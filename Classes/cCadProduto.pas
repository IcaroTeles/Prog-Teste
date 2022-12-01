unit cCadProduto;

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
  TProduto = class
  private
    ConectDB:TZConnection;
    F_produtoId:Integer;
    F_nome:String;
    F_valor:Double;
    F_desconto:Double;
    F_quantidade: Double;
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
    property codigo        :Integer    read F_produtoId      write F_produtoId;
    property nome          :string     read F_nome           write F_nome;
    property valor         :Double     read F_valor          write F_valor;
    property desconto      :Double     read F_desconto       write F_desconto;
    property quantidade    :Double     read F_quantidade     write F_quantidade;
    property datainclusao  :TDateTime  read F_datainclusao   write F_datainclusao;
    property dataedicao    :TDateTime  read F_dataedicao     write F_dataedicao;
  end;


implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TProduto.Create(aConexao:TZConnection);
begin
  ConectDB:=aConexao;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TProduto.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_produtoId)+#13+
                'Descrição: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM produtos '+
                ' WHERE produtoId=:produtoId ');
    Qry.ParamByName('produtoId').AsInteger :=F_produtoId;
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

function TProduto.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE produtos '+
                '   SET nome           =:nome '+
                '       ,valor         =:valor '+
                '       ,desconto      =:desconto '+
                '       ,quantidade    =:quantidade '+
                '       ,datainclusao  =:datainclusao '+
                '       ,dataedicao    =:dataedicao '+
                ' WHERE produtoId=:produtoId ');
    Qry.ParamByName('produtoId').AsInteger       :=Self.F_produtoId;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('valor').AsFloat             :=Self.F_valor;
    Qry.ParamByName('desconto').AsFloat          :=Self.F_desconto;
    Qry.ParamByName('quantidade').AsFloat        :=Self.F_quantidade;
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

function TProduto.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO produtos (nome, '+
                '                      valor,  '+
                '                      desconto,  '+
                '                      quantidade,  '+
                '                      datainclusao, '+
                '                      dataedicao) '+
                ' VALUES              (:nome, '+
                '                      :valor,  '+
                '                      :desconto,  '+
                '                      :quantidade,  '+
                '                      :datainclusao, '+
                '                      :dataedicao)' );

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('valor').AsFloat             :=Self.F_valor;
    Qry.ParamByName('desconto').AsFloat          :=Self.F_desconto;
    Qry.ParamByName('quantidade').AsFloat        :=Self.F_quantidade;
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

function TProduto.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT produtoId,'+
                '       nome, '+
                '       valor, '+
                '       desconto, '+
                '       quantidade, '+
                '       datainclusao,'+
                '       dataedicao'+
                '  FROM produtos '+
                ' WHERE produtoId=:produtoId');
    Qry.ParamByName('produtoId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_produtoId     := Qry.FieldByName('produtoId').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_valor         := Qry.FieldByName('valor').AsFloat;
      Self.F_desconto      := Qry.FieldByName('desconto').AsFloat;
      Self.F_quantidade    := Qry.FieldByName('quantidade').AsFloat;
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
