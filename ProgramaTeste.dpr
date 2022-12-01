program ProgramaTeste;

uses
  Vcl.Forms,
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmheranca},
  uCadProdutos in 'Telas\uCadProdutos.pas' {frmcadprodutos},
  uCadClientes in 'Telas\uCadClientes.pas' {frmcadclientes},
  uCadPedidos in 'Telas\uCadPedidos.pas' {frmcadpedidos},
  uCadFuncionarios in 'Telas\uCadFuncionarios.pas' {frmcadfuncionarios},
  ProgTeste in 'ProgTeste.pas' {frmMenu},
  uConfiguracao in 'Telas\uConfiguracao.pas' {frmconfiguracao},
  cCadClientes in 'Classes\cCadClientes.pas',
  cCadProduto in 'Classes\cCadProduto.pas',
  cCadFuncionarios in 'Classes\cCadFuncionarios.pas',
  cAtualizacaoBancodeDados in 'Classes\cAtualizacaoBancodeDados.pas',
  cAtualizacaoTabelaMSSQL in 'Classes\cAtualizacaoTabelaMSSQL.pas',
  cCadPedidos in 'Classes\cCadPedidos.pas',
  cEnum in 'Classes\cEnum.pas',
  uDtmConexao in 'DataModule\uDtmConexao.pas' {DtmConexao: TDataModule},
  uSelecaoData in 'Telas\uSelecaoData.pas' {frmselecionardata},
  uRelatorioProduto in 'Telas\uRelatorioProduto.pas' {frmrelatorioproduto},
  uArquivoIni in 'Classes\uArquivoIni.pas',
  uRelPedidos in 'Telas\uRelPedidos.pas' {frmrelpedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(Tfrmrelpedidos, frmrelpedidos);
  Application.Run;
end.
