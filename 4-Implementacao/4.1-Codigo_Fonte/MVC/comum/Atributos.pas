unit Atributos;

interface

uses Classes, SysUtils, Generics.Defaults;

type

  TLocalDisplay = (ldGrid, ldLookup, ldComboBox);
  TLocalDisplayColumn = set of TLocalDisplay;

  // Mapeia uma classe como uma entidade persistente
  TEntity = class(TCustomAttribute)
  end;

  // Mapeia a classe de acordo com a tabela do banco de dados
  TTable = class(TCustomAttribute)
  private
    FName: String;
    FCatalog: String;
    FSchema: String;
  public
    constructor Create(pName, pCatalog, pSchema: String); overload;
    constructor Create(pName, pSchema: String); overload;
    constructor Create(pName: String); overload;
    property Name: String read FName write FName;
    property Catalog: String read FCatalog write FCatalog;
    property Schema: String read FSchema write FSchema;
  end;

  // Mapeia o identificador da classe, a chave prim�ria na tabela do banco de dados
  TId = class(TCustomAttribute)
  private
    FNameField: String;
  public
    constructor Create(pNameField: String);
    property NameField: String read FNameField write FNameField;
  end;

  // Mapeia um campo de uma tabela no banco de dados
  TColumn = class(TCustomAttribute)
  private
    FName: String;
    FCaption: String;
    FUnique: Boolean;
    FLength: Integer;
    FLocalDisplay: TLocalDisplayColumn;
    FTransiente: Boolean;
    FTableName: String;
    FAliasTable: String;
    FAliasColumn: String;
    FLocalColumn: String;
    FForeingColumn: String;
  public
    constructor Create(pName: String); overload;
    constructor Create(pName: String; pCaption: String); overload;
    constructor Create(pName: String; pCaption: String; pUnique: Boolean; pLength: Integer); overload;
    constructor Create(pName: String; pUnique: Boolean; pLength: Integer); overload;
    constructor Create(pName: String; pUnique: Boolean); overload;
    constructor Create(pName: String; pLength: Integer); overload;
    constructor Create(pName: String; pCaption: String; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean); overload;
    constructor Create(pName: String; pCaption: String; pTransiente: Boolean); overload;
    constructor Create(pName: String; pCaption: String; pUnique: Boolean; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean); overload;
    constructor Create(pName: String; pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean); overload;
    constructor Create(pName: String; pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean; pTableName: String; pLocalColumn: String; pForeingColumn: String); overload;
    constructor Create(pName: String; pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean; pTableName: String; pLocalColumn: String; pForeingColumn: String; pAliasTable:String; pAliasColumn:String); overload;

    property Name: String read FName write FName;
    property Caption: String read FCaption write FCaption;
    property Unique: Boolean read FUnique write FUnique;
    property Length: Integer read FLength write FLength;
    property LocalDisplay: TLocalDisplayColumn read FLocalDisplay write FLocalDisplay;
    property Transiente: Boolean read FTransiente write FTransiente;
    { Para informar o nome da tabela da da coluna transiente }
    property TableName: String read FTableName write FTableName;

    property AliasTable: String read FAliasTable write FAliasTable;
    property AliasColumn: String read FAliasColumn write FAliasColumn;

    { Campo da tabela local utilizado para montar o Join }
    property LocalColumn: String read FLocalColumn write FLocalColumn;
    { Campo da tabela estrangeira utilizado para montar o Join }
    property ForeingColumn: String read FForeingColumn write FForeingColumn;

    function Clone: TColumn;
    function LocalDisplayIs(pLocalDisplay: TLocalDisplay): Boolean;
    function LocalDisplayContainsOneTheseItems(pLocalDisplay: TLocalDisplayColumn): Boolean;
  end;

  { Estrat�gia de gera��o de valores para chaves prim�rias, valores poss�veis:
    sAuto = o provedor de persist�ncia escolhe a estrat�gia mais adequada dependendo do banco de dados
    sIdentity = utiliza��o se identity do banco de dados
    sSequence = utiliza��o se sequence do banco de dados
    sTable = chave gerada por uma tabela exclusiva para este fim
    }
  TStrategy = (sAuto, sIdentity, sSequence, sTable);

  // Informa a estrat�gia de gera��o de valores para chaves prim�rias
  TGeneratedValue = class(TCustomAttribute)
  private
    FStrategy: TStrategy;
    FGenerator: String;
  public
    constructor Create(pStrategy: TStrategy; pGenerator: String); overload;
    constructor Create(pStrategy: TStrategy); overload;
    property Strategy: TStrategy read FStrategy write FStrategy;
    property Generator: String read FGenerator write FGenerator;
  end;

  TUniqueConstraint = class(TCustomAttribute)
  private
    FColumns: array of String;
    function GetColumn(Index: Integer): String;
  public
    constructor Create(pColumns: array of String);
    function ColumnCount: Integer;
    property Column[Index: Integer]: String read GetColumn;
  end;

  // Define uma associa��o da classe atual para outra classe de entidade
  TAssociation = class(TCustomAttribute)
  private
    FGetRelations: Boolean;
    FForeingColumn: String;
    FLocalColumn: String;
    FTableName: String;
  public
    constructor Create(pGetRelations: Boolean; pForeingColumn: String; pLocalColumn: String); overload;
    constructor Create(pGetRelations: Boolean; pForeingColumn: String; pLocalColumn: String; pTableName: String); overload;

    { O objeto referenciado no VO sempre � retornato. Se esse objeto tiver outros objetos referenciados,
      eles s� ser�o retornados caso essa op��o seja marcada como True }
    property GetRelations: Boolean read FGetRelations write FGetRelations;
    { Campo pertencente � tabela vinculada que ser� utilizado para o filtro da pesquisa }
    property ForeingColumn: String read FForeingColumn write FForeingColumn;
    { Campo local cujo valor ser� utilizado para realizar a pesquisa na ForeingColumn }
    property LocalColumn: String read FLocalColumn write FLocalColumn;
    { Para informar o nome da tabela da rela��o }
    property TableName: String read FTableName write FTableName;
  end;

  { Define uma associa��o para outra classe em um
    atributo multivalorado, como por exemplo, uma lista de itens }
  TManyValuedAssociation = class(TAssociation)
  end;

  { � utilizado junto com as anota��es de  Association  e define uma
    das colunas que comp�e a chave estrangeira para a tabela da classe associada
    obs: ainda n�o utilizado pelo ORM }
  TJoinColumn = class(TCustomAttribute)
  private
    FRequired: Boolean;
    FColumn: String;
  public
    constructor Create(pColumn: String; pRequired: Boolean);
    property Column: String read FColumn write FColumn;
    property Required: Boolean read FRequired write FRequired;
  end;

  { � utilizada junto com as anota��es de  ManyValuedAssociation  e define uma
    das colunas que comp�e a chave estrangeira  da tabela associada  para a
    tabela atual, caso a associa��o seja unidirecional
    obs: ainda n�o utilizado pelo ORM }
  TForeignJoinColumn = class(TCustomAttribute)
  public
  private
    FRequired: Boolean;
    FColumn: String;
  public
    constructor Create(pColumn: String; pRequired: Boolean); overload;
    constructor Create(pColumn: String); overload;
    property Column: String read FColumn write FColumn;
    property Required: Boolean read FRequired write FRequired;
  end;

  // Mapeia Formul�rios do Sistema
  TFormDescription = class(TCustomAttribute)
  private
    FModule: String;
    FDescription: String;
  public
    constructor Create(pModule, pDescription: String);
    property Module: String read FModule;
    property Description: String read FDescription;
  end;

  // Mapeia Componentes do Sistema
  TComponentDescription = class(TCustomAttribute)
  private
    FDescription: String;
    FClassOwner: TClass;
  public
    constructor Create(pDescription: String); overload;
    constructor Create(pDescription: String; pClassOwner: TClass); overload;
    property Description: String read FDescription;
    property ClassOwner: TClass read FClassOwner;
  end;

  // Formatter
  TFormatter = class(TCustomAttribute)
  private
    FFormatter: String;
    FAlignment: TAlignment;
  public
    constructor Create(pFormatter: String); overload;
    constructor Create(pAlignment: TAlignment); overload;
    constructor Create(pFormatter: String; pAlignment: TAlignment); overload;

    property Formatter: String read FFormatter write FFormatter;
    property Alignment: TAlignment read FAlignment write FAlignment;
  end;



  Nullable<T> = record
  private

    FValue: T;
    FHasValue: IInterface;

    function GetValue: T;
    function GetHasValue: Boolean;

  public

    constructor Create(AValue: T); overload;

  //  function GetValueOrDefault: T; overload;
  //  function GetValueOrDefault(Default: T): T; overload;

    property HasValue: Boolean read GetHasValue;
    property Value: T read GetValue;

   // class operator NotEqual(ALeft, ARight: Nullable<T>): Boolean;
   // class operator Equal(ALeft, ARight: Nullable<T>): Boolean;

  //  class operator Implicit(Value: Nullable<T>): T;
  //  class operator Implicit(Value: T): Nullable<T>;
  //  class operator Explicit(Value: Nullable<T>): T;
  end;





