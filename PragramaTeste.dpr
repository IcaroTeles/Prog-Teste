program PragramaTeste;

uses
  Vcl.Forms,
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmheranca},
  uDtmConexao in 'DataModule\uDtmConexao.pas' {DataModule1: TDataModule},
  uCadProdutos in 'Telas\uCadProdutos.pas' {frmcadprodutos},
  uCadClientes in 'Telas\uCadClientes.pas' {frmcadclientes},
  uCadPedidos in 'Telas\uCadPedidos.pas' {frmcadpedidos},
  uCadFuncionarios in 'Telas\uCadFuncionarios.pas' {frmcadfuncionarios},
  ProgTeste in 'ProgTeste.pas' {frmMenu},
  uConfiguracao in 'Telas\uConfiguracao.pas' {frmconfiguracao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
