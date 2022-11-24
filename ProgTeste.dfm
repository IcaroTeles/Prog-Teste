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
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 400
    Top = 168
    object Menu1: TMenuItem
      Caption = 'Menu'
      object Configurao1: TMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = Configurao1Click
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
      end
      object Pedidos2: TMenuItem
        Caption = 'Pedidos'
      end
    end
  end
end
