inherited frmcadprodutos: Tfrmcadprodutos
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tabgeral: TPageControl
    inherited tabdados: TTabSheet
      object Label1: TLabel [0]
        Left = 225
        Top = 75
        Width = 80
        Height = 13
        Caption = 'Valor do Produto'
      end
      object Label2: TLabel [1]
        Left = 225
        Top = 15
        Width = 105
        Height = 13
        Caption = 'Desconto Promocional'
      end
      object edtnomeproduto: TLabeledEdit [5]
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do Produto'
        TabOrder = 1
      end
      object edtestoque: TLabeledEdit [6]
        Left = 16
        Top = 90
        Width = 121
        Height = 21
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Quantidade'
        NumbersOnly = True
        TabOrder = 2
      end
      object edtvalorproduto: TCurrencyEdit [7]
        Left = 225
        Top = 90
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtdesconto: TCurrencyEdit [8]
        Left = 225
        Top = 34
        Width = 121
        Height = 21
        TabOrder = 4
      end
      inherited dtinclusao: TDateEdit
        TabOrder = 5
      end
      inherited dtedicao: TDateEdit
        TabOrder = 6
      end
    end
  end
end
