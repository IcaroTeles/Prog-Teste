unit cCadPedidos;

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
  TPedido = class
  private
    ConectDB:TZConnection;
    F_pedidoid:Integer;
    F_produtoid:integer;
    F_clienteid:integer;
    F_quantidadetotal: string;
    F_valortotal:Double;
    F_valortotaldesconto:Double;
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
    property codigopedido       :Integer    read F_pedidoid           write F_pedidoId;
    property codigoproduto      :integer   read F_produtoid          write F_produtoid;
    property codigocliente      :integer    read F_clienteid          write F_clienteid;
    property quantidadetotal    :string     read F_quantidadetotal    write F_quantidadetotal;
    property valortotal         :Double     read F_valortotal         write F_valortotal;
    property valortotaldesconto :Double     read F_valortotaldesconto write F_valortotaldesconto;
    property datainclusao       :TDateTime  read F_datainclusao       write F_datainclusao;
    property dataedicao         :TDateTime  read F_dataedicao         write F_dataedicao;
  end;


implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TPedido.Create(aConexao:TZConnection);
begin
  ConectDB:=aConexao;
end;

destructor TPedido.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TPedido.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_pedidoId)+#13+
                'Descrição: '+inttostr (F_pedidoid),mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM pedidos '+
                ' WHERE pedidoId=:pedidoId ');
    Qry.ParamByName('pedidoId').AsInteger :=F_pedidoId;
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

function TPedido.Atualizar: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE pedidos '+
                '   SET  produtoid          =:produtoid '+
                '       ,clienteid          =:clienteid '+
                '       ,valortotal         =:valortotal '+
                '       ,valortotaldesconto =:valortotaldesconto '+
                '       ,quantidadetotal    =:quantidadetotal '+
                '       ,datainclusao       =:datainclusao '+
                '       ,dataedicao         =:dataedicao '+
                ' WHERE pedidoId=:pedidoId ');
    Qry.ParamByName('pedidoId').AsInteger        :=Self.F_pedidoId;
    Qry.ParamByName('produtoId').Asinteger       :=Self.F_produtoid;
    Qry.ParamByName('clienteId').Asinteger       :=Self.F_clienteid;
    Qry.ParamByName('valortotal').AsFloat        :=Self.F_valortotal;
    Qry.ParamByName('valortotaldesconto').AsFloat:=Self.F_valortotaldesconto;
    Qry.ParamByName('quantidadetotal').asstring   :=Self.F_quantidadetotal;
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

function TPedido.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO pedidos (produtoid, '+
                '                      clienteid, '+
                '                      valortotal,  '+
                '                      valortotaldesconto,  '+
                '                      quantidadetotal,  '+
                '                      datainclusao, '+
                '                      dataedicao) '+
                ' VALUES              (:produtoid, '+
                '                      :clienteid, '+
                '                      :valortotal,  '+
                '                      :valortotaldesconto,  '+
                '                      :quantidadetotal,  '+
                '                      :datainclusao, '+
                '                      :dataedicao)' );

    Qry.ParamByName('produtoid').Asinteger       :=Self.F_produtoid;
    Qry.ParamByName('clienteid').Asinteger       :=Self.F_clienteid;
    Qry.ParamByName('valortotal').AsFloat        :=Self.F_valortotal;
    Qry.ParamByName('valortotaldesconto').AsFloat:=Self.F_valortotaldesconto;
    Qry.ParamByName('quantidadetotal').Asstring   :=Self.F_quantidadetotal;
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

function TPedido.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConectDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('select  pedidoid, ' +
		            'clienteid, ' +
		            'produtoid, ' +
		            'quantidadetotal, ' +
		            'datainclusao, ' +
		            'dataedicao, ' +
		            'valortotal, ' +
		            'valortotaldesconto ' +
		            'from pedidos ' +
                'WHERE pedidoid=:pedidoid');
    Qry.ParamByName('pedidoid').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_pedidoId            := Qry.FieldByName('pedidoId').AsInteger;
      Self.F_produtoid          := Qry.FieldByName('produtoid').Asinteger;
      Self.F_clienteid          := Qry.FieldByName('clienteid').Asinteger;
      Self.F_quantidadetotal      := Qry.FieldByName('quantidadetotal').AsString;
      Self.F_valortotal           := Qry.FieldByName('valortotal').AsFloat;
      Self.F_valortotaldesconto   := Qry.FieldByName('valortotaldesconto').AsFloat;
      Self.F_datainclusao        := Qry.FieldByName('datainclusao').AsDateTime;
      Self.F_dataedicao          := Qry.FieldByName('dataedicao').AsDateTime;
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
