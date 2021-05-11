unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, uFuncoes;

type
  TfTarefa2 = class(TForm)
    spbIniciar: TSpeedButton;
    pbBarraProgresso1: TProgressBar;
    edtTempoThread01: TEdit;
    edtTempoThread02: TEdit;
    stTempoThread01: TStaticText;
    stTempoThread02: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    pbBarraProgresso2: TProgressBar;
    stProgressoTred1: TStaticText;
    stProgressoTred2: TStaticText;
    procedure spbIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fFormUFuncoes: TfuFuncoes;
    procedure VerificarCampos;

  end;

implementation

uses
  System.Threading, uTrhead;

{$R *.dfm}

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TfTarefa2.spbIniciarClick(Sender: TObject);
var
  Threads: array [0..2] of Thread;
begin
  VerificarCampos;
  try
    Threads[0] := Thread.Create(pbBarraProgresso1, StrToInt(edtTempoThread01.Text), stProgressoTred1);
    Threads[0].FreeOnTerminate := True;
    Threads[0].Start;

    Threads[1] := Thread.Create(pbBarraProgresso2, StrToInt(edtTempoThread02.Text), stProgressoTred2);
    Threads[1].FreeOnTerminate := True;
    Threads[1].Start;
  except
    on E:exception do
      ShowMessage('Erro realizar a criação das Threads!  ' + E.Message);

  end;
end;

procedure TfTarefa2.VerificarCampos;
begin
    if fFormUFuncoes.VerificarCampoVazioOuZerado(edtTempoThread01.Text) then begin
    ShowMessage('Valores tem que ser maior que zero!');
    edtTempoThread01.SetFocus;
    Abort;
  end;

  if fFormUFuncoes.VerificarCampoVazioOuZerado(edtTempoThread02.Text) then begin
    ShowMessage('Valores tem que ser maior que zero!');
    edtTempoThread02.SetFocus;
    Abort;
  end;
end;
end.
