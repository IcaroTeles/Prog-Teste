unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, Vcl.Mask,
  Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls,
  RxToolEdit, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  Tfrmcadfuncionarios = class(Tfrmheranca)
    edtnomefuncionario: TLabeledEdit;
    edtsenha: TLabeledEdit;
    edtcpf: TMaskEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadfuncionarios: Tfrmcadfuncionarios;

implementation

{$R *.dfm}

end.
