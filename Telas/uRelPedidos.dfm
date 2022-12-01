object frmrelpedidos: Tfrmrelpedidos
  Left = 0
  Top = 0
  Caption = 'frmrealpedidos'
  ClientHeight = 337
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -3
    Top = -6
    Width = 794
    Height = 1123
    DataSource = dtsrelpedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      Transparent = False
      object RLAngleLabel6: TRLAngleLabel
        Left = 3
        Top = 16
        Width = 51
        Height = 16
        Caption = 'Pedidos'
        Transparent = False
      end
      object RLDraw2: TRLDraw
        Left = 3
        Top = 37
        Width = 670
        Height = 3
        DrawKind = dkLine
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 171
      Width = 718
      Height = 40
      BandType = btFooter
      Transparent = False
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 115
      Width = 718
      Height = 56
      Transparent = False
      object RLDBText3: TRLDBText
        Left = 3
        Top = 24
        Width = 52
        Height = 16
        DataField = 'pedidoid'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
      object RLDBText5: TRLDBText
        Left = 334
        Top = 24
        Width = 92
        Height = 16
        DataField = 'quantidadetotal'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
      object RLDBText6: TRLDBText
        Left = 79
        Top = 24
        Width = 52
        Height = 16
        DataField = 'clienteid'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 193
        Top = 24
        Width = 57
        Height = 16
        DataField = 'produtoid'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 507
        Top = 24
        Width = 108
        Height = 16
        DataField = 'valortotaldesconto'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 635
        Top = 24
        Width = 55
        Height = 16
        DataField = 'valortotal'
        DataSource = dtsrelpedidos
        Text = ''
        Transparent = False
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 34
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLAngleLabel7: TRLAngleLabel
        Left = 3
        Top = 15
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
        Transparent = False
      end
      object RLAngleLabel8: TRLAngleLabel
        Left = 331
        Top = 12
        Width = 70
        Height = 16
        Caption = 'Quantidade'
        Transparent = False
      end
      object RLAngleLabel9: TRLAngleLabel
        Left = 635
        Top = 12
        Width = 63
        Height = 16
        Caption = 'Valor total'
        Transparent = False
      end
      object RLAngleLabel10: TRLAngleLabel
        Left = 79
        Top = 12
        Width = 88
        Height = 16
        Caption = 'C'#243'digo Cliente'
        Transparent = False
      end
      object RLAngleLabel1: TRLAngleLabel
        Left = 193
        Top = 12
        Width = 93
        Height = 16
        Caption = 'C'#243'digo Produto'
        Transparent = False
      end
      object RLAngleLabel2: TRLAngleLabel
        Left = 507
        Top = 12
        Width = 93
        Height = 16
        Caption = 'Valor Desconto'
        Transparent = False
      end
    end
  end
  object qryrelpedidos: TZQuery
    Connection = DtmConexao.conexaodb
    SQL.Strings = (
      
        'select pedidoid, clienteid, produtoid, quantidadetotal, valortot' +
        'aldesconto, valortotal from pedidos')
    Params = <
      item
        DataType = ftWideString
        Name = 'DataInicio'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end
      item
        DataType = ftWideString
        Name = 'DataFim'
        ParamType = ptUnknown
        Value = '01/01/2201'
      end>
    Left = 469
    Top = 282
    ParamData = <
      item
        DataType = ftWideString
        Name = 'DataInicio'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end
      item
        DataType = ftWideString
        Name = 'DataFim'
        ParamType = ptUnknown
        Value = '01/01/2201'
      end>
    object qryrelpedidospedidoid: TIntegerField
      FieldName = 'pedidoid'
      ReadOnly = True
    end
    object qryrelpedidosclienteid: TIntegerField
      FieldName = 'clienteid'
      Required = True
    end
    object qryrelpedidosprodutoid: TIntegerField
      FieldName = 'produtoid'
      Required = True
    end
    object qryrelpedidosquantidadetotal: TWideStringField
      FieldName = 'quantidadetotal'
      Size = 10
    end
    object qryrelpedidosvalortotaldesconto: TFloatField
      FieldName = 'valortotaldesconto'
      Required = True
    end
    object qryrelpedidosvalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
    end
  end
  object dtsrelpedidos: TDataSource
    DataSet = qryrelpedidos
    Left = 557
    Top = 282
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 637
    Top = 282
  end
end
