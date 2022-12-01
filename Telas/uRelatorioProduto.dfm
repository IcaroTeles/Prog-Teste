object frmrelatorioproduto: Tfrmrelatorioproduto
  Left = 0
  Top = 0
  ClientHeight = 359
  ClientWidth = 673
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
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsrelprodutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      Transparent = False
      object RLAngleLabel1: TRLAngleLabel
        Left = 3
        Top = 16
        Width = 56
        Height = 16
        Caption = 'Produtos'
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 37
        Width = 670
        Height = 3
        DrawKind = dkLine
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 171
      Width = 718
      Height = 40
      BandType = btFooter
      Transparent = False
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 115
      Width = 718
      Height = 56
      Transparent = False
      object RLDBText1: TRLDBText
        Left = 3
        Top = 24
        Width = 57
        Height = 16
        DataField = 'produtoId'
        DataSource = dtsrelprodutos
        Text = ''
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 331
        Top = 24
        Width = 67
        Height = 16
        DataField = 'quantidade'
        DataSource = dtsrelprodutos
        Text = ''
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 131
        Top = 24
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsrelprodutos
        Text = ''
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 531
        Top = 24
        Width = 88
        Height = 16
        DataField = 'valor'
        DataSource = dtsrelprodutos
        Info = riAverage
        Text = ''
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 34
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLAngleLabel2: TRLAngleLabel
        Left = 3
        Top = 15
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
        Transparent = False
      end
      object RLAngleLabel3: TRLAngleLabel
        Left = 331
        Top = 12
        Width = 70
        Height = 16
        Caption = 'Quantidade'
        Transparent = False
      end
      object RLAngleLabel4: TRLAngleLabel
        Left = 531
        Top = 6
        Width = 98
        Height = 16
        Caption = 'Valor total Bruto'
        Transparent = False
      end
      object RLAngleLabel5: TRLAngleLabel
        Left = 131
        Top = 12
        Width = 105
        Height = 16
        Caption = 'Nome do Produto'
        Transparent = False
      end
    end
  end
  object qryrelprodutos: TZQuery
    Connection = DtmConexao.conexaodb
    Active = True
    SQL.Strings = (
      'select produtoid, nome, quantidade, valor from produtos')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/02/22'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = 48639d
      end>
    Left = 464
    Top = 288
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/02/22'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = 48639d
      end>
    object qryrelprodutosprodutoid: TIntegerField
      FieldName = 'produtoid'
      ReadOnly = True
    end
    object qryrelprodutosnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryrelprodutosquantidade: TWideStringField
      FieldName = 'quantidade'
      Size = 10
    end
    object qryrelprodutosvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object dtsrelprodutos: TDataSource
    DataSet = qryrelprodutos
    Left = 384
    Top = 288
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 568
    Top = 288
  end
end
