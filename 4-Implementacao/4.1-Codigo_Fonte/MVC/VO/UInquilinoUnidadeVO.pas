unit UInquilinoUnidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UCondominioVO, UPessoasVO;

type
  [TEntity]
  [TTable('InquilinoUnidade')]
  TInquilinoUnidadeVO = class(TGenericVO)
  private
    FidInquilinounidade: Integer;
    FidUnidade: Integer;
    FidPessoa : Integer;
    FdtInicio : TdateTime;
    FNomePessoa : string;


  public
    CondominioVO : TCondominioVO;
    PessoaVo : TPessoasVO;

    [TId('idinquilinounidade')]
    [TGeneratedValue(sAuto)]
    property idInquilinounidade: Integer  read FidInquilinounidade write FidInquilinounidade;
    [TColumn('nome','Pessoa',500,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property NomePessoa: string  read FNomePessoa write FNomePessoa;
    [TColumn('idunidade','Unidade',50,[ldLookup,ldComboBox], False)]
    property IdUnidade: Integer  read FidUnidade write FidUnidade;
    [TColumn('idpessoa','id Pessoa',50,[ldLookup,ldComboBox], False)]
    property idPessoa: Integer  read FidPessoa write FidPessoa;
    [TColumn('DtInicio','Data Inicio',70,[ldGrid,ldLookup,ldComboBox], False)]
    property DtInicio: TDateTime  read FdtInicio write FdtInicio;



    procedure ValidarCampos;

  end;

  implementation

  { TProprietarioUnidadeVO }

procedure TInquilinoUnidadeVO.ValidarCampos;
begin

  if (Self.FidPessoa = 0) then
  begin
    raise Exception.Create('O campo Inquilino � obrigat�rio!');

  end
  else if (self.FdtInicio = 0) then
  begin
    raise Exception.Create('O campo data � obrigat�rio!');

  end;
end;

end.

