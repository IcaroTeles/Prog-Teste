unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  RxCurrEdit, Vcl.DBCtrls, uDtmConexao, cEnum;

type
  Tfrmheranca = class(TForm)
    tabgeral: TPageControl;
    tabcontrole: TTabSheet;
    tabdados: TTabSheet;
    grdcontrole: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btncadastrar: TBitBtn;
    btneditar: TBitBtn;
    btndeletar: TBitBtn;
    btnsair: TBitBtn;
    btnok: TBitBtn;
    btncancelar: TBitBtn;
    btneditar2: TBitBtn;
    qrycontrole: TZQuery;
    dtscontrole: TDataSource;
    dtinclusao: TDateEdit;
    dtedicao: TDateEdit;
    Label4: TLabel;
    Label3: TLabel;
    btnsair2: TBitBtn;
    procedure btnsairClick(Sender: TObject);
    procedure btnsair2Click(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure grdcontroleDblClick(Sender: TObject);
    procedure btneditar2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btndeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure controlarbotoes(btnok, btncancelar, btneditar2: Tbitbtn;
      tabgeral: Tpagecontrol; Flag: boolean);
    procedure limparedits;


    { Private declarations }
  public
  EstadodoCadastro: TEstadoDoCadastro;
  function excluir: boolean; virtual;
  function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; virtual;
  procedure controlartab(tabgeral: Tpagecontrol; indice: integer);
  procedure desativaredts(flag:boolean);
    { Public declarations }
  end;

var
  frmheranca: Tfrmheranca;

implementation

{$R *.dfm}

procedure Tfrmheranca.btnsair2Click(Sender: TObject);
begin
close;
limparedits;
end;

procedure Tfrmheranca.btncadastrarClick(Sender: TObject);
begin
  controlarbotoes (btnok,btncancelar,btneditar2,tabgeral,false);
  limparedits;
  EstadodoCadastro:= ecNovo;
  dtedicao.Enabled:= false;
end;

procedure Tfrmheranca.btncancelarClick(Sender: TObject);
begin
controlarbotoes (btnok,btncancelar,btneditar2,tabgeral,true);
controlartab(tabgeral,0);
limparedits;
Estadodocadastro := ecNada;
end;

procedure Tfrmheranca.btndeletarClick(Sender: TObject);
begin
if excluir then
  begin
   EstadodoCadastro:= ecNada;
  end;
end;

procedure Tfrmheranca.btneditar2Click(Sender: TObject);
begin
controlarbotoes (btnok,btncancelar,btneditar2,tabgeral,false);
dtinclusao.Enabled:= false;
Estadodocadastro := ecAlterar;
end;

procedure Tfrmheranca.btneditarClick(Sender: TObject);
begin
 controlarbotoes (btnok,btncancelar,btneditar2,tabgeral,false);
 dtinclusao.Enabled:= false;
 EstadodoCadastro:= ecAlterar;
end;

procedure Tfrmheranca.btnokClick(Sender: TObject);
begin
 if gravar (estadodocadastro) then
 begin
  controlarbotoes (btnok,btncancelar,btneditar2,tabgeral,true);
  controlartab(tabgeral,0);
  limparedits;
  Estadodocadastro := ecNada;
 end;
end;

procedure Tfrmheranca.btnsairClick(Sender: TObject);
begin
close;
end;

procedure Tfrmheranca.grdcontroleDblClick(Sender: TObject);
begin
 btnok.Enabled:= false;
end;

procedure Tfrmheranca.controlarbotoes (btnok, btncancelar, btneditar2:Tbitbtn; tabgeral: Tpagecontrol; Flag:boolean);
begin
 btnok.Enabled := not Flag;
 btncancelar.Enabled := not Flag;
 btneditar2.Enabled :=Flag;
 tabgeral.Pages[0].TabVisible := Flag;
 tabgeral.Pages[1].TabVisible := not Flag;
end;

procedure Tfrmheranca.controlartab (tabgeral: Tpagecontrol; indice:integer);
begin
  if (tabgeral.Pages [indice].TabVisible) then
  tabgeral.TabIndex:=indice;

end;

procedure Tfrmheranca.FormCreate(Sender: TObject);
begin
Qrycontrole.Connection:= dtmConexao.ConexaoDB;
  dtscontrole.DataSet := Qrycontrole;
  Grdcontrole.DataSource := Dtscontrole;
  Grdcontrole.Options:= [dgTitles,dgIndicator,dgColumnResize,
                     dgColLines,dgRowLines,dgTabs,dgRowSelect,
                     dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,
                     dgTitleHotTrack];
end;

procedure Tfrmheranca.FormShow(Sender: TObject);
begin
  tabgeral.Pages[1].TabVisible := false;
end;

procedure Tfrmheranca.limparedits;
var
  x:integer;
begin
  for x := 0 to ComponentCount -1 do
    begin
      if (Components[x] is TLabeledEdit) then
      begin
        begin
         TLabeledEdit(Components[x]).Text:= EmptyStr;
        end;
      end
      else if (Components[x] is TMemo) then
      begin
        begin
         TMemo(Components[x]).Text:= EmptyStr;
        end;
      end
      else if (Components[x] is TDBLookupComboBox) then
      begin
        begin
         TDBLookupComboBox(Components[x]).KeyValue:= Null;
        end;
      end
      else if (Components[x] is TCurrencyEdit) then
      begin
        begin
         TCurrencyEdit(Components[x]).Value:= 0;
        end;
      end
      else if (Components[x] is TDateEdit) then
      begin
        begin
         TDateEdit(Components[x]).Date:=0;
        end;
      end
      else if (Components[x] is TMaskEdit) then
      begin
        begin
         TMaskEdit(Components[x]).Text:= EmptyStr;
        end;
      end;
    end;
  end;

function TfrmHeranca.excluir: boolean;
begin
   showmessage ('Deletado');
   result := True;
end;

function TfrmHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if (EstadoDoCadastro = ecnovo) then
    ShowMessage('Inserido')
  else if (EstadoDoCadastro = ecAlterar) then
    ShowMessage('Gravado');
  Result := True;
end;

procedure TfrmHeranca.desativaredts(flag:boolean);
begin
var
  x:integer;
begin
  for x := 0 to ComponentCount -1 do
    begin
      if (Components[x] is TLabeledEdit) then
      begin
        begin
         TLabeledEdit(Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TEdit) then
      begin
        begin
         TEdit (Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TCheckBox) then
      begin
        begin
         TCheckBox (Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TMemo) then
      begin
        begin
         TMemo(Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TDBLookupComboBox) then
      begin
        begin
         TDBLookupComboBox(Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TCurrencyEdit) then
      begin
        begin
         TCurrencyEdit(Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TDateEdit) then
      begin
        begin
         TDateEdit(Components[x]).Enabled:= flag;
        end;
      end
      else if (Components[x] is TMaskEdit) then
      begin
        begin
         TMaskEdit(Components[x]).Enabled:= flag;
        end;
      end;
    end;
  end;
end;

end.
