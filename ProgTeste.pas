unit ProgTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus,uCadProdutos,uCadFuncionarios, uRelatorioProduto,
  uCadPedidos, uCadClientes,cAtualizacaoBancodeDados,
   udtmconexao,uSelecaoData, RLReport, RLFilters, RLPDFFilter,
   System.IniFiles, urelpedidos, uarquivoini, Vcl.ExtCtrls,uconfiguracao,
  Vcl.ExtDlgs, Vcl.StdCtrls,jpeg;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Cadastros1: TMenuItem;
    Funcionrios1: TMenuItem;
    Relatrios1: TMenuItem;
    Configurao1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    Pedidos1: TMenuItem;
    Cadastro1: TMenuItem;
    Produtos2: TMenuItem;
    Pedidos2: TMenuItem;
    MudarImagemdeFundo1: TMenuItem;
    dlgimg: TOpenPictureDialog;
    imgfundo: TImage;
    edtcaminho: TEdit;
    procedure Configurao1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure MudarImagemdeFundo1Click(Sender: TObject);
  private
    procedure AtualizarBancodedados;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

{$region 'Chamada de Telas'}

procedure TfrmMenu.Cadastro1Click(Sender: TObject);
begin
 frmcadfuncionarios:= Tfrmcadfuncionarios.Create(self);
 frmcadfuncionarios.ShowModal;
 frmcadfuncionarios.Release;
end;

procedure TfrmMenu.Clientes1Click(Sender: TObject);
begin
 frmcadclientes:= Tfrmcadclientes.Create(self);
 frmcadclientes.ShowModal;
 frmcadclientes.Release;
end;

procedure TfrmMenu.Configurao1Click(Sender: TObject);
begin
 frmconfiguracao:= Tfrmconfiguracao.Create(self);
 frmconfiguracao.ShowModal;
 frmconfiguracao.Release;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  frmconfiguracao:= Tfrmconfiguracao.Create(self);
  if not FileExists(TArquivoIni.ArquivoIni) then
  begin
    TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
    TArquivoIni.AtualizarIni('SERVER', 'HostName', '.\');
    TArquivoIni.AtualizarIni('SERVER', 'Port', '1433');
    TArquivoIni.AtualizarIni('SERVER', 'User', ' ');
    TArquivoIni.AtualizarIni('SERVER', 'Password', ' ');
    TArquivoIni.AtualizarIni('SERVER', 'Database', ' ');
    TArquivoIni.AtualizarIni('CONFIGURACAO', 'Imagem', ' ');
    MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni +' Criado com sucesso' +#13+
               'Configure o arquivo (User, Password, Database) antes de inicializar aplicação',MtInformation,[mbok],0);

    Application.Terminate;
  end
  else
  begin
  dtmConexao := TdtmConexao.create(self);
  with dtmConexao.ConexaoDB do
    begin
    SQLHourGlass:= False;
    LibraryLocation:=ExtractFilePath(Application.ExeName)+'ntwdblib.dll';;
    AtualizarBancodedados;
    if TArquivoIni.LerIni('SERVER','TipoDataBase')='MSSQL' then
         Protocol:='mssql';

      HostName:= TArquivoIni.LerIni('SERVER','HostName');
      Port    := StrToInt(TArquivoIni.LerIni('SERVER','Port'));
      User    := TArquivoIni.LerIni('SERVER','User');
      Password:= TArquivoIni.LerIni('SERVER','Password');
      Database:= TArquivoIni.LerIni('SERVER','DataBase');
      AutoCommit:= True;
      Connected:=True;
    end;
    end;
  edtcaminho.Text:= TArquivoIni.LerIni('CONFIGURACAO','Imagem');
  if edtcaminho.Text <> '' then
  imgfundo.Picture.LoadFromFile(edtcaminho.Text);
  end;

procedure TfrmMenu.Pedidos1Click(Sender: TObject);
begin
 frmcadpedidos:= Tfrmcadpedidos.Create(self);
 frmcadpedidos.ShowModal;
 frmcadpedidos.Release;
end;

procedure TfrmMenu.Pedidos2Click(Sender: TObject);
begin
  try
    frmselecionardata:= Tfrmselecionardata.create(self);
    frmselecionardata.showmodal;

    frmrelpedidos:=Tfrmrelpedidos.Create(self);
    frmrelpedidos.qryrelpedidos.open;
    frmrelpedidos.qryrelpedidos.ParamByName('DataInicio').AsDate:=frmSelecionarData.EdtDataInicio.Date;
    frmrelpedidos.qryrelpedidos.ParamByName('DataFim').AsDate:=frmSelecionarData.EdtDataFinal.Date;
    frmrelpedidos.Relatorio.PreviewModal;
    frmrelpedidos.qryrelpedidos.close;
  finally
    frmselecionardata.release;
    frmrelpedidos.Release;
  end;
end;

procedure TfrmMenu.Produtos1Click(Sender: TObject);
begin
 frmcadprodutos:= Tfrmcadprodutos.Create(self);
 frmcadprodutos.ShowModal;
 frmcadprodutos.Release;
end;

procedure TfrmMenu.Produtos2Click(Sender: TObject);
begin
  try
    frmselecionardata:= Tfrmselecionardata.create(self);
    frmselecionardata.showmodal;

    frmrelatorioproduto:=Tfrmrelatorioproduto.Create(self);
    frmrelatorioproduto.Qryrelprodutos.open;
    frmrelatorioproduto.Qryrelprodutos.ParamByName('DataInicio').AsDate:=frmSelecionarData.EdtDataInicio.Date;
    frmrelatorioproduto.Qryrelprodutos.ParamByName('DataFim').AsDate:=frmSelecionarData.EdtDataFinal.Date;
    frmrelatorioproduto.Relatorio.PreviewModal;
    frmrelatorioproduto.Qryrelprodutos.close;
  finally
    frmselecionardata.release;
    frmrelatorioproduto.Release;
  end;
end;

procedure TfrmMenu.AtualizarBancodedados;
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
  try
    oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(Dtmconexao.ConexaoDB);
    oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
    if Assigned(oAtualizarMSSQL) then
       FreeAndNil(oAtualizarMSSQL)
    else
    abort;
  end;
end;


procedure TfrmMenu.MudarImagemdeFundo1Click(Sender: TObject);
begin
if dlgimg.Execute = true then
  begin
    edtcaminho.Enabled:= true;
    imgfundo.Picture.LoadFromFile(dlgimg.FileName);
    edtcaminho.Text:= ExtractFilePath(dlgimg.FileName) + ExtractFileName(dlgimg.FileName);
    TArquivoIni.AtualizarIni('CONFIGURACAO', 'Imagem', edtcaminho.text)
  end;
end;

{$endregion}


end.
