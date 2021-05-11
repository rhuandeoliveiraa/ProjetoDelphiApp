unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ufTarefa1,ufTarefa2,ufTarefa3, uFuncoes;

type
  TfPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    arefas1: TMenuItem;
    mmTarefa01: TMenuItem;
    mmTarefa02: TMenuItem;
    mmTarefa03: TMenuItem;
    procedure mmTarefa02Click(Sender: TObject);
    procedure mmTarefa03Click(Sender: TObject);
    procedure mmTarefa01Click(Sender: TObject);
  private
    fFormTarefa1 : TfTarefa1;
    fFormTarefa2 : TfTarefa2;
    fFormTarefa3 : TfTarefa3;
    fFormUFuncoes: TfuFuncoes;
  end;

var
  fPrincipal: TfPrincipal;

implementation


{$R *.dfm}

procedure TfPrincipal.mmTarefa01Click(Sender: TObject);
begin
  fFormUFuncoes.CriarForm(Self, TfTarefa1, fFormTarefa1);
end;

procedure TfPrincipal.mmTarefa02Click(Sender: TObject);
begin
  fFormUFuncoes.CriarForm(Self, TfTarefa2, fFormTarefa2);
end;

procedure TfPrincipal.mmTarefa03Click(Sender: TObject);
begin
  fFormUFuncoes.CriarForm(Self, TfTarefa3, fFormTarefa3);
end;

end.
