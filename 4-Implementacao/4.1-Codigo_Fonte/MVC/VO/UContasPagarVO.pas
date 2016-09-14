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
    [TColumn('DtEmissao','Data Emiss�o',50,[ldGrid,ldLookup,ldComboBox], False)]
    property DtEmissao: TDateTime  read FDtEmissao write FDtEmissao;
    [TColumn('DtVencimento','Data Vencimento',50,[ldGrid,ldLookup,ldComboBox], False)]
    property DtVencimento: TDateTime  read FDtVencimento write FDtVencimento;
    [TColumn('NrDocumento','Documento',100,[ldGrid,ldLookup,ldComboBox], False)]
    property NrDocumento: string  read FNrDocumento write FNrDocumento;
    // Atributos Transientes
    [TColumn('NOME','Pessoa',400,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property NomePessoa: string  read FNomePessoa write FNomePessoa;
    [TColumn('VlValor','Valor',100,[ldGrid,ldLookup,ldComboBox], False)]
    property VlValor: Currency  read FVlValor write FVlValor;
    [TColumn('DsComplemento','Complemento',0,[ldLookup,ldComboBox], False)]
    property DsComplemento: String  read FDsComplemento write FDsComplemento;
    [TColumn('IdHistorico','Hist�rico',0,[ldLookup,ldComboBox], False)]
    property IdHistorico: integer  read FIdHistorico write FIdHistorico;
    [TColumn('FlBaixa','Baixa',0,[ldLookup,ldComboBox], False)]
    property FlBaixa: String  read FFlBaixa write FFlBaixa;
    [TColumn('IdConta','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdConta: Integer  read FIdConta write FIdConta;
    [TColumn('IdCondominio','Id Condominio',0,[ldLookup,ldComboBox], False)]
    property IdCondominio: Integer  read FIdCondominio write FIdCondominio;
    [TColumn('IdPessoa','Id Pessoa',50,[ldLookup,ldComboBox], False)]
    property IdPessoa: Integer  read FIdPessoa write FIdPessoa;
    [TColumn('IdContraPartida','Id Contra Partida',0,[ldLookup,ldComboBox], False)]
    property IdContraPartida: Integer  read FIdContraPartida write FIdContraPartida;


    Function ValidarCamposObrigatorios:boolean;

  end;
implementation



function TContasPagarVO.ValidarCamposObrigatorios: boolean;
begin
  Result := true;
end;
end.

