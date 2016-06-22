unit UInquilinoUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UCondominioController, UInquilinoUnidadeVO;


type
  TInquilinoUnidadeController = class(TController<TInquilinoUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TInquilinoUnidadeVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TInquilinoUnidadeController.ConsultarPorId(id: integer): TInquilinoUnidadeVO;
var
  P: TInquilinoUnidadeVO;
  codominioController:TCondominioController;
begin
  P := TDAO.ConsultarPorId<TInquilinoUnidadeVO>(id);
{//  codominioController:=TCondominioController.Create;
//  if (P <> nil) then
  begin
    P.CondominioVO := codominioController.ConsultarPorId(P.idCondominio);
  end;
  codominioController.Free;    }
  result := P;
end;


begin


end.
