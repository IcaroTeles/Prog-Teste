object frmheranca: Tfrmheranca
  Left = 0
  Top = 0
  Caption = 'Insira Nome'
  ClientHeight = 283
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tabgeral: TPageControl
    Left = 0
    Top = 0
    Width = 506
    Height = 283
    ActivePage = tabdados
    Align = alClient
    TabOrder = 0
    object tabcontrole: TTabSheet
      AlignWithMargins = True
      Caption = 'Controle'
      object grdcontrole: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 486
        Height = 202
        Align = alClient
        DataSource = dtscontrole
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdcontroleDblClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 208
        Width = 492
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btncadastrar: TBitBtn
          Left = 165
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cadastrar'
          TabOrder = 0
          OnClick = btncadastrarClick
        end
        object btneditar: TBitBtn
          Left = 246
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btneditarClick
        end
        object btndeletar: TBitBtn
          Left = 327
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Deletar'
          TabOrder = 2
          OnClick = btndeletarClick
        end
        object btnsair: TBitBtn
          Left = 408
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Sair'
          TabOrder = 3
          OnClick = btnsairClick
        end
      end
    end
    object tabdados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 168
        Width = 72
        Height = 13
        Caption = 'Data da Edi'#231#227'o'
      end
      object Label3: TLabel
        Left = 16
        Top = 117
        Width = 81
        Height = 13
        Caption = 'Data da Inclus'#227'o'
      end
      object Panel2: TPanel
        Left = 0
        Top = 214
        Width = 498
        Height = 41
        ParentCustomHint = False
        Align = alBottom
        ParentColor = True
        TabOrder = 0
        object btnok: TBitBtn
          Left = 120
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Ok'
          TabOrder = 0
          OnClick = btnokClick
        end
        object btncancelar: TBitBtn
          Left = 307
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btncancelarClick
        end
        object btneditar2: TBitBtn
          Left = 210
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 2
          OnClick = btneditar2Click
        end
      end
      object dtinclusao: TDateEdit
        Left = 16
        Top = 136
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object dtedicao: TDateEdit
        Left = 16
        Top = 187
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
      end
      object btnsair2: TBitBtn
        Left = 400
        Top = 222
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 3
        OnClick = btnsair2Click
      end
    end
  end
  object qrycontrole: TZQuery
    Params = <>
    Left = 436
    Top = 40
  end
  object dtscontrole: TDataSource
    DataSet = qrycontrole
    Left = 436
    Top = 104
  end
end
