unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, RxCurrEdit, Vcl.Mask,
  RxToolEdit,cCadProduto,udtmconexao,cenum,uconfiguracao;

type
  Tfrmcadprodutos = class(Tfrmheranca)
    edtnomeproduto: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtvalorproduto: TCurrencyEdit;
    edtdesconto: TCurrencyEdit;
    edtestoque: TCurrencyEdit;
    Label5: TLabel;
    qrycontroleprodutoId: TIntegerField;
    qrycontrolenome: TWideStringField;
    qrycontrolevalor: TFloatField;
    qrycontroledesconto: TFloatField;
    qrycontrolequantidade: TWideStringField;
    qrycontroledatainclusao: TDateTimeField;
    qrycontroledataedicao: TDateTimeField;
    procedure btncadastrarClick(Sender: TObject);
    procedure btneditar2Click(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdcontroleDblClick(Sender: TObject);
  private
  oproduto:Tproduto;
    function excluir: boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadprodutos: Tfrmcadprodutos;

implementation

{$R *.dfm}

{ Tfrmcadprodutos }

procedure Tfrmcadprodutos.btncadastrarClick(Sender: TObject);
begin
  inherited;
  dtinclusao.Date:= Date;
end;

procedure Tfrmcadprodutos.btneditar2Click(Sender: TObject);
begin
desativaredts(true);
  if oproduto.Selecionar(Qrycontrole.FieldByName('produtoId').AsInteger) then
  begin
     edtnomeproduto.Text     :=oproduto.nome;
     edtestoque.Value        :=oproduto.quantidade;
     edtdesconto.Value       :=oproduto.desconto;
     edtvalorproduto.Value   :=oproduto.valor;
     dtinclusao.Date         :=oproduto.datainclusao;
     dtedicao.Date           :=oproduto.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

procedure Tfrmcadprodutos.btneditarClick(Sender: TObject);
begin
if oproduto.Selecionar(Qrycontrole.FieldByName('produtoId').AsInteger) then
  begin
     edtnomeproduto.Text     :=oproduto.nome;
     edtestoque.Value        :=oproduto.quantidade;
     edtdesconto.Value       :=oproduto.desconto;
     edtvalorproduto.Value   :=oproduto.valor;
     dtinclusao.Date         :=oproduto.datainclusao;
     dtedicao.Date           :=oproduto.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

function Tfrmcadprodutos.excluir: boolean;
begin
  if oproduto.Selecionar(Qrycontrole.FieldByName('produtoId').AsInteger) then
  begin
     Result:=oproduto.Apagar;
  end;
  qrycontrole.Refresh;
end;

procedure Tfrmcadprodutos.FormCreate(Sender: TObject);
begin
  inherited;
  oproduto:=tproduto.Create(dtmconexao.conexaodb);
  qrycontrole.Active:= true;
end;

function Tfrmcadprodutos.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  oproduto.nome           :=edtnomeproduto.Text;
  oproduto.quantidade     :=edtestoque.Value;
  oproduto.desconto       :=edtdesconto.Value;
  oproduto.valor          :=edtvalorproduto.Value;
  oproduto.datainclusao   :=dtinclusao.Date;
  oproduto.dataedicao     :=dtinclusao.Date;

  if (EstadoDoCadastro=ecNovo) then
     Result:=oproduto.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oproduto.Atualizar;
     qrycontrole.Refresh;
end;

procedure Tfrmcadprodutos.grdcontroleDblClick(Sender: TObject);
begin
  inherited;
   btneditar.Click;
   btnok.Enabled:= false;
   btneditar2.Enabled:= true;
   desativaredts(false);
end;

end.
