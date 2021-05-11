object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 387
  ClientWidth = 779
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
  object spbGeraSql: TSpeedButton
    Left = 647
    Top = 82
    Width = 106
    Height = 31
    Caption = '&GeraSql'
    OnClick = spbGeraSqlClick
  end
  object mColunas: TMemo
    Left = 8
    Top = 26
    Width = 193
    Height = 153
    TabOrder = 0
  end
  object mTabelas: TMemo
    Left = 221
    Top = 26
    Width = 193
    Height = 153
    TabOrder = 1
  end
  object mCondicoes: TMemo
    Left = 434
    Top = 26
    Width = 193
    Height = 153
    TabOrder = 2
  end
  object mSqlGerado: TMemo
    Left = 8
    Top = 220
    Width = 763
    Height = 159
    TabOrder = 3
  end
  object stSqlGerado: TStaticText
    Left = 8
    Top = 197
    Width = 61
    Height = 17
    Caption = 'SQL Gerado'
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 42
    Height = 17
    Caption = 'Colunas'
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 221
    Top = 8
    Width = 41
    Height = 17
    Caption = 'Tabelas'
    TabOrder = 6
  end
  object StaticText3: TStaticText
    Left = 434
    Top = 8
    Width = 53
    Height = 17
    Caption = 'Condi'#231#245'es'
    TabOrder = 7
  end
  object tspGeraConsulta: TspQuery
    Left = 656
    Top = 24
  end
end
