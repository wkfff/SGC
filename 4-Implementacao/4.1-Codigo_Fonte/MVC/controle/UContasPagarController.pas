unit UContasPagarController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UContasPagarVO, UPessoasController, UCondominioController,
  UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO, ULancamentoContabilVO;

type
  TContasPagarController = class(TController<TContasPagarVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasPagarVO;
    procedure ValidarDados(Objeto:TContasPagarVO);override;
    function Inserir(ContasPagar: TContasPagarVO): integer;
    function Excluir(ContasPagar: TContasPagarVO): boolean;
    function Alterar(ContasPagar: TContasPagarVO): boolean;

  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasPagarController.Alterar(ContasPagar: TContasPagarVO): boolean;
var Lancamentos : TObjectList<TLancamentoContabilVO>;
  IdContaFor, idContaDebito, idContaCredito : Integer;
  Lancamento : TLancamentoContabilVO;
  PlanoContasController : TPlanoContasCOntroller;
  ListaConta : TObjectList<TPlanoContasVO>;
  ContaPlano : TPlanoContasVO;
  Query : string;
begin
  validarDados(ContasPagar);
  idContaFor := 0;
  try
    TDBExpress.IniciaTransacao;
    Result := TDAO.Alterar(ContasPagar);
    Lancamentos:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASPAGAR = '+inttostr(ContasPagar.idContasPagar), '',0,true);
    if(Lancamentos.Count>0)then
    begin
      TDAO.Excluir(Lancamentos.First);
    end;
    if(ContasPagar.IdPessoa>0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idPessoa = ' +(IntTOsTR(ContasPagar.IdPessoa));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count <= 0) then
      begin
        ContasPagar.PessoaVO := TDao.ConsultarPorId<TPessoasVO>(ContasPagar.IdPessoa);
        contaPlano:=TPlanoContasVO.Create;
        ContaPlano.nrClassificacao:= '2.1.25.01';
        contaplano.dsConta:= ContasPagar.PessoaVO.nome;
        contaplano.flTipo:= 'F';
        contaPlano.idcondominio:=ContasPagar.idcondominio;
        contaPlano.idPessoa:= ContasPagar.IdPessoa;
        idcontafor:= TDAO.Inserir(contaPlano);
      end
      else
        idcontafor:=listaConta[0].idPlanoContas;
    end;
    if idContaFor <>  0 then
      idContaDebito := idContaFor;
    if ContasPagar.IdConta <> 0  then
      idContaDebito := ContasPagar.IdConta;
    if COntasPagar.IdContraPartida <> 0 then
      idContaCredito := ContasPagar.IdContraPartida;
    Lancamento := TLancamentoContabilVo.Create;
    Lancamento.idcontadebito := idContaDebito;
    Lancamento.idContaCredito := idContaCredito;
    Lancamento.complemento := COntasPagar.DsComplemento;
    Lancamento.dtLcto := ContasPagar.DtEmissao;
    Lancamento.VlValor := ContasPagar.VlValor;
    Lancamento.idContasPagar := ContasPagar.idContasPagar;
    Lancamento.idHistorico := ContasPagar.IdHistorico;
    TDao.Inserir(Lancamento);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TContasPagarController.ConsultarPorId(id: integer): TContasPagarVO;
var
  P: TContasPagarVO;
begin
  P := TDAO.ConsultarPorId<TContasPagarVO>(id);

  if (P <> nil) then
  begin
      p.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.IdCondominio);
      p.PessoaVO := TDAO.ConsultarPorId<TPessoasVO>(P.IdPessoa);
      p.PlanoContasContaVO := TDAO.ConsultarPorId<TPlanoContasVO>(P.IdConta);
      P.PlanoContasContraPartidaVO := TDao.ConsultarPorId<TPlanoContasVO>(P.IdContraPartida);
      p.HistoricoVO := TDao.ConsultarPorId<THistoricoVO>(P.IdHistorico);
  end;
  result := P;
end;

function TContasPagarController.Excluir(ContasPagar: TContasPagarVO): boolean;
var Lancamento : TObjectList<TLancamentoContabilVO>;
begin
  try
    TDBExpress.IniciaTransacao;
    Lancamento:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASPAGAR = '+inttostr(ContasPagar.idContasPagar), '',0,true);
    if(Lancamento.Count>0)then
    begin
      TDAO.Excluir(Lancamento.First);
    end;
    Result := TDAO.Excluir(ContasPagar);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TContasPagarController.Inserir(ContasPagar: TContasPagarVO): integer;
var contaPlano:TPlanoContasVO;
    Lancamento : TLancamentoContabilVO;
    PessoaVo : TPessoASvo;
    listaConta :TObjectList<TPlanoContasVO>;
    Query : String;
    idcontafor, idcontadebito,idcontacredito:integer;
    PlanoContasController : TPlanoContasController;
begin
  try
    idcontafor:=0;
    TDBExpress.IniciaTransacao;
    Result := TDAO.Inserir(ContasPagar);
    if(ContasPagar.IdPessoa>0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idPessoa = ' +(IntTOsTR(ContasPagar.IdPessoa));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count <= 0) then
      begin
        ContasPagar.PessoaVO := TDao.ConsultarPorId<TPessoasVO>(ContasPagar.IdPessoa);
        contaPlano:=TPlanoContasVO.Create;
        ContaPlano.nrClassificacao:= '2.1.25.01';
        contaplano.dsConta:= ContasPagar.PessoaVO.nome;
        contaplano.flTipo:= 'F';
        contaPlano.idcondominio:=ContasPagar.idcondominio;
        contaPlano.idPessoa:= ContasPagar.IdPessoa;
        idcontafor:= TDAO.Inserir(contaPlano);
      end
      else
        idcontafor:=listaConta[0].idPlanoContas;
    end;
    if idContaFor <>  0 then
      idContaDebito := idContaFor;
    if ContasPagar.IdConta <> 0  then
      idContaDebito := ContasPagar.IdConta;
    if COntasPagar.IdContraPartida <> 0 then
      idContaCredito := ContasPagar.IdContraPartida;
    Lancamento := TLancamentoContabilVo.Create;
    Lancamento.idcontadebito := idContaDebito;
    Lancamento.idContaCredito := idContaCredito;
    Lancamento.complemento := COntasPagar.DsComplemento;
    Lancamento.dtLcto := ContasPagar.DtEmissao;
    Lancamento.VlValor := ContasPagar.VlValor;
    Lancamento.idContasPagar := result;
    Lancamento.idHistorico := ContasPagar.IdHistorico;
    TDao.Inserir(Lancamento);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

procedure TContasPagarController.ValidarDados(Objeto: TContasPagarVO);
begin
  inherited;
end;

begin

end.
