object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 03'
  ClientHeight = 391
  ClientWidth = 593
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbObterTotal: TSpeedButton
    Left = 368
    Top = 315
    Width = 102
    Height = 26
    Caption = '&Obter Total'
    OnClick = sbObterTotalClick
  end
  object sbObterTotalDivisoes: TSpeedButton
    Left = 320
    Top = 357
    Width = 150
    Height = 26
    Caption = 'Obter Total &Divis'#245'es'
    OnClick = sbObterTotalDivisoesClick
  end
  object stTextoValorProjeto: TStaticText
    Left = 16
    Top = 8
    Width = 100
    Height = 17
    Caption = 'Valores por projeto:'
    TabOrder = 0
  end
  object edTotal: TEdit
    Left = 476
    Top = 315
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object stTotal: TStaticText
    Left = 476
    Top = 298
    Width = 48
    Height = 17
    Caption = 'Total R$:'
    TabOrder = 2
  end
  object edTotalDivisoes: TEdit
    Left = 476
    Top = 362
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 477
    Top = 342
    Width = 48
    Height = 17
    Caption = 'Total R$:'
    TabOrder = 4
  end
  object dbProjetos: TDBGrid
    Left = 8
    Top = 27
    Width = 577
    Height = 265
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
