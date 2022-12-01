unit uConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
   Vcl.ExtCtrls, uarquivoini;

type
  Tfrmconfiguracao = class(TForm)
    chkbandeja: TCheckBox;
    edtemail: TLabeledEdit;
    btnsalvaremail: TBitBtn;
    btnsair: TBitBtn;
    TrayIcon1: TTrayIcon;
    procedure btnsalvaremailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
  private
    procedure iconebandeja;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfiguracao: Tfrmconfiguracao;

implementation

{$R *.dfm}

procedure Tfrmconfiguracao.btnsairClick(Sender: TObject);
begin
close;
end;

procedure Tfrmconfiguracao.btnsalvaremailClick(Sender: TObject);
begin
  TArquivoIni.AtualizarIni('CONFIGURACAO', 'Email', edtemail.text);
  TArquivoIni.AtualizarIniBool('CONFIGURACAO', 'Bandeja', chkbandeja.Checked);
end;

procedure Tfrmconfiguracao.FormCreate(Sender: TObject);
begin
edtemail.text := Tarquivoini.LerIni('CONFIGURACAO', 'Email');
chkbandeja.Checked := Tarquivoini.LerIniBool('CONFIGURACAO', 'Bandeja',false);
iconebandeja;
end;

procedure Tfrmconfiguracao.iconebandeja;
begin
   if chkbandeja.Checked then
   begin
     TrayIcon1.visible :=true;
   end
   else
   begin
     trayicon1.visible := false;
   end;

end;

end.
