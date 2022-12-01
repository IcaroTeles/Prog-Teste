unit cCadFuncionarios;

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
  TFuncionario = class
  private
    ConectDB:TZConnection;
    F_funcionarioId:Integer;
    F_nome:String;
    F_cpf: String;
    F_senha: String;
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
    property codigo        :Integer    read F_funcionarioId  write F_funcionarioId;
    property nome          :string     read F_nome           write F_nome;
    property cpf           :string     read F_cpf            write F_cpf;
    property senha         :string     read F_senha          write F_senha;
    property datainclusao  :TDateTime  read F_datainclusao   write F_datainclusao;
    property dataedicao    :TDateTime  read F_dataedicao     write F_dataedicao;
  end;

implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TFuncionario.Create(aConexao:TZConnection);
begin
  ConectDB:=aConexao;
end;

destructor TFuncionario.Destroy;
begin
  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TFuncionario.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_funcionarioId)+#13+
                'Descrição: '+(F_nome),mtConfirmation,[mbYes, mbNo],0)=mrNo then
  begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM funcionarios '+
                ' WHERE funcionarioId=:funcionarioId ');
    Qry.ParamByName('funcionarioId').AsInteger :=F_funcionarioId;
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

function TFuncionario.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE funcionarios '+
                '   SET nome            =:nome '+
                '       ,cpf            =:cpf '+
                '       ,senha          =:senha '+
                '       ,datainclusao   =:datainclusao '+
                '       ,dataedicao     =:dataedicao '+
                ' WHERE funcionarioId   =:funcionarioId ');
    Qry.ParamByName('funcionarioId').AsInteger   :=Self.F_funcionarioId;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('cpf').AsString              :=Self.F_cpf;
    Qry.ParamByName('senha').AsString            :=Self.F_senha;
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

function TFuncionario.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO funcionarios (nome, '+
                '                          cpf, '+
                '                          senha, '+
                '                          datainclusao, '+
                '                          dataedicao) '+
                ' VALUES                  (:nome, '+
                '                          :cpf, '+
                '                          :senha, '+
                '                          :datainclusao, '+
                '                          :dataedicao)' );

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('cpf').AsString              :=Self.F_cpf;
    Qry.ParamByName('senha').AsString            :=Self.F_senha;
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

function TFuncionario.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT funcionarioid,'+
                '       nome, '+
                '       cpf, '+
                '       senha, '+
                '       datainclusao, '+
                '       dataedicao '+
                '  FROM funcionarios '+
                ' WHERE funcionarioid=:funcionarioid');
    Qry.ParamByName('funcionarioid').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_funcionarioId     := Qry.FieldByName('funcionarioId').AsInteger;
      Self.F_nome              := Qry.FieldByName('nome').AsString;
      Self.F_cpf               := Qry.FieldByName('cpf').AsString;
      Self.F_senha             := Qry.FieldByName('senha').AsString;
      Self.F_datainclusao      := Qry.FieldByName('datainclusao').AsDateTime;
      Self.F_dataedicao        := Qry.FieldByName('dataedicao').AsDateTime;

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
