unit UTela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, DBClient,
  UGenericVO,
  DB, UController, Generics.Collections, Atributos, Rtti;

type
  TClasseObjetoGridVO = class of TGenericVO;

  TFTela = class(TFBase)
    PageControl: TPageControl;
    Consulta: TTabSheet;
    Grid: TDBGrid;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    EditBusca: TMaskEdit;
    BotaoConsultar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BotaoConsultarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    // ObjetoController: TController<TGenericVO>;

    ObjetoRetornoVO: TGenericVO;
    FechaForm: boolean;

    ClasseObjetoGridVO: TClassGenericVO;
    procedure ConfiguraGrid;
    procedure LimparCampos; virtual;
    procedure GridParaEdits; virtual;
    procedure PopulaGrid<T: class>(lista: TObjectList<T>);
    procedure DoConsultar; virtual;
    procedure CarregaObjetoSelecionado; virtual;
  published
    CDSGrid: TClientDataSet;
    DSGrid: TDataSource;
  end;

var
  FTela: TFTela;

implementation

{$R *.dfm}

uses Biblioteca, TypInfo;

{ TFTela }

procedure TFTela.PopulaGrid<T>(lista: TObjectList<T>);
var
  I: Integer;
  ObjetoVO: T;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  Metodo: TRttiMethod;
  Params: TArray<TRttiParameter>;
  DataSetField: TField;
  EncontrouConstrutor: boolean;
begin
  if not Assigned(CDSGrid) then
    Exit;

  try
    CDSGrid.DisableControls;
    CDSGrid.EmptyDataSet;

    try
      Contexto := TRttiContext.Create;
      Tipo := Contexto.GetType(TClass(T));

      for I := 0 to lista.Count - 1 do
      begin
        ObjetoVO := lista[I];
        try
          CDSGrid.Append;

          for Propriedade in Tipo.GetProperties do
          begin
            for Atributo in Propriedade.GetAttributes do
            begin
              if Atributo is TColumn then
              begin
                  if (TColumn(Atributo).LocalDisplayIs(ldGrid))then
                  begin
                    DataSetField := CDSGrid.FindField((Atributo as TColumn).Name);
                    if Assigned(DataSetField) then
                    begin
                      if Propriedade.PropertyType.TypeKind in [tkEnumeration] then
                        DataSetField.AsBoolean :=
                          Propriedade.GetValue(TObject(ObjetoVO)).AsBoolean
                      else
                        DataSetField.Value := Propriedade.GetValue(TObject(ObjetoVO)
                          ).AsVariant;

                      if DataSetField.DataType = ftDateTime then
                      begin
                        if DataSetField.AsDateTime = 0 then
                          DataSetField.Clear;
                      end;

                      if DataSetField.DataType = ftInteger then
                      begin
                        if DataSetField.AsInteger = 0 then
                          DataSetField.Clear;
                      end;

                    end;
                  end;
              end
              else if Atributo is TId then
              begin
                DataSetField := CDSGrid.FindField((Atributo as TId).NameField);
                if Assigned(DataSetField) then
                begin
                  DataSetField.Value := Propriedade.GetValue(TObject(ObjetoVO))
                    .AsVariant;
                end;
              end;
            end;
          end;
        finally
          TObject(ObjetoVO).Free;
        end;

        CDSGrid.Post;
      end;
    finally
      Contexto.Free;
    end;

    CDSGrid.Open;
    CDSGrid.First;
  finally
    CDSGrid.EnableControls;
  end;
end;

procedure TFTela.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFTela.BotaoConsultarClick(Sender: TObject);
begin
  inherited;
  DoConsultar;
end;

procedure TFTela.CarregaObjetoSelecionado;
begin

end;

procedure TFTela.ConfiguraGrid;
begin
  ConfiguraCDSFromVO(CDSGrid, ClasseObjetoGridVO);
  ConfiguraGridFromVO(Grid, ClasseObjetoGridVO);
end;

procedure TFTela.DoConsultar;
begin

end;

procedure TFTela.FormCreate(Sender: TObject);
begin
  inherited;
  FechaForm := false;
  ObjetoRetornoVO := nil;
  CDSGrid := TClientDataSet.Create(Self);
  DSGrid := TDataSource.Create(Self);
  DSGrid.DataSet := CDSGrid;
  Grid.DataSource := DSGrid;
  PageControl.ActivePage := Consulta;
  ConfiguraGrid;
end;

procedure TFTela.FormShow(Sender: TObject);
begin
  inherited;
  DoConsultar;
end;

procedure TFTela.LimparCampos;
var
  I: Integer;
begin

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TLabeledEdit) then
      (Components[I] as TLabeledEdit).Text := ''
    else if (Components[I] is TEdit) then
      (Components[I] as TEdit).Text := ''
    else if (Components[I] is TMaskEdit) then
      (Components[I] as TMaskEdit).Text := ''
    else if (Components[I] is TMemo) then
      (Components[I] as TMemo).Lines.Clear;
  end;

end;

procedure TFTela.GridDblClick(Sender: TObject);
begin
  if (FechaForm = true) then
  begin
    CarregaObjetoSelecionado;
    Close;
  end;
end;

procedure TFTela.GridParaEdits;
begin
  LimparCampos;
end;

end.