implementation



constructor Nullable<T>.Create(AValue: T);
begin
  FValue := AValue;
  FHasValue := TInterfacedObject.Create;

//  SetFlagInterface(FHasValue);
end;

function Nullable<T>.GetHasValue: Boolean;
begin
  Result := FHasValue <> nil;
end;

function Nullable<T>.GetValue: T;
begin
  if not HasValue then
    raise Exception.Create('Invalid operation, Nullable type has no value');
  Result := FValue;
end;


{ TTable }


constructor TTable.Create(pName, pCatalog, pSchema: String);
begin
  FName := pName;
  FCatalog := pCatalog;
  FSchema := pSchema;
end;

constructor TTable.Create(pName, pSchema: String);
begin
  FName := pName;
  FSchema := pSchema;
end;

constructor TTable.Create(pName: String);
begin
  FName := pName;
end;

{ TId }

constructor TId.Create(pNameField: String);
begin
  FNameField := pNameField;
end;

{ TColumn }

constructor TColumn.Create(pName: String; pUnique: Boolean; pLength: Integer);
begin
  FName := pName;
  FUnique := pUnique;
  FLength := pLength;
end;

constructor TColumn.Create(pName: String; pLength: Integer);
begin
  FName := pName;
  FLength := pLength;
end;

constructor TColumn.Create(pName: String; pUnique: Boolean);
begin
  FName := pName;
  FUnique := pUnique;
