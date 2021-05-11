unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    mColunas: TMemo;
    mTabelas: TMemo;
    mCondicoes: TMemo;
    mSqlGerado: TMemo;
    spbGeraSql: TSpeedButton;
    stSqlGerado: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    tspGeraConsulta: TspQuery;
    procedure spbGeraSqlClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  public
    Function MontaSql(Colunas, Tabelas, Condicoes: Tmemo): String;
  end;

implementation

{$R *.dfm}

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

function TfTarefa1.MontaSql(Colunas, Tabelas,
  Condicoes: Tmemo): String;
var
  i: Integer;
begin
  Result := '';

  tspGeraConsulta := TspQuery.Create(nil);

  try
    try
      for i := 0 to Colunas.Lines.Count -1 do
        tspGeraConsulta.spColunas.Add(Colunas.Lines[i]);

      for i := 0 to Tabelas.Lines.Count -1 do
        tspGeraConsulta.spTabelas.Add(Tabelas.Lines[i]);

      for i := 0 to Condicoes.Lines.Count -1 do
        tspGeraConsulta.spCondicoes.Add(Condicoes.Lines[i]);

      tspGeraConsulta.GeraSQL;

      Result := tspGeraConsulta.SQL.Text;
    except
      on E:exception do
        ShowMessage(E.Message);
    end;

  finally
    FreeAndNil(tspGeraConsulta);
  end;
end;
procedure TfTarefa1.spbGeraSqlClick(Sender: TObject);
begin
  mSqlGerado.Text := MontaSql(mColunas, mTabelas, mCondicoes);
end;

end.
