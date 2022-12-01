inherited frmcadclientes: Tfrmcadclientes
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 166
    Top = 196
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  inherited tabgeral: TPageControl
    ActivePage = tabcontrole
    inherited tabcontrole: TTabSheet
      inherited grdcontrole: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteid'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sobrenome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'celular'
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
      object Label1: TLabel [2]
        Left = 17
        Top = 57
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label2: TLabel [3]
        Left = 161
        Top = 57
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      inherited btnsair2: TBitBtn
        TabOrder = 9
      end
      object edtnomecliente: TLabeledEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 3
      end
      object edtsobrenome: TLabeledEdit
        Left = 162
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Sobrenome'
        TabOrder = 4
      end
      object edttelefone: TMaskEdit
        Left = 16
        Top = 72
        Width = 119
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object edtcelular: TMaskEdit
        Left = 160
        Top = 72
        Width = 119
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object edtcep: TLabeledEdit
        Left = 162
        Top = 136
        Width = 121
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'CEP'
        TabOrder = 7
        OnExit = edtcepExit
      end
      object edtendereco: TLabeledEdit
        Left = 162
        Top = 187
        Width = 319
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endereco'
        TabOrder = 8
      end
    end
  end
  inherited qrycontrole: TZQuery
    Connection = DtmConexao.conexaodb
    Active = True
    SQL.Strings = (
      'select * from clientes'
      '')
    Left = 356
    object qrycontroleclienteid: TIntegerField
      FieldName = 'clienteid'
      ReadOnly = True
    end
    object qrycontrolenome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object qrycontrolesobrenome: TWideStringField
      FieldName = 'sobrenome'
      Size = 60
    end
    object qrycontroleendereco: TWideStringField
      FieldName = 'endereco'
      Size = 80
    end
    object qrycontrolecep: TWideStringField
      FieldName = 'cep'
      Size = 10
    end
    object qrycontroletelefone: TWideStringField
      FieldName = 'telefone'
      Size = 14
    end
    object qrycontrolecelular: TWideStringField
      FieldName = 'celular'
      Size = 14
    end
    object qrycontroledatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object qrycontroledataedicao: TDateTimeField
      FieldName = 'dataedicao'
    end
  end
  inherited dtscontrole: TDataSource
    Top = 32
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    Left = 424
    Top = 160
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = '60430355/json'
    Response = RESTResponse1
    Left = 464
    Top = 160
  end
  object RESTResponse1: TRESTResponse
    Left = 464
    Top = 112
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemTable
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 392
    Top = 112
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 376
    Top = 160
  end
end
