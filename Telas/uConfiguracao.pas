unit uConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfrmconfiguracao = class(TForm)
    chkdescontos: TCheckBox;
    CheckBox1: TCheckBox;
    edtemail: TLabeledEdit;
    btnsalvaremail: TBitBtn;
    btnlimparemail: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfiguracao: Tfrmconfiguracao;

implementation

{$R *.dfm}

end.
