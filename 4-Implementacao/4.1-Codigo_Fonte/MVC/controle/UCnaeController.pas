unit UCnaeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UCnaeVO;

type
  TCnaeController = class(TController<TCnaeVO>)
  private

  public
    function ConsultarPorId(id: integer): TCnaeVO;
    procedure ValidarDados(Objeto:TCnaeVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TCnaeController.ConsultarPorId(id: integer): TCnaeVO;
var
  P: TCnaeVO;
begin
  P := TDAO.ConsultarPorId<TCnaeVO>(id);
  result := P;
end;

procedure TCnaeController.ValidarDados(Objeto: TCnaeVO);
begin
  inherited;

end;

begin

end.
