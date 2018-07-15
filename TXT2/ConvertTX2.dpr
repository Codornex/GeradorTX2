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
  unMain in 'unMain.pas' {frmMain};

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
