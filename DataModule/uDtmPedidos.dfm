object dtmvendas: Tdtmvendas
  OldCreateOrder = False
  Height = 183
  Width = 264
  object qryclientes: TZQuery
    Connection = DtmConexao.conexaodb
    Active = True
    SQL.Strings = (
      'select clienteid,'
      '          nome'
      'from clientes')
    Params = <>
    Left = 48
    Top = 40
  end
  object qryprodutos: TZQuery
    Connection = DtmConexao.conexaodb
    Active = True
    SQL.Strings = (
      'select produtoid,'
      '          nome,'
      '          valor,'
      '          desconto'
      'from produtos')
    Params = <>
    Left = 144
    Top = 40
  end
  object dtsclientes: TDataSource
    Left = 48
    Top = 104
  end
  object dtsprodutos: TDataSource
    Left = 144
    Top = 104
  end
end
