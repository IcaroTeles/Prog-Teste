unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, RxCurrEdit, Vcl.Mask,
  RxToolEdit;

type
  Tfrmcadprodutos = class(Tfrmheranca)
    edtnomeproduto: TLabeledEdit;
    Label1: TLabel;
    edtestoque: TLabeledEdit;
    Label2: TLabel;
    edtvalorproduto: TCurrencyEdit;
    edtdesconto: TCurrencyEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadprodutos: Tfrmcadprodutos;

implementation

{$R *.dfm}

end.
