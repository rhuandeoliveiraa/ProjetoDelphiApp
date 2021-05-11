unit uspQuery;

interface
uses FireDAC.Comp.Client, Classes, SysUtils, FireDAC.Phys;

type
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
  public
    procedure GeraSQL;
    procedure VerificarCampos;
    constructor Create(aOwnerComponent: TComponent); override;
    destructor Destroy(); override;
  published
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas:   TStringList read FspColunas   write FspColunas;
    property spTabelas:   TStringList read FspTabelas   write FspTabelas;
end;

implementation

constructor TspQuery.Create(aOwnerComponent: TComponent);
begin
  inherited;

  FspCondicoes := TStringList.Create;
  FspColunas   := TStringList.Create;
  FspTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  inherited;

  FreeAndNil(FspCondicoes);
  FreeAndNil(FspColunas);
  FreeAndNil(FspTabelas);
end;

procedure TspQuery.GeraSQL;
var
  stlSQL: TStringList;
  linha: Integer;
begin
  stlSQL := TStringList.Create;

  try
    stlSQL.Clear;
    stlSQL.Add('SELECT ');

    VerificarCampos;

    if (Self.spColunas.Count <= 0) then
      stlSQL.Add('*')
    else begin
     stlSQL.Add('  ' + self.spColunas[0]);

     for linha := 1 to Self.spColunas.Count - 1 do
      stlSQL.Add('  ,' +self.spColunas[linha]);
    end;

    stlSQL.Add('FROM ');
    stlSQL.Add('  '+ Self.spTabelas[0]);

    if (Self.spCondicoes.Count > 0) then begin
     stlSQL.Add('WHERE ' + self.spCondicoes[0]);

     for linha := 1 to Self.spCondicoes.Count - 1 do
      stlSQL.Add('AND ' + self.spCondicoes[linha]);
    end;

    SQL.Add(stlSQL.Text);
  finally
    FreeAndNil(stlSQL);
  end;
end;


procedure TspQuery.VerificarCampos;
begin
 if (Self.spTabelas.Count <= 0) then
  raise Exception.Create('É necessário informar ao menos uma tabela!');

 if (Self.spTabelas.Count > 1) then
  raise Exception.Create('Somente uma tabela pode ser utilizada!');
end;
end.
