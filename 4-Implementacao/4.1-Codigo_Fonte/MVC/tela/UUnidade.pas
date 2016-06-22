unit UUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, UUnidadeVO, UGenericVO,
  Generics.Collections, UUnidadeController, UPessoa, UPessoasController, UPessoasVO,
  UProprietarioUnidade, UProprietarioUnidadeVO, UInquilinoUnidade, UInquilinoUnidadeVO;

type
  TFTelaCadastroUnidade = class(TFTelaCadastro)
    GroupBox2: TGroupBox;
    RadioButtonNome: TRadioButton;
    PageControlUnidade: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelEditNumero: TLabeledEdit;
    EditQtdGas: TEdit;
    EditAreaTotal: TEdit;
    EditFracaoIdeal: TEdit;
    EditObservacao: TEdit;
    BtnProprietario: TBitBtn;
    BtnInquilino: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure GridParaEdits; override;
    procedure BtnProprietarioClick(Sender: TObject);
    procedure BtnInquilinoClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    function EditsToObject(Unidade: TUnidadeVO): TUnidadeVO;

  end;

var
  FTelaCadastroUnidade: TFTelaCadastroUnidade;
  UnidadeController: TUnidadeController;
  FormPessoaConsulta : TFTelaCadastroPessoa;
  PessoaController : TPessoasController;

implementation

{$R *.dfm}

uses UEmpresaTrab;

{ TFTelaCadastroUnidade }



procedure TFTelaCadastroUnidade.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditNumero.SetFocus;


end;

procedure TFTelaCadastroUnidade.BtnInquilinoClick(Sender: TObject);
var
  FormInquilino: TFTelaCadastroInquilino;
begin
  FormInquilino := TFTelaCadastroInquilino.Create(nil);
  FormInquilino.FechaForm := true;
  FormInquilino.idunidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
  FormInquilino.ShowModal;
end;

procedure TFTelaCadastroUnidade.BtnProprietarioClick(Sender: TObject);
var
  FormProprietario: TFTelaCadastroProprietario;
begin
  FormProprietario := TFTelaCadastroProprietario.Create(nil);
  FormProprietario.FechaForm := true;
  FormProprietario.idunidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
  FormProprietario.ShowModal;
end;

procedure TFTelaCadastroUnidade.DoConsultar;
var
  listaUnidade: TObjectList<TUnidadeVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaUnidade := UnidadeController.Consultar(filtro);
  PopulaGrid<TUnidadeVO>(listaUnidade);
end;


function TFTelaCadastroUnidade.DoExcluir: boolean;
var
  Unidade: TUnidadeVO;
begin
  try
    try
      Unidade := TUnidadeVO.Create;
      Unidade.idUnidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
      UnidadeController.Excluir(Unidade);
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

function TFTelaCadastroUnidade.DoSalvar: boolean;
var
  Unidade: TUnidadeVO;
begin
  begin
    Unidade:=EditsToObject(TUnidadeVO.Create);
    try
      try
        if (Unidade.ValidarCamposObrigatorios()) then
        begin
           if (StatusTela = stInserindo) then
           begin
              Unidade.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              UnidadeController.Inserir(Unidade);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            Unidade := UnidadeController.ConsultarPorId(CDSGrid.FieldByName('IDUNIDADE')
              .AsInteger);
            Unidade := EditsToObject(Unidade);
            UnidadeController.Alterar(Unidade);
            Result := true;
          end;
        end
        else
          Result := false;
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

function TFTelaCadastroUnidade.EditsToObject(Unidade: TUnidadeVO): TUnidadeVO;
begin

  Unidade.numero := StrToInt(LabelEditNumero.Text);
  Unidade.vlgasinicial := EditQtdGas.Text;
  Unidade.vlareatotal := EditAreaTotal.Text;
  Unidade.vlfracaoideal := EditFracaoIdeal.Text;
  Unidade.observacao := EditObservacao.Text;


  Result := Unidade;

end;



procedure TFTelaCadastroUnidade.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TUnidadeVO;
  RadioButtonNome.Checked := true;
  inherited;
end;

procedure TFTelaCadastroUnidade.GridParaEdits;
var
  Unidade: TUnidadeVO;
begin
  inherited;

  Unidade := nil;
  if not CDSGrid.IsEmpty then
    Unidade := UnidadeController.ConsultarPorId(CDSGrid.FieldByName('IDUNIDADE')
      .AsInteger);

  if Unidade <> nil then
  begin

    LabelEditNumero.Text := IntToStr(Unidade.Numero);
    EditQtdGas.Text := Unidade.vlgasinicial;
    EditAreaTotal.Text := Unidade.vlareatotal;
    EditFracaoIdeal.Text := Unidade.vlfracaoideal;
    EditObservacao.Text := Unidade.observacao;
  end;
end;

function TFTelaCadastroUnidade.MontaFiltro: string;
begin
  Result := ' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButtonNome.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := ' AND ( UPPER(NUMERO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonNome.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := ' AND ( UPPER(NUMERO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;


end.
