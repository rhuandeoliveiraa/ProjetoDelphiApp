unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, DB, DBClient,
  Vcl.DBGrids, MidasLib,uFuncoes;

type
  TfTarefa3 = class(TForm)
    stTextoValorProjeto: TStaticText;
    sbObterTotal: TSpeedButton;
    edTotal: TEdit;
    stTotal: TStaticText;
    sbObterTotalDivisoes: TSpeedButton;
    edTotalDivisoes: TEdit;
    StaticText1: TStaticText;
    dbProjetos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure sbObterTotalClick(Sender: TObject);
    procedure sbObterTotalDivisoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fFormUFuncoes: TfuFuncoes;
    procedure PreencherGrid;
    procedure RelacionarGrid;
    procedure PopularLinhasGrid(FDataSet: TClientDataSet);
    procedure PopularColunasGrid(FDataSet: TClientDataSet);
    procedure FormatarCamposDataSet(FDataSet : TClientDataSet);

  end;
var
  DSTarefa3: TDataSource;
  sDataClienteTarefa3: TClientDataSet;

implementation
uses
  StrUtils,
  Math;

{$R *.dfm}

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  PreencherGrid;
end;

procedure TfTarefa3.PreencherGrid;
begin
  sDataClienteTarefa3 := TClientDataSet.Create(nil);
  PopularColunasGrid(sDataClienteTarefa3);

  sDataClienteTarefa3.CreateDataSet;


  PopularLinhasGrid(sDataClienteTarefa3);
  RelacionarGrid;
  FormatarCamposDataSet(sDataClienteTarefa3);
end;

procedure TfTarefa3.RelacionarGrid;
begin
  try
    DSTarefa3 := TDataSource.Create(nil);
    dbProjetos.DataSource :=  DSTarefa3;
    DSTarefa3.DataSet := sDataClienteTarefa3;
  except
    on E:exception do
      ShowMessage('Erro relacionar o Dataset ao ClienteDataSet!  ' + E.Message);
  end;
end;

procedure TfTarefa3.sbObterTotalClick(Sender: TObject);
begin
  edTotal.Text := FloatToStr(fFormUFuncoes.SomarCamposDataset(sDataClienteTarefa3));
  edTotal.Text := fFormUFuncoes.FormatarEditDuasCasas(edTotal.Text);
end;

procedure TfTarefa3.sbObterTotalDivisoesClick(Sender: TObject);
begin
  edTotalDivisoes.Text :=  FloatToStr(fFormUFuncoes.DividirCamposDataset(sDataClienteTarefa3));
  edTotalDivisoes.Text := fFormUFuncoes.FormatarEditDuasCasas(edTotalDivisoes.Text);
end;

procedure TfTarefa3.PopularLinhasGrid(FDataSet: TClientDataSet);
var
  linha, numRandom: Integer;
begin
  try
    for linha := 1 to 10 do begin
      FDataSet.Append;
      FDataSet.FieldByName('IDPROJETO').AsInteger := linha;
      FDataSet.FieldByName('NOMEPROJETO').AsString := 'Projeto ' + IntToStr(linha);
      numRandom :=  Random(100);
      FDataSet.FieldByName('VALOR').AsFloat := linha * ifthen(numRandom = 0, 1 , numRandom);
      FDataSet.Post;
    end;
  except
    on E:exception do
      ShowMessage('Erro ao adicionar valores no dataset!  ' + E.Message);
  end;

end;

procedure TfTarefa3.PopularColunasGrid(FDataSet: TClientDataSet);
begin
  try
    fFormUFuncoes.AdicionarCampoDataSet(sDataClienteTarefa3, 'IDPROJETO', ftInteger,0);
    fFormUFuncoes.AdicionarCampoDataSet(sDataClienteTarefa3, 'NOMEPROJETO', ftString, 60);
    fFormUFuncoes.AdicionarCampoDataSet(sDataClienteTarefa3, 'VALOR', ftFloat,0);
  except
    on E:exception do
      ShowMessage('Erro ao adicionar campo no dataset!  ' + E.Message);
  end;

end;

procedure  TfTarefa3.FormatarCamposDataSet(FDataSet : TClientDataSet);
var
 linha : Integer;
Begin
  for linha:= 0 to FDataSet.FieldCount  - 1 do begin
     If ((FDataSet.Fields[linha] is TFloatField )) then
         TFloatField(FDataSet.FieldByName(FDataSet.Fields[linha].FieldName )).DisplayFormat := '#,##0.00';
  end;
end;
end.
