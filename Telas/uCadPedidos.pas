unit uCadPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  RxCurrEdit, Vcl.DBCtrls, uDtmConexao, cenum, ccadpedidos, ucadclientes,
  uarquivoini, ucadprodutos, uconfiguracao,ccadproduto,ccadclientes;

type
  Tfrmcadpedidos = class(Tfrmheranca)
    edtvalortotal: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtvalorunitario: TCurrencyEdit;
    edtvalordesconto: TCurrencyEdit;
    edtquantidade: TCurrencyEdit;
    lblcap: TLabel;
    edtvalorparcial: TCurrencyEdit;
    edtvalortotaldesconto: TCurrencyEdit;
    edtcodigocliente: TLabeledEdit;
    edtcodigoproduto: TLabeledEdit;
    lkpproduto: TDBLookupComboBox;
    lkpcliente: TDBLookupComboBox;
    qryprodutos: TZQuery;
    qrycliente: TZQuery;
    dtsprodutos: TDataSource;
    dtscliente: TDataSource;
    qryprodutosprodutoid: TIntegerField;
    qryprodutosnome: TWideStringField;
    qryprodutosvalor: TFloatField;
    qryprodutosdesconto: TFloatField;
    qryclienteclienteid: TIntegerField;
    qryclientenome: TWideStringField;
    qrycontrolepedidoId: TIntegerField;
    qrycontroleclienteid: TIntegerField;
    qrycontroleprodutoid: TIntegerField;
    qrycontrolequantidadetotal: TWideStringField;
    qrycontroledatainclusao: TDateTimeField;
    qrycontroledataedicao: TDateTimeField;
    qrycontrolevalortotal: TFloatField;
    qrycontrolevalortotaldesconto: TFloatField;
    chkdesconto: TCheckBox;
    edtnome: TLabeledEdit;
    edtnomecliente: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure grdcontroleDblClick(Sender: TObject);
    procedure btneditar2Click(Sender: TObject);
    procedure edtquantidadeExit(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
  private

    function excluir: boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    procedure somarvalores;
    { Private declarations }
  public
  opedido:tpedido;
    { Public declarations }
  end;

var
  frmcadpedidos: Tfrmcadpedidos;

implementation

{$R *.dfm}

{ Tfrmcadpedidos }

procedure Tfrmcadpedidos.btncadastrarClick(Sender: TObject);
begin
  inherited;
  dtinclusao.Date:= Date;
end;

procedure Tfrmcadpedidos.btneditar2Click(Sender: TObject);
begin
  desativaredts(true);
  if opedido.Selecionar(Qrycontrole.FieldByName('pedidoId').AsInteger) then
  begin
     edtcodigoproduto.Text       :=inttostr (opedido.codigoproduto);
     edtcodigocliente.Text       :=inttostr(opedido.codigocliente);
     edtvalortotal.Value         :=opedido.valortotal;
     edtvalortotaldesconto.Value :=opedido.valortotaldesconto;
     edtquantidade.Value         := strtofloat(opedido.quantidadetotal);
     dtinclusao.Date             :=opedido.datainclusao;
     dtedicao.Date               :=opedido.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

procedure Tfrmcadpedidos.btneditarClick(Sender: TObject);
begin
  inherited;
  if opedido.Selecionar(Qrycontrole.FieldByName('pedidoId').AsInteger) then
  begin
     edtcodigoproduto.Text       :=inttostr(opedido.codigoproduto);
     edtcodigocliente.Text       :=inttostr(opedido.codigocliente);
     edtvalortotal.Value         :=opedido.valortotal;
     edtvalortotaldesconto.Value :=opedido.valortotaldesconto;
     edtquantidade.Value         :=strtofloat (opedido.quantidadetotal);
     dtinclusao.Date             :=opedido.datainclusao;
     dtedicao.Date               :=opedido.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

procedure Tfrmcadpedidos.edtquantidadeExit(Sender: TObject);
begin
  inherited;
somarvalores;

end;

function Tfrmcadpedidos.excluir: boolean;
begin
  if opedido.Selecionar(Qrycontrole.FieldByName('pedidoId').AsInteger) then
  begin
     Result:=opedido.Apagar;
  end;
  qrycontrole.Refresh;
end;

procedure Tfrmcadpedidos.FormCreate(Sender: TObject);
begin
  inherited;
  opedido:=tpedido.Create(dtmconexao.conexaodb);
  qrycontrole.Active:= true;
  qryprodutos.Active:= true;
  qrycliente.Active:= true;
end;

function Tfrmcadpedidos.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  opedido.codigoproduto      :=strtoint (edtcodigoproduto.Text);
  opedido.codigocliente      :=strtoint (edtcodigocliente.Text);
  opedido.valortotal         :=edtvalortotal.Value;
  opedido.quantidadetotal    :=floattostr (edtquantidade.Value);
  opedido.valortotaldesconto :=edtvalortotaldesconto.Value;
  opedido.datainclusao       :=dtinclusao.Date;
  opedido.dataedicao         :=dtinclusao.Date;


  if (EstadoDoCadastro=ecNovo) then
     Result:=opedido.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=opedido.Atualizar;
     qrycontrole.Refresh;
end;

procedure Tfrmcadpedidos.grdcontroleDblClick(Sender: TObject);
begin
  inherited;
  btneditar.Click;
  btnok.Enabled:= false;
  btneditar2.Enabled:= true;
  desativaredts(false);
end;

procedure tfrmcadpedidos.somarvalores;
begin
 edtvalorunitario.Value:= qryprodutos.FieldByName('valor').AsCurrency;
 if chkdesconto.Checked = false then
 edtvalordesconto.Value:= 0;
 edtvalordesconto.Value:= qryprodutos.FieldByName('desconto').AsCurrency;
 edtvalorparcial.Value:= (edtquantidade.Value)*(edtvalorunitario.Value);
 edtvalortotaldesconto.Value:= (edtvalordesconto.Value)*(edtquantidade.Value);
 edtvalortotal.Value:= edtvalorparcial.Value-edtvalortotaldesconto.Value;
 edtcodigoproduto.Text:=qryprodutos.FieldByName('produtoid').Asstring;
 edtcodigocliente.Text:=qrycliente.FieldByName('clienteid').Asstring;
end;

end.
