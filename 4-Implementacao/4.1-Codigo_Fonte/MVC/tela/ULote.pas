unit ULote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections, ULoteVO, ULoteController, UEmpresaTrab;

type
  TFTelaCadastroLote = class(TFTelaCadastro)
    BtnAlterar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    MaskEditDtInicio: TMaskEdit;
    EdtValor: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BtnNovo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnGravaClick(Sender: TObject);
    procedure SetStatusTela(const Value: TStatusTela);
    procedure BitBtnAlteraClick(Sender: TObject);
    procedure BitBtnCancelaClick(Sender: TObject);
    procedure BitBtnExcluiClick(Sender: TObject);

  private
    { Private declarations }
    FStatusTela: TStatusTela;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Lote: TLoteVO): TLoteVO;
    property StatusTela: TStatusTela read FStatusTela write SetStatusTela;
 //   function ConsultaLote (Lote:TLoteVO) : TLoteVO;

  end;

var
  FTelaCadastroLote: TFTelaCadastroLote;
  ControllerLote: TLoteController;

implementation

{$R *.dfm}

procedure TFTelaCadastroLote.BitBtnAlteraClick(Sender: TObject);
begin
  if CDSGrid.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    StatusTela := stEditando;
    GridParaEdits;
   end;
end;

procedure TFTelaCadastroLote.BitBtnCancelaClick(Sender: TObject);
begin
  if (StatusTela = TStatusTela.stInserindo) then
    PageControl.ActivePage := Consulta;

  SetStatusTela(TStatusTela.stNavegandoGrid);
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BitBtnExcluiClick(Sender: TObject);
begin
  inherited;
  DadosCadastrais.TabVisible := true;

end;

procedure TFTelaCadastroLote.BitBtnGravaClick(Sender: TObject);
begin
  inherited;
  SetStatusTela(TStatusTela.stNavegandoGrid);
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BitBtnNovoClick(Sender: TObject);
begin
  StatusTela := stInserindo;
  MaskEditDtInicio.SetFocus;

end;

procedure TFTelaCadastroLote.DoConsultar;
var
  listaLote: TObjectList<TLoteVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaLote := ControllerLote.Consultar(filtro);
  PopulaGrid<TLoteVO>(listaLote);
end;

function TFTelaCadastroLote.DoExcluir: boolean;
var
  Lote: TLoteVO;
begin
  try
    try
      Lote := TLoteVO.Create;
      Lote.idLote := CDSGrid.FieldByName('IDLOTE').AsInteger;
      ControllerLote.Excluir(Lote);
    except
      on E: Exception do
      begin
        ShowMessage('Ocorreu um erro ao excluir o registro: ' + #13 + #13 +
          E.Message);
        Result := false;
      end;
    end;
  finally
  end;
end;

function TFTelaCadastroLote.DoSalvar: boolean;
var
   Lote: TLoteVO;
begin
  begin
    Lote:=EditsToObject(TLoteVO.Create);
    try
      try
       Lote.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
              Lote.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerLote.Inserir(Lote);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
              Lote := ControllerLote.ConsultarPorId(CDSGrid.FieldByName('IDLOTE')
              .AsInteger);
              Lote := EditsToObject(Lote);
              ControllerLote.Alterar(Lote);
            Result := true;
          end
        else
          Result := false;
        end;
      except
        on E: Exception do
        begin
          ShowMessage(E.Message);
          Result := false;
        end;
      end;
    finally
    end;
end;
end;


function TFTelaCadastroLote.EditsToObject(Lote: TLoteVO): TLoteVO;
begin
  if Edit1.Text <> '' then
  begin
    Lote.dsLote := Edit1.Text;
  end;
  if EdtValor.Text <> '' then
  begin
    Lote.nrLote := EdtValor.Text;
  end;
  if(MaskEditDtInicio.Text<> '  /  /    ' )then
  begin
    Lote.dtLote := StrToDateTime(MaskEditDtInicio.Text);
  end;
  Result := Lote;
end;

procedure TFTelaCadastroLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
  FreeAndNil(ControllerLote);
end;

procedure TFTelaCadastroLote.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TLoteVO;
  ControllerLote := TLoteController.Create;
  inherited;

end;

procedure TFTelaCadastroLote.GridParaEdits;
var
  Lote: TLoteVO;
begin
  inherited;
  Lote := nil;

  if not CDSGrid.IsEmpty then
    Lote := ControllerLote.ConsultarPorId
      (CDSGrid.FieldByName('IDLOTE').AsInteger);

  if Lote <> nil then
  begin
    MaskEditDtInicio.Text := DateTimeToStr(Lote.dtLote);
    EdtValor.Text := Lote.nrLote;
    Edit1.Text := Lote.dsLote;
  end;
end;

function TFTelaCadastroLote.MontaFiltro: string;
begin

 Result := ' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButton2.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(NRLOTE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButton1.Checked = true) then
  begin
      if (editBusca.Text <> '') then
      begin
        Result := '( UPPER(DSLOTE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
      end;
  end;

end;

procedure TFTelaCadastroLote.SetStatusTela(const Value: TStatusTela);
begin
FStatusTela := Value;
  BtnNovo.Enabled := True;
  BtnAlterar.Enabled := True;
  BtnGravar.Enabled := True;
  BtnExcluir.Enabled := True;
  BtnCancelar.Enabled := false;

  PanelEdits.Enabled := True;
  case Value of
    stNavegandoGrid:
      begin
        PanelEdits.Enabled := false;
        BtnNovo.Enabled := True;
        BtnAlterar.Enabled := True;
        BtnGravar.Enabled := false;
        BtnExcluir.Enabled := True;
        BtnCancelar.Enabled := false;
      end;
    stInserindo, stEditando:
      begin
        DadosCadastrais.TabVisible := false;
        PanelEdits.Enabled := True;
        BtnNovo.Enabled := false;
        BtnAlterar.Enabled := false;
        BtnGravar.Enabled := True;
        BtnExcluir.Enabled := false;
        BtnCancelar.Enabled := True;
      end;
  end;

end;

end.