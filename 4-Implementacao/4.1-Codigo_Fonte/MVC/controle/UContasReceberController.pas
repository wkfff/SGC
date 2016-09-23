unit UContasReceberController;


interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UUnidadeVO, UController, DBClient, DB, UContasReceberVO, UPessoasController, UCondominioController,
  UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO;


type
  TContasReceberController = class(TController<TContasReceberVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasReceberVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasReceberController.ConsultarPorId(id: integer): TContasReceberVO;
var
  P: TContasReceberVO;



begin
  P := TDAO.ConsultarPorId<TContasReceberVO>(id);


  if (P <> nil) then
  begin
      p.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.IdCondominio);
      p.UnidadeVO := TDAO.ConsultarPorId<TUnidadeVO>(p.IdUnidade);
      p.PlanoContasContaVO := TDAO.ConsultarPorId<TPlanoContasVO>(P.IdConta);
      P.PlanoContasContraPartidaVO := TDao.ConsultarPorId<TPlanoContasVO>(P.IdContraPartida);
      p.HistoricoVO := TDao.ConsultarPorId<THistoricoVO>(P.IdHistorico);
  end;


  result := P;
end;

begin

end.