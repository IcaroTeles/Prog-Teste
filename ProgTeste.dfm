object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object imgfundo: TImage
    Left = 0
    Top = 0
    Width = 447
    Height = 201
    Align = alClient
    ExplicitLeft = 176
    ExplicitTop = 48
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object edtcaminho: TEdit
    Left = 160
    Top = 72
    Width = 273
    Height = 21
    TabOrder = 0
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 168
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Configurao1: TMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = Configurao1Click
      end
      object MudarImagemdeFundo1: TMenuItem
        Caption = 'Mudar Imagem de Fundo'
        OnClick = MudarImagemdeFundo1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
    end
    object Funcionrios1: TMenuItem
      Caption = 'Funcion'#225'rios'
      object Cadastro1: TMenuItem
        Caption = 'Cadastro'
        OnClick = Cadastro1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Produtos2: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos2Click
      end
      object Pedidos2: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos2Click
      end
    end
  end
  object dlgimg: TOpenPictureDialog
    Left = 344
    Top = 120
  end
end
