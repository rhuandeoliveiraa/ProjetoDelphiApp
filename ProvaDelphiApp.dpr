program ProvaDelphiApp;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uTrhead in 'uTrhead.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  uFuncoes in 'uFuncoes.pas' {fuFuncoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
