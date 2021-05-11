unit uFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  System.Threading,DB, DBClient, Vcl.StdCtrls, MaskUtils ;

type
  TfuFuncoes = class(TForm)
  public
    procedure CriarForm(MainForm:TForm; InstanceClass: TFormClass; var Reference);
    function VerificarCampoVazioOuZerado(valor: string): Boolean;
    function SomarCamposDataset(FDataSet: TClientDataSet): Double;
    function DividirCamposDataset(FDataSet: TClientDataSet): Double;
    procedure AdicionarCampoDataSet(FDataSet: TClientDataSet;FCampo: string; FTipoCampo: TFieldType; FTamanhoString: Integer);
    function FormatarEditDuasCasas(valorEdit: string): string;
    procedure MostrarFormFilho(MainForm : TForm; InstanceClass: TFormClass; var Reference);
    function ExisteFormFilho(InstanceClass: TFormClass): Boolean;
  end;

implementation

{$R *.dfm}

procedure TfuFuncoes.CriarForm(MainForm:TForm; InstanceClass: TFormClass; var Reference);
begin
  MostrarFormFilho(MainForm, InstanceClass, Reference);
end;

function TfuFuncoes.ExisteFormFilho(InstanceClass: TFormClass): Boolean;
var
  I: Integer;
begin
  with (Application.MainForm) do
    for I := 0 to MDIChildCount - 1 do
      if (MDIChildren[i] is InstanceClass) then
      begin
        Result:= True;
        Exit;
      end;
  Result:= False;
end;

procedure TfuFuncoes.MostrarFormFilho(MainForm : TForm; InstanceClass: TFormClass; var Reference);
var
  Instance: TForm;
begin
  Screen.Cursor:= crHourglass;
  LockWindowUpdate(MainForm.Handle);
  if not ExisteFormFilho(InstanceClass) then
    try
      Instance:= TForm(InstanceClass.NewInstance);
      TForm(Reference):= Instance;
      try
        Instance.Create(MainForm);
        if (Instance as TForm).FormStyle = fsNormal then
        begin
          (Instance as TForm).FormStyle := fsMdiChild;
          (Instance as TForm).Visible := True;
        end;
      except
        TForm(Reference):= nil;
        Instance.Free;
        raise;
      end;
    finally
      Screen.Cursor:= crDefault;
    end
  else
    with TForm(Reference) do begin
      if WindowState = wsMinimized then WindowState:= wsNormal;
      BringToFront;
      Screen.Cursor:= crDefault;
      SetFocus;
    end;

  LockWindowUpdate(0);
end;


function TfuFuncoes.VerificarCampoVazioOuZerado(valor: string): Boolean;
begin
  Result := True;
  if valor <> '' then begin
    if (StrToInt(valor) > 0) then
      Result := False;
  end;
end;

function TfuFuncoes.SomarCamposDataset(FDataSet: TClientDataSet): Double;
begin
  Result := 0;
  FDataSet.First;
  while not FDataSet.Eof do begin
    Result := Result + FDataSet.FieldByName('VALOR').Value;
    FDataSet.Next;
  end;
end;

function TfuFuncoes.DividirCamposDataset(FDataSet: TClientDataSet): Double;
var
  valorAnterior: Double;
begin
  Result := 0;
  FDataSet.First;
  valorAnterior := FDataSet.FieldByName('VALOR').Value;
  FDataSet.Next;
  while not FDataSet.Eof do begin
    if valorAnterior > 0 then
      Result := Result + (FDataSet.FieldByName('VALOR').Value/valorAnterior);

    valorAnterior := FDataSet.FieldByName('VALOR').Value;
    FDataSet.Next;
  end;
end;

procedure TfuFuncoes.AdicionarCampoDataSet(FDataSet: TClientDataSet;FCampo: string; FTipoCampo: TFieldType; FTamanhoString: Integer);
begin
  if FTamanhoString <> 0 then
    FDataSet.FieldDefs.Add(FCampo, FTipoCampo,FTamanhoString)
  else
    FDataSet.FieldDefs.Add(FCampo, FTipoCampo);
end;

function TfuFuncoes.FormatarEditDuasCasas(valorEdit: string): string;
begin
  Result := FormatFloat('0.00', StrToFloat(valorEdit));
end;
end.
