inherited frmcadfuncionarios: Tfrmcadfuncionarios
  Caption = 'Cadastro de Funcion'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited tabgeral: TPageControl
    inherited tabdados: TTabSheet
      object Label1: TLabel [2]
        Left = 16
        Top = 57
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object edtnomefuncionario: TLabeledEdit
        Left = 16
        Top = 22
        Width = 361
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome Completo'
        TabOrder = 3
      end
      object edtsenha: TLabeledEdit
        Left = 256
        Top = 72
        Width = 121
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        TabOrder = 4
      end
      object edtcpf: TMaskEdit
        Left = 16
        Top = 72
        Width = 120
        Height = 21
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '   .   .   -  '
      end
    end
  end
end
