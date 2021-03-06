unit UPrecoGasVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCnaeVO, UCidadeVO, UEstadoVO, UPaisVO, UPessoasVO;

type
  [TEntity]
  [TTable('PrecoGas')]
  TPrecoGasVO = class(TGenericVO)
  private
    FidPrecoGas: Integer;
    FdtMesAno : TdateTime;
    FvlGas : currency;
    FNome : String;
    FidPessoa : Integer;
  public
    PessoaVo : TPessoasVO;

    [TId('idprecogas')]
    [TGeneratedValue(sAuto)]
    property idPrecoGas: Integer  read FidPrecoGas write FidPrecoGas;
    [TColumn('dtMesAno','Data Inicio',20,[ldGrid,ldLookup,ldComboBox], False)]
    property dtMesAno: TDateTime  read FdtMesAno write FdtMesAno;

    [TColumn('idPessoa','Pessoa',0,[ldLookup,ldComboBox], False)]
    property idPessoa: integer  read FidPessoa write FidPessoa;

    [TColumn('nome','Fornecedor',350,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property Nome: string  read FNome write FNome;

    [TColumn('vlGas','Valor Total',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlGas: currency  read FvlGas write FvlGas;

    Procedure ValidarCamposObrigatorios;

  end;
implementation

{ TPrecoGasVO }

Procedure TPrecoGasVO.ValidarCamposObrigatorios;
begin
  if (Self.FvlGas <= 0) then
    raise Exception.Create('O campo Valor do G�s � obrigat�rio!')
  else if (self.FdtMesAno = 0) then
    raise Exception.Create('O campo data � obrigat�rio!')
  else if (self.idPessoa = 0 ) then
    raise Exception.Create('O campo Fornecedor � obrigat�rio!');

end;
end.

