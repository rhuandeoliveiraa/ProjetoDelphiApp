object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 02'
  ClientHeight = 171
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object spbIniciar: TSpeedButton
    Left = 16
    Top = 120
    Width = 255
    Height = 33
    Caption = 'Iniciar Threads'
    OnClick = spbIniciarClick
  end
  object pbBarraProgresso1: TProgressBar
    Left = 91
    Top = 46
    Width = 180
    Height = 27
    TabOrder = 0
  end
  object edtTempoThread01: TEdit
    Left = 8
    Top = 19
    Width = 127
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtTempoThread02: TEdit
    Left = 141
    Top = 19
    Width = 130
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object stTempoThread01: TStaticText
    Left = 8
    Top = 0
    Width = 127
    Height = 17
    Caption = 'Tempo da primeira thread'
    TabOrder = 3
  end
  object stTempoThread02: TStaticText
    Left = 141
    Top = 0
    Width = 130
    Height = 17
    Caption = 'Tempo da segunda thread'
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 53
    Width = 77
    Height = 17
    Caption = 'Primeira thread'
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 84
    Width = 81
    Height = 17
    Caption = 'Segunda thread'
    TabOrder = 6
  end
  object pbBarraProgresso2: TProgressBar
    Left = 91
    Top = 79
    Width = 180
    Height = 27
    TabOrder = 7
  end
  object stProgressoTred1: TStaticText
    Left = 168
    Top = 52
    Width = 21
    Height = 17
    Caption = '0%'
    TabOrder = 8
    StyleElements = [seFont]
  end
  object stProgressoTred2: TStaticText
    Left = 168
    Top = 86
    Width = 21
    Height = 17
    Caption = '0%'
    TabOrder = 9
    Transparent = False
  end
end