end;

constructor TColumn.Create(pName: String);
begin
  FName := pName;
  FTransiente := False;
end;

function TColumn.Clone: TColumn;
begin
  Result := TColumn.Create(FName, FCaption, FUnique, FLength, FLocalDisplay, FTransiente);
end;

constructor TColumn.Create(pName, pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean);
begin
  Create(pName, pCaption, pLocalDisplay, pTransiente);

  FLength := pLength;
end;

constructor TColumn.Create(pName: String; pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean; pTableName: String; pLocalColumn: String; pForeingColumn: String);
begin
  Create(pName, pCaption, pLocalDisplay, pTransiente);

  FLength := pLength;
  FTableName := pTableName;
  FLocalColumn := pLocalColumn;
  FForeingColumn := pForeingColumn;
end;

constructor TColumn.Create(pName: String; pCaption: String; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean; pTableName: String; pLocalColumn: String; pForeingColumn: String; pAliasTable:String; pAliasColumn:String);
begin
  Create(pName, pCaption, pLocalDisplay, pTransiente);

  FLength := pLength;
  FTableName := pTableName;
  FLocalColumn := pLocalColumn;
  FForeingColumn := pForeingColumn;
  FAliasTable:= pAliasTable;
  FAliasColumn:= pAliasColumn;
end;

constructor TColumn.Create(pName, pCaption: String; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean);
begin
  FName := pName;
  FCaption := pCaption;
  FLocalDisplay := pLocalDisplay;
  FTransiente := pTransiente;
end;

constructor TColumn.Create(pName, pCaption: String; pUnique: Boolean; pLength: Integer);
begin
  FName := pName;
  FCaption := pCaption;
  FUnique := pUnique;
  FLength := pLength;
end;

