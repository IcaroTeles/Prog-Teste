unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, RxToolEdit;

type
  Tfrmcadclientes = class(Tfrmheranca)
    edtnomecliente: TLabeledEdit;
    edtsobrenome: TLabeledEdit;
    edtendereco: TLabeledEdit;
    edttelefone: TMaskEdit;
    edtcelular: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtcep: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadclientes: Tfrmcadclientes;

implementation

{$R *.dfm}

end.
