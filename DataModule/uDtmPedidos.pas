unit uDtmPedidos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDtmConexao;

type
  Tpedido = class(TDataModule)
    qryclientes: TZQuery;
    qryprodutos: TZQuery;
    dtsclientes: TDataSource;
    dtsprodutos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmpedido: Tpedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
