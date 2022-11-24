unit ProgTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus,uConfiguracao,uCadProdutos,uCadFuncionarios, uCadPedidos, uCadClientes;

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
    procedure Configurao1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

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

procedure TfrmMenu.Pedidos1Click(Sender: TObject);
begin
 frmcadpedidos:= Tfrmcadpedidos.Create(self);
 frmcadpedidos.ShowModal;
 frmcadpedidos.Release;
end;

procedure TfrmMenu.Produtos1Click(Sender: TObject);
begin
 frmcadprodutos:= Tfrmcadprodutos.Create(self);
 frmcadprodutos.ShowModal;
 frmcadprodutos.Release;
end;

end.
