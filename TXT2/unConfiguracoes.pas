unit unConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, IniFiles;

type
  TfrmConfiguracoes = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    bConfirmar: TBitBtn;
    sbSelectDirectTX2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    edtDiretorioTX2: TEdit;
    GroupBox2: TGroupBox;
    edtDiretorioTXT: TEdit;
    sbSelectDirectTXT: TSpeedButton;
    procedure sbSelectDirectTX2Click(Sender: TObject);
    procedure bConfirmarClick(Sender: TObject);
    procedure sbSelectDirectTXTClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;
  _DirTXTTX2: TInifile;

implementation

{$R *.dfm}

function SelectADirectory(Title : string) : string;
var
  Pasta : String;
begin
  SelectDirectory(Title, '', Pasta);
  if (Trim(Pasta) <> '') then
  begin
    if (Pasta[Length(Pasta)] <> '\') then
      Pasta := Pasta + '\';
  end;
  Result := Pasta;
end;

procedure TfrmConfiguracoes.bConfirmarClick(Sender: TObject);
begin
  if (edtDiretorioTX2.Text<>'') then
  begin
    _DirTXTTX2 := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\ConfigTX2.ini');
    _DirTXTTX2.WriteString('Config', 'DirTX2', edtDiretorioTX2.Text);
    _DirTXTTX2.WriteString('Config', 'DirTXT', edtDiretorioTXT.Text);
    _DirTXTTX2.Free;
  end;
  Close;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  if (FileExists(ExtractFilePath(Application.ExeName)+'\ConfigTX2.ini')) then
  begin
    _DirTXTTX2 := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\ConfigTX2.ini');
    edtDiretorioTX2.Text := _DirTXTTX2.ReadString('Config', 'DirTX2', '');
    edtDiretorioTXT.Text := _DirTXTTX2.ReadString('Config', 'DirTXT', '');
    _DirTXTTX2.Free;
  end;
end;

procedure TfrmConfiguracoes.sbSelectDirectTX2Click(Sender: TObject);
begin
  edtDiretorioTX2.Text := SelectADirectory('Selecione a pasta dos arquivos TX2.');
end;

procedure TfrmConfiguracoes.sbSelectDirectTXTClick(Sender: TObject);
begin
  edtDiretorioTXT.Text := SelectADirectory('Selecione a pasta dos arquivos TXT.');
end;

end.

