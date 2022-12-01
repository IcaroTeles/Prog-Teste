unit uSelecaoData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.Buttons, System.DateUtils;

type
  Tfrmselecionardata = class(TForm)
    edtdatainicio: TDateEdit;
    edtdatafinal: TDateEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmselecionardata: Tfrmselecionardata;

implementation

{$R *.dfm}

procedure Tfrmselecionardata.BitBtn1Click(Sender: TObject);
begin
if (edtdatafinal.Date) < (edtdatainicio.Date) then begin
    MessageDlg('Data Final não pode ser maior que a data inicio',mtInformation,[mbok],0);
    EdtDataFinal.SetFocus;
    abort;
  end;

  if (edtdatafinal.Date=0) OR (edtdatainicio.Date=0) then begin
    MessageDlg('Data Inicial ou Final são campo obrigatório',MtInformation,[mbok],0);
    EdtDataInicio.SetFocus;
    abort;
  end;
Close;
end;

procedure Tfrmselecionardata.FormShow(Sender: TObject);
begin
 edtdatainicio.Date := StartOfTheMonth(Date);
 edtdatafinal.Date  := EndOfTheMonth(Date);
end;

end.
