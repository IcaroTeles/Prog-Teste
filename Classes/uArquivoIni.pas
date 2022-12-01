unit uArquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     System.SysUtils,
     System.IniFiles,
     Vcl.Forms;

type
  TArquivoIni = class
  private



  public
    class function ArquivoIni:string; static;
    class procedure AtualizarIniBool(aSecao, aEntrada: String; aTipo: Boolean); static;
    class function LerIni(aSecao:String; aEntrada:String):String; static;
    class procedure AtualizarIni(aSecao, aEntrada, aValor: String); static;
    class function LerIniBool(aSecao, aEntrada: String; aFlag:boolean): Boolean; static;
end;

implementation

{ IniFile }

class function TArquivoIni.ArquivoIni: string;
begin
  result := ChangeFileExt( Application.ExeName, '.INI' );
end;

class function TArquivoIni.LerIni(aSecao:String; aEntrada:String):String;
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Result := Ini.ReadString( aSecao, aEntrada, 'NAO ENCONTRADO' );
  finally
    Ini.Free;
  end;
end;

class function TArquivoIni.LerIniBool(aSecao:String; aEntrada:String; aFlag:boolean):Boolean;
var
  Ini: TIniFile;
  Flag: Boolean;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Result := Ini.ReadBool( aSecao, aEntrada, Flag );
  finally
    Ini.Free;
  end;
end;


class procedure TArquivoIni.AtualizarIni(aSecao:String; aEntrada:String; aValor:String);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Ini.WriteString( aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

class procedure TArquivoIni.AtualizarIniBool(aSecao:String; aEntrada:String; aTipo:Boolean);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Ini.WriteBool( aSecao, aEntrada, aTipo);
  finally
    Ini.Free;
  end;
end;

end.
