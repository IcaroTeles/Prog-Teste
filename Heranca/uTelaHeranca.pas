unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Mask, RxToolEdit;

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
    BitBtn8: TBitBtn;
    qrycontrole: TZQuery;
    dtscontrole: TDataSource;
    dtinclusao: TDateEdit;
    dtedicao: TDateEdit;
    Label4: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmheranca: Tfrmheranca;

implementation

{$R *.dfm}

end.
