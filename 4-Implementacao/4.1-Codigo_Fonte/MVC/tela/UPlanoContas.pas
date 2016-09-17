unit UPlanoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UPlanoContasVO,UPlanoContasController,
  Generics.Collections, UEmpresaTrab;

type
  TFTelaCadastroPlano = class(TFTelaCadastro)
    LabelEditCodigo: TLabeledEdit;
    Telefone_1: TLabel;
    EditClassificacao: TMaskEdit;
    Label1: TLabel;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    RadioButtonClassificacao: TRadioButton;
    RadioButtonCodigo: TRadioButton;
    RadioButtonDescricao: TRadioButton;
    LabelEditDescricao: TMaskEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    function DoSalvar: boolean; override;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;

    function MontaFiltro: string;
    procedure CarregaObjetoSelecionado; override;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(PlanoContas: TPlanoContasVO): TPlanoContasVO;
  end;

var
  FTelaCadastroPlano: TFTelaCadastroPlano;
  PlanoContasController : TPlanoContasController;
implementation

{$R *.dfm}

procedure TFTelaCadastroPlano.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroPlano.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := PlanoContasController.ConsultarPorId(CDSGRID.FieldByName('IDPLANOCONTAS').AsInteger);
  end;
end;

procedure TFTelaCadastroPlano.DoConsultar;
var
  listaPlanoContas: TObjectList<TPlanoContasVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaPlanoContas := PlanoContasController.Consultar(filtro);
  PopulaGrid<TPlanoContasVo>(listaPlanoContas);
end;

function TFTelaCadastroPlano.DoExcluir: boolean;
var
  PlanoContas : TPlanoContasVo;
begin
  try
    try
      PlanoContas := TPlanoContasVo.Create;
      PlanoContas.idPlanoContas := CDSGrid.FieldByName('IDPLANOCONTAS')
        .AsInteger;
      PlanoContasController.Excluir(PlanoContas);
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

function TFTelaCadastroPlano.DoSalvar: boolean;
var
  PlanoContas : TPlanoContasVo;
begin
  begin
    PlanoContas:=EditsToObject(TPlanoContasVo.Create);
    try
      try
        PlanoContas.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
              PlanoContas.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              PlanoContasController.Inserir(PlanoContas);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            PlanoContas := PlanoContasController.ConsultarPorId(CDSGrid.FieldByName('IDPLANOCONTAS')
              .AsInteger);
            PlanoContas := EditsToObject(PlanoContas);
            PlanoContasController.Alterar(PlanoContas);
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

function TFTelaCadastroPlano.EditsToObject(
  PlanoContas: TPlanoContasVO): TPlanoContasVO;
begin
  PlanoContas.idConta := StrToInt(LabelEditCodigo.Text);
  PlanoContas.dsConta := LabelEditDescricao.Text;
  PlanoContas.nrClassificacao := EditClassificacao.Text;
  PlanoContas.flTipo := IntToStr(comboboxTipo.ItemIndex);

  Result := PlanoContas;
end;

procedure TFTelaCadastroPlano.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPlanoContasVO;
  inherited;

end;

procedure TFTelaCadastroPlano.GridParaEdits;
var
  PlanoContas: TPlanoContasVO;
begin
  inherited;
  PlanoContas := nil;

  if not CDSGrid.IsEmpty then
    PlanoContas := PlanoContasController.ConsultarPorId
      (CDSGrid.FieldByName('IDPLANOCONTAS').AsInteger);

  if PlanoContas <> nil then
  begin
    LabelEditCodigo.Text := IntToStr(PlanoContas.idConta);
    LabelEditDescricao.Text := PlanoContas.dsConta;
    EditClassificacao.Text := PlanoContas.nrClassificacao;
//    comboboxTipo.ItemIndex := IntToStr(PlanoContas.flTipo);
  end;
end;

function TFTelaCadastroPlano.MontaFiltro: string;
begin
  Result :=' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButtonCodigo.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(IDCONTA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonClassificacao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(NRCLASSIFICACAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
  if (editBusca.Text <> '') then
      Result := '( UPPER(DSCONTA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;

end;

end.
