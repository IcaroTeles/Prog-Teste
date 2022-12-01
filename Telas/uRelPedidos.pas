unit uRelPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, ZAbstractRODataset, udtmconexao,
  ZAbstractDataset, ZDataset, RLFilters, RLPDFFilter;

type
  Tfrmrelpedidos = class(TForm)
    Relatorio: TRLReport;
    RLBand5: TRLBand;
    RLAngleLabel6: TRLAngleLabel;
    RLDraw2: TRLDraw;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand8: TRLBand;
    RLAngleLabel7: TRLAngleLabel;
    RLAngleLabel8: TRLAngleLabel;
    RLAngleLabel9: TRLAngleLabel;
    RLAngleLabel10: TRLAngleLabel;
    RLAngleLabel1: TRLAngleLabel;
    RLAngleLabel2: TRLAngleLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    qryrelpedidos: TZQuery;
    dtsrelpedidos: TDataSource;
    qryrelpedidospedidoid: TIntegerField;
    qryrelpedidosclienteid: TIntegerField;
    qryrelpedidosprodutoid: TIntegerField;
    qryrelpedidosquantidadetotal: TWideStringField;
    qryrelpedidosvalortotaldesconto: TFloatField;
    qryrelpedidosvalortotal: TFloatField;
    RLPDFFilter1: TRLPDFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelpedidos: Tfrmrelpedidos;

implementation

{$R *.dfm}

end.
