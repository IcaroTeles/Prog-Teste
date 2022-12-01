inherited frmcadpedidos: Tfrmcadpedidos
  Caption = 'Pedidos'
  ClientHeight = 326
  ClientWidth = 516
  ExplicitWidth = 532
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited tabgeral: TPageControl
    Width = 516
    Height = 326
    ExplicitWidth = 516
    ExplicitHeight = 326
    inherited tabcontrole: TTabSheet
      ExplicitWidth = 502
      ExplicitHeight = 292
      inherited grdcontrole: TDBGrid
        Width = 496
        Height = 245
        Columns = <
          item
            Expanded = False
            FieldName = 'pedidoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteid'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produtoid'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidadetotal'
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
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotaldesconto'
            Visible = True
          end>
      end
      inherited Panel1: TPanel
        Top = 251
        Width = 502
        ExplicitTop = 251
        ExplicitWidth = 502
      end
    end
    inherited tabdados: TTabSheet
      ExplicitWidth = 508
      ExplicitHeight = 298
      inherited Label4: TLabel
        Top = 184
        ExplicitTop = 184
      end
      inherited Label3: TLabel
        Left = 18
        Top = 138
        ExplicitLeft = 18
        ExplicitTop = 138
      end
      object Label1: TLabel [2]
        Left = 224
        Top = 92
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label2: TLabel [3]
        Left = 224
        Top = 138
        Width = 114
        Height = 13
        Caption = 'Valor Total do Desconto'
      end
      object Label5: TLabel [4]
        Left = 16
        Top = 25
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object Label6: TLabel [5]
        Left = 224
        Top = 25
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object lblcap: TLabel [6]
        Left = 17
        Top = 92
        Width = 83
        Height = 13
        Caption = 'Quantidade Total'
      end
      inherited Panel2: TPanel
        Top = 257
        Width = 508
        ExplicitTop = 257
        ExplicitWidth = 508
        inherited btnok: TBitBtn
          Left = 142
          ExplicitLeft = 142
        end
        inherited btncancelar: TBitBtn
          Left = 315
          ExplicitLeft = 315
        end
        inherited btneditar2: TBitBtn
          Left = 227
          ExplicitLeft = 227
        end
      end
      inherited dtinclusao: TDateEdit
        Top = 157
        ExplicitTop = 157
      end
      inherited dtedicao: TDateEdit
        Top = 203
        ExplicitTop = 203
      end
      inherited btnsair2: TBitBtn
        Left = 408
        Top = 265
        TabOrder = 13
        ExplicitLeft = 408
        ExplicitTop = 265
      end
      object edtvalortotal: TCurrencyEdit
        Left = 223
        Top = 111
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtvalorunitario: TCurrencyEdit
        Left = 223
        Top = 238
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 4
        Visible = False
      end
      object edtvalordesconto: TCurrencyEdit
        Left = 351
        Top = 219
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
      object edtquantidade: TCurrencyEdit
        Left = 16
        Top = 111
        Width = 121
        Height = 21
        DisplayFormat = '0'
        MaxLength = 13
        MaxValue = 9999999999999.000000000000000000
        TabOrder = 6
        OnExit = edtquantidadeExit
      end
      object edtvalorparcial: TCurrencyEdit
        Left = 224
        Top = 219
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 7
        Visible = False
      end
      object edtvalortotaldesconto: TCurrencyEdit
        Left = 223
        Top = 157
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
      object edtcodigocliente: TLabeledEdit
        Left = 81
        Top = 238
        Width = 58
        Height = 21
        EditLabel.Width = 78
        EditLabel.Height = 13
        EditLabel.Caption = 'edtcodigocliente'
        TabOrder = 9
        Visible = False
      end
      object edtcodigoproduto: TLabeledEdit
        Left = 17
        Top = 241
        Width = 58
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 10
        Visible = False
      end
      object lkpproduto: TDBLookupComboBox
        Left = 16
        Top = 44
        Width = 145
        Height = 21
        KeyField = 'produtoid'
        ListField = 'nome'
        ListSource = dtsprodutos
        TabOrder = 11
      end
      object lkpcliente: TDBLookupComboBox
        Left = 223
        Top = 44
        Width = 145
        Height = 21
        KeyField = 'clienteid'
        ListField = 'nome'
        ListSource = dtscliente
        TabOrder = 12
      end
      object chkdesconto: TCheckBox
        Left = 227
        Top = 196
        Width = 97
        Height = 17
        Caption = 'Aplicar Desconto'
        TabOrder = 14
      end
      object edtnome: TLabeledEdit
        Left = 18
        Top = 268
        Width = 58
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'edtnome'
        TabOrder = 15
        Visible = False
      end
      object edtnomecliente: TLabeledEdit
        Left = 82
        Top = 268
        Width = 58
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'edtnome'
        TabOrder = 16
        Visible = False
      end
    end
  end
  inherited qrycontrole: TZQuery
    Connection = DtmConexao.conexaodb
    SQL.Strings = (
      'select * from pedidos')
    Left = 396
    Top = 152
    object qrycontrolepedidoId: TIntegerField
      FieldName = 'pedidoId'
      ReadOnly = True
    end
    object qrycontroleclienteid: TIntegerField
      FieldName = 'clienteid'
      Required = True
    end
    object qrycontroleprodutoid: TIntegerField
      FieldName = 'produtoid'
      Required = True
    end
    object qrycontrolequantidadetotal: TWideStringField
      FieldName = 'quantidadetotal'
      ReadOnly = True
      Size = 10
    end
    object qrycontroledatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object qrycontroledataedicao: TDateTimeField
      FieldName = 'dataedicao'
    end
    object qrycontrolevalortotal: TFloatField
      FieldName = 'valortotal'
      ReadOnly = True
    end
    object qrycontrolevalortotaldesconto: TFloatField
      FieldName = 'valortotaldesconto'
      ReadOnly = True
    end
  end
  inherited dtscontrole: TDataSource
    Left = 452
    Top = 152
  end
  object qryprodutos: TZQuery
    Connection = DtmConexao.conexaodb
    SQL.Strings = (
      'select produtoid, nome, valor, desconto from produtos')
    Params = <>
    Left = 404
    Top = 40
    object qryprodutosprodutoid: TIntegerField
      FieldName = 'produtoid'
      ReadOnly = True
    end
    object qryprodutosnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryprodutosvalor: TFloatField
      FieldName = 'valor'
    end
    object qryprodutosdesconto: TFloatField
      FieldName = 'desconto'
    end
  end
  object qrycliente: TZQuery
    Connection = DtmConexao.conexaodb
    SQL.Strings = (
      'select clienteid, nome from clientes')
    Params = <>
    Left = 468
    Top = 40
    object qryclienteclienteid: TIntegerField
      FieldName = 'clienteid'
      ReadOnly = True
    end
    object qryclientenome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
  end
  object dtsprodutos: TDataSource
    DataSet = qryprodutos
    Left = 396
    Top = 96
  end
  object dtscliente: TDataSource
    DataSet = qrycliente
    Left = 460
    Top = 96
  end
end
