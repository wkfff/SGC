unit TestURateioVO;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, SysUtils, Atributos, UItensRateioVO, UCondominioVO,
  Generics.Collections, UGenericVO, Classes, Constantes, URateioVO;

type
  // Test methods for class TRateioVO

  TestTRateioVO = class(TTestCase)
  strict private
    FRateioVO: TRateioVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposObrigatorios;
    procedure TestValidarCamposObrigatoriosNaoEncontrado;
  end;

implementation

procedure TestTRateioVO.SetUp;
begin
  FRateioVO := TRateioVO.Create;
end;

procedure TestTRateioVO.TearDown;
begin
  FRateioVO.Free;
  FRateioVO := nil;
end;

procedure TestTRateioVO.TestValidarCamposObrigatorios;
var
  Rateio : TRateioVO;
begin
  Rateio := TRateioVO.Create;
  Rateio.dtRateio := StrToDate('01/01/2016');
  Rateio.idRateio := 11;
  try
     Rateio.ValidarCamposObrigatorios;
     Check(True,'Sucesso!')
  except on E: Exception do
     Check(False,'Erro!');
  end;
end;

procedure TestTRateioVO.TestValidarCamposObrigatoriosNaoEncontrado;
var
  Rateio : TRateioVO;
begin
  Rateio := TRateioVO.Create;
  Rateio.dtRateio := StrToDate('01/01/2016');
  Rateio.idRateio := 1;
  try
     Rateio.ValidarCamposObrigatorios;
     Check(false,'Erro!')
  except on E: Exception do
     Check(True,'Sucesso!');
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTRateioVO.Suite);
end.
