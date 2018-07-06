program ConvertTX2;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UTS1000 in 'UTS1000.pas',
  UTS1005 in 'UTS1005.pas',
  UTS1020 in 'UTS1020.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
