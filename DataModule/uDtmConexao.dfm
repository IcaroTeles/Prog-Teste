object DtmConexao: TDtmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object conexaodb: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    HostName = '.\AZAXDB'
    Port = 1433
    Database = 'Azax'
    User = ''
    Password = ''
    Protocol = 'mssql'
    LibraryLocation = 'D:\Projetos\Prog Teste\Prog-Teste\ntwdblib.dll'
    Left = 152
    Top = 96
  end
end
