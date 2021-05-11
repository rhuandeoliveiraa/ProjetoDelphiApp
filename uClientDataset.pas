unit uClientDataset;

interface
  uses
    classes, SysUtils, Windows, ComCtrls, StdCtrls, DB, DBClient;
type
  ClientDataset = class(TClientDataSet)
    class function Somar(FDataSet: TClientDataSet):Double;
    class function Dividir(FDataSet: TClientDataSet):Double;
    class procedure AddFields(FDataSet: TClientDataSet);
  private


  public


  end;
implementation

class function ClientDataset.Somar(FDataSet: TClientDataSet): Double;
begin
  Result := 0;
  FDataSet.First;
  while not FDataSet.Eof do begin
    Result := Result + FDataSet.FieldByName('VALOR').Value;
    FDataSet.Next;
  end;

end;

class function ClientDataset.Dividir(FDataSet: TClientDataSet): Double;
var
  valorAnterior: Double;
begin
  Result := 0;
  FDataSet.First;
  valorAnterior := FDataSet.FieldByName('VALOR').Value;
  while not FDataSet.Eof do begin
    Result := Result + (FDataSet.FieldByName('VALOR').Value/valorAnterior);
    valorAnterior := FDataSet.FieldByName('VALOR').Value;
    FDataSet.Next;
  end;
end;

class procedure ClientDataset.AddFields(FDataSet: TClientDataSet);
begin

end;
end.
