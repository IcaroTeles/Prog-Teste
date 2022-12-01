unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, Vcl.Mask,
  Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls,
  RxToolEdit, Vcl.Buttons, Vcl.Grids,
   Vcl.DBGrids, Vcl.ComCtrls,udtmconexao, cCadFuncionarios,cenum;

type
  Tfrmcadfuncionarios = class(Tfrmheranca)
    edtnomefuncionario: TLabeledEdit;
    edtsenha: TLabeledEdit;
    edtcpf: TMaskEdit;
    Label1: TLabel;
    qrycontrolefuncionarioId: TIntegerField;
    qrycontrolenome: TWideStringField;
    qrycontrolecpf: TWideStringField;
    qrycontrolesenha: TWideStringField;
    qrycontroledatainclusao: TDateTimeField;
    qrycontroledataedicao: TDateTimeField;
    procedure btneditar2Click(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdcontroleDblClick(Sender: TObject);
  private
  ofuncionario:TFuncionario;
    function excluir: boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadfuncionarios: Tfrmcadfuncionarios;

implementation

{$R *.dfm}

procedure Tfrmcadfuncionarios.btncadastrarClick(Sender: TObject);
begin
  inherited;
dtinclusao.Date:= Date;
end;

procedure Tfrmcadfuncionarios.btneditar2Click(Sender: TObject);
begin
desativaredts(true);
if oFuncionario.Selecionar(Qrycontrole.FieldByName('funcionarioId').AsInteger) then
  begin
     edtnomefuncionario.Text     :=ofuncionario.nome;
     edtcpf.Text                 :=ofuncionario.cpf;
     edtsenha.Text               :=ofuncionario.senha;
     dtinclusao.Date             :=ofuncionario.datainclusao;
     dtedicao.Date               :=ofuncionario.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

procedure Tfrmcadfuncionarios.btneditarClick(Sender: TObject);
begin
if oFuncionario.Selecionar(Qrycontrole.FieldByName('funcionarioId').AsInteger) then
  begin
     edtnomefuncionario.Text     :=ofuncionario.nome;
     edtcpf.Text                 :=ofuncionario.cpf;
     edtsenha.Text               :=ofuncionario.senha;
     dtinclusao.Date             :=ofuncionario.datainclusao;
     dtedicao.Date               :=ofuncionario.dataedicao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  dtedicao.Enabled:= true;
end;

function Tfrmcadfuncionarios.excluir: boolean;
begin
  if ofuncionario.Selecionar(Qrycontrole.FieldByName('funcionarioId').AsInteger) then
  begin
     Result:=ofuncionario.Apagar;
  end;
  qrycontrole.Refresh;
end;

procedure Tfrmcadfuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  ofuncionario:=tfuncionario.Create(dtmconexao.conexaodb);
  qrycontrole.Active:= true;
end;

function Tfrmcadfuncionarios.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  ofuncionario.nome           :=edtnomefuncionario.Text;
  ofuncionario.cpf            :=edtcpf.Text;
  ofuncionario.senha          :=edtsenha.Text;
  ofuncionario.datainclusao   :=dtinclusao.Date;
  ofuncionario.dataedicao     :=dtinclusao.Date;

  if (EstadoDoCadastro=ecNovo) then
     Result:=ofuncionario.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=ofuncionario.Atualizar;
     qrycontrole.Refresh;
end;

procedure Tfrmcadfuncionarios.grdcontroleDblClick(Sender: TObject);
begin
  inherited;
   btneditar.Click;
   btnok.Enabled:= false;
   btneditar2.Enabled:= true;
   desativaredts(false);
end;

end.
