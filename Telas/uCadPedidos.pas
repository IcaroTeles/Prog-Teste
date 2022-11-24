unit uCadPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  RxCurrEdit;

type
  Tfrmcadpedidos = class(Tfrmheranca)
    edtcodigoproduto: TLabeledEdit;
    edtcodigocliente: TLabeledEdit;
    edtquantidade: TLabeledEdit;
    edtvalortotal: TCurrencyEdit;
    edtvalortotaldesconto: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadpedidos: Tfrmcadpedidos;

implementation

{$R *.dfm}

end.
