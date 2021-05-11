unit uTrhead;

interface
uses
  classes, SysUtils, Windows, ComCtrls, StdCtrls;

type
  { TMinhaThread }

  Thread = class(TThread)
  private
    FTempo       : Integer;
    FProgressBar : TProgressBar;
    FTexto       : TStaticText;

  public
    procedure AvancarBarraProgresso;
    procedure PreencherPercentual(linha: integer);
    procedure Execute; override;
    constructor Create(BarraProgresso: TProgressBar; Tempo: integer; Texto: TStaticText); overload;
  end;

implementation

constructor Thread.Create(BarraProgresso: TProgressBar; Tempo: integer; Texto: TStaticText);
begin
  inherited Create(True);
  FProgressBar := BarraProgresso;
  FTempo       := Tempo;
  FTexto       := Texto;
end;

procedure Thread.Execute;
var
  linha: Integer;
begin
  FProgressBar.Position := 0;
  for linha := 0 to 100 do
  begin
    if Self.Terminated then
      Abort;

    Sleep(FTempo);
    Synchronize(AvancarBarraProgresso);
  end;
end;

procedure Thread.AvancarBarraProgresso;
begin
  FProgressBar.Position := FProgressBar.Position + 1;
  PreencherPercentual(FProgressBar.Position);
end;

procedure Thread.PreencherPercentual(linha: integer);
begin
  FTexto.Caption := IntToStr(linha) + '%';
end;

end.
