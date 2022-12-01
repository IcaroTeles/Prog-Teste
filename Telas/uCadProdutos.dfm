inherited frmcadprodutos: Tfrmcadprodutos
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tabgeral: TPageControl
    inherited tabcontrole: TTabSheet
      inherited grdcontrole: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datainclusao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataedicao'
            Visible = True
          end>
      end
    end
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
      object Label5: TLabel [4]
        Left = 17
        Top = 75
        Width = 39
        Height = 13
        Caption = 'Estoque'
      end
      object edtdesconto: TCurrencyEdit [5]
        Left = 225
        Top = 34
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtnomeproduto: TLabeledEdit [6]
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome do Produto'
        TabOrder = 1
      end
      object edtvalorproduto: TCurrencyEdit [7]
        Left = 225
        Top = 94
        Width = 121
        Height = 21
        TabOrder = 2
      end
      inherited dtinclusao: TDateEdit
        TabOrder = 4
      end
      object edtestoque: TCurrencyEdit [10]
        Left = 16
        Top = 90
        Width = 121
        Height = 21
        DisplayFormat = '0'
        MaxLength = 13
        MaxValue = 9999999999999.000000000000000000
        TabOrder = 6
      end
      inherited dtedicao: TDateEdit
        TabOrder = 5
      end
      inherited btnsair2: TBitBtn
        TabOrder = 7
      end
    end
  end
  inherited qrycontrole: TZQuery
    Connection = DtmConexao.conexaodb
    SQL.Strings = (
      'select * from produtos')
    object qrycontroleprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object qrycontrolenome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qrycontrolevalor: TFloatField
      FieldName = 'valor'
    end
    object qrycontroledesconto: TFloatField
      FieldName = 'desconto'
    end
    object qrycontrolequantidade: TWideStringField
      FieldName = 'quantidade'
      Size = 10
    end
    object qrycontroledatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object qrycontroledataedicao: TDateTimeField
      FieldName = 'dataedicao'
    end
  end
end
