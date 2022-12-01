unit cCadClientes;

interface

uses system.Classes,
     Vcl.Extctrls,
     Vcl.Dialogs,
     Vcl.Controls,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils;

type
  TCliente = class
  private
    ConectDB:TZConnection;
    F_clienteId:Integer;
    F_nome:String;
    F_sobrenome: string;
    F_endereco: string;
    F_cep: String;
    F_telefone: string;
    F_celular: string;
    F_datainclusao: TDateTime;
    F_dataedicao: TDateTime;

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
  published
    property codigo        :Integer    read F_clienteId      write F_clienteId;
    property nome          :string     read F_nome           write F_nome;
    property sobrenome     :string     read F_sobrenome      write F_sobrenome;
    property endereco      :string     read F_endereco       write F_endereco;
    property cep           :string     read F_cep            write F_Cep;
    property telefone      :string     read F_telefone       write F_telefone;
    property celular       :string     read F_celular        write F_celular;
    property datainclusao  :TDateTime  read F_datainclusao   write F_datainclusao;
    property dataedicao    :TDateTime  read F_dataedicao     write F_dataedicao;
  end;

implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao:TZConnection);
begin
  ConectDB:=aConexao;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TCliente.Apagar: Boolean;
var Qry:TZQuery;
begin
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM clientes '+
                ' WHERE clienteId=:clienteId ');
    Qry.ParamByName('clienteId').AsInteger :=F_clienteId;
    Try
       ConectDB.StartTransaction;
      Qry.ExecSQL;
      ConectDB.Commit;
    Except
      ConectDB.Rollback;
      Result:=false;
    End;
    if Assigned(Qry) then
       FreeAndNil(Qry);
end;

function TCliente.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE clientes '+
                '   SET nome            =:nome '+
                '       ,sobrenome      =:sobrenome '+
                '       ,endereco       =:endereco '+
                '       ,cep            =:cep '+
                '       ,telefone       =:telefone '+
                '       ,celular        =:celular '+
                '       ,datainclusao   =:datainclusao '+
                '       ,dataedicao     =:dataedicao '+
                ' WHERE clienteId       =:clienteId ');
    Qry.ParamByName('clienteId').AsInteger       :=Self.F_clienteId;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('sobrenome').AsString        :=Self.F_sobrenome;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('celular').AsString          :=Self.F_celular;
    Qry.ParamByName('datainclusao').AsDateTime   :=Self.F_datainclusao;
    Qry.ParamByName('dataedicao').AsDateTime     :=Self.F_dataedicao;


    Try
       ConectDB.StartTransaction;
      Qry.ExecSQL;
      ConectDB.Commit;
    Except
      ConectDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCliente.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO clientes (nome, '+
                '                      sobrenome, '+
                '                      endereco, '+
                '                      cep, '+
                '                      telefone, '+
                '                      celular, '+
                '                      datainclusao, '+
                '                      dataedicao) '+
                ' VALUES              (:nome, '+
                '                      :sobrenome, '+
                '                      :endereco, '+
                '                      :cep, '+
                '                      :telefone, '+
                '                      :celular, '+
                '                      :datainclusao, '+
                '                      :dataedicao)' );

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('sobrenome').AsString        :=Self.F_sobrenome;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('celular').AsString          :=Self.F_celular;
    Qry.ParamByName('datainclusao').AsDateTime   :=Self.F_datainclusao;
    Qry.ParamByName('dataedicao').AsDateTime     :=Self.F_dataedicao;

    Try
       ConectDB.StartTransaction;
      Qry.ExecSQL;
      ConectDB.Commit;
    Except
      ConectDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT clienteid,'+
                '       nome, '+
                '       sobrenome, '+
                '       endereco, '+
                '       cep, '+
                '       telefone, '+
                '       celular, '+
                '       datainclusao, '+
                '       dataedicao '+
                '  FROM clientes '+
                ' WHERE clienteid=:clienteid');
    Qry.ParamByName('clienteid').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_clienteId     := Qry.FieldByName('clienteId').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_sobrenome     := Qry.FieldByName('sobrenome').AsString;
      Self.F_endereco      := Qry.FieldByName('endereco').AsString;
      Self.F_cep           := Qry.FieldByName('cep').AsString;
      Self.F_telefone      := Qry.FieldByName('telefone').AsString;
      Self.F_celular       := Qry.FieldByName('celular').AsString;
      Self.F_datainclusao  := Qry.FieldByName('datainclusao').AsDateTime;
      Self.F_dataedicao    := Qry.FieldByName('dataedicao').AsDateTime;

    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;
{$endregion}


end.

end.
