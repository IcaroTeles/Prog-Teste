object frmselecionardata: Tfrmselecionardata
  Left = 0
  Top = 0
  Caption = 'frmselecionardata'
  ClientHeight = 151
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 8
    Width = 100
    Height = 13
    Caption = 'DATA DE INCLUS'#195'O '
  end
  object Label2: TLabel
    Left = 152
    Top = 47
    Width = 66
    Height = 13
    Caption = 'DE -----> AT'#201
  end
  object edtdatainicio: TDateEdit
    Left = 25
    Top = 44
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object edtdatafinal: TDateEdit
    Left = 226
    Top = 44
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
