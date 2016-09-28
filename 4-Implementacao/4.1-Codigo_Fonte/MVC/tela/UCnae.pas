unit UCnae;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UCnaeVo, UCnaeController, Generics.Collections;

type
  TFTelaCadastroCnae = class(TFTelaCadastro)
    LabelEditDescricao: TLabeledEdit;
    MaskEditCnae: TMaskEdit;
    Cep: TLabel;
    GroupBox2: TGroupBox;
    RadioButtonDescricao: TRadioButton;
    RadioButtonCnae: TRadioButton;
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoExcluir: boolean; override;
    procedure DoConsultar; override;
    procedure CarregaObjetoSelecionado; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Cnae: TCnaeVo): TCnaeVo;
  end;

var
  FTelaCadastroCnae: TFTelaCadastroCnae;
  ControllerCnae: TCnaeController;

implementation

{$R *.dfm}
{ TFTelaCadastroCnae }

procedure TFTelaCadastroCnae.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  MaskEditCnae.SetFocus;
end;

procedure TFTelaCadastroCnae.CarregaObjetoSelecionado;
begin
  if not CDSGrid.IsEmpty then
  begin
    ObjetoRetornoVO := TCnaeVo.Create;
    TCnaeVo(ObjetoRetornoVO).idCnae := CDSGrid.FieldByName('IDCNAE').AsInteger;
    TCnaeVo(ObjetoRetornoVO).descricao :=
      CDSGrid.FieldByName('DESCRICAO').AsString;
    TCnaeVo(ObjetoRetornoVO).codigoCnae :=
      CDSGrid.FieldByName('CODIGOCNAE').AsString;
  end;
end;

procedure TFTelaCadastroCnae.DoConsultar;
var
  listaCnae: TObjectList<TCnaeVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaCnae := ControllerCnae.Consultar(filtro);
  PopulaGrid<TCnaeVo>(listaCnae);
end;

function TFTelaCadastroCnae.DoExcluir: boolean;
var
  Cnae: TCnaeVo;
begin
  try
    try
      Cnae := TCnaeVo.Create;
      Cnae.idCnae := CDSGrid.FieldByName('IDCNAE').AsInteger;
      ControllerCnae.Excluir(Cnae);
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

function TFTelaCadastroCnae.DoSalvar: boolean;
var
  Cnae: TCnaeVo;
begin
    Cnae:=EditsToObject(TCnaeVO.Create);
    try
      try
        if (Cnae.ValidarCamposObrigatorios()) then
        begin
          if (StatusTela = stInserindo) then
          begin
            ControllerCnae.Inserir(Cnae);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            Cnae := ControllerCnae.ConsultarPorId(CDSGrid.FieldByName('IDCNAE')
              .AsInteger);
            Cnae := EditsToObject(Cnae);
            ControllerCnae.Alterar(Cnae);
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

function TFTelaCadastroCnae.EditsToObject(Cnae: TCnaeVo): TCnaeVo;
begin
  Cnae.codigoCnae := MaskEditCnae.Text;
  Cnae.descricao := LabelEditDescricao.Text;
  Result := Cnae;
end;

procedure TFTelaCadastroCnae.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerCnae);

end;

procedure TFTelaCadastroCnae.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCnaeVo;
  RadioButtonCnae.Checked := true;
  ControllerCnae := TCnaeController.create;
  inherited;
end;

procedure TFTelaCadastroCnae.GridParaEdits;
var
  Cnae: TCnaeVo;
begin
  inherited;
  Cnae := nil;

  if not CDSGrid.IsEmpty then
    Cnae := ControllerCnae.ConsultarPorId(CDSGrid.FieldByName('IDCNAE')
      .AsInteger);

  if Assigned(Cnae) then
  begin
    MaskEditCnae.Text := Cnae.codigoCnae;
    LabelEditDescricao.Text := Cnae.descricao;
  end;
end;

function TFTelaCadastroCnae.MontaFiltro: string;
begin
  Result := '';
  if (RadioButtonCnae.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(CODIGOCNAE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(DESCRICAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';

  end;

end;


end.
