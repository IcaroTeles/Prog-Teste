unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, RxToolEdit, uDtmConexao,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,cCadClientes,cenum;

type
  Tfrmcadclientes = class(Tfrmheranca)
    edtnomecliente: TLabeledEdit;
    edtsobrenome: TLabeledEdit;
    edttelefone: TMaskEdit;
    edtcelular: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    qrycontroleclienteid: TIntegerField;
    qrycontrolenome: TWideStringField;
    qrycontrolesobrenome: TWideStringField;
    qrycontroleendereco: TWideStringField;
    qrycontrolecep: TWideStringField;
    qrycontroletelefone: TWideStringField;
    qrycontrolecelular: TWideStringField;
    qrycontroledatainclusao: TDateTimeField;
    qrycontroledataedicao: TDateTimeField;
    edtcep: TLabeledEdit;
    edtendereco: TLabeledEdit;
    procedure btnconsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btneditar2Click(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure edtcepExit(Sender: TObject);
    procedure grdcontroleDblClick(Sender: TObject);
  private
    oCliente:TCliente;
    function excluir: boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    procedure consultarcep(cep: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadclientes: Tfrmcadclientes;

implementation

{$R *.dfm}


procedure Tfrmcadclientes.btncadastrarClick(Sender: TObject);
begin
  inherited;
 dtinclusao.Date:= Date;
end;

procedure Tfrmcadclientes.btnconsultarClick(Sender: TObject);
begin
  inherited;
  consultarcep(edtcep.Text);
end;

procedure Tfrmcadclientes.btneditar2Click(Sender: TObject);
begin
desativaredts(true);
if oCliente.Selecionar(Qrycontrole.FieldByName('clienteId').AsInteger) then
  begin
     edtnomecliente.Text     :=oCliente.nome;
     edtsobrenome.Text       :=oCliente.sobrenome;
     edtCEP.Text             :=oCliente.cep;
     edtEndereco.Text        :=oCliente.endereco;
     edtTelefone.Text        :=oCliente.telefone;
     edtcelular.Text         :=oCliente.celular;
     dtinclusao.Date         :=oCliente.datainclusao;
     dtedicao.Date           :=oCliente.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

procedure Tfrmcadclientes.btneditarClick(Sender: TObject);
begin
desativaredts(true);
if oCliente.Selecionar(Qrycontrole.FieldByName('clienteId').AsInteger) then
  begin
     edtnomecliente.Text     :=oCliente.nome;
     edtsobrenome.Text       :=oCliente.sobrenome;
     edtCEP.Text             :=oCliente.cep;
     edtEndereco.Text        :=oCliente.endereco;
     edtTelefone.Text        :=oCliente.telefone;
     edtcelular.Text         :=oCliente.celular;
     dtinclusao.Date         :=oCliente.datainclusao;
     dtedicao.Date           :=oCliente.dataedicao;
  end
   else
  begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure Tfrmcadclientes.consultarcep(cep:string);
var tamanho: integer;
begin
 tamanho := length(edtcep.Text);
 if tamanho <> 8 then
  begin
     ShowMessage('Cep Inválido');
     exit;
  end;
  RESTRequest1.Resource :=(edtcep.Text) + '/json';
  RESTRequest1.Execute;
  if RESTRequest1.Response.StatusCode = 200 then
  begin
    if RESTRequest1.Response.Content.IndexOf('erro')> 0 then
    begin
      ShowMessage('CEP não encontrado');
    end
    else
    begin
      with MemTable do
      begin
        edtendereco.Text:= FieldByName('logradouro').AsString +
         ', ' + FieldByName('bairro').AsString + ', ' + FieldByName('localidade').AsString +
         ', ' + FieldByName('uf').AsString + '.';
      end;

    end;
  end
  else
  begin
    ShowMessage('Erro ao consultar Cep');
  end;

end;

procedure Tfrmcadclientes.edtcepExit(Sender: TObject);
begin
  inherited;
  consultarcep(edtcep.Text);
end;

function Tfrmcadclientes.excluir: Boolean;
begin
if oCliente.Selecionar(Qrycontrole.FieldByName('clienteId').AsInteger) then
  begin
     Result:=oCliente.Apagar;
  end;
  qrycontrole.Refresh;
end;

procedure Tfrmcadclientes.FormCreate(Sender: TObject);
begin
  inherited;
  ocliente:=tcliente.Create(dtmconexao.conexaodb);
  qrycontrole.Active:= true;
end;

function Tfrmcadclientes.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  oCliente.nome           :=edtnomecliente.Text;
  oCliente.sobrenome      :=edtsobrenome.Text;
  oCliente.cep            :=edtCEP.Text;
  oCliente.endereco       :=edtEndereco.Text;
  oCliente.telefone       :=edtTelefone.Text;
  oCliente.celular        :=edtcelular.Text;
  oCliente.datainclusao   :=dtinclusao.Date;
  oCliente.dataedicao     :=dtinclusao.Date;

  if (EstadoDoCadastro=ecNovo) then
     Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCliente.Atualizar;
     qrycontrole.Refresh;
end;

procedure Tfrmcadclientes.grdcontroleDblClick(Sender: TObject);
begin
  inherited;
   btneditar.Click;
   btnok.Enabled:= false;
   btneditar2.Enabled:= true;
   desativaredts(false);
end;

end.
