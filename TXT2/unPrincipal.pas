unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.StdCtrls, Contnrs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, IniFiles;

type
  TfrmPrincipal = class(TForm)
    memoTX2: TMemo;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    Panel4: TPanel;
    FLBOrigem: TFileListBox;
    Label1: TLabel;
    RGArqTX2: TRadioGroup;
    Panel2: TPanel;
    sbConfiguracao: TSpeedButton;
    sbGeraTx2: TSpeedButton;
    RGTipoTX2: TRadioGroup;
    procedure GeraTX2S1000;
    procedure GeraTX2S1000ALT;
    procedure GeraTX2S1005;
    procedure GeraTX2S1005ALT;
    procedure GeraTX2S1010;
    procedure GeraTX2S1010ALT;
    procedure GeraTX2S1020;
    procedure GeraTX2S1020ALT;
    procedure GeraTX2S1030;
    procedure GeraTX2S1030ALT;
    procedure GeraTX2S1050;
    procedure GeraTX2S1050ALT;
    procedure GeraTX2S2190;
    procedure GeraTX2S2190ALT;
    procedure GeraTX2S2200;
    procedure GeraTX2S2200ALT;
    procedure GeraTX2S2205;
    procedure GeraTX2S2250;
    procedure GeraTX2S2299;
    procedure sbGeraTx2Click(Sender: TObject);
    procedure sbConfiguracaoClick(Sender: TObject);
    procedure ConfiracoesIniciais;
    procedure RGArqTX2Click(Sender: TObject);
    procedure SaveTX2(aNameTX2: String);
    procedure CalcModValue(iDividendo, iDivisor, iQuociente, iResto: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  sDirTX2: String;

implementation

{$R *.dfm}

uses UTS1000, UTS1000ALT, UTS1005, UTS1005ALT, UTS1010, UTS1010ALT, UTS1020, UTS1020ALT,
     UTS1030, UTS1030ALT, UTS1050, UTS1050ALT, UTS2190, UTS2190ALT, UTS2200, UTS2200ALT,
     UTS2205, UTS2250, UTS2299, unConfiguracoes, unMain;

procedure TfrmPrincipal.sbConfiguracaoClick(Sender: TObject);
begin
  frmConfiguracoes := TfrmConfiguracoes.Create(frmConfiguracoes);
  frmConfiguracoes.ShowModal;
  FreeAndNil(frmConfiguracoes);
end;

procedure TfrmPrincipal.sbGeraTx2Click(Sender: TObject);
begin
  if FLBOrigem.FileName = EmptyStr then
  begin
    Application.MessageBox('Selecione um arquivo','Atenção',MB_ICONWARNING);
  end else
  begin
    frmPrincipal.Enabled := False;
    case RGArqTX2.ItemIndex of
      0: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1000 else
             GeraTX2S1000ALT;
         end;
      1: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1005 else
             GeraTX2S1005ALT;
         end;
      2: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1010 else
             GeraTX2S1010ALT;
         end;
      3: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1020 else
             GeraTX2S1020ALT;
         end;
      4: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1030 else
             GeraTX2S1030ALT;
         end;
      5: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1050 else
             GeraTX2S1050ALT;
         end;
      6: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2190 else
             Application.MessageBox('Não existe arquivo de alteralçao.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
      7: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2200 else
             Application.MessageBox('Não existe arquivo de alteralçao.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
      8: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2205 else
             Application.MessageBox('Não existe arquivo de alteralçao.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
      9: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2250 else
             Application.MessageBox('Não existe arquivo de alteralçao.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     10: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2299 else
             Application.MessageBox('Não existe arquivo de alteralçao.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
    end;
    frmPrincipal.Enabled := True;
  end;
end;

procedure TfrmPrincipal.CalcModValue(iDividendo, iDivisor, iQuociente,
  iResto: Integer);
begin
  iDividendo := 17;
  iDivisor := 2;
  iQuociente := iDividendo div iDivisor;
  iResto := iDividendo mod iDivisor;
end;

procedure TfrmPrincipal.ConfiracoesIniciais;
begin
  if (FileExists(ExtractFilePath(Application.ExeName)+'\ConfigTX2.ini')) then
  begin
    _DirTX2 := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\ConfigTX2.ini');
    sDirTX2 := _DirTX2.ReadString('Config', 'DirTX2', '');
    _DirTX2.Free;
  end;
end;

procedure TfrmPrincipal.GeraTX2S1000;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1000: TS1000;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1000 := TS1000.Create;
  S1000.GetS1000(ArquivoTXT);
  for I := 0 to Pred(S1000.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1000');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1000.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1000.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1000.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1000.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1000.Items[I].nrInsc_9);
    memoTX2.Lines.Add('iniValid_13 = ' + S1000.Items[I].iniValid_13);
    memoTX2.Lines.Add('fimValid_14 = ' + S1000.Items[I].fimValid_14);
    memoTX2.Lines.Add('nmRazao_15 = ' + S1000.Items[I].nmRazao_15);
    memoTX2.Lines.Add('classTrib_16 = ' + S1000.Items[I].classTrib_16);
    memoTX2.Lines.Add('natJurid_17 = ' + S1000.Items[I].natJurid_17);
    memoTX2.Lines.Add('indCoop_18 = ' + S1000.Items[I].indCoop_18);
    memoTX2.Lines.Add('indConstr_19 = ' + S1000.Items[I].indConstr_19);
    memoTX2.Lines.Add('indDesFolha_20 = ' + S1000.Items[I].indDesFolha_20);
    memoTX2.Lines.Add('indOptRegEletron_21 = ' + S1000.Items[I].indOptRegEletron_21);
    memoTX2.Lines.Add('indEntEd_23 = ' + S1000.Items[I].indEntEd_23);
    memoTX2.Lines.Add('indEtt_24 = ' + S1000.Items[I].indEtt_24);
    memoTX2.Lines.Add('nmCtt_36 = ' + S1000.Items[I].nmCtt_36);
    memoTX2.Lines.Add('cpfCtt_37 = ' + S1000.Items[I].cpfCtt_37);
    memoTX2.Lines.Add('foneFixo_38 = ' + S1000.Items[I].foneFixo_38);
    memoTX2.Lines.Add('email_40 = ' + S1000.Items[I].email_40);
    memoTX2.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('cnpjSoftHouse_56 = '+ S1000.Items[I].cnpjSoftHouse_56);
    memoTX2.Lines.Add('nmRazao_57 = ' + S1000.Items[I].nmRazao_57);
    memoTX2.Lines.Add('nmCont_58 = ' + S1000.Items[I].nmCont_58);
    memoTX2.Lines.Add('telefone_59 = ' + S1000.Items[I].telefone_59);
    memoTX2.Lines.Add('email_60 = ' + S1000.Items[I].email_60);
    memoTX2.Lines.Add('SALVARSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('indSitPJ_63 = ' + S1000.Items[I].indSitPJ_63);
    memoTX2.Lines.Add('SALVARS1000');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1000ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1000ALT: TS1000ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1000ALT := TS1000ALT.Create;
  S1000ALT.GetS1000ALT(ArquivoTXT);
  for I := 0 to Pred(S1000ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1000');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1000ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1000ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1000ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1000ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1000ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('iniValid_13 = ' + S1000ALT.Items[I].iniValid_13);
    memoTX2.Lines.Add('fimValid_14 = ' + S1000ALT.Items[I].fimValid_14);
    memoTX2.Lines.Add('nmRazao_15 = ' + S1000ALT.Items[I].nmRazao_15);
    memoTX2.Lines.Add('classTrib_16 = ' + S1000ALT.Items[I].classTrib_16);
    memoTX2.Lines.Add('natJurid_17 = ' + S1000ALT.Items[I].natJurid_17);
    memoTX2.Lines.Add('indCoop_18 = ' + S1000ALT.Items[I].indCoop_18);
    memoTX2.Lines.Add('indConstr_19 = ' + S1000ALT.Items[I].indConstr_19);
    memoTX2.Lines.Add('indDesFolha_20 = ' + S1000ALT.Items[I].indDesFolha_20);
    memoTX2.Lines.Add('indOptRegEletron_21 = ' + S1000ALT.Items[I].indOptRegEletron_21);
    memoTX2.Lines.Add('indEntEd_23 = ' + S1000ALT.Items[I].indEntEd_23);
    memoTX2.Lines.Add('indEtt_24 = ' + S1000ALT.Items[I].indEtt_24);
    memoTX2.Lines.Add('nrRegEtt_25 = ' + S1000ALT.Items[I].nrRegEtt_25);
    memoTX2.Lines.Add('ideMinLei_27 = ' + S1000ALT.Items[I].ideMinLei_27);
    memoTX2.Lines.Add('nrCertif_28 = ' + S1000ALT.Items[I].nrCertif_28);
    memoTX2.Lines.Add('dtEmisCertif_29 = ' + S1000ALT.Items[I].dtEmisCertif_29);
    memoTX2.Lines.Add('dtVencCertif_30 = ' + S1000ALT.Items[I].dtVencCertif_30);
    memoTX2.Lines.Add('nrProtRenov_31 = ' + S1000ALT.Items[I].nrProtRenov_31);
    memoTX2.Lines.Add('dtProtRenov_32 = ' + S1000ALT.Items[I].dtProtRenov_32);
    memoTX2.Lines.Add('dtDou_33 = ' + S1000ALT.Items[I].dtDou_33);
    memoTX2.Lines.Add('pagDou_34 = ' + S1000ALT.Items[I].pagDou_34);
    memoTX2.Lines.Add('nmCtt_36 = ' + S1000ALT.Items[I].nmCtt_36);
    memoTX2.Lines.Add('cpfCtt_37 = ' + S1000ALT.Items[I].cpfCtt_37);
    memoTX2.Lines.Add('foneFixo_38 = ' + S1000ALT.Items[I].foneFixo_38);
    memoTX2.Lines.Add('foneCel_39 = ' + S1000ALT.Items[I].foneCel_39);
    memoTX2.Lines.Add('email_40 = ' + S1000ALT.Items[I].email_40);
    memoTX2.Lines.Add('nrSiafi_42 = ' + S1000ALT.Items[I].nrSiafi_42);
    memoTX2.Lines.Add('ideEFR_44 = ' + S1000ALT.Items[I].ideEFR_44);
    memoTX2.Lines.Add('cnpjEFR_45 = ' + S1000ALT.Items[I].cnpjEFR_45);
    memoTX2.Lines.Add('nmEnte_47 = ' + S1000ALT.Items[I].nmEnte_47);
    memoTX2.Lines.Add('uf_48 = ' + S1000ALT.Items[I].uf_48);
    memoTX2.Lines.Add('codMunic_49 = ' + S1000ALT.Items[I].codMunic_49);
    memoTX2.Lines.Add('indRPPS_50 = ' + S1000ALT.Items[I].indRPPS_50);
    memoTX2.Lines.Add('subteto_51 = ' + S1000ALT.Items[I].subteto_51);
    memoTX2.Lines.Add('vrSubteto_52 = ' + S1000ALT.Items[I].vrSubteto_52);
    memoTX2.Lines.Add('indAcordoIsenMulta_54 = ' + S1000ALT.Items[I].indAcordoIsenMulta_54);
    memoTX2.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('cnpjSoftHouse_56 = '+ S1000ALT.Items[I].cnpjSoftHouse_56);
    memoTX2.Lines.Add('nmRazao_57 = ' + S1000ALT.Items[I].nmRazao_57);
    memoTX2.Lines.Add('nmCont_58 = ' + S1000ALT.Items[I].nmCont_58);
    memoTX2.Lines.Add('telefone_59 = ' + S1000ALT.Items[I].telefone_59);
    memoTX2.Lines.Add('email_60 = ' + S1000ALT.Items[I].email_60);
    memoTX2.Lines.Add('SALVARSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('indSitPJ_63 = ' + S1000ALT.Items[I].indSitPJ_63);
    memoTX2.Lines.Add('indSitPF_65 = ' + S1000ALT.Items[I].indSitPF_65);
    memoTX2.Lines.Add('iniValid_66 = ' + S1000ALT.Items[I].iniValid_66);
    memoTX2.Lines.Add('fimValid_67 = ' + S1000ALT.Items[I].fimValid_67);
    memoTX2.Lines.Add('SALVARS1000');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1005;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1005: TS1005;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1005 := TS1005.Create;
  S1005.GetS1005(ArquivoTXT);
  for I := 0 to Pred(S1005.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1005');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1005.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1005.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1005.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1005.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1005.Items[I].nrInsc_9);
    memoTX2.Lines.Add('tpInsc_13 = ' + S1005.Items[I].tpInsc_13);
    memoTX2.Lines.Add('nrInsc_14 = ' + S1005.Items[I].nrInsc_14);
    memoTX2.Lines.Add('iniValid_15 = ' + S1005.Items[I].iniValid_15);
    memoTX2.Lines.Add('fimValid_16 = ' + S1005.Items[I].fimValid_16);
    memoTX2.Lines.Add('cnaePrep_18 = ' + S1005.Items[I].cnaePrep_18);
    memoTX2.Lines.Add('aliqRat_20 = ' + S1005.Items[I].aliqRat_20);
    memoTX2.Lines.Add('fap_21 = ' + S1005.Items[I].fap_21);
    memoTX2.Lines.Add('aliqRatAjust_22 = ' + S1005.Items[I].aliqRatAjust_22);
    memoTX2.Lines.Add('regPt_36 = ' + S1005.Items[I].regPt_36);
    memoTX2.Lines.Add('contApr_38 = ' + S1005.Items[I].contApr_38);
    memoTX2.Lines.Add('SALVARS1005');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1005ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1005ALT: TS1005ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1005ALT := TS1005ALT.Create;
  S1005ALT.GetS1005ALT(ArquivoTXT);
  for I := 0 to Pred(S1005ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1005');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1005ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1005ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1005ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1005ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1005ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('tpInsc_13 = ' + S1005ALT.Items[I].tpInsc_13);
    memoTX2.Lines.Add('nrInsc_14 = ' + S1005ALT.Items[I].nrInsc_14);
    memoTX2.Lines.Add('iniValid_15 = ' + S1005ALT.Items[I].iniValid_15);
    memoTX2.Lines.Add('fimValid_16 = ' + S1005ALT.Items[I].fimValid_16);
    memoTX2.Lines.Add('cnaePrep_18 = ' + S1005ALT.Items[I].cnaePrep_18);
    memoTX2.Lines.Add('aliqRat_20 = ' + S1005ALT.Items[I].aliqRat_20);
    memoTX2.Lines.Add('fap_21 = ' + S1005ALT.Items[I].fap_21);
    memoTX2.Lines.Add('aliqRatAjust_22 = ' + S1005ALT.Items[I].aliqRatAjust_22);
    memoTX2.Lines.Add('tpProc_24 = ' + S1005ALT.Items[I].tpProc_24);
    memoTX2.Lines.Add('nrProc_25 = ' + S1005ALT.Items[I].nrProc_25);
    memoTX2.Lines.Add('codSusp_26 = ' + S1005ALT.Items[I].codSusp_26);
    memoTX2.Lines.Add('tpProc_28 = ' + S1005ALT.Items[I].tpProc_28);
    memoTX2.Lines.Add('nrProc_29 = ' + S1005ALT.Items[I].nrProc_29);
    memoTX2.Lines.Add('codSusp_30 = ' + S1005ALT.Items[I].codSusp_30);
    memoTX2.Lines.Add('tpCaepf_32 = ' + S1005ALT.Items[I].tpCaepf_32);
    memoTX2.Lines.Add('indSubstPatrObra_34 = ' + S1005ALT.Items[I].indSubstPatrObra_34);
    memoTX2.Lines.Add('regPt_36 = ' + S1005ALT.Items[I].regPt_36);
    memoTX2.Lines.Add('contApr_38 = ' + S1005ALT.Items[I].contApr_38);
    memoTX2.Lines.Add('nrProcJud_39 = ' + S1005ALT.Items[I].nrProcJud_39);
    memoTX2.Lines.Add('contEntEd_40 = ' + S1005ALT.Items[I].contEntEd_40);
    memoTX2.Lines.Add('INCLUIRINFOENTEDUC_41');
    memoTX2.Lines.Add('nrInsc_42 = ' + S1005ALT.Items[I].nrInsc_42);
    memoTX2.Lines.Add('SALVARINFOENTEDUC_41');
    memoTX2.Lines.Add('contPCD_44 = ' + S1005ALT.Items[I].contPCD_44);
    memoTX2.Lines.Add('nrProcJud_45 = ' + S1005ALT.Items[I].nrProcJud_45);
    memoTX2.Lines.Add('iniValid_46 = ' + S1005ALT.Items[I].iniValid_46);
    memoTX2.Lines.Add('fimValid_47 = ' + S1005ALT.Items[I].fimValid_47);
    memoTX2.Lines.Add('SALVARS1005');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1010;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J,iCount: Integer;
  S1010: TS1010;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1010 := TS1010.Create;
  S1010.GetS1010(ArquivoTXT);
  for I := 0 to Pred(S1010.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1010');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1010.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1010.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1010.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1010.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1010.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codRubr_13 = ' + S1010.Items[I].codRubr_13);
    memoTX2.Lines.Add('ideTabRubr_14 = ' + S1010.Items[I].ideTabRubr_14);
    memoTX2.Lines.Add('iniValid_15 = ' + S1010.Items[I].iniValid_15);
    memoTX2.Lines.Add('fimValid_16 = ' + S1010.Items[I].fimValid_16);
    memoTX2.Lines.Add('dscRubr_18 = ' + S1010.Items[I].dscRubr_18);
    memoTX2.Lines.Add('natRubr_19 = ' + S1010.Items[I].natRubr_19);
    memoTX2.Lines.Add('tpRubr_20 = ' + S1010.Items[I].tpRubr_20);
    memoTX2.Lines.Add('codIncCP_21 = ' + S1010.Items[I].codIncCP_21);
    memoTX2.Lines.Add('codIncIRRF_22 = ' + S1010.Items[I].codIncIRRF_22);
    memoTX2.Lines.Add('codIncFGTS_23 = ' + S1010.Items[I].codIncFGTS_23);
    memoTX2.Lines.Add('codIncSIND_24 = ' + S1010.Items[I].codIncSIND_24);
    memoTX2.Lines.Add('observacao_29 = ' + S1010.Items[I].observacao_29);
    memoTX2.Lines.Add('SALVARS1010');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1010ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J,iCount: Integer;
  S1010ALT: TS1010ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1010ALT := TS1010ALT.Create;
  S1010ALT.GetS1010ALT(ArquivoTXT);
  for I := 0 to Pred(S1010ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1010');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1010ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1010ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1010ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1010ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1010ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codRubr_13 = ' + S1010ALT.Items[I].codRubr_13);
    memoTX2.Lines.Add('ideTabRubr_14 = ' + S1010ALT.Items[I].ideTabRubr_14);
    memoTX2.Lines.Add('iniValid_15 = ' + S1010ALT.Items[I].iniValid_15);
    memoTX2.Lines.Add('fimValid_16 = ' + S1010ALT.Items[I].fimValid_16);
    memoTX2.Lines.Add('dscRubr_18 = ' + S1010ALT.Items[I].dscRubr_18);
    memoTX2.Lines.Add('natRubr_19 = ' + S1010ALT.Items[I].natRubr_19);
    memoTX2.Lines.Add('tpRubr_20 = ' + S1010ALT.Items[I].tpRubr_20);
    memoTX2.Lines.Add('codIncCP_21 = ' + S1010ALT.Items[I].codIncCP_21);
    memoTX2.Lines.Add('codIncIRRF_22 = ' + S1010ALT.Items[I].codIncIRRF_22);
    memoTX2.Lines.Add('codIncFGTS_23 = ' + S1010ALT.Items[I].codIncFGTS_23);
    memoTX2.Lines.Add('codIncSIND_24 = ' + S1010ALT.Items[I].codIncSIND_24);
    memoTX2.Lines.Add('observacao_29 = ' + S1010ALT.Items[I].observacao_29);
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOCP_30');
    memoTX2.Lines.Add('tpProc_31 = ' + S1010ALT.Items[I].tpProc_31);
    memoTX2.Lines.Add('nrProc_32 = ' + S1010ALT.Items[I].nrProc_32);
    memoTX2.Lines.Add('extDecisao_33 = ' + S1010ALT.Items[I].extDecisao_33);
    memoTX2.Lines.Add('codSusp_34 = ' + S1010ALT.Items[I].codSusp_34);
    memoTX2.Lines.Add('SALVARIDEPROCESSOCP_30');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOIRRF_35');
    memoTX2.Lines.Add('nrProc_36 = ' + S1010ALT.Items[I].nrProc_36);
    memoTX2.Lines.Add('codSusp_37 = ' + S1010ALT.Items[I].codSusp_37);
    memoTX2.Lines.Add('SALVARIDEPROCESSOIRRF_35');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOFGTS_38');
    memoTX2.Lines.Add('nrProc_39 = ' + S1010ALT.Items[I].nrProc_39);
    memoTX2.Lines.Add('SALVARIDEPROCESSOFGTS_38');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOSIND_41');
    memoTX2.Lines.Add('nrProc_42 = ' + S1010ALT.Items[I].nrProc_42);
    memoTX2.Lines.Add('SALVARIDEPROCESSOSIND_41');
    memoTX2.Lines.Add('iniValid_44 = ' + S1010ALT.Items[I].iniValid_44);
    memoTX2.Lines.Add('fimValid_45 = ' + S1010ALT.Items[I].fimValid_45);
    memoTX2.Lines.Add('SALVARS1010');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1020;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1020: TS1020;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1020 := TS1020.Create;
  S1020.GetS1020(ArquivoTXT);
  for I := 0 to Pred(S1020.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1020');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1020.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1020.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1020.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1020.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1020.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codLotacao_13 = ' + S1020.Items[I].codLotacao_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1020.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1020.Items[I].fimValid_15);
    memoTX2.Lines.Add('tpLotacao_17 = ' + S1020.Items[I].tpLotacao_17);
    memoTX2.Lines.Add('fpas_21 = ' + S1020.Items[I].fpas_21);
    memoTX2.Lines.Add('codTercs_22 = ' + S1020.Items[I].codTercs_22);
    memoTX2.Lines.Add('SALVARS1020');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1020ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1020ALT: TS1020ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1020ALT := TS1020ALT.Create;
  S1020ALT.GetS1020ALT(ArquivoTXT);
  for I := 0 to Pred(S1020ALT.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1020ALT');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1020ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1020ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1020ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1020ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1020ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codLotacao_13 = ' + S1020ALT.Items[I].codLotacao_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1020ALT.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1020ALT.Items[I].fimValid_15);
    memoTX2.Lines.Add('tpLotacao_17 = ' + S1020ALT.Items[I].tpLotacao_17);
    memoTX2.Lines.Add('tpInsc_18 = ' + S1020ALT.Items[I].tpLotacao_17);
    memoTX2.Lines.Add('nrInsc_19 = ' + S1020ALT.Items[I].tpLotacao_17);
    memoTX2.Lines.Add('fpas_21 = ' + S1020ALT.Items[I].fpas_21);
    memoTX2.Lines.Add('codTercs_22 = ' + S1020ALT.Items[I].codTercs_22);
    memoTX2.Lines.Add('codTercsSusp_23 = ' + S1020ALT.Items[I].codTercsSusp_23);
    memoTX2.Lines.Add('tpInscContrat_30 = ' + S1020ALT.Items[I].tpInscContrat_30);
    memoTX2.Lines.Add('nrInscContrat_31 = ' + S1020ALT.Items[I].nrInscContrat_31);
    memoTX2.Lines.Add('tpInscProp_32 = ' + S1020ALT.Items[I].tpInscProp_32);
    memoTX2.Lines.Add('nrInscProp_33 = ' + S1020ALT.Items[I].nrInscProp_33);
    memoTX2.Lines.Add('INCLUIRPROCJUDTERCEIRO_25');
    memoTX2.Lines.Add('codTerc_26 = ' + S1020ALT.Items[I].codTerc_26);
    memoTX2.Lines.Add('nrProcJud_27 = ' + S1020ALT.Items[I].nrProcJud_27);
    memoTX2.Lines.Add('codSusp_28 = ' + S1020ALT.Items[I].codSusp_28);
    memoTX2.Lines.Add('SALVARPROCJUDTERCEIRO_25');
    memoTX2.Lines.Add('iniValid_34 = ' + S1020ALT.Items[I].iniValid_34);
    memoTX2.Lines.Add('fimValid_35 = ' + S1020ALT.Items[I].fimValid_35);
    memoTX2.Lines.Add('SALVARS1020ALT');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1030;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1030: TS1030;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1030 := TS1030.Create;
  S1030.GetS1030(ArquivoTXT);
  for I := 0 to Pred(S1030.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1030');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1030.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1030.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1030.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1030.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1030.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codCargo_13 = ' + S1030.Items[I].codCargo_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1030.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1030.Items[I].fimValid_15);
    memoTX2.Lines.Add('nmCargo_17 = ' + S1030.Items[I].nmCargo_17);
    memoTX2.Lines.Add('codCBO_18 = ' + S1030.Items[I].codCBO_18);
    memoTX2.Lines.Add('SALVARS1030');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1030ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1030ALT: TS1030ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1030ALT := TS1030ALT.Create;
  S1030ALT.GetS1030ALT(ArquivoTXT);
  for I := 0 to Pred(S1030ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1030');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1030ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1030ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1030ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1030ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1030ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codCargo_13 = ' + S1030ALT.Items[I].codCargo_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1030ALT.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1030ALT.Items[I].fimValid_15);
    memoTX2.Lines.Add('nmCargo_17 = ' + S1030ALT.Items[I].nmCargo_17);
    memoTX2.Lines.Add('codCBO_18 = ' + S1030ALT.Items[I].codCBO_18);
    memoTX2.Lines.Add('acumCargo_20 = ' + S1030ALT.Items[I].acumCargo_20);
    memoTX2.Lines.Add('contagemEsp_21 = ' + S1030ALT.Items[I].contagemEsp_21);
    memoTX2.Lines.Add('dedicExcl_22 = ' + S1030ALT.Items[I].dedicExcl_22);
    memoTX2.Lines.Add('nrLei_24 = ' + S1030ALT.Items[I].nrLei_24);
    memoTX2.Lines.Add('dtLei_25 = ' + S1030ALT.Items[I].dtLei_25);
    memoTX2.Lines.Add('sitCargo_26 = ' + S1030ALT.Items[I].sitCargo_26);
    memoTX2.Lines.Add('iniValid_27 = ' + S1030ALT.Items[I].iniValid_27);
    memoTX2.Lines.Add('fimValid_28 = ' + S1030ALT.Items[I].fimValid_28);
    memoTX2.Lines.Add('SALVARS1030');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1050;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1050: TS1050;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1050 := TS1050.Create;
  S1050.GetS1050(ArquivoTXT);
  for I := 0 to Pred(S1050.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1050');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1050.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1050.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1050.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1050.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1050.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codHorContrat_13 = ' + S1050.Items[I].codHorContrat_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1050.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1050.Items[I].fimValid_15);
    memoTX2.Lines.Add('hrEntr_17 = ' + S1050.Items[I].hrEntr_17);
    memoTX2.Lines.Add('hrSaida_18 = ' + S1050.Items[I].hrSaida_18);
    memoTX2.Lines.Add('durJornada_19 = ' + S1050.Items[I].durJornada_19);
    memoTX2.Lines.Add('perHorFlexivel_20 = ' + S1050.Items[I].perHorFlexivel_20);
    memoTX2.Lines.Add('INCLUIRHORARIOINTERVALO_21');
    memoTX2.Lines.Add('tpInterv_22 = ' + S1050.Items[I].tpInterv_22);
    memoTX2.Lines.Add('durInterv_23 = ' + S1050.Items[I].durInterv_23);
    memoTX2.Lines.Add('iniInterv_24 = ' + S1050.Items[I].iniInterv_24);
    memoTX2.Lines.Add('termInterv_25 = ' + S1050.Items[I].termInterv_25);
    memoTX2.Lines.Add('SALVARHORARIOINTERVALO_21');
    memoTX2.Lines.Add('SALVARS1050');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1050ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1050ALT: TS1050ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1050ALT := TS1050ALT.Create;
  S1050ALT.GetS1050ALT(ArquivoTXT);
  for I := 0 to Pred(S1050ALT.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1050');
    memoTX2.Lines.Add('tpAmb_4 = ' + S1050ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S1050ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S1050ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S1050ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S1050ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('codHorContrat_13 = ' + S1050ALT.Items[I].codHorContrat_13);
    memoTX2.Lines.Add('iniValid_14 = ' + S1050ALT.Items[I].iniValid_14);
    memoTX2.Lines.Add('fimValid_15 = ' + S1050ALT.Items[I].fimValid_15);
    memoTX2.Lines.Add('hrEntr_17 = ' + S1050ALT.Items[I].hrEntr_17);
    memoTX2.Lines.Add('hrSaida_18 = ' + S1050ALT.Items[I].hrSaida_18);
    memoTX2.Lines.Add('durJornada_19 = ' + S1050ALT.Items[I].durJornada_19);
    memoTX2.Lines.Add('perHorFlexivel_20 = ' + S1050ALT.Items[I].perHorFlexivel_20);
    memoTX2.Lines.Add('INCLUIRHORARIOINTERVALO_21');
    memoTX2.Lines.Add('tpInterv_22 = ' + S1050ALT.Items[I].tpInterv_22);
    memoTX2.Lines.Add('durInterv_23 = ' + S1050ALT.Items[I].durInterv_23);
    memoTX2.Lines.Add('iniInterv_24 = ' + S1050ALT.Items[I].iniInterv_24);
    memoTX2.Lines.Add('termInterv_25 = ' + S1050ALT.Items[I].termInterv_25);
    memoTX2.Lines.Add('SALVARHORARIOINTERVALO_21');
    memoTX2.Lines.Add('iniValid_26 = ' + S1050ALT.Items[I].iniValid_26);
    memoTX2.Lines.Add('fimValid_27 = ' + S1050ALT.Items[I].iniValid_26);
    memoTX2.Lines.Add('SALVARS1050');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2190;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2190: TS2190;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2190 := TS2190.Create;
  S2190.GetS2190(ArquivoTXT);
  for I := 0 to Pred(S2190.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2190');
    memoTX2.Lines.Add('tpAmb_4 = ' + S2190.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S2190.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S2190.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S2190.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S2190.Items[I].nrInsc_9);
    memoTX2.Lines.Add('cpfTrab_11 = ' + S2190.Items[I].cpfTrab_11);
    memoTX2.Lines.Add('dtNascto_12 = ' + S2190.Items[I].dtNascto_12);
    memoTX2.Lines.Add('dtAdm_13 = ' + S2190.Items[I].dtAdm_13);
    memoTX2.Lines.Add('SALVARS2190');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2190ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2190ALT: TS2190ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2190ALT := TS2190ALT.Create;
  S2190ALT.GetS2190ALT(ArquivoTXT);
  for I := 0 to Pred(S2190ALT.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2190');
    memoTX2.Lines.Add('tpAmb_4 = ' + S2190ALT.Items[I].tpAmb_4);
    memoTX2.Lines.Add('procEmi_5 = ' + S2190ALT.Items[I].procEmi_5);
    memoTX2.Lines.Add('verProc_6 = ' + S2190ALT.Items[I].verProc_6);
    memoTX2.Lines.Add('tpInsc_8 = ' + S2190ALT.Items[I].tpInsc_8);
    memoTX2.Lines.Add('nrInsc_9 = ' + S2190ALT.Items[I].nrInsc_9);
    memoTX2.Lines.Add('cpfTrab_11 = ' + S2190ALT.Items[I].cpfTrab_11);
    memoTX2.Lines.Add('dtNascto_12 = ' + S2190ALT.Items[I].dtNascto_12);
    memoTX2.Lines.Add('dtAdm_13 = ' + S2190ALT.Items[I].dtAdm_13);
    memoTX2.Lines.Add('SALVARS2190');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2200;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2200: TS2200;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2200 := TS2200.Create;
  S2200.GetS2200(ArquivoTXT);
  for I := 0 to Pred(S2200.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2200');
    memoTX2.Lines.Add('indRetif_4= ' + S2200.Items[I].indRetif_4);
    memoTX2.Lines.Add('tpAmb_6= ' + S2200.Items[I].tpAmb_6);
    memoTX2.Lines.Add('procEmi_7= ' + S2200.Items[I].procEmi_7);
    memoTX2.Lines.Add('verProc_8= ' + S2200.Items[I].verProc_8);
    memoTX2.Lines.Add('tpInsc_10= ' + S2200.Items[I].tpInsc_10);
    memoTX2.Lines.Add('nrInsc_11= ' + S2200.Items[I].nrInsc_11);
    memoTX2.Lines.Add('cpfTrab_13= ' + S2200.Items[I].cpfTrab_13);
    memoTX2.Lines.Add('nisTrab_14= ' + S2200.Items[I].nisTrab_14);
    memoTX2.Lines.Add('nmTrab_15= ' + S2200.Items[I].nmTrab_15);
    memoTX2.Lines.Add('sexo_16= ' + S2200.Items[I].sexo_16);
    memoTX2.Lines.Add('racaCor_17= ' + S2200.Items[I].racaCor_17);
    memoTX2.Lines.Add('estCiv_18= ' + S2200.Items[I].estCiv_18);
    memoTX2.Lines.Add('grauInstr_19= ' + S2200.Items[I].grauInstr_19);
    memoTX2.Lines.Add('indPriEmpr_20= ' + S2200.Items[I].indPriEmpr_20);
    memoTX2.Lines.Add('dtNascto_23= ' + S2200.Items[I].dtNascto_23);
    memoTX2.Lines.Add('codMunic_24= ' + S2200.Items[I].codMunic_24);
    memoTX2.Lines.Add('uf_25= ' + S2200.Items[I].uf_25);
    memoTX2.Lines.Add('paisNascto_26= ' + S2200.Items[I].paisNascto_26);
    memoTX2.Lines.Add('paisNac_27= ' + S2200.Items[I].paisNac_27);
    memoTX2.Lines.Add('nmMae_28= ' + S2200.Items[I].nmMae_28);
    memoTX2.Lines.Add('nmPai_29= ' + S2200.Items[I].nmPai_29);
    memoTX2.Lines.Add('nrCtps_32= ' + S2200.Items[I].nrCtps_32);
    memoTX2.Lines.Add('serieCtps_33= ' + S2200.Items[I].serieCtps_33);
    memoTX2.Lines.Add('ufCtps_34= ' + S2200.Items[I].ufCtps_34);
    memoTX2.Lines.Add('nrRg_40= ' + S2200.Items[I].nrRg_40);
    memoTX2.Lines.Add('orgaoEmissor_41= ' + S2200.Items[I].orgaoEmissor_41);
    memoTX2.Lines.Add('dtExped_42= ' + S2200.Items[I].dtExped_42);
    memoTX2.Lines.Add('nrRegCnh_53= ' + S2200.Items[I].nrRegCnh_53);
    memoTX2.Lines.Add('dtExped_54= ' + S2200.Items[I].dtExped_54);
    memoTX2.Lines.Add('ufCnh_55= ' + S2200.Items[I].ufCnh_55);
    memoTX2.Lines.Add('dtValid_56= ' + S2200.Items[I].dtValid_56);
    memoTX2.Lines.Add('dtPriHab_57= ' + S2200.Items[I].dtPriHab_57);
    memoTX2.Lines.Add('categoriaCnh_58= ' + S2200.Items[I].categoriaCnh_58);
    memoTX2.Lines.Add('tpLograd_61= ' + S2200.Items[I].tpLograd_61);
    memoTX2.Lines.Add('dscLograd_62= ' + S2200.Items[I].dscLograd_62);
    memoTX2.Lines.Add('nrLograd_63= ' + S2200.Items[I].nrLograd_63);
    memoTX2.Lines.Add('bairro_65= ' + S2200.Items[I].bairro_65);
    memoTX2.Lines.Add('cep_66= ' + S2200.Items[I].cep_66);
    memoTX2.Lines.Add('codMunic_67= ' + S2200.Items[I].codMunic_67);
    memoTX2.Lines.Add('uf_68= ' + S2200.Items[I].uf_68);
    memoTX2.Lines.Add('defFisica_83= ' + S2200.Items[I].defFisica_83);
    memoTX2.Lines.Add('defVisual_84= ' + S2200.Items[I].defVisual_84);
    memoTX2.Lines.Add('defAuditiva_85= ' + S2200.Items[I].defAuditiva_85);
    memoTX2.Lines.Add('defMental_86= ' + S2200.Items[I].defMental_86);
    memoTX2.Lines.Add('defIntelectual_87= ' + S2200.Items[I].defIntelectual_87);
    memoTX2.Lines.Add('reabReadap_88= ' + S2200.Items[I].reabReadap_88);
    memoTX2.Lines.Add('infoCota_89= ' + S2200.Items[I].infoCota_89);
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92= ' + S2200.Items[I].tpDep_92);
    memoTX2.Lines.Add('nmDep_93= ' + S2200.Items[I].nmDep_93);
    memoTX2.Lines.Add('dtNascto_94= ' + S2200.Items[I].dtNascto_94);
    memoTX2.Lines.Add('cpfDep_95= ' + S2200.Items[I].cpfDep_95);
    memoTX2.Lines.Add('depIRRF_96= ' + S2200.Items[I].depIRRF_96);
    memoTX2.Lines.Add('depSF_97= ' + S2200.Items[I].depSF_97);
    memoTX2.Lines.Add('incTrab_99= ' + S2200.Items[I].incTrab_99);
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92= ' + S2200.Items[I].tpDep_92);
    memoTX2.Lines.Add('nmDep_93= ' + S2200.Items[I].nmDep_93);
    memoTX2.Lines.Add('dtNascto_94= ' + S2200.Items[I].dtNascto_94);
    memoTX2.Lines.Add('cpfDep_95= ' + S2200.Items[I].cpfDep_95);
    memoTX2.Lines.Add('depIRRF_96= ' + S2200.Items[I].depIRRF_96);
    memoTX2.Lines.Add('depSF_97= ' + S2200.Items[I].depSF_97);
    memoTX2.Lines.Add('incTrab_99= ' + S2200.Items[I].incTrab_99);
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('trabAposent_101= ' + S2200.Items[I].trabAposent_101);
    memoTX2.Lines.Add('fonePrinc_103= ' + S2200.Items[I].fonePrinc_103);
    memoTX2.Lines.Add('matricula_108= ' + S2200.Items[I].matricula_108);
    memoTX2.Lines.Add('tpRegTrab_109= ' + S2200.Items[I].tpRegTrab_109);
    memoTX2.Lines.Add('tpRegPrev_110= ' + S2200.Items[I].tpRegPrev_110);
    memoTX2.Lines.Add('cadIni_197= ' + S2200.Items[I].cadIni_197);
    memoTX2.Lines.Add('dtAdm_114= ' + S2200.Items[I].dtAdm_114);
    memoTX2.Lines.Add('tpAdmissao_115= ' + S2200.Items[I].tpAdmissao_115);
    memoTX2.Lines.Add('indAdmissao_116= ' + S2200.Items[I].indAdmissao_116);
    memoTX2.Lines.Add('tpRegJor_117= ' + S2200.Items[I].tpRegJor_117);
    memoTX2.Lines.Add('natAtividade_118= ' + S2200.Items[I].natAtividade_118);
    memoTX2.Lines.Add('dtBase_119= ' + S2200.Items[I].dtBase_119);
    memoTX2.Lines.Add('cnpjSindCategProf_120= ' + S2200.Items[I].cnpjSindCategProf_120);
    memoTX2.Lines.Add('opcFGTS_122= ' + S2200.Items[I].opcFGTS_122);
    memoTX2.Lines.Add('dtOpcFGTS_123= ' + S2200.Items[I].dtOpcFGTS_123);
    memoTX2.Lines.Add('codCargo_150= ' + S2200.Items[I].codCargo_150);
    memoTX2.Lines.Add('codFuncao_151= ' + S2200.Items[I].codFuncao_151);
    memoTX2.Lines.Add('codCateg_152= ' + S2200.Items[I].codCateg_152);
    memoTX2.Lines.Add('vrSalFx_155= ' + S2200.Items[I].vrSalFx_155);
    memoTX2.Lines.Add('undSalFixo_156= ' + S2200.Items[I].undSalFixo_156);
    memoTX2.Lines.Add('tpContr_159= ' + S2200.Items[I].tpContr_159);
    memoTX2.Lines.Add('tpInsc_163= ' + S2200.Items[I].tpInsc_163);
    memoTX2.Lines.Add('nrInsc_164= ' + S2200.Items[I].nrInsc_164);
    memoTX2.Lines.Add('tpLograd_167= ' + S2200.Items[I].tpLograd_167);
    memoTX2.Lines.Add('dscLograd_168= ' + S2200.Items[I].dscLograd_168);
    memoTX2.Lines.Add('nrLograd_169= ' + S2200.Items[I].nrLograd_169);
    memoTX2.Lines.Add('bairro_171= ' + S2200.Items[I].bairro_171);
    memoTX2.Lines.Add('cep_172= ' + S2200.Items[I].cep_172);
    memoTX2.Lines.Add('codMunic_173= ' + S2200.Items[I].codMunic_173);
    memoTX2.Lines.Add('uf_174= ' + S2200.Items[I].uf_174);
    memoTX2.Lines.Add('qtdHrsSem_176= ' + S2200.Items[I].qtdHrsSem_176);
    memoTX2.Lines.Add('tpJornada_177= ' + S2200.Items[I].tpJornada_177);
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('cnpjSindTrab_184= ' + S2200.Items[I].cnpjSindTrab_184);
    memoTX2.Lines.Add('SALVARFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('INCLUIROBSERVACAO_204');
    memoTX2.Lines.Add('observacao_205= ' + S2200.Items[I].observacao_205);
    memoTX2.Lines.Add('SALVAROBSERVACAO_204');
    memoTX2.Lines.Add('SALVARS2200');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2200ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2200ALT: TS2200ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2200ALT := TS2200ALT.Create;
  S2200ALT.GetS2200ALT(ArquivoTXT);
  for I := 0 to Pred(S2200ALT.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2200');
    memoTX2.Lines.Add('indRetif_4= ' + S2200ALT.Items[I].indRetif_4);
    memoTX2.Lines.Add('tpAmb_6= ' + S2200ALT.Items[I].tpAmb_6);
    memoTX2.Lines.Add('procEmi_7= ' + S2200ALT.Items[I].procEmi_7);
    memoTX2.Lines.Add('verProc_8= ' + S2200ALT.Items[I].verProc_8);
    memoTX2.Lines.Add('tpInsc_10= ' + S2200ALT.Items[I].tpInsc_10);
    memoTX2.Lines.Add('nrInsc_11= ' + S2200ALT.Items[I].nrInsc_11);
    memoTX2.Lines.Add('cpfTrab_13= ' + S2200ALT.Items[I].cpfTrab_13);
    memoTX2.Lines.Add('nisTrab_14= ' + S2200ALT.Items[I].nisTrab_14);
    memoTX2.Lines.Add('nmTrab_15= ' + S2200ALT.Items[I].nmTrab_15);
    memoTX2.Lines.Add('sexo_16= ' + S2200ALT.Items[I].sexo_16);
    memoTX2.Lines.Add('racaCor_17= ' + S2200ALT.Items[I].racaCor_17);
    memoTX2.Lines.Add('estCiv_18= ' + S2200ALT.Items[I].estCiv_18);
    memoTX2.Lines.Add('grauInstr_19= ' + S2200ALT.Items[I].grauInstr_19);
    memoTX2.Lines.Add('indPriEmpr_20= ' + S2200ALT.Items[I].indPriEmpr_20);
    memoTX2.Lines.Add('dtNascto_23= ' + S2200ALT.Items[I].dtNascto_23);
    memoTX2.Lines.Add('codMunic_24= ' + S2200ALT.Items[I].codMunic_24);
    memoTX2.Lines.Add('uf_25= ' + S2200ALT.Items[I].uf_25);
    memoTX2.Lines.Add('paisNascto_26= ' + S2200ALT.Items[I].paisNascto_26);
    memoTX2.Lines.Add('paisNac_27= ' + S2200ALT.Items[I].paisNac_27);
    memoTX2.Lines.Add('nmMae_28= ' + S2200ALT.Items[I].nmMae_28);
    memoTX2.Lines.Add('nmPai_29= ' + S2200ALT.Items[I].nmPai_29);
    memoTX2.Lines.Add('nrCtps_32= ' + S2200ALT.Items[I].nrCtps_32);
    memoTX2.Lines.Add('serieCtps_33= ' + S2200ALT.Items[I].serieCtps_33);
    memoTX2.Lines.Add('ufCtps_34= ' + S2200ALT.Items[I].ufCtps_34);
    memoTX2.Lines.Add('nrRg_40= ' + S2200ALT.Items[I].nrRg_40);
    memoTX2.Lines.Add('orgaoEmissor_41= ' + S2200ALT.Items[I].orgaoEmissor_41);
    memoTX2.Lines.Add('dtExped_42= ' + S2200ALT.Items[I].dtExped_42);
    memoTX2.Lines.Add('nrRegCnh_53= ' + S2200ALT.Items[I].nrRegCnh_53);
    memoTX2.Lines.Add('dtExped_54= ' + S2200ALT.Items[I].dtExped_54);
    memoTX2.Lines.Add('ufCnh_55= ' + S2200ALT.Items[I].ufCnh_55);
    memoTX2.Lines.Add('dtValid_56= ' + S2200ALT.Items[I].dtValid_56);
    memoTX2.Lines.Add('dtPriHab_57= ' + S2200ALT.Items[I].dtPriHab_57);
    memoTX2.Lines.Add('categoriaCnh_58= ' + S2200ALT.Items[I].categoriaCnh_58);
    memoTX2.Lines.Add('tpLograd_61= ' + S2200ALT.Items[I].tpLograd_61);
    memoTX2.Lines.Add('dscLograd_62= ' + S2200ALT.Items[I].dscLograd_62);
    memoTX2.Lines.Add('nrLograd_63= ' + S2200ALT.Items[I].nrLograd_63);
    memoTX2.Lines.Add('bairro_65= ' + S2200ALT.Items[I].bairro_65);
    memoTX2.Lines.Add('cep_66= ' + S2200ALT.Items[I].cep_66);
    memoTX2.Lines.Add('codMunic_67= ' + S2200ALT.Items[I].codMunic_67);
    memoTX2.Lines.Add('uf_68= ' + S2200ALT.Items[I].uf_68);
    memoTX2.Lines.Add('defFisica_83= ' + S2200ALT.Items[I].defFisica_83);
    memoTX2.Lines.Add('defVisual_84= ' + S2200ALT.Items[I].defVisual_84);
    memoTX2.Lines.Add('defAuditiva_85= ' + S2200ALT.Items[I].defAuditiva_85);
    memoTX2.Lines.Add('defMental_86= ' + S2200ALT.Items[I].defMental_86);
    memoTX2.Lines.Add('defIntelectual_87= ' + S2200ALT.Items[I].defIntelectual_87);
    memoTX2.Lines.Add('reabReadap_88= ' + S2200ALT.Items[I].reabReadap_88);
    memoTX2.Lines.Add('infoCota_89= ' + S2200ALT.Items[I].infoCota_89);
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92= ' + S2200ALT.Items[I].tpDep_92);
    memoTX2.Lines.Add('nmDep_93= ' + S2200ALT.Items[I].nmDep_93);
    memoTX2.Lines.Add('dtNascto_94= ' + S2200ALT.Items[I].dtNascto_94);
    memoTX2.Lines.Add('cpfDep_95= ' + S2200ALT.Items[I].cpfDep_95);
    memoTX2.Lines.Add('depIRRF_96= ' + S2200ALT.Items[I].depIRRF_96);
    memoTX2.Lines.Add('depSF_97= ' + S2200ALT.Items[I].depSF_97);
    memoTX2.Lines.Add('incTrab_99= ' + S2200ALT.Items[I].incTrab_99);
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92= ' + S2200ALT.Items[I].tpDep_92);
    memoTX2.Lines.Add('nmDep_93= ' + S2200ALT.Items[I].nmDep_93);
    memoTX2.Lines.Add('dtNascto_94= ' + S2200ALT.Items[I].dtNascto_94);
    memoTX2.Lines.Add('cpfDep_95= ' + S2200ALT.Items[I].cpfDep_95);
    memoTX2.Lines.Add('depIRRF_96= ' + S2200ALT.Items[I].depIRRF_96);
    memoTX2.Lines.Add('depSF_97= ' + S2200ALT.Items[I].depSF_97);
    memoTX2.Lines.Add('incTrab_99= ' + S2200ALT.Items[I].incTrab_99);
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('trabAposent_101= ' + S2200ALT.Items[I].trabAposent_101);
    memoTX2.Lines.Add('fonePrinc_103= ' + S2200ALT.Items[I].fonePrinc_103);
    memoTX2.Lines.Add('matricula_108= ' + S2200ALT.Items[I].matricula_108);
    memoTX2.Lines.Add('tpRegTrab_109= ' + S2200ALT.Items[I].tpRegTrab_109);
    memoTX2.Lines.Add('tpRegPrev_110= ' + S2200ALT.Items[I].tpRegPrev_110);
    memoTX2.Lines.Add('cadIni_197= ' + S2200ALT.Items[I].cadIni_197);
    memoTX2.Lines.Add('dtAdm_114= ' + S2200ALT.Items[I].dtAdm_114);
    memoTX2.Lines.Add('tpAdmissao_115= ' + S2200ALT.Items[I].tpAdmissao_115);
    memoTX2.Lines.Add('indAdmissao_116= ' + S2200ALT.Items[I].indAdmissao_116);
    memoTX2.Lines.Add('tpRegJor_117= ' + S2200ALT.Items[I].tpRegJor_117);
    memoTX2.Lines.Add('natAtividade_118= ' + S2200ALT.Items[I].natAtividade_118);
    memoTX2.Lines.Add('dtBase_119= ' + S2200ALT.Items[I].dtBase_119);
    memoTX2.Lines.Add('cnpjSindCategProf_120= ' + S2200ALT.Items[I].cnpjSindCategProf_120);
    memoTX2.Lines.Add('opcFGTS_122= ' + S2200ALT.Items[I].opcFGTS_122);
    memoTX2.Lines.Add('dtOpcFGTS_123= ' + S2200ALT.Items[I].dtOpcFGTS_123);
    memoTX2.Lines.Add('codCargo_150= ' + S2200ALT.Items[I].codCargo_150);
    memoTX2.Lines.Add('codFuncao_151= ' + S2200ALT.Items[I].codFuncao_151);
    memoTX2.Lines.Add('codCateg_152= ' + S2200ALT.Items[I].codCateg_152);
    memoTX2.Lines.Add('vrSalFx_155= ' + S2200ALT.Items[I].vrSalFx_155);
    memoTX2.Lines.Add('undSalFixo_156= ' + S2200ALT.Items[I].undSalFixo_156);
    memoTX2.Lines.Add('tpContr_159= ' + S2200ALT.Items[I].tpContr_159);
    memoTX2.Lines.Add('tpInsc_163= ' + S2200ALT.Items[I].tpInsc_163);
    memoTX2.Lines.Add('nrInsc_164= ' + S2200ALT.Items[I].nrInsc_164);
    memoTX2.Lines.Add('tpLograd_167= ' + S2200ALT.Items[I].tpLograd_167);
    memoTX2.Lines.Add('dscLograd_168= ' + S2200ALT.Items[I].dscLograd_168);
    memoTX2.Lines.Add('nrLograd_169= ' + S2200ALT.Items[I].nrLograd_169);
    memoTX2.Lines.Add('bairro_171= ' + S2200ALT.Items[I].bairro_171);
    memoTX2.Lines.Add('cep_172= ' + S2200ALT.Items[I].cep_172);
    memoTX2.Lines.Add('codMunic_173= ' + S2200ALT.Items[I].codMunic_173);
    memoTX2.Lines.Add('uf_174= ' + S2200ALT.Items[I].uf_174);
    memoTX2.Lines.Add('qtdHrsSem_176= ' + S2200ALT.Items[I].qtdHrsSem_176);
    memoTX2.Lines.Add('tpJornada_177= ' + S2200ALT.Items[I].tpJornada_177);
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181= ' + S2200ALT.Items[I].dia_181);
    memoTX2.Lines.Add('codHorContrat_182= ' + S2200ALT.Items[I].codHorContrat_182);
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('cnpjSindTrab_184= ' + S2200ALT.Items[I].cnpjSindTrab_184);
    memoTX2.Lines.Add('SALVARFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('INCLUIROBSERVACAO_204');
    memoTX2.Lines.Add('observacao_205= ' + S2200ALT.Items[I].observacao_205);
    memoTX2.Lines.Add('SALVAROBSERVACAO_204');
    memoTX2.Lines.Add('SALVARS2200');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2205;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2205: TS2205;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2205 := TS2205.Create;
  S2205.GetS2205(ArquivoTXT);
  for I := 0 to Pred(S2205.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2205');
    memoTX2.Lines.Add('indRetif_4 = ' + S2205.Items[I].indRetif_4);
    memoTX2.Lines.Add('nrRecibo_5 = ' + S2205.Items[I].nrRecibo_5);
    memoTX2.Lines.Add('tpAmb_6 = ' + S2205.Items[I].tpAmb_6);
    memoTX2.Lines.Add('procEmi_7 = ' + S2205.Items[I].procEmi_7);
    memoTX2.Lines.Add('verProc_8 = ' + S2205.Items[I].verProc_8);
    memoTX2.Lines.Add('tpInsc_10 = ' + S2205.Items[I].tpInsc_10);
    memoTX2.Lines.Add('nrInsc_11 = ' + S2205.Items[I].nrInsc_11);
    memoTX2.Lines.Add('cpfTrab_13 = ' + S2205.Items[I].cpfTrab_13);
    memoTX2.Lines.Add('dtAlteracao_15 = ' + S2205.Items[I].dtAlteracao_15);
    memoTX2.Lines.Add('nisTrab_17 = ' + S2205.Items[I].nisTrab_17);
    memoTX2.Lines.Add('nmTrab_18 = ' + S2205.Items[I].nmTrab_18);
    memoTX2.Lines.Add('sexo_19 = ' + S2205.Items[I].sexo_19);
    memoTX2.Lines.Add('racaCor_20 = ' + S2205.Items[I].racaCor_20);
    memoTX2.Lines.Add('estCiv_21 = ' + S2205.Items[I].estCiv_21);
    memoTX2.Lines.Add('grauInstr_22 = ' + S2205.Items[I].grauInstr_22);
    memoTX2.Lines.Add('nmSoc_23 = ' + S2205.Items[I].nmSoc_23);
    memoTX2.Lines.Add('dtNascto_101 = ' + S2205.Items[I].dtNascto_101);
    memoTX2.Lines.Add('codMunic_102 = ' + S2205.Items[I].codMunic_102);
    memoTX2.Lines.Add('uf_103 = ' + S2205.Items[I].uf_103);
    memoTX2.Lines.Add('paisNascto_104 = ' + S2205.Items[I].paisNascto_104);
    memoTX2.Lines.Add('paisNac_105 = ' + S2205.Items[I].paisNac_105);
    memoTX2.Lines.Add('nmMae_106 = ' + S2205.Items[I].nmMae_106);
    memoTX2.Lines.Add('nmPai_107 = ' + S2205.Items[I].nmPai_107);
    memoTX2.Lines.Add('nrCtps_26 = ' + S2205.Items[I].nrCtps_26);
    memoTX2.Lines.Add('serieCtps_27 = ' + S2205.Items[I].serieCtps_27);
    memoTX2.Lines.Add('ufCtps_28 = ' + S2205.Items[I].ufCtps_28);
    memoTX2.Lines.Add('nrRic_30 = ' + S2205.Items[I].nrRic_30);
    memoTX2.Lines.Add('orgaoEmissor_31 = ' + S2205.Items[I].orgaoEmissor_31);
    memoTX2.Lines.Add('dtExped_32 = ' + S2205.Items[I].dtExped_32);
    memoTX2.Lines.Add('nrRg_34 = ' + S2205.Items[I].nrRg_34);
    memoTX2.Lines.Add('orgaoEmissor_35 = ' + S2205.Items[I].orgaoEmissor_35);
    memoTX2.Lines.Add('dtExped_36 = ' + S2205.Items[I].dtExped_36);
    memoTX2.Lines.Add('nrRne_38 = ' + S2205.Items[I].nrRne_38);
    memoTX2.Lines.Add('orgaoEmissor_39 = ' + S2205.Items[I].orgaoEmissor_39);
    memoTX2.Lines.Add('dtExped_40 = ' + S2205.Items[I].dtExped_40);
    memoTX2.Lines.Add('nrOc_42 = ' + S2205.Items[I].nrOc_42);
    memoTX2.Lines.Add('orgaoEmissor_43 = ' + S2205.Items[I].orgaoEmissor_43);
    memoTX2.Lines.Add('dtExped_44 = ' + S2205.Items[I].dtExped_44);
    memoTX2.Lines.Add('dtValid_45 = ' + S2205.Items[I].dtValid_45);
    memoTX2.Lines.Add('nrRegCnh_47 = ' + S2205.Items[I].nrRegCnh_47);
    memoTX2.Lines.Add('dtExped_48 = ' + S2205.Items[I].dtExped_48);
    memoTX2.Lines.Add('ufCnh_49 = ' + S2205.Items[I].ufCnh_49);
    memoTX2.Lines.Add('dtValid_50 = ' + S2205.Items[I].dtValid_50);
    memoTX2.Lines.Add('dtPriHab_51 = ' + S2205.Items[I].dtPriHab_51);
    memoTX2.Lines.Add('categoriaCnh_52 = ' + S2205.Items[I].categoriaCnh_52);
    memoTX2.Lines.Add('tpLograd_55 = ' + S2205.Items[I].tpLograd_55);
    memoTX2.Lines.Add('dscLograd_56 = ' + S2205.Items[I].dscLograd_56);
    memoTX2.Lines.Add('nrLograd_57 = ' + S2205.Items[I].nrLograd_57);
    memoTX2.Lines.Add('complemento_58 = ' + S2205.Items[I].complemento_58);
    memoTX2.Lines.Add('bairro_59 = ' + S2205.Items[I].bairro_59);
    memoTX2.Lines.Add('cep_60 = ' + S2205.Items[I].cep_60);
    memoTX2.Lines.Add('codMunic_61 = ' + S2205.Items[I].codMunic_61);
    memoTX2.Lines.Add('uf_62 = ' + S2205.Items[I].uf_62);
    memoTX2.Lines.Add('paisResid_64 = ' + S2205.Items[I].paisResid_64);
    memoTX2.Lines.Add('dscLograd_65 = ' + S2205.Items[I].dscLograd_65);
    memoTX2.Lines.Add('nrLograd_66 = ' + S2205.Items[I].nrLograd_66);
    memoTX2.Lines.Add('complemento_67 = ' + S2205.Items[I].complemento_67);
    memoTX2.Lines.Add('bairro_68 = ' + S2205.Items[I].bairro_68);
    memoTX2.Lines.Add('nmCid_69 = ' + S2205.Items[I].nmCid_69);
    memoTX2.Lines.Add('codPostal_70 = ' + S2205.Items[I].codPostal_70);
    memoTX2.Lines.Add('dtChegada_72 = ' + S2205.Items[I].dtChegada_72);
    memoTX2.Lines.Add('classTrabEstrang_73 = ' + S2205.Items[I].classTrabEstrang_73);
    memoTX2.Lines.Add('casadoBr_74 = ' + S2205.Items[I].casadoBr_74);
    memoTX2.Lines.Add('filhosBr_75 = ' + S2205.Items[I].filhosBr_75);
    memoTX2.Lines.Add('defFisica_77 = ' + S2205.Items[I].defFisica_77);
    memoTX2.Lines.Add('defVisual_78 = ' + S2205.Items[I].defVisual_78);
    memoTX2.Lines.Add('defAuditiva_79 = ' + S2205.Items[I].defAuditiva_79);
    memoTX2.Lines.Add('defMental_80 = ' + S2205.Items[I].defMental_80);
    memoTX2.Lines.Add('defIntelectual_81 = ' + S2205.Items[I].defIntelectual_81);
    memoTX2.Lines.Add('reabReadap_82 = ' + S2205.Items[I].reabReadap_82);
    memoTX2.Lines.Add('infoCota_83 = ' + S2205.Items[I].infoCota_83);
    memoTX2.Lines.Add('observacao_84 = ' + S2205.Items[I].observacao_84);
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_85');
    memoTX2.Lines.Add('tpDep_86 = ' + S2205.Items[I].tpDep_86);
    memoTX2.Lines.Add('nmDep_87 = ' + S2205.Items[I].nmDep_87);
    memoTX2.Lines.Add('dtNascto_88 = ' + S2205.Items[I].dtNascto_88);
    memoTX2.Lines.Add('cpfDep_89 = ' + S2205.Items[I].cpfDep_89);
    memoTX2.Lines.Add('depIRRF_90 = ' + S2205.Items[I].depIRRF_90);
    memoTX2.Lines.Add('depSF_91 = ' + S2205.Items[I].depSF_91);
    memoTX2.Lines.Add('incTrab_93 = ' + S2205.Items[I].incTrab_93);
    memoTX2.Lines.Add('SALVARDEPENDENTE_85');
    memoTX2.Lines.Add('trabAposent_95 = ' + S2205.Items[I].trabAposent_95);
    memoTX2.Lines.Add('fonePrinc_97 = ' + S2205.Items[I].fonePrinc_97);
    memoTX2.Lines.Add('foneAlternat_98 = ' + S2205.Items[I].foneAlternat_98);
    memoTX2.Lines.Add('emailPrinc_99 = ' + S2205.Items[I].emailPrinc_99);
    memoTX2.Lines.Add('emailAlternat_100 = ' + S2205.Items[I].emailAlternat_100);
    memoTX2.Lines.Add('SALVARS2205');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2250;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2250: TS2250;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2250 := TS2250.Create;
  S2250.GetS2250(ArquivoTXT);
  for I := 0 to Pred(S2250.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2250');
    memoTX2.Lines.Add('indRetif_4 = ' + S2250.Items[I].indRetif_4);
    memoTX2.Lines.Add('nrRecibo_5 = ' + S2250.Items[I].nrRecibo_5);
    memoTX2.Lines.Add('tpAmb_6 = ' + S2250.Items[I].tpAmb_6);
    memoTX2.Lines.Add('procEmi_7 = ' + S2250.Items[I].procEmi_7);
    memoTX2.Lines.Add('verProc_8 = ' + S2250.Items[I].verProc_8);
    memoTX2.Lines.Add('tpInsc_10 = ' + S2250.Items[I].tpInsc_10);
    memoTX2.Lines.Add('nrInsc_11 = ' + S2250.Items[I].nrInsc_11);
    memoTX2.Lines.Add('cpfTrab_13 = ' + S2250.Items[I].cpfTrab_13);
    memoTX2.Lines.Add('nisTrab_14 = ' + S2250.Items[I].nisTrab_14);
    memoTX2.Lines.Add('matricula_15 = ' + S2250.Items[I].matricula_15);
    memoTX2.Lines.Add('dtAvPrv_18 = ' + S2250.Items[I].dtAvPrv_18);
    memoTX2.Lines.Add('dtPrevDeslig_19 = ' + S2250.Items[I].dtPrevDeslig_19);
    memoTX2.Lines.Add('tpAvPrevio_20 = ' + S2250.Items[I].tpAvPrevio_20);
    memoTX2.Lines.Add('observacao_21 = ' + S2250.Items[I].observacao_21);
    memoTX2.Lines.Add('dtCancAvPrv_23 = ' + S2250.Items[I].dtCancAvPrv_23);
    memoTX2.Lines.Add('observacao_24 = ' + S2250.Items[I].observacao_24);
    memoTX2.Lines.Add('mtvCancAvPrevio_25 = ' + S2250.Items[I].mtvCancAvPrevio_25);
    memoTX2.Lines.Add('SALVARS2250');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2299;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2299: TS2299;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2299 := TS2299.Create;
  S2299.GetS2299(ArquivoTXT);
  for I := 0 to Pred(S2299.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2299');
    memoTX2.Lines.Add('indRetif_4 = ' + S2299.Items[I].indRetif_4);
    memoTX2.Lines.Add('nrRecibo_5 = ' + S2299.Items[I].nrRecibo_5);
    memoTX2.Lines.Add('tpAmb_6 = ' + S2299.Items[I].tpAmb_6);
    memoTX2.Lines.Add('procEmi_7 = ' + S2299.Items[I].procEmi_7);
    memoTX2.Lines.Add('verProc_8 = ' + S2299.Items[I].verProc_8);
    memoTX2.Lines.Add('tpInsc_10 = ' + S2299.Items[I].tpInsc_10);
    memoTX2.Lines.Add('nrInsc_11 = ' + S2299.Items[I].nrInsc_11);
    memoTX2.Lines.Add('cpfTrab_13 = ' + S2299.Items[I].cpfTrab_13);
    memoTX2.Lines.Add('nisTrab_14 = ' + S2299.Items[I].nisTrab_14);
    memoTX2.Lines.Add('matricula_15 = ' + S2299.Items[I].matricula_15);
    memoTX2.Lines.Add('mtvDeslig_17 = ' + S2299.Items[I].mtvDeslig_17);
    memoTX2.Lines.Add('dtDeslig_18 = ' + S2299.Items[I].dtDeslig_18);
    memoTX2.Lines.Add('indPagtoAPI_19 = ' + S2299.Items[I].indPagtoAPI_19);
    memoTX2.Lines.Add('dtProjFimAPI_20 = ' + S2299.Items[I].dtProjFimAPI_20);
    memoTX2.Lines.Add('pensAlim_21 = ' + S2299.Items[I].pensAlim_21);
    memoTX2.Lines.Add('percAliment_22 = ' + S2299.Items[I].percAliment_22);
    memoTX2.Lines.Add('vrAlim_23 = ' + S2299.Items[I].vrAlim_23);
    memoTX2.Lines.Add('nrCertObito_24 = ' + S2299.Items[I].nrCertObito_24);
    memoTX2.Lines.Add('nrProcTrab_25 = ' + S2299.Items[I].nrProcTrab_25);
    memoTX2.Lines.Add('indCumprParc_26 = ' + S2299.Items[I].indCumprParc_26);
    memoTX2.Lines.Add('INCLUIROBSERVACOES_106 = ' + S2299.Items[I].INCLUIROBSERVACOES_106);
    memoTX2.Lines.Add('observacao_107 = ' + S2299.Items[I].observacao_107);
    memoTX2.Lines.Add('SALVAROBSERVACOES_106 = ' + S2299.Items[I].SALVAROBSERVACOES_106);
    memoTX2.Lines.Add('cnpjSucessora_29 = ' + S2299.Items[I].cnpjSucessora_29);
    memoTX2.Lines.Add('cpfSubstituto_98 = ' + S2299.Items[I].cpfSubstituto_98);
    memoTX2.Lines.Add('dtNascto_99 = ' + S2299.Items[I].dtNascto_99);
    memoTX2.Lines.Add('INCLUIRDMDEV_31 = ' + S2299.Items[I].INCLUIRDMDEV_31);
    memoTX2.Lines.Add('ideDmDev_32 = ' + S2299.Items[I].ideDmDev_32);
    memoTX2.Lines.Add('INCLUIRIDEESTABLOT_34 = ' + S2299.Items[I].INCLUIRIDEESTABLOT_34);
    memoTX2.Lines.Add('tpInsc_35 = ' + S2299.Items[I].tpInsc_35);
    memoTX2.Lines.Add('nrInsc_36 = ' + S2299.Items[I].nrInsc_36);
    memoTX2.Lines.Add('codLotacao_37 = ' + S2299.Items[I].codLotacao_37);
    memoTX2.Lines.Add('INCLUIRDETVERBAS_38 = ' + S2299.Items[I].INCLUIRDETVERBAS_38);
    memoTX2.Lines.Add('codRubr_39 = ' + S2299.Items[I].codRubr_39);
    memoTX2.Lines.Add('ideTabRubr_40 = ' + S2299.Items[I].ideTabRubr_40);
    memoTX2.Lines.Add('qtdRubr_41 = ' + S2299.Items[I].qtdRubr_41);
    memoTX2.Lines.Add('fatorRubr_42 = ' + S2299.Items[I].fatorRubr_42);
    memoTX2.Lines.Add('vrUnit_43 = ' + S2299.Items[I].vrUnit_43);
    memoTX2.Lines.Add('vrRubr_44 = ' + S2299.Items[I].vrRubr_44);
    memoTX2.Lines.Add('SALVARDETVERBAS_38 = ' + S2299.Items[I].SALVARDETVERBAS_38);
    memoTX2.Lines.Add('INCLUIRDETOPER_46 = ' + S2299.Items[I].INCLUIRDETOPER_46);
    memoTX2.Lines.Add('cnpjOper_47 = ' + S2299.Items[I].cnpjOper_47);
    memoTX2.Lines.Add('regANS_48 = ' + S2299.Items[I].regANS_48);
    memoTX2.Lines.Add('vrPgTit_49 = ' + S2299.Items[I].vrPgTit_49);
    memoTX2.Lines.Add('INCLUIRDETPLANO_50 = ' + S2299.Items[I].INCLUIRDETPLANO_50);
    memoTX2.Lines.Add('tpDep_95 = ' + S2299.Items[I].tpDep_95);
    memoTX2.Lines.Add('cpfDep_51 = ' + S2299.Items[I].cpfDep_51);
    memoTX2.Lines.Add('nmDep_52 = ' + S2299.Items[I].nmDep_52);
    memoTX2.Lines.Add('dtNascto_53 = ' + S2299.Items[I].dtNascto_53);
    memoTX2.Lines.Add('vlrPgDep_54 = ' + S2299.Items[I].vlrPgDep_54);
    memoTX2.Lines.Add('SALVARDETPLANO_50 = ' + S2299.Items[I].SALVARDETPLANO_50);
    memoTX2.Lines.Add('SALVARDETOPER_46 = ' + S2299.Items[I].SALVARDETOPER_46);
    memoTX2.Lines.Add('grauExp_56 = ' + S2299.Items[I].grauExp_56);
    memoTX2.Lines.Add('indSimples_58 = ' + S2299.Items[I].indSimples_58);
    memoTX2.Lines.Add('SALVARIDEESTABLOT_34 = ' + S2299.Items[I].SALVARIDEESTABLOT_34);
    memoTX2.Lines.Add('INCLUIRIDEADC_60 = ' + S2299.Items[I].INCLUIRIDEADC_60);
    memoTX2.Lines.Add('dtAcConv_61 = ' + S2299.Items[I].dtAcConv_61);
    memoTX2.Lines.Add('tpAcConv_62 = ' + S2299.Items[I].tpAcConv_62);
    memoTX2.Lines.Add('compAcConv_96 = ' + S2299.Items[I].compAcConv_96);
    memoTX2.Lines.Add('dtEfAcConv_63 = ' + S2299.Items[I].dtEfAcConv_63);
    memoTX2.Lines.Add('dsc_64 = ' + S2299.Items[I].dsc_64);
    memoTX2.Lines.Add('INCLUIRIDEPERIODO_65 = ' + S2299.Items[I].INCLUIRIDEPERIODO_65);
    memoTX2.Lines.Add('perRef_66 = ' + S2299.Items[I].perRef_66);
    memoTX2.Lines.Add('INCLUIRIDEESTABLOT_67 = ' + S2299.Items[I].INCLUIRIDEESTABLOT_67);
    memoTX2.Lines.Add('tpInsc_68 = ' + S2299.Items[I].tpInsc_68);
    memoTX2.Lines.Add('nrInsc_69 = ' + S2299.Items[I].nrInsc_69);
    memoTX2.Lines.Add('codLotacao_70 = ' + S2299.Items[I].codLotacao_70);
    memoTX2.Lines.Add('INCLUIRDETVERBAS_71 = ' + S2299.Items[I].INCLUIRDETVERBAS_71);
    memoTX2.Lines.Add('codRubr_72 = ' + S2299.Items[I].codRubr_72);
    memoTX2.Lines.Add('ideTabRubr_73 = ' + S2299.Items[I].ideTabRubr_73);
    memoTX2.Lines.Add('qtdRubr_74 = ' + S2299.Items[I].qtdRubr_74);
    memoTX2.Lines.Add('fatorRubr_75 = ' + S2299.Items[I].fatorRubr_75);
    memoTX2.Lines.Add('vrUnit_76 = ' + S2299.Items[I].vrUnit_76);
    memoTX2.Lines.Add('vrRubr_77 = ' + S2299.Items[I].vrRubr_77);
    memoTX2.Lines.Add('SALVARDETVERBAS_71 = ' + S2299.Items[I].SALVARDETVERBAS_71);
    memoTX2.Lines.Add('grauExp_79 = ' + S2299.Items[I].grauExp_79);
    memoTX2.Lines.Add('indSimples_81 = ' + S2299.Items[I].indSimples_81);
    memoTX2.Lines.Add('SALVARIDEESTABLOT_6 = ' + S2299.Items[I].SALVARIDEESTABLOT_6);
    memoTX2.Lines.Add('SALVARIDEPERIODO_65 = ' + S2299.Items[I].SALVARIDEPERIODO_65);
    memoTX2.Lines.Add('SALVARIDEADC_60 = ' + S2299.Items[I].SALVARIDEADC_60);
    memoTX2.Lines.Add('INCLUIRINFOTRABINTERM_100 = ' + S2299.Items[I].INCLUIRINFOTRABINTERM_100);
    memoTX2.Lines.Add('codConv_101 = ' + S2299.Items[I].codConv_101);
    memoTX2.Lines.Add('SALVARINFOTRABINTERM_100 = ' + S2299.Items[I].SALVARINFOTRABINTERM_100);
    memoTX2.Lines.Add('SALVARDMDEV_31 = ' + S2299.Items[I].SALVARDMDEV_31);
    memoTX2.Lines.Add('INCLUIRPROCJUDTRAB_82 = ' + S2299.Items[I].INCLUIRPROCJUDTRAB_82);
    memoTX2.Lines.Add('tpTrib_83 = ' + S2299.Items[I].tpTrib_83);
    memoTX2.Lines.Add('nrProcJud_84 = ' + S2299.Items[I].nrProcJud_84);
    memoTX2.Lines.Add('codSusp_85 = ' + S2299.Items[I].codSusp_85);
    memoTX2.Lines.Add('SALVARPROCJUDTRAB_82 = ' + S2299.Items[I].SALVARPROCJUDTRAB_82);
    memoTX2.Lines.Add('indMV_87 = ' + S2299.Items[I].indMV_87);
    memoTX2.Lines.Add('INCLUIRREMUNOUTREMPR_88 = ' + S2299.Items[I].INCLUIRREMUNOUTREMPR_88);
    memoTX2.Lines.Add('tpInsc_89 = ' + S2299.Items[I].tpInsc_89);
    memoTX2.Lines.Add('nrInsc_90 = ' + S2299.Items[I].nrInsc_90);
    memoTX2.Lines.Add('codCateg_91 = ' + S2299.Items[I].codCateg_91);
    memoTX2.Lines.Add('vlrRemunOE_92 = ' + S2299.Items[I].vlrRemunOE_92);
    memoTX2.Lines.Add('SALVARREMUNOUTREMPR_88 = ' + S2299.Items[I].SALVARREMUNOUTREMPR_88);
    memoTX2.Lines.Add('dtFimQuar_94 = ' + S2299.Items[I].dtFimQuar_94);
    memoTX2.Lines.Add('INCLUIRCONSIGFGTS_103 = ' + S2299.Items[I].INCLUIRCONSIGFGTS_103);
    memoTX2.Lines.Add('insConsig_104 = ' + S2299.Items[I].insConsig_104);
    memoTX2.Lines.Add('nrContr_105 = ' + S2299.Items[I].nrContr_105);
    memoTX2.Lines.Add('SALVARCONSIGFGTS_103 = ' + S2299.Items[I].SALVARCONSIGFGTS_103);
    memoTX2.Lines.Add('SALVARS2299');
  end;
end;

procedure TfrmPrincipal.RGArqTX2Click(Sender: TObject);
begin
  if (FLBOrigem.Count=1) then
  begin
    FLBOrigem.Selected[0] := True;
  end;
end;

procedure TfrmPrincipal.SaveTX2(aNameTX2: String);
begin
  if (sDirTX2='') then
    memoTX2.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\'+aNameTX2) else
    memoTX2.Lines.SaveToFile(sDirTX2+'\'+aNameTX2)
end;

end.