constructor TColumn.Create(pName, pCaption: String);
begin
  FName := pName;
  FCaption := pCaption;
end;

constructor TColumn.Create(pName, pCaption: String; pUnique: Boolean; pLength: Integer; pLocalDisplay: TLocalDisplayColumn; pTransiente: Boolean);
begin
  FName := pName;
  FCaption := pCaption;
  FUnique := pUnique;
  FLength := pLength;
  FLocalDisplay := pLocalDisplay;
  FTransiente := pTransiente;
end;

constructor TColumn.Create(pName, pCaption: String; pTransiente: Boolean);
begin
  FName := pName;
  FCaption := pCaption;
  FTransiente := pTransiente;
end;

function TColumn.LocalDisplayIs(pLocalDisplay: TLocalDisplay): Boolean;
begin
  Result := pLocalDisplay in FLocalDisplay;
end;

function TColumn.LocalDisplayContainsOneTheseItems(pLocalDisplay: TLocalDisplayColumn): Boolean;
var
  Local: TLocalDisplay;
begin
  Result := False;

  for Local in pLocalDisplay do
  begin
    if LocalDisplayIs(Local) then
    begin
      Exit(True)
    end;
  end;
end;

{ TGeneratedValue }

constructor TGeneratedValue.Create(pStrategy: TStrategy; pGenerator: String);
begin
  FStrategy := pStrategy;
  FGenerator := pGenerator;
end;

constructor TGeneratedValue.Create(pStrategy: TStrategy);
begin
  FStrategy := pStrategy;
end;

{ TFormCategory }

constructor TFormDescription.Create(pModule, pDescription: String);
begin
  FModule := pModule;
  FDescription := pDescription;
end;

{ TComponentDescription }

constructor TComponentDescription.Create(pDescription: String);
begin
  FDescription := pDescription;
  FClassOwner := nil;
end;

constructor TComponentDescription.Create(pDescription: String; pClassOwner: TClass);
begin
  FDescription := pDescription;
  FClassOwner := pClassOwner;
end;

{ TUniqueConstraint }

constructor TUniqueConstraint.Create(pColumns: array of String);
var
  I: Integer;
begin
  SetLength(FColumns, Length(pColumns));
  for I := 0 to Length(pColumns) - 1 do
  begin
    FColumns[I] := pColumns[I];
  end;
end;

function TUniqueConstraint.ColumnCount: Integer;
begin
  Result := Length(FColumns);
end;

function TUniqueConstraint.GetColumn(Index: Integer): String;
begin
  if (Index < 0) or (Index > Length(FColumns) - 1) then
    raise Exception.Create('Este indice n�o existe.');

  Result := FColumns[Index];
end;

{ TAssociation }
constructor TAssociation.Create(pGetRelations: Boolean; pForeingColumn: String; pLocalColumn: String);
begin
  FGetRelations := pGetRelations;
  FForeingColumn := pForeingColumn;
  FLocalColumn := pLocalColumn;
end;

constructor TAssociation.Create(pGetRelations: Boolean; pForeingColumn, pLocalColumn, pTableName: String);
begin
  FGetRelations := pGetRelations;
  FForeingColumn := pForeingColumn;
  FLocalColumn := pLocalColumn;
  FTableName := pTableName;
end;

{ TJoinColumn }
constructor TJoinColumn.Create(pColumn: String; pRequired: Boolean);
begin
  FRequired := pRequired;
  FColumn := pColumn;
end;

{ TForeignJoinColumn }

constructor TForeignJoinColumn.Create(pColumn: String; pRequired: Boolean);
begin
  FColumn := pColumn;
  FRequired := pRequired;
end;

constructor TForeignJoinColumn.Create(pColumn: String);
begin
  Create(pColumn, False);
end;

{ Formatter }

constructor TFormatter.Create(pFormatter: String);
begin
  FFormatter := pFormatter;
end;

constructor TFormatter.Create(pAlignment: TAlignment);
begin
  FAlignment := pAlignment;
end;

constructor TFormatter.Create(pFormatter: String; pAlignment: TAlignment);
begin
  FFormatter := pFormatter;
  FAlignment := pAlignment;
end;

end.
