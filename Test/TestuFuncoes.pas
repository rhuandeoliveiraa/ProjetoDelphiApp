unit TestuFuncoes;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Vcl.Dialogs, Winapi.Windows, Vcl.StdCtrls, DBClient, System.SysUtils,
  DB, Vcl.Graphics, System.Variants, uFuncoes, System.Threading, Winapi.Messages,
  Vcl.Controls, Vcl.Forms, System.Classes;

type
  // Test methods for class TfuFuncoes

  TestTfuFuncoes = class(TTestCase)
  strict private
    FfuFuncoes: TfuFuncoes;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestVerificarCampoVazioOuZerado;
    procedure TestSomarCamposDataset;
    procedure TestDividirCamposDataset;
    procedure TestFormatarEditDuasCasas;
  end;

implementation

procedure TestTfuFuncoes.SetUp;
begin
  FfuFuncoes := TfuFuncoes.Create(nil);
end;

procedure TestTfuFuncoes.TearDown;
begin
  FfuFuncoes.Free;
  FfuFuncoes := nil;
end;

procedure TestTfuFuncoes.TestVerificarCampoVazioOuZerado;
var
  ReturnValue: Boolean;
  valor: string;
begin
  valor := '1';
  ReturnValue := FfuFuncoes.VerificarCampoVazioOuZerado(valor);
  CheckEquals(False, ReturnValue, 'M�todo VerificarCampoVazioOuZerado retornou valor errado!' );

  valor := '0';
  ReturnValue := FfuFuncoes.VerificarCampoVazioOuZerado(valor);
  CheckEquals(True, ReturnValue, 'M�todo VerificarCampoVazioOuZerado retornou valor errado!' );
end;

procedure TestTfuFuncoes.TestSomarCamposDataset;
var
  ReturnValue: Double;
  FDataSet: TClientDataSet;
begin
  FDataSet := TClientDataSet.Create(nil);
  FDataSet.FieldDefs.Add('VALOR', ftFloat);
  FDataSet.CreateDataSet;

  FDataSet.Append;
  FDataSet.FieldByName('VALOR').AsFloat := 10;
  FDataSet.Post;

  FDataSet.Append;
  FDataSet.FieldByName('VALOR').AsFloat := 20;
  FDataSet.Post;

  ReturnValue := FfuFuncoes.SomarCamposDataset(FDataSet);

  CheckEquals(30, ReturnValue, 'M�todo SomarCamposDataset retornou valor errado!' );
end;

procedure TestTfuFuncoes.TestDividirCamposDataset;
var
  ReturnValue: Double;
  FDataSet: TClientDataSet;
begin
  FDataSet := TClientDataSet.Create(nil);
  FDataSet.FieldDefs.Add('VALOR', ftFloat);
  FDataSet.CreateDataSet;

  FDataSet.Append;
  FDataSet.FieldByName('VALOR').AsFloat := 10;
  FDataSet.Post;

  FDataSet.Append;
  FDataSet.FieldByName('VALOR').AsFloat := 20;
  FDataSet.Post;

  FDataSet.Append;
  FDataSet.FieldByName('VALOR').AsFloat := 30;
  FDataSet.Post;

  ReturnValue := FfuFuncoes.DividirCamposDataset(FDataSet);

  CheckEquals(3.5, ReturnValue, 'M�todo DividirCamposDataset retornou valor errado!' );
end;

procedure TestTfuFuncoes.TestFormatarEditDuasCasas;
var
  ReturnValue: string;
  valorString: string;
begin
  valorString := '2';

  ReturnValue := FfuFuncoes.FormatarEditDuasCasas(valorString);

  CheckEquals('2,00', ReturnValue, 'M�todo FormatarEditDuasCasas retornou valor errado!' );
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTfuFuncoes.Suite);
end.

