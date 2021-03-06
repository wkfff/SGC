unit UItensRateioVO;
interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UUnidadeVO;

type
  [TEntity]
  [TTable('ItensRateio')]
  TItensRateioVO = class(TGenericVO)
  private
    FidItensRateio : Integer;
    FidRateio : Integer;
    FidUnidade : Integer;
    FvlRateio : currency;
    FvlFundoReserva : currency;
    FdtRateio : TDateTime;
    FdsUnidade : String;
    Fvlareatotal : Currency;

  public
    UnidadeVO : TUnidadeVO;

    [TId('idItensRateio')]
    [TGeneratedValue(sAuto)]
    property idItensRateio : Integer  read FidItensRateio write FidItensRateio;

    [TColumn('idRateio','Leitura G�s',0,[ldLookup,ldComboBox], False)]
    property idRateio: integer  read FidRateio write FidRateio;

    [TColumn('dtRateio','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtRateio: TDateTime  read FdtRateio write FdtRateio;

    [TColumn('idUnidade','Unidade',0,[ldLookup,ldComboBox], False)]
    property idUnidade: integer  read FidUnidade write FidUnidade;

    [TColumn('vlRateio','Valor Medido',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlRateio: currency  read FvlRateio write FvlRateio;

    [TColumn('vlFundoReserva','Valor Calculado',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlFundoReserva: currency  read FvlFundoReserva write FvlFundoReserva;

   // [TColumn('DSUNIDADE','Unidade',0,[], True, 'Unidade', 'idUnidade', 'idUnidade')]
   // property DsUnidade: string  read FdsUnidade write FdsUnidade;

  //  [TColumn('vlareatotal','Valor Area',0,[], True, 'Unidade', 'idUnidade', 'idUnidade')]
  //  property vlareatotal: Currency  read Fvlareatotal write Fvlareatotal;

    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TItensRateioVO.ValidarCamposObrigatorios;
begin
  if (self.dtRateio = 0) then
  begin
    raise Exception.Create('O campo Data � obrigat�rio!');
  end;
end;
end.


