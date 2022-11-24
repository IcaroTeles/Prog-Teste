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
      object Label6: TLabel [4]
        Left = 162
        Top = 168
        Width = 19
        Height = 13
        Caption = 'CEP'
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
        Left = 161
        Top = 30
        Width = 121
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Sobrenome'
        TabOrder = 4
      end
      object edtendereco: TLabeledEdit
        Left = 160
        Top = 136
        Width = 321
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        TabOrder = 5
      end
      object edttelefone: TMaskEdit
        Left = 16
        Top = 72
        Width = 119
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object edtcelular: TMaskEdit
        Left = 160
        Top = 76
        Width = 119
        Height = 21
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 7
        Text = '(  )     -    '
      end
    end
  end
  object edtcep: TMaskEdit [2]
    Left = 166
    Top = 211
    Width = 120
    Height = 21
    EditMask = '99.999-999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  .   -   '
  end
end
