unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     cAtualizacaoBancoDeDados;

type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)

  private
    function  TabelaExiste(aNomeTabela:String):Boolean;
    procedure Pedidos;

  protected

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    procedure Cliente;
    procedure Produto;
    procedure Funcionarios;
end;

implementation

{ TAtualizacaoTableMSSQL }

constructor TAtualizacaoTableMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
  Cliente;
  Produto;
  Funcionarios;
  Pedidos;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin
  inherited;
end;

procedure TAtualizacaoTableMSSQL.Funcionarios;
  begin
  if not TabelaExiste('funcionarios') then
  begin
    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE funcionarios (  '+
      '		funcionarioId int IDENTITY(1,1) NOT NULL, '+
      '		nome varchar(60) NULL, '+
      '		cpf varchar(60) null, '+
      '		senha varchar(50) null, '+
      '		datainclusao datetime null, '+
      '		dataedicao datetime null, '+
      '		PRIMARY KEY (funcionarioId) '+
      '	) '
    );
  end;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
Var Qry:TZQuery;
Begin
  Try
    Result:=False;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT OBJECT_ID (:NomeTabela) As ID ');
    Qry.ParamByName('NomeTabela').AsString:=aNomeTabela;
    Qry.Open;

    if Qry.FieldByName('ID').AsInteger>0 then
       Result:=True;

  Finally
    Qry.Close;
    if Assigned(Qry) then
       FreeAndNil(Qry);
  End;
end;

procedure TAtualizacaoTableMSSQL.Cliente;
begin
  if not TabelaExiste('clientes') then
  begin
    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE clientes (  '+
      '		clienteId int IDENTITY(1,1) NOT NULL, '+
      '		nome varchar(60) NULL, '+
      '		sobrenome varchar(60) null, '+
      '		endereco varchar(80) null, '+
      '		cep varchar(10) null, '+
      '		telefone varchar(14) null, '+
      '		celular varchar(14) null,      '+
      '		datainclusao datetime null, '+
      '		dataedicao datetime null, '+
      '		PRIMARY KEY (clienteId) '+
      '	) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Produto;
begin
  if not TabelaExiste('produtos') then
  begin
    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE produtos(  '+
      '		produtoId int IDENTITY(1,1) NOT NULL, '+
      '		nome varchar(60) NULL, '+
      '		valor decimal(15,4) default 0.00000 null, '+
      '		desconto decimal(15,4) default 0.00000 null, '+
      '		quantidade varchar(10) null, '+
      '		datainclusao datetime null, '+
      '		dataedicao datetime null, '+
      '		PRIMARY KEY (produtoId), '+
      '	) '
    );
  end;
end;


procedure TAtualizacaoTableMSSQL.Pedidos;
begin
  if not TabelaExiste('pedidos') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE pedidos ( ' +
      	  ' pedidoId int identity(1,1) not null, ' +
      	  ' clienteid int, ' +
      	  ' produtoid int, ' +
      		' quantidadetotal varchar(10) null, ' +
      		' datainclusao datetime default getdate(), ' +
      		' dataedicao datetime null, ' +
      	  ' valortotal decimal(15,4) default 0.00000, ' +
      	  ' valortotaldesconto decimal(15,4) default 0.00000, ' +
      	  ' PRIMARY KEY (pedidoId),' +
      	')'
    );
  end;
end;

end.
