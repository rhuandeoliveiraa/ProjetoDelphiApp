object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 540
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 144
    Top = 64
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object mmTarefa01: TMenuItem
        Caption = 'Tarefa 01'
        OnClick = mmTarefa01Click
      end
      object mmTarefa02: TMenuItem
        Caption = 'Tarefa 02'
        OnClick = mmTarefa02Click
      end
      object mmTarefa03: TMenuItem
        Caption = 'Tarefa 03'
        OnClick = mmTarefa03Click
      end
    end
  end
end
