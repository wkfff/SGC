unit UContasPagarVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UPessoasVO,
UHistoricoVO, UCondominioVO, UPlanoContasVO;

type
  [TEntity]
  [TTable('ContasPagar')]
  TContasPagarVO = class(TGenericVO)
  private
    FidContasPagar : Integer;
    FDtCompetencia : TDateTime;
    FDtEmissao : TDateTime;
    FDtVencimento: TDateTime;
    FNrDocumento : String;
    FVlValor : Currency;
    FDsComplemento : String;
    FIdHistorico : Integer;
    FFlBaixa : String;
    FIdConta : Integer;
    FIdCondominio : Integer;
    FIdPessoa : Integer;
    FIdContraPartida : Integer;
    FNomePessoa : string;
    FVlBaixa : Currency;
    FVlJuros : Currency;
    FVlMulta : Currency;
    FVlDesconto : Currency;
    FDtBaixa : TDateTime;
    FIdContaBaixa : Integer;
    FIdHistoricoBx  : Integer;
    FVlPago : Currency;




  public

    CondominioVO : TCondominioVO;
    PessoaVO : TPessoasVO;
    PlanoContasContaVO : TPlanoContasVO;
    PlanoContasContraPartidaVO : TPlanoContasVO;
    HistoricoVO : THistoricoVO;


    [TId('idContasPagar')]
    [TGeneratedValue(sAuto)]
    property idContasPagar : Integer  read FidContasPagar write FidContasPagar;

    [TColumn('DtCompetencia','Data Competencia',50,[ldLookup,ldComboBox], False)]
    property DtCompetencia: TDateTime  read FDtCompetencia write FDtCompetencia;
    [TColumn('DtVencimento','Data Vencimento',50,[ldGrid,ldLookup,ldComboBox], False)]
    property DtVencimento: TDateTime  read FDtVencimento write FDtVencimento;
    [TColumn('DtEmissao','Data Emiss�o',50,[ldGrid,ldLookup,ldComboBox], False)]
    property DtEmissao: TDateTime  read FDtEmissao write FDtEmissao;
    [TColumn('NrDocumento','Documento',100,[ldGrid,ldLookup,ldComboBox], False)]
    property NrDocumento: string  read FNrDocumento write FNrDocumento;
    // Atributos Transientes
    [TColumn('NOME','Pessoa',390,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property NomePessoa: string  read FNomePessoa write FNomePessoa;
    [TColumn('VlValor','Valor',80,[ldGrid,ldLookup,ldComboBox], False)]
    property VlValor: Currency  read FVlValor write FVlValor;
    [TColumn('DsComplemento','Complemento',0,[ldLookup,ldComboBox], False)]
    property DsComplemento: String  read FDsComplemento write FDsComplemento;
    [TColumn('IdHistorico','Hist�rico',0,[ldLookup,ldComboBox], False)]
    property IdHistorico: integer  read FIdHistorico write FIdHistorico;
    [TColumn('FlBaixa','Situa��o',10,[ldGrid,ldLookup,ldComboBox], False)]
    property FlBaixa: String  read FFlBaixa write FFlBaixa;
    [TColumn('IdConta','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdConta: Integer  read FIdConta write FIdConta;
    [TColumn('IdCondominio','Id Condominio',0,[ldLookup,ldComboBox], False)]
    property IdCondominio: Integer  read FIdCondominio write FIdCondominio;
    [TColumn('IdPessoa','Id Pessoa',50,[ldLookup,ldComboBox], False)]
    property IdPessoa: Integer  read FIdPessoa write FIdPessoa;
    [TColumn('IdContraPartida','Id Contra Partida',0,[ldLookup,ldComboBox], False)]
    property IdContraPartida: Integer  read FIdContraPartida write FIdContraPartida;
    [TColumn('VlBaixa','Valor',100,[ldLookup,ldComboBox], False)]
    property VlBaixa: Currency  read FVlBaixa write FVlBaixa;
    [TColumn('VlJuros','Juros',100,[ldLookup,ldComboBox], False)]
    property VlJuros: Currency  read FVlJuros write FVlJuros;
    [TColumn('VlMulta','Multa',100,[ldLookup,ldComboBox], False)]
    property VlMulta: Currency  read FVlMulta write FVlMulta;
    [TColumn('VlDesconto','Desconto',100,[ldLookup,ldComboBox], False)]
    property VlDesconto: Currency  read FVlDesconto write FVlDesconto;
    [TColumn('DtBaixa','Data Emiss�o',50,[ldLookup,ldComboBox], False)]
    property DtBaixa: TDateTime  read FDtBaixa write FDtBaixa;
    [TColumn('IdContaBaixa','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdContaBaixa: Integer  read FIdContaBaixa write FIdContaBaixa;
    [TColumn('IdHistoricoBx','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdHistoricoBx: Integer  read FIdHistoricoBx write FIdHistoricoBx;
    [TColumn('VlPago','Valor Pago',100,[ldLookup,ldComboBox], False)]
    property VlPago: Currency  read FVlPago write FVlPago;


    procedure ValidarCampos;
    procedure ValidarBaixa;

  end;
implementation



procedure TContasPagarVO.ValidarBaixa;
begin
  if (Self.FDtBaixa = 0)  then
   raise Exception.Create('O campo Data Baixa � obrigat�rio!');
  if (Self.FVlBaixa= 0) then
    raise Exception.Create('O campo Valor � obrigat�rio!');
  if ( Self.FVlPago=0) then
    raise Exception.Create('O campo Valor Pago � obrigat�rio!');
  if (self.FDtBaixa < self.FDtEmissao) then
    raise Exception.Create('A data da baixa n�o pode ser menor que a data de emiss�o!');
  if (Self.FIdContaBaixa = 0) then
    raise Exception.Create('O campo Conta � obrigat�rio!');

  if Self.vlpago > self.vlvalor then
  begin
    if ((self.vlbaixa + Self.VlJuros + self.VlMulta - self.VlDesconto) <> self.VlPago) then
    raise Exception.Create('Valor n�o confere!');
  end
  else if Self.VlPago < self.VlValor then
  begin
    if ((self.VlPago + self.vldesconto) <> self.vlValor) then
    raise Exception.Create('Valor n�o confere');
  end;
end;

procedure TContasPagarVO.ValidarCampos;
begin
  if (Self.FDtCompetencia = 0 ) then
    raise Exception.Create('O campo Data Competencia � obrigat�rio!');
  if (Self.FDtEmissao = 0) then
    raise Exception.Create('O campo Data Emiss�o � obrigat�rio!');
  if (Self.FNrDocumento= '') then
    raise Exception.Create('O campo Documento � obrigat�rio!');
  if (Self.FDtCompetencia = 0) then
   raise Exception.Create('O campo Data Vencimento � obrigat�rio!');
  if (Self.FVlValor= 0) then
    raise Exception.Create('O campo Valor � obrigat�rio!');
  if (Self.FDtVencimento < self.FDtEmissao) then
    raise Exception.Create('A data de emiss�o deve ser menor que a data de vencimento!');
end;


end.

