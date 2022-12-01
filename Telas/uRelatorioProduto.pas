unit uRelatorioProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, udtmconexao;

type
  Tfrmrelatorioproduto = class(TForm)
    qryrelprodutos: TZQuery;
    dtsrelprodutos: TDataSource;
    Relatorio: TRLReport;
    RLBand1: TRLBand;
    RLAngleLabel1: TRLAngleLabel;
    RLBand2: TRLBand;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLAngleLabel2: TRLAngleLabel;
    RLAngleLabel3: TRLAngleLabel;
    RLAngleLabel4: TRLAngleLabel;
    RLAngleLabel5: TRLAngleLabel;
    RLDBText4: TRLDBText;
    RLDBResult1: TRLDBResult;
    qryrelprodutosprodutoid: TIntegerField;
    qryrelprodutosnome: TWideStringField;
    qryrelprodutosquantidade: TWideStringField;
    qryrelprodutosvalor: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelatorioproduto: Tfrmrelatorioproduto;

implementation

{$R *.dfm}

end.
