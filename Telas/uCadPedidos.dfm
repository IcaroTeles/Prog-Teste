inherited frmcadpedidos: Tfrmcadpedidos
  Caption = 'Pedidos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tabgeral: TPageControl
    inherited tabdados: TTabSheet
      object Label1: TLabel [2]
        Left = 224
        Top = 57
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label2: TLabel [3]
        Left = 224
        Top = 121
        Width = 121
        Height = 13
        Caption = 'Valor Total com Desconto'
      end
      object edtcodigoproduto: TLabeledEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo do Produto'
        NumbersOnly = True
        TabOrder = 3
      end
      object edtcodigocliente: TLabeledEdit
        Left = 224
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo do Cliente'
        NumbersOnly = True
        TabOrder = 4
      end
      object edtquantidade: TLabeledEdit
        Left = 16
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Quantidade Total'
        NumbersOnly = True
        TabOrder = 5
      end
      object edtvalortotal: TCurrencyEdit
        Left = 224
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edtvalortotaldesconto: TCurrencyEdit
        Left = 224
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 7
      end
    end
  end
end
