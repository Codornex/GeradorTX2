program ConvertTX2;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UTS1000 in 'UTS1000.pas',
  UTS1005 in 'UTS1005.pas',
  UTS1020 in 'UTS1020.pas',
  unConfiguracoes in 'unConfiguracoes.pas' {frmConfiguracoes},
  UTS1000ALT in 'UTS1000ALT.pas',
  unMain in 'unMain.pas' {frmMain},
  UTS2300 in 'UTS2300.pas',
  UTS2399 in 'UTS2399.pas',
  UTS2306 in 'UTS2306.pas',
  UTS2400 in 'UTS2400.pas',
  UTS3000 in 'UTS3000.pas',
  UTS5002 in 'UTS5002.pas',
  UTS5011 in 'UTS5011.pas',
  UTS5012 in 'UTS5012.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConfiguracoes, frmConfiguracoes);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
