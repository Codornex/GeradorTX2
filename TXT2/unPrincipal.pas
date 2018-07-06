unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.StdCtrls, Contnrs;

type
  TfrmPrincipal = class(TForm)
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UTS1000, UTS1005, UTS1020;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1000: TS1000;
  S1005: TS1005;
  S1020: TS1020;
begin
  if FileListBox1.FileName = EmptyStr then
  begin
    Application.MessageBox('Selecione um arquivo','',MB_ICONWARNING);
    Exit;
  end;
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FileListBox1.FileName);

  Memo1.Lines.Clear;
  S1000 := TS1000.Create;
  S1000.GetS1000(ArquivoTXT);
  S1005 := TS1005.Create;
  S1005.GetS1005(ArquivoTXT);
  S1020 := TS1020.Create;
  S1020.GetS1020(ArquivoTXT);
  for I := 0 to Pred(S1020.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1020');
    Memo1.Lines.Add('tpAmb_4 = ' + S1020.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1020.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1020.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1020.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1020.Items[I].nrInsc_9);
    Memo1.Lines.Add('codLotacao_13 = ' + S1020.Items[I].codLotacao_13);
    Memo1.Lines.Add('iniValid_14 = ' + S1020.Items[I].iniValid_14);
    Memo1.Lines.Add('fimValid_15 = ' + S1020.Items[I].fimValid_15);
    Memo1.Lines.Add('tpLotacao_17 = ' + S1020.Items[I].tpLotacao_17);
    Memo1.Lines.Add('fpas_21 = ' + S1020.Items[I].fpas_21);
    Memo1.Lines.Add('codTercs_22 = ' + S1020.Items[I].codTercs_22);
    Memo1.Lines.Add('SALVARS1020');
  end;
  // TESTE S1020
  {
  for I := 0 to Pred(S1005.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1005');
    Memo1.Lines.Add('tpAmb_4 = ' + S1005.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1005.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1005.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1005.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1005.Items[I].nrInsc_9);
    Memo1.Lines.Add('tpInsc_13 = ' + S1005.Items[I].tpInsc_13);
    Memo1.Lines.Add('nrInsc_14 = ' + S1005.Items[I].nrInsc_14);
    Memo1.Lines.Add('iniValid_15 = ' + S1005.Items[I].iniValid_15);
    Memo1.Lines.Add('fimValid_16 = ' + S1005.Items[I].fimValid_16);
    Memo1.Lines.Add('cnaePrep_18 = ' + S1005.Items[I].cnaePrep_18);
    Memo1.Lines.Add('aliqRat_20 = ' + S1005.Items[I].aliqRat_20);
    Memo1.Lines.Add('fap_21 = ' + S1005.Items[I].fap_21);
    Memo1.Lines.Add('aliqRatAjust_22 = ' + S1005.Items[I].aliqRatAjust_22);
    Memo1.Lines.Add('regPt_36 = ' + S1005.Items[I].regPt_36);
    Memo1.Lines.Add('contApr_38 = ' + S1005.Items[I].contApr_38);
    Memo1.Lines.Add('SALVARS1005');
  end;
  }
  { //TESTE S1000
  for I := 0 to Pred(S1000.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1000');
    Memo1.Lines.Add('tpAmb_4 = ' + S1000.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1000.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1000.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1000.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1000.Items[I].nrInsc_9);
    Memo1.Lines.Add('iniValid_13 = ' + S1000.Items[I].iniValid_13);
    Memo1.Lines.Add('fimValid_14 = ' + S1000.Items[I].fimValid_14);
    Memo1.Lines.Add('nmRazao_15 = ' + S1000.Items[I].nmRazao_15);
    Memo1.Lines.Add('classTrib_16 = ' + S1000.Items[I].classTrib_16);
    Memo1.Lines.Add('natJurid_17 = ' + S1000.Items[I].natJurid_17);
    Memo1.Lines.Add('indCoop_18 = ' + S1000.Items[I].indCoop_18);
    Memo1.Lines.Add('indConstr_19 = ' + S1000.Items[I].indConstr_19);
    Memo1.Lines.Add('indDesFolha_20 = ' + S1000.Items[I].indDesFolha_20);
    Memo1.Lines.Add('indOptRegEletron_21 = ' + S1000.Items[I].indOptRegEletron_21);
    Memo1.Lines.Add('indEntEd_23 = ' + S1000.Items[I].indEntEd_23);
    Memo1.Lines.Add('indEtt_24 = ' + S1000.Items[I].indEtt_24);
    Memo1.Lines.Add('nmCtt_36 = ' + S1000.Items[I].nmCtt_36);
    Memo1.Lines.Add('cpfCtt_37 = ' + S1000.Items[I].cpfCtt_37);
    Memo1.Lines.Add('foneFixo_38 = ' + S1000.Items[I].foneFixo_38);
    Memo1.Lines.Add('email_40 = ' + S1000.Items[I].email_40);
    Memo1.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
    Memo1.Lines.Add('cnpjSoftHouse_56 = '+ S1000.Items[I].cnpjSoftHouse_56);
    Memo1.Lines.Add('nmRazao_57 = ' + S1000.Items[I].nmRazao_57);
    Memo1.Lines.Add('nmCont_58 = ' + S1000.Items[I].nmCont_58);
    Memo1.Lines.Add('telefone_59 = ' + S1000.Items[I].telefone_59);
    Memo1.Lines.Add('email_60 = ' + S1000.Items[I].email_60);
    Memo1.Lines.Add('SALVARSOFTWAREHOUSE_55');
    Memo1.Lines.Add('indSitPJ_63 = ' + S1000.Items[I].indSitPJ_63);
    Memo1.Lines.Add('SALVARS1000');
  end;
  }
  {for I := 0 to Pred(ArquivoTXT.Count) do
    if Copy(ArquivoTXT[I],0,Pred(Pos('|',ArquivoTXT[I]))) = 'S1000'then
    begin
      ExtractStrings(['|'],[],PChar(ArquivoTXT[I]),Teste);
      for J := 0 to Pred(Teste.Count) do
        Memo1.Lines.Add(IntToStr(J)+': '+Teste[J]);
    end;}
end;

procedure TfrmPrincipal.FileListBox1DblClick(Sender: TObject);
begin
  Button1Click(Sender);
end;

end.
