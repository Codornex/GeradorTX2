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
    Label1: TLabel;
    RGArqTX2: TRadioGroup;
    Panel2: TPanel;
    RGTipoTX2: TRadioGroup;
    GroupBox1: TGroupBox;
    FLBOrigem: TFileListBox;
    btnCopiar: TBitBtn;
    DriveComboBox1: TDriveComboBox;
    Button1: TButton;
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
    procedure GeraTX2S1035;
    procedure GeraTX2S1035ALT;
    procedure GeraTX2S1040;
    procedure GeraTX2S1040ALT;
    procedure GeraTX2S1050;
    procedure GeraTX2S1050ALT;
    procedure GeraTX2S1060;
    procedure GeraTX2S1060ALT;
    procedure GeraTX2S2190;
    procedure GeraTX2S2200;
    procedure GeraTX2S2205;
    procedure GeraTX2S2206;
    procedure GeraTX2S2210;
    procedure GeraTX2S2230;
    procedure GeraTX2S2250;
    procedure GeraTX2S2299;
    procedure GeraTX2S2300;
    procedure GeraTX2S2306;
    procedure GeraTX2S2399;
    procedure GeraTX2S2400;
    procedure GeraTX2S3000;
    procedure GeraTX2S5002;
    procedure GeraTX2S5011;
    procedure GeraTX2S5012;
    procedure sbConfiguracaoClick(Sender: TObject);
    procedure RGArqTX2Click(Sender: TObject);
    procedure SaveTX2(aNameTX2: String);
    procedure CalcModValue(iDividendo, iDivisor, iQuociente, iResto: Integer);
    procedure btnCopiarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
     UTS2205, UTS2250, UTS2299, UTS1035, UTS1035ALT, UTS1040, UTS1040ALT, UTS1060, UTS1060ALT,
     UTS2206, UTS2210, UTS2230, unConfiguracoes, unMain, UTS2300, UTS2306,
  UTS2399, UTS2400, UTS3000, UTS5002, UTS5011, UTS5012;

procedure TfrmPrincipal.sbConfiguracaoClick(Sender: TObject);
begin
  frmConfiguracoes := TfrmConfiguracoes.Create(frmConfiguracoes);
  frmConfiguracoes.ShowModal;
  FreeAndNil(frmConfiguracoes);
end;

procedure TfrmPrincipal.btnCopiarClick(Sender: TObject);
begin
  memoTX2.SelectAll;
  memoTX2.CopyToClipboard;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmMain := TfrmMain.Create(frmMain);
  frmMain.ShowModal;
  FreeAndNil(frmMain);
end;

procedure TfrmPrincipal.CalcModValue(iDividendo, iDivisor, iQuociente,
  iResto: Integer);
begin
  iDividendo := 17;
  iDivisor := 2;
  iQuociente := iDividendo div iDivisor;
  iResto := iDividendo mod iDivisor;
end;

procedure TfrmPrincipal.GeraTX2S1000;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J,K,iCount: Integer;
  S1000: TS1000;
begin
  K := 0;
  iCount := 0;
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1000 := TS1000.Create;
  S1000.GetS1000(ArquivoTXT);
  for I := 0 to Pred(S1000.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1000');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1000.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1000.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1000.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1000.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1000.Items[I].nrInsc_9));
    memoTX2.Lines.Add('iniValid_13='+Trim(S1000.Items[I].iniValid_13));
    memoTX2.Lines.Add('fimValid_14='+Trim(S1000.Items[I].fimValid_14));
    memoTX2.Lines.Add('nmRazao_15='+Trim(S1000.Items[I].nmRazao_15));
    memoTX2.Lines.Add('classTrib_16='+Trim(S1000.Items[I].classTrib_16));
    memoTX2.Lines.Add('natJurid_17='+Trim(S1000.Items[I].natJurid_17));
    memoTX2.Lines.Add('indCoop_18='+Trim(S1000.Items[I].indCoop_18));
    memoTX2.Lines.Add('indConstr_19='+Trim(S1000.Items[I].indConstr_19));
    memoTX2.Lines.Add('indDesFolha_20='+Trim(S1000.Items[I].indDesFolha_20));
    memoTX2.Lines.Add('indOptRegEletron_21='+Trim(S1000.Items[I].indOptRegEletron_21));
    memoTX2.Lines.Add('indEntEd_23='+Trim(S1000.Items[I].indEntEd_23));
    memoTX2.Lines.Add('indEtt_24='+Trim(S1000.Items[I].indEtt_24));
    memoTX2.Lines.Add('nmCtt_36='+Trim(S1000.Items[I].nmCtt_36));
    memoTX2.Lines.Add('cpfCtt_37='+Trim(S1000.Items[I].cpfCtt_37));
    memoTX2.Lines.Add('foneFixo_38='+Trim(S1000.Items[I].foneFixo_38));
    memoTX2.Lines.Add('email_40='+Trim(S1000.Items[I].email_40));
    memoTX2.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('cnpjSoftHouse_56='+Trim(S1000.Items[I].cnpjSoftHouse_56));
    memoTX2.Lines.Add('nmRazao_57='+Trim(S1000.Items[I].nmRazao_57));
    memoTX2.Lines.Add('nmCont_58='+Trim(S1000.Items[I].nmCont_58));
    memoTX2.Lines.Add('telefone_59='+Trim(S1000.Items[I].telefone_59));
    memoTX2.Lines.Add('email_60='+Trim(S1000.Items[I].email_60));
    memoTX2.Lines.Add('SALVARSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('indSitPJ_63='+Trim(S1000.Items[I].indSitPJ_63));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1000ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1000ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1000ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1000ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1000ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('iniValid_13='+Trim(S1000ALT.Items[I].iniValid_13));
    memoTX2.Lines.Add('fimValid_14='+Trim(S1000ALT.Items[I].fimValid_14));
    memoTX2.Lines.Add('nmRazao_15='+Trim(S1000ALT.Items[I].nmRazao_15));
    memoTX2.Lines.Add('classTrib_16='+Trim(S1000ALT.Items[I].classTrib_16));
    memoTX2.Lines.Add('natJurid_17='+Trim(S1000ALT.Items[I].natJurid_17));
    memoTX2.Lines.Add('indCoop_18='+Trim(S1000ALT.Items[I].indCoop_18));
    memoTX2.Lines.Add('indConstr_19='+Trim(S1000ALT.Items[I].indConstr_19));
    memoTX2.Lines.Add('indDesFolha_20='+Trim(S1000ALT.Items[I].indDesFolha_20));
    memoTX2.Lines.Add('indOptRegEletron_21='+Trim(S1000ALT.Items[I].indOptRegEletron_21));
    memoTX2.Lines.Add('indEntEd_23='+Trim(S1000ALT.Items[I].indEntEd_23));
    memoTX2.Lines.Add('indEtt_24='+Trim(S1000ALT.Items[I].indEtt_24));
    memoTX2.Lines.Add('nrRegEtt_25='+Trim(S1000ALT.Items[I].nrRegEtt_25));
    memoTX2.Lines.Add('ideMinLei_27='+Trim(S1000ALT.Items[I].ideMinLei_27));
    memoTX2.Lines.Add('nrCertif_28='+Trim(S1000ALT.Items[I].nrCertif_28));
    memoTX2.Lines.Add('dtEmisCertif_29='+Trim(S1000ALT.Items[I].dtEmisCertif_29));
    memoTX2.Lines.Add('dtVencCertif_30='+Trim(S1000ALT.Items[I].dtVencCertif_30));
    memoTX2.Lines.Add('nrProtRenov_31='+Trim(S1000ALT.Items[I].nrProtRenov_31));
    memoTX2.Lines.Add('dtProtRenov_32='+Trim(S1000ALT.Items[I].dtProtRenov_32));
    memoTX2.Lines.Add('dtDou_33='+Trim(S1000ALT.Items[I].dtDou_33));
    memoTX2.Lines.Add('pagDou_34='+Trim(S1000ALT.Items[I].pagDou_34));
    memoTX2.Lines.Add('nmCtt_36='+Trim(S1000ALT.Items[I].nmCtt_36));
    memoTX2.Lines.Add('cpfCtt_37='+Trim(S1000ALT.Items[I].cpfCtt_37));
    memoTX2.Lines.Add('foneFixo_38='+Trim(S1000ALT.Items[I].foneFixo_38));
    memoTX2.Lines.Add('foneCel_39='+Trim(S1000ALT.Items[I].foneCel_39));
    memoTX2.Lines.Add('email_40='+Trim(S1000ALT.Items[I].email_40));
    memoTX2.Lines.Add('nrSiafi_42='+Trim(S1000ALT.Items[I].nrSiafi_42));
    memoTX2.Lines.Add('ideEFR_44='+Trim(S1000ALT.Items[I].ideEFR_44));
    memoTX2.Lines.Add('cnpjEFR_45='+Trim(S1000ALT.Items[I].cnpjEFR_45));
    memoTX2.Lines.Add('nmEnte_47='+Trim(S1000ALT.Items[I].nmEnte_47));
    memoTX2.Lines.Add('uf_48='+Trim(S1000ALT.Items[I].uf_48));
    memoTX2.Lines.Add('codMunic_49='+Trim(S1000ALT.Items[I].codMunic_49));
    memoTX2.Lines.Add('indRPPS_50='+Trim(S1000ALT.Items[I].indRPPS_50));
    memoTX2.Lines.Add('subteto_51='+Trim(S1000ALT.Items[I].subteto_51));
    memoTX2.Lines.Add('vrSubteto_52='+Trim(S1000ALT.Items[I].vrSubteto_52));
    memoTX2.Lines.Add('indAcordoIsenMulta_54='+Trim(S1000ALT.Items[I].indAcordoIsenMulta_54));
    memoTX2.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('cnpjSoftHouse_56='+Trim(S1000ALT.Items[I].cnpjSoftHouse_56));
    memoTX2.Lines.Add('nmRazao_57='+Trim(S1000ALT.Items[I].nmRazao_57));
    memoTX2.Lines.Add('nmCont_58='+Trim(S1000ALT.Items[I].nmCont_58));
    memoTX2.Lines.Add('telefone_59='+Trim(S1000ALT.Items[I].telefone_59));
    memoTX2.Lines.Add('email_60='+Trim(S1000ALT.Items[I].email_60));
    memoTX2.Lines.Add('SALVARSOFTWAREHOUSE_55');
    memoTX2.Lines.Add('indSitPJ_63='+Trim(S1000ALT.Items[I].indSitPJ_63));
    memoTX2.Lines.Add('indSitPF_65='+Trim(S1000ALT.Items[I].indSitPF_65));
    memoTX2.Lines.Add('iniValid_66='+Trim(S1000ALT.Items[I].iniValid_66));
    memoTX2.Lines.Add('fimValid_67='+Trim(S1000ALT.Items[I].fimValid_67));
    memoTX2.Lines.Add('SALVARS1000');
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1005.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1005.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1005.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1005.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1005.Items[I].nrInsc_9));
    memoTX2.Lines.Add('tpInsc_13='+Trim(S1005.Items[I].tpInsc_13));
    memoTX2.Lines.Add('nrInsc_14='+Trim(S1005.Items[I].nrInsc_14));
    memoTX2.Lines.Add('iniValid_15='+Trim(S1005.Items[I].iniValid_15));
    memoTX2.Lines.Add('fimValid_16='+Trim(S1005.Items[I].fimValid_16));
    memoTX2.Lines.Add('cnaePrep_18='+Trim(S1005.Items[I].cnaePrep_18));
    memoTX2.Lines.Add('aliqRat_20='+Trim(S1005.Items[I].aliqRat_20));
    memoTX2.Lines.Add('fap_21='+Trim(S1005.Items[I].fap_21));
    memoTX2.Lines.Add('aliqRatAjust_22='+Trim(S1005.Items[I].aliqRatAjust_22));
    memoTX2.Lines.Add('regPt_36='+Trim(S1005.Items[I].regPt_36));
    memoTX2.Lines.Add('contApr_38='+Trim(S1005.Items[I].contApr_38));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1005ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1005ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1005ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1005ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1005ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('tpInsc_13='+Trim(S1005ALT.Items[I].tpInsc_13));
    memoTX2.Lines.Add('nrInsc_14='+Trim(S1005ALT.Items[I].nrInsc_14));
    memoTX2.Lines.Add('iniValid_15='+Trim(S1005ALT.Items[I].iniValid_15));
    memoTX2.Lines.Add('fimValid_16='+Trim(S1005ALT.Items[I].fimValid_16));
    memoTX2.Lines.Add('cnaePrep_18='+Trim(S1005ALT.Items[I].cnaePrep_18));
    memoTX2.Lines.Add('aliqRat_20='+Trim(S1005ALT.Items[I].aliqRat_20));
    memoTX2.Lines.Add('fap_21='+Trim(S1005ALT.Items[I].fap_21));
    memoTX2.Lines.Add('aliqRatAjust_22='+Trim(S1005ALT.Items[I].aliqRatAjust_22));
    memoTX2.Lines.Add('tpProc_24='+Trim(S1005ALT.Items[I].tpProc_24));
    memoTX2.Lines.Add('nrProc_25='+Trim(S1005ALT.Items[I].nrProc_25));
    memoTX2.Lines.Add('codSusp_26='+Trim(S1005ALT.Items[I].codSusp_26));
    memoTX2.Lines.Add('tpProc_28='+Trim(S1005ALT.Items[I].tpProc_28));
    memoTX2.Lines.Add('nrProc_29='+Trim(S1005ALT.Items[I].nrProc_29));
    memoTX2.Lines.Add('codSusp_30='+Trim(S1005ALT.Items[I].codSusp_30));
    memoTX2.Lines.Add('tpCaepf_32='+Trim(S1005ALT.Items[I].tpCaepf_32));
    memoTX2.Lines.Add('indSubstPatrObra_34='+Trim(S1005ALT.Items[I].indSubstPatrObra_34));
    memoTX2.Lines.Add('regPt_36='+Trim(S1005ALT.Items[I].regPt_36));
    memoTX2.Lines.Add('contApr_38='+Trim(S1005ALT.Items[I].contApr_38));
    memoTX2.Lines.Add('nrProcJud_39='+Trim(S1005ALT.Items[I].nrProcJud_39));
    memoTX2.Lines.Add('contEntEd_40='+Trim(S1005ALT.Items[I].contEntEd_40));
    memoTX2.Lines.Add('INCLUIRINFOENTEDUC_41');
    memoTX2.Lines.Add('nrInsc_42='+Trim(S1005ALT.Items[I].nrInsc_42));
    memoTX2.Lines.Add('SALVARINFOENTEDUC_41');
    memoTX2.Lines.Add('contPCD_44='+Trim(S1005ALT.Items[I].contPCD_44));
    memoTX2.Lines.Add('nrProcJud_45='+Trim(S1005ALT.Items[I].nrProcJud_45));
    memoTX2.Lines.Add('iniValid_46='+Trim(S1005ALT.Items[I].iniValid_46));
    memoTX2.Lines.Add('fimValid_47='+Trim(S1005ALT.Items[I].fimValid_47));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1010.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1010.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1010.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1010.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1010.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codRubr_13='+Trim(S1010.Items[I].codRubr_13));
    memoTX2.Lines.Add('ideTabRubr_14='+Trim(S1010.Items[I].ideTabRubr_14));
    memoTX2.Lines.Add('iniValid_15='+Trim(S1010.Items[I].iniValid_15));
    memoTX2.Lines.Add('fimValid_16='+Trim(S1010.Items[I].fimValid_16));
    memoTX2.Lines.Add('dscRubr_18='+Trim(S1010.Items[I].dscRubr_18));
    memoTX2.Lines.Add('natRubr_19='+Trim(S1010.Items[I].natRubr_19));
    memoTX2.Lines.Add('tpRubr_20='+Trim(S1010.Items[I].tpRubr_20));
    memoTX2.Lines.Add('codIncCP_21='+Trim(S1010.Items[I].codIncCP_21));
    memoTX2.Lines.Add('codIncIRRF_22='+Trim(S1010.Items[I].codIncIRRF_22));
    memoTX2.Lines.Add('codIncFGTS_23='+Trim(S1010.Items[I].codIncFGTS_23));
    memoTX2.Lines.Add('codIncSIND_24='+Trim(S1010.Items[I].codIncSIND_24));
    memoTX2.Lines.Add('observacao_29='+Trim(S1010.Items[I].observacao_29));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1010ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1010ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1010ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1010ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1010ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codRubr_13='+Trim(S1010ALT.Items[I].codRubr_13));
    memoTX2.Lines.Add('ideTabRubr_14='+Trim(S1010ALT.Items[I].ideTabRubr_14));
    memoTX2.Lines.Add('iniValid_15='+Trim(S1010ALT.Items[I].iniValid_15));
    memoTX2.Lines.Add('fimValid_16='+Trim(S1010ALT.Items[I].fimValid_16));
    memoTX2.Lines.Add('dscRubr_18='+Trim(S1010ALT.Items[I].dscRubr_18));
    memoTX2.Lines.Add('natRubr_19='+Trim(S1010ALT.Items[I].natRubr_19));
    memoTX2.Lines.Add('tpRubr_20='+Trim(S1010ALT.Items[I].tpRubr_20));
    memoTX2.Lines.Add('codIncCP_21='+Trim(S1010ALT.Items[I].codIncCP_21));
    memoTX2.Lines.Add('codIncIRRF_22='+Trim(S1010ALT.Items[I].codIncIRRF_22));
    memoTX2.Lines.Add('codIncFGTS_23='+Trim(S1010ALT.Items[I].codIncFGTS_23));
    memoTX2.Lines.Add('codIncSIND_24='+Trim(S1010ALT.Items[I].codIncSIND_24));
    memoTX2.Lines.Add('observacao_29='+Trim(S1010ALT.Items[I].observacao_29));
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOCP_30');
    memoTX2.Lines.Add('tpProc_31='+Trim(S1010ALT.Items[I].tpProc_31));
    memoTX2.Lines.Add('nrProc_32='+Trim(S1010ALT.Items[I].nrProc_32));
    memoTX2.Lines.Add('extDecisao_33='+Trim(S1010ALT.Items[I].extDecisao_33));
    memoTX2.Lines.Add('codSusp_34='+Trim(S1010ALT.Items[I].codSusp_34));
    memoTX2.Lines.Add('SALVARIDEPROCESSOCP_30');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOIRRF_35');
    memoTX2.Lines.Add('nrProc_36='+Trim(S1010ALT.Items[I].nrProc_36));
    memoTX2.Lines.Add('codSusp_37='+Trim(S1010ALT.Items[I].codSusp_37));
    memoTX2.Lines.Add('SALVARIDEPROCESSOIRRF_35');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOFGTS_38');
    memoTX2.Lines.Add('nrProc_39='+Trim(S1010ALT.Items[I].nrProc_39));
    memoTX2.Lines.Add('SALVARIDEPROCESSOFGTS_38');
    memoTX2.Lines.Add('INCLUIRIDEPROCESSOSIND_41');
    memoTX2.Lines.Add('nrProc_42='+Trim(S1010ALT.Items[I].nrProc_42));
    memoTX2.Lines.Add('SALVARIDEPROCESSOSIND_41');
    memoTX2.Lines.Add('iniValid_44='+Trim(S1010ALT.Items[I].iniValid_44));
    memoTX2.Lines.Add('fimValid_45='+Trim(S1010ALT.Items[I].fimValid_45));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1020.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1020.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1020.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1020.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1020.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codLotacao_13='+Trim(S1020.Items[I].codLotacao_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1020.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1020.Items[I].fimValid_15));
    memoTX2.Lines.Add('tpLotacao_17='+Trim(S1020.Items[I].tpLotacao_17));
    memoTX2.Lines.Add('fpas_21='+Trim(S1020.Items[I].fpas_21));
    memoTX2.Lines.Add('codTercs_22='+Trim(S1020.Items[I].codTercs_22));
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
    memoTX2.Lines.Add('ALTERARS1020');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1020ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1020ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1020ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1020ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1020ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codLotacao_13='+Trim(S1020ALT.Items[I].codLotacao_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1020ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1020ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('tpLotacao_17='+Trim(S1020ALT.Items[I].tpLotacao_17));
    memoTX2.Lines.Add('tpInsc_18='+Trim(S1020ALT.Items[I].tpLotacao_17));
    memoTX2.Lines.Add('nrInsc_19='+Trim(S1020ALT.Items[I].tpLotacao_17));
    memoTX2.Lines.Add('fpas_21='+Trim(S1020ALT.Items[I].fpas_21));
    memoTX2.Lines.Add('codTercs_22='+Trim(S1020ALT.Items[I].codTercs_22));
    memoTX2.Lines.Add('codTercsSusp_23='+Trim(S1020ALT.Items[I].codTercsSusp_23));
    memoTX2.Lines.Add('tpInscContrat_30='+Trim(S1020ALT.Items[I].tpInscContrat_30));
    memoTX2.Lines.Add('nrInscContrat_31='+Trim(S1020ALT.Items[I].nrInscContrat_31));
    memoTX2.Lines.Add('tpInscProp_32='+Trim(S1020ALT.Items[I].tpInscProp_32));
    memoTX2.Lines.Add('nrInscProp_33='+Trim(S1020ALT.Items[I].nrInscProp_33));
    memoTX2.Lines.Add('INCLUIRPROCJUDTERCEIRO_25');
    memoTX2.Lines.Add('codTerc_26='+Trim(S1020ALT.Items[I].codTerc_26));
    memoTX2.Lines.Add('nrProcJud_27='+Trim(S1020ALT.Items[I].nrProcJud_27));
    memoTX2.Lines.Add('codSusp_28='+Trim(S1020ALT.Items[I].codSusp_28));
    memoTX2.Lines.Add('SALVARPROCJUDTERCEIRO_25');
    memoTX2.Lines.Add('iniValid_34='+Trim(S1020ALT.Items[I].iniValid_34));
    memoTX2.Lines.Add('fimValid_35='+Trim(S1020ALT.Items[I].fimValid_35));
    memoTX2.Lines.Add('SALVARS1020');
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1030.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1030.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1030.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1030.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1030.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codCargo_13='+Trim(S1030.Items[I].codCargo_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1030.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1030.Items[I].fimValid_15));
    memoTX2.Lines.Add('nmCargo_17='+Trim(S1030.Items[I].nmCargo_17));
    memoTX2.Lines.Add('codCBO_18='+Trim(S1030.Items[I].codCBO_18));
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1030ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1030ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1030ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1030ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1030ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codCargo_13='+Trim(S1030ALT.Items[I].codCargo_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1030ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1030ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('nmCargo_17='+Trim(S1030ALT.Items[I].nmCargo_17));
    memoTX2.Lines.Add('codCBO_18='+Trim(S1030ALT.Items[I].codCBO_18));
    memoTX2.Lines.Add('acumCargo_20='+Trim(S1030ALT.Items[I].acumCargo_20));
    memoTX2.Lines.Add('contagemEsp_21='+Trim(S1030ALT.Items[I].contagemEsp_21));
    memoTX2.Lines.Add('dedicExcl_22='+Trim(S1030ALT.Items[I].dedicExcl_22));
    memoTX2.Lines.Add('nrLei_24='+Trim(S1030ALT.Items[I].nrLei_24));
    memoTX2.Lines.Add('dtLei_25='+Trim(S1030ALT.Items[I].dtLei_25));
    memoTX2.Lines.Add('sitCargo_26='+Trim(S1030ALT.Items[I].sitCargo_26));
    memoTX2.Lines.Add('iniValid_27='+Trim(S1030ALT.Items[I].iniValid_27));
    memoTX2.Lines.Add('fimValid_28='+Trim(S1030ALT.Items[I].fimValid_28));
    memoTX2.Lines.Add('SALVARS1030');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1035;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1035: TS1035;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1035 := TS1035.Create;
  S1035.GetS1035(ArquivoTXT);
  for I := 0 to Pred(S1035.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1035');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1035.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1035.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1035.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1035.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1035.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codCarreira_13='+Trim(S1035.Items[I].codCarreira_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1035.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1035.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscCarreira_17='+Trim(S1035.Items[I].dscCarreira_17));
    memoTX2.Lines.Add('leiCarr_18='+Trim(S1035.Items[I].leiCarr_18));
    memoTX2.Lines.Add('dtLeiCarr_19='+Trim(S1035.Items[I].dtLeiCarr_19));
    memoTX2.Lines.Add('sitCarr_20='+Trim(S1035.Items[I].sitCarr_20));
    memoTX2.Lines.Add('SALVARS1035');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1035ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1035ALT: TS1035ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1035ALT := TS1035ALT.Create;
  S1035ALT.GetS1035ALT(ArquivoTXT);
  for I := 0 to Pred(S1035ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1035');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1035ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1035ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1035ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1035ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1035ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codCarreira_13='+Trim(S1035ALT.Items[I].codCarreira_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1035ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1035ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscCarreira_17='+Trim(S1035ALT.Items[I].dscCarreira_17));
    memoTX2.Lines.Add('leiCarr_18='+Trim(S1035ALT.Items[I].leiCarr_18));
    memoTX2.Lines.Add('dtLeiCarr_19='+Trim(S1035ALT.Items[I].dtLeiCarr_19));
    memoTX2.Lines.Add('sitCarr_20='+Trim(S1035ALT.Items[I].sitCarr_20));
    memoTX2.Lines.Add('iniValid_21='+Trim(S1035ALT.Items[I].iniValid_21));
    memoTX2.Lines.Add('fimValid_22='+Trim(S1035ALT.Items[I].fimValid_22));
    memoTX2.Lines.Add('SALVARS1035');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1040;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1040: TS1040;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1040 := TS1040.Create;
  S1040.GetS1040(ArquivoTXT);
  for I := 0 to Pred(S1040.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1040');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1040.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1040.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1040.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1040.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1040.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codFuncao_13='+Trim(S1040.Items[I].codFuncao_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1040.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1040.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscFuncao_17='+Trim(S1040.Items[I].dscFuncao_17));
    memoTX2.Lines.Add('codCBO_18='+Trim(S1040.Items[I].codCBO_18));
    memoTX2.Lines.Add('SALVARS1040');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1040ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1040ALT: TS1040ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1040ALT := TS1040ALT.Create;
  S1040ALT.GetS1040ALT(ArquivoTXT);
  for I := 0 to Pred(S1040ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1040');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1040ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1040ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1040ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1040ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1040ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codFuncao_13='+Trim(S1040ALT.Items[I].codFuncao_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1040ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1040ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscFuncao_17='+Trim(S1040ALT.Items[I].dscFuncao_17));
    memoTX2.Lines.Add('codCBO_18='+Trim(S1040ALT.Items[I].codCBO_18));
    memoTX2.Lines.Add('iniValid_19='+Trim(S1040ALT.Items[I].iniValid_19));
    memoTX2.Lines.Add('fimValid_20='+Trim(S1040ALT.Items[I].fimValid_20));
    memoTX2.Lines.Add('SALVARS1040');
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1050.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1050.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1050.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1050.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1050.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codHorContrat_13='+Trim(S1050.Items[I].codHorContrat_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1050.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1050.Items[I].fimValid_15));
    memoTX2.Lines.Add('hrEntr_17='+Trim(S1050.Items[I].hrEntr_17));
    memoTX2.Lines.Add('hrSaida_18='+Trim(S1050.Items[I].hrSaida_18));
    memoTX2.Lines.Add('durJornada_19='+Trim(S1050.Items[I].durJornada_19));
    memoTX2.Lines.Add('perHorFlexivel_20='+Trim(S1050.Items[I].perHorFlexivel_20));
    memoTX2.Lines.Add('INCLUIRHORARIOINTERVALO_21');
    memoTX2.Lines.Add('tpInterv_22='+Trim(S1050.Items[I].tpInterv_22));
    memoTX2.Lines.Add('durInterv_23='+Trim(S1050.Items[I].durInterv_23));
    memoTX2.Lines.Add('iniInterv_24='+Trim(S1050.Items[I].iniInterv_24));
    memoTX2.Lines.Add('termInterv_25='+Trim(S1050.Items[I].termInterv_25));
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
    memoTX2.Lines.Add('ALTERARS1050');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1050ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1050ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1050ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1050ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1050ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codHorContrat_13='+Trim(S1050ALT.Items[I].codHorContrat_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1050ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1050ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('hrEntr_17='+Trim(S1050ALT.Items[I].hrEntr_17));
    memoTX2.Lines.Add('hrSaida_18='+Trim(S1050ALT.Items[I].hrSaida_18));
    memoTX2.Lines.Add('durJornada_19='+Trim(S1050ALT.Items[I].durJornada_19));
    memoTX2.Lines.Add('perHorFlexivel_20='+Trim(S1050ALT.Items[I].perHorFlexivel_20));
    memoTX2.Lines.Add('INCLUIRHORARIOINTERVALO_21');
    memoTX2.Lines.Add('tpInterv_22='+Trim(S1050ALT.Items[I].tpInterv_22));
    memoTX2.Lines.Add('durInterv_23='+Trim(S1050ALT.Items[I].durInterv_23));
    memoTX2.Lines.Add('iniInterv_24='+Trim(S1050ALT.Items[I].iniInterv_24));
    memoTX2.Lines.Add('termInterv_25='+Trim(S1050ALT.Items[I].termInterv_25));
    memoTX2.Lines.Add('SALVARHORARIOINTERVALO_21');
    memoTX2.Lines.Add('iniValid_26='+Trim(S1050ALT.Items[I].iniValid_26));
    memoTX2.Lines.Add('fimValid_27='+Trim(S1050ALT.Items[I].iniValid_26));
    memoTX2.Lines.Add('SALVARS1050');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1060;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1060: TS1060;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1060 := TS1060.Create;
  S1060.GetS1060(ArquivoTXT);
  for I := 0 to Pred(S1060.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS1060');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1060.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1060.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1060.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1060.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1060.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codAmb_13='+Trim(S1060.Items[I].codAmb_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1060.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1060.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscAmb_17='+Trim(S1060.Items[I].dscAmb_17));
    memoTX2.Lines.Add('localAmb_18='+Trim(S1060.Items[I].localAmb_18));
    memoTX2.Lines.Add('tpInsc_19='+Trim(S1060.Items[I].tpInsc_19));
    memoTX2.Lines.Add('nrInsc_20='+Trim(S1060.Items[I].nrInsc_20));
    memoTX2.Lines.Add('INCLUIRFATORRISCO_21');
    memoTX2.Lines.Add('codFatRis_22='+Trim(S1060.Items[I].codFatRis_22));
    memoTX2.Lines.Add('SALVARFATORRISCO_21');
    memoTX2.Lines.Add('SALVARS1060');
  end;
end;

procedure TfrmPrincipal.GeraTX2S1060ALT;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1060ALT: TS1060ALT;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S1060ALT := TS1060ALT.Create;
  S1060ALT.GetS1060ALT(ArquivoTXT);
  for I := 0 to Pred(S1060ALT.Count) do
  begin
    memoTX2.Lines.Add('ALTERARS1060');
    memoTX2.Lines.Add('tpAmb_4='+Trim(S1060ALT.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S1060ALT.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S1060ALT.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S1060ALT.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S1060ALT.Items[I].nrInsc_9));
    memoTX2.Lines.Add('codAmb_13='+Trim(S1060ALT.Items[I].codAmb_13));
    memoTX2.Lines.Add('iniValid_14='+Trim(S1060ALT.Items[I].iniValid_14));
    memoTX2.Lines.Add('fimValid_15='+Trim(S1060ALT.Items[I].fimValid_15));
    memoTX2.Lines.Add('dscAmb_17='+Trim(S1060ALT.Items[I].dscAmb_17));
    memoTX2.Lines.Add('localAmb_18='+Trim(S1060ALT.Items[I].localAmb_18));
    memoTX2.Lines.Add('tpInsc_19='+Trim(S1060ALT.Items[I].tpInsc_19));
    memoTX2.Lines.Add('nrInsc_20='+Trim(S1060ALT.Items[I].nrInsc_20));
    memoTX2.Lines.Add('INCLUIRFATORRISCO_21');
    memoTX2.Lines.Add('codFatRis_22='+Trim(S1060ALT.Items[I].codFatRis_22));
    memoTX2.Lines.Add('SALVARFATORRISCO_21');
    memoTX2.Lines.Add('iniValid_23='+Trim(S1060ALT.Items[I].iniValid_23));
    memoTX2.Lines.Add('fimValid_24='+Trim(S1060ALT.Items[I].fimValid_24));
    memoTX2.Lines.Add('SALVARS1060');
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
    memoTX2.Lines.Add('tpAmb_4='+Trim(S2190.Items[I].tpAmb_4));
    memoTX2.Lines.Add('procEmi_5='+Trim(S2190.Items[I].procEmi_5));
    memoTX2.Lines.Add('verProc_6='+Trim(S2190.Items[I].verProc_6));
    memoTX2.Lines.Add('tpInsc_8='+Trim(S2190.Items[I].tpInsc_8));
    memoTX2.Lines.Add('nrInsc_9='+Trim(S2190.Items[I].nrInsc_9));
    memoTX2.Lines.Add('cpfTrab_11='+Trim(S2190.Items[I].cpfTrab_11));
    memoTX2.Lines.Add('dtNascto_12='+Trim(S2190.Items[I].dtNascto_12));
    memoTX2.Lines.Add('dtAdm_13='+Trim(S2190.Items[I].dtAdm_13));
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
    memoTX2.Lines.Add('indRetif_4='+Trim(S2200.Items[I].indRetif_4));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2200.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2200.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2200.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2200.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2200.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2200.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('nisTrab_14='+Trim(S2200.Items[I].nisTrab_14));
    memoTX2.Lines.Add('nmTrab_15='+Trim(S2200.Items[I].nmTrab_15));
    memoTX2.Lines.Add('sexo_16='+Trim(S2200.Items[I].sexo_16));
    memoTX2.Lines.Add('racaCor_17='+Trim(S2200.Items[I].racaCor_17));
    memoTX2.Lines.Add('estCiv_18='+Trim(S2200.Items[I].estCiv_18));
    memoTX2.Lines.Add('grauInstr_19='+Trim(S2200.Items[I].grauInstr_19));
    memoTX2.Lines.Add('indPriEmpr_20='+Trim(S2200.Items[I].indPriEmpr_20));
    memoTX2.Lines.Add('dtNascto_23='+Trim(S2200.Items[I].dtNascto_23));
    memoTX2.Lines.Add('codMunic_24='+Trim(S2200.Items[I].codMunic_24));
    memoTX2.Lines.Add('uf_25='+Trim(S2200.Items[I].uf_25));
    memoTX2.Lines.Add('paisNascto_26='+Trim(S2200.Items[I].paisNascto_26));
    memoTX2.Lines.Add('paisNac_27='+Trim(S2200.Items[I].paisNac_27));
    memoTX2.Lines.Add('nmMae_28='+Trim(S2200.Items[I].nmMae_28));
    memoTX2.Lines.Add('nmPai_29='+Trim(S2200.Items[I].nmPai_29));
    memoTX2.Lines.Add('nrCtps_32='+Trim(S2200.Items[I].nrCtps_32));
    memoTX2.Lines.Add('serieCtps_33='+Trim(S2200.Items[I].serieCtps_33));
    memoTX2.Lines.Add('ufCtps_34='+Trim(S2200.Items[I].ufCtps_34));
    memoTX2.Lines.Add('nrRg_40='+Trim(S2200.Items[I].nrRg_40));
    memoTX2.Lines.Add('orgaoEmissor_41='+Trim(S2200.Items[I].orgaoEmissor_41));
    memoTX2.Lines.Add('dtExped_42='+Trim(S2200.Items[I].dtExped_42));
    memoTX2.Lines.Add('nrRegCnh_53='+Trim(S2200.Items[I].nrRegCnh_53));
    memoTX2.Lines.Add('dtExped_54='+Trim(S2200.Items[I].dtExped_54));
    memoTX2.Lines.Add('ufCnh_55='+Trim(S2200.Items[I].ufCnh_55));
    memoTX2.Lines.Add('dtValid_56='+Trim(S2200.Items[I].dtValid_56));
    memoTX2.Lines.Add('dtPriHab_57='+Trim(S2200.Items[I].dtPriHab_57));
    memoTX2.Lines.Add('categoriaCnh_58='+Trim(S2200.Items[I].categoriaCnh_58));
    memoTX2.Lines.Add('tpLograd_61='+Trim(S2200.Items[I].tpLograd_61));
    memoTX2.Lines.Add('dscLograd_62='+Trim(S2200.Items[I].dscLograd_62));
    memoTX2.Lines.Add('nrLograd_63='+Trim(S2200.Items[I].nrLograd_63));
    memoTX2.Lines.Add('bairro_65='+Trim(S2200.Items[I].bairro_65));
    memoTX2.Lines.Add('cep_66='+Trim(S2200.Items[I].cep_66));
    memoTX2.Lines.Add('codMunic_67='+Trim(S2200.Items[I].codMunic_67));
    memoTX2.Lines.Add('uf_68='+Trim(S2200.Items[I].uf_68));
    memoTX2.Lines.Add('defFisica_83='+Trim(S2200.Items[I].defFisica_83));
    memoTX2.Lines.Add('defVisual_84='+Trim(S2200.Items[I].defVisual_84));
    memoTX2.Lines.Add('defAuditiva_85='+Trim(S2200.Items[I].defAuditiva_85));
    memoTX2.Lines.Add('defMental_86='+Trim(S2200.Items[I].defMental_86));
    memoTX2.Lines.Add('defIntelectual_87='+Trim(S2200.Items[I].defIntelectual_87));
    memoTX2.Lines.Add('reabReadap_88='+Trim(S2200.Items[I].reabReadap_88));
    memoTX2.Lines.Add('infoCota_89='+Trim(S2200.Items[I].infoCota_89));
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92='+Trim(S2200.Items[I].tpDep_92));
    memoTX2.Lines.Add('nmDep_93='+Trim(S2200.Items[I].nmDep_93));
    memoTX2.Lines.Add('dtNascto_94='+Trim(S2200.Items[I].dtNascto_94));
    memoTX2.Lines.Add('cpfDep_95='+Trim(S2200.Items[I].cpfDep_95));
    memoTX2.Lines.Add('depIRRF_96='+Trim(S2200.Items[I].depIRRF_96));
    memoTX2.Lines.Add('depSF_97='+Trim(S2200.Items[I].depSF_97));
    memoTX2.Lines.Add('incTrab_99='+Trim(S2200.Items[I].incTrab_99));
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_91');
    memoTX2.Lines.Add('tpDep_92='+Trim(S2200.Items[I].tpDep_92));
    memoTX2.Lines.Add('nmDep_93='+Trim(S2200.Items[I].nmDep_93));
    memoTX2.Lines.Add('dtNascto_94='+Trim(S2200.Items[I].dtNascto_94));
    memoTX2.Lines.Add('cpfDep_95='+Trim(S2200.Items[I].cpfDep_95));
    memoTX2.Lines.Add('depIRRF_96='+Trim(S2200.Items[I].depIRRF_96));
    memoTX2.Lines.Add('depSF_97='+Trim(S2200.Items[I].depSF_97));
    memoTX2.Lines.Add('incTrab_99='+Trim(S2200.Items[I].incTrab_99));
    memoTX2.Lines.Add('SALVARDEPENDENTE_91');
    memoTX2.Lines.Add('trabAposent_101='+Trim(S2200.Items[I].trabAposent_101));
    memoTX2.Lines.Add('fonePrinc_103='+Trim(S2200.Items[I].fonePrinc_103));
    memoTX2.Lines.Add('matricula_108='+Trim(S2200.Items[I].matricula_108));
    memoTX2.Lines.Add('tpRegTrab_109='+Trim(S2200.Items[I].tpRegTrab_109));
    memoTX2.Lines.Add('tpRegPrev_110='+Trim(S2200.Items[I].tpRegPrev_110));
    memoTX2.Lines.Add('cadIni_197='+Trim(S2200.Items[I].cadIni_197));
    memoTX2.Lines.Add('dtAdm_114='+Trim(S2200.Items[I].dtAdm_114));
    memoTX2.Lines.Add('tpAdmissao_115='+Trim(S2200.Items[I].tpAdmissao_115));
    memoTX2.Lines.Add('indAdmissao_116='+Trim(S2200.Items[I].indAdmissao_116));
    memoTX2.Lines.Add('tpRegJor_117='+Trim(S2200.Items[I].tpRegJor_117));
    memoTX2.Lines.Add('natAtividade_118='+Trim(S2200.Items[I].natAtividade_118));
    memoTX2.Lines.Add('dtBase_119='+Trim(S2200.Items[I].dtBase_119));
    memoTX2.Lines.Add('cnpjSindCategProf_120='+Trim(S2200.Items[I].cnpjSindCategProf_120));
    memoTX2.Lines.Add('opcFGTS_122='+Trim(S2200.Items[I].opcFGTS_122));
    memoTX2.Lines.Add('dtOpcFGTS_123='+Trim(S2200.Items[I].dtOpcFGTS_123));
    memoTX2.Lines.Add('codCargo_150='+Trim(S2200.Items[I].codCargo_150));
    memoTX2.Lines.Add('codFuncao_151='+Trim(S2200.Items[I].codFuncao_151));
    memoTX2.Lines.Add('codCateg_152='+Trim(S2200.Items[I].codCateg_152));
    memoTX2.Lines.Add('vrSalFx_155='+Trim(S2200.Items[I].vrSalFx_155));
    memoTX2.Lines.Add('undSalFixo_156='+Trim(S2200.Items[I].undSalFixo_156));
    memoTX2.Lines.Add('tpContr_159='+Trim(S2200.Items[I].tpContr_159));
    memoTX2.Lines.Add('tpInsc_163='+Trim(S2200.Items[I].tpInsc_163));
    memoTX2.Lines.Add('nrInsc_164='+Trim(S2200.Items[I].nrInsc_164));
    memoTX2.Lines.Add('tpLograd_167='+Trim(S2200.Items[I].tpLograd_167));
    memoTX2.Lines.Add('dscLograd_168='+Trim(S2200.Items[I].dscLograd_168));
    memoTX2.Lines.Add('nrLograd_169='+Trim(S2200.Items[I].nrLograd_169));
    memoTX2.Lines.Add('bairro_171='+Trim(S2200.Items[I].bairro_171));
    memoTX2.Lines.Add('cep_172='+Trim(S2200.Items[I].cep_172));
    memoTX2.Lines.Add('codMunic_173='+Trim(S2200.Items[I].codMunic_173));
    memoTX2.Lines.Add('uf_174='+Trim(S2200.Items[I].uf_174));
    memoTX2.Lines.Add('qtdHrsSem_176='+Trim(S2200.Items[I].qtdHrsSem_176));
    memoTX2.Lines.Add('tpJornada_177='+Trim(S2200.Items[I].tpJornada_177));
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRHORARIO_180');
    memoTX2.Lines.Add('dia_181='+Trim(S2200.Items[I].dia_181));
    memoTX2.Lines.Add('codHorContrat_182='+Trim(S2200.Items[I].codHorContrat_182));
    memoTX2.Lines.Add('SALVARHORARIO_180');
    memoTX2.Lines.Add('INCLUIRFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('cnpjSindTrab_184='+Trim(S2200.Items[I].cnpjSindTrab_184));
    memoTX2.Lines.Add('SALVARFILIACAOSINDICAL_183');
    memoTX2.Lines.Add('INCLUIROBSERVACAO_204');
    memoTX2.Lines.Add('observacao_205='+Trim(S2200.Items[I].observacao_205));
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
    memoTX2.Lines.Add('indRetif_4='+Trim(S2205.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2205.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2205.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2205.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2205.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2205.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2205.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2205.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('dtAlteracao_15='+Trim(S2205.Items[I].dtAlteracao_15));
    memoTX2.Lines.Add('nisTrab_17='+Trim(S2205.Items[I].nisTrab_17));
    memoTX2.Lines.Add('nmTrab_18='+Trim(S2205.Items[I].nmTrab_18));
    memoTX2.Lines.Add('sexo_19='+Trim(S2205.Items[I].sexo_19));
    memoTX2.Lines.Add('racaCor_20='+Trim(S2205.Items[I].racaCor_20));
    memoTX2.Lines.Add('estCiv_21='+Trim(S2205.Items[I].estCiv_21));
    memoTX2.Lines.Add('grauInstr_22='+Trim(S2205.Items[I].grauInstr_22));
    memoTX2.Lines.Add('nmSoc_23='+Trim(S2205.Items[I].nmSoc_23));
    memoTX2.Lines.Add('dtNascto_101='+Trim(S2205.Items[I].dtNascto_101));
    memoTX2.Lines.Add('codMunic_102='+Trim(S2205.Items[I].codMunic_102));
    memoTX2.Lines.Add('uf_103='+Trim(S2205.Items[I].uf_103));
    memoTX2.Lines.Add('paisNascto_104='+Trim(S2205.Items[I].paisNascto_104));
    memoTX2.Lines.Add('paisNac_105='+Trim(S2205.Items[I].paisNac_105));
    memoTX2.Lines.Add('nmMae_106='+Trim(S2205.Items[I].nmMae_106));
    memoTX2.Lines.Add('nmPai_107='+Trim(S2205.Items[I].nmPai_107));
    memoTX2.Lines.Add('nrCtps_26='+Trim(S2205.Items[I].nrCtps_26));
    memoTX2.Lines.Add('serieCtps_27='+Trim(S2205.Items[I].serieCtps_27));
    memoTX2.Lines.Add('ufCtps_28='+Trim(S2205.Items[I].ufCtps_28));
    memoTX2.Lines.Add('nrRic_30='+Trim(S2205.Items[I].nrRic_30));
    memoTX2.Lines.Add('orgaoEmissor_31='+Trim(S2205.Items[I].orgaoEmissor_31));
    memoTX2.Lines.Add('dtExped_32='+Trim(S2205.Items[I].dtExped_32));
    memoTX2.Lines.Add('nrRg_34='+Trim(S2205.Items[I].nrRg_34));
    memoTX2.Lines.Add('orgaoEmissor_35='+Trim(S2205.Items[I].orgaoEmissor_35));
    memoTX2.Lines.Add('dtExped_36='+Trim(S2205.Items[I].dtExped_36));
    memoTX2.Lines.Add('nrRne_38='+Trim(S2205.Items[I].nrRne_38));
    memoTX2.Lines.Add('orgaoEmissor_39='+Trim(S2205.Items[I].orgaoEmissor_39));
    memoTX2.Lines.Add('dtExped_40='+Trim(S2205.Items[I].dtExped_40));
    memoTX2.Lines.Add('nrOc_42='+Trim(S2205.Items[I].nrOc_42));
    memoTX2.Lines.Add('orgaoEmissor_43='+Trim(S2205.Items[I].orgaoEmissor_43));
    memoTX2.Lines.Add('dtExped_44='+Trim(S2205.Items[I].dtExped_44));
    memoTX2.Lines.Add('dtValid_45='+Trim(S2205.Items[I].dtValid_45));
    memoTX2.Lines.Add('nrRegCnh_47='+Trim(S2205.Items[I].nrRegCnh_47));
    memoTX2.Lines.Add('dtExped_48='+Trim(S2205.Items[I].dtExped_48));
    memoTX2.Lines.Add('ufCnh_49='+Trim(S2205.Items[I].ufCnh_49));
    memoTX2.Lines.Add('dtValid_50='+Trim(S2205.Items[I].dtValid_50));
    memoTX2.Lines.Add('dtPriHab_51='+Trim(S2205.Items[I].dtPriHab_51));
    memoTX2.Lines.Add('categoriaCnh_52='+Trim(S2205.Items[I].categoriaCnh_52));
    memoTX2.Lines.Add('tpLograd_55='+Trim(S2205.Items[I].tpLograd_55));
    memoTX2.Lines.Add('dscLograd_56='+Trim(S2205.Items[I].dscLograd_56));
    memoTX2.Lines.Add('nrLograd_57='+Trim(S2205.Items[I].nrLograd_57));
    memoTX2.Lines.Add('complemento_58='+Trim(S2205.Items[I].complemento_58));
    memoTX2.Lines.Add('bairro_59='+Trim(S2205.Items[I].bairro_59));
    memoTX2.Lines.Add('cep_60='+Trim(S2205.Items[I].cep_60));
    memoTX2.Lines.Add('codMunic_61='+Trim(S2205.Items[I].codMunic_61));
    memoTX2.Lines.Add('uf_62='+Trim(S2205.Items[I].uf_62));
    memoTX2.Lines.Add('paisResid_64='+Trim(S2205.Items[I].paisResid_64));
    memoTX2.Lines.Add('dscLograd_65='+Trim(S2205.Items[I].dscLograd_65));
    memoTX2.Lines.Add('nrLograd_66='+Trim(S2205.Items[I].nrLograd_66));
    memoTX2.Lines.Add('complemento_67='+Trim(S2205.Items[I].complemento_67));
    memoTX2.Lines.Add('bairro_68='+Trim(S2205.Items[I].bairro_68));
    memoTX2.Lines.Add('nmCid_69='+Trim(S2205.Items[I].nmCid_69));
    memoTX2.Lines.Add('codPostal_70='+Trim(S2205.Items[I].codPostal_70));
    memoTX2.Lines.Add('dtChegada_72='+Trim(S2205.Items[I].dtChegada_72));
    memoTX2.Lines.Add('classTrabEstrang_73='+Trim(S2205.Items[I].classTrabEstrang_73));
    memoTX2.Lines.Add('casadoBr_74='+Trim(S2205.Items[I].casadoBr_74));
    memoTX2.Lines.Add('filhosBr_75='+Trim(S2205.Items[I].filhosBr_75));
    memoTX2.Lines.Add('defFisica_77='+Trim(S2205.Items[I].defFisica_77));
    memoTX2.Lines.Add('defVisual_78='+Trim(S2205.Items[I].defVisual_78));
    memoTX2.Lines.Add('defAuditiva_79='+Trim(S2205.Items[I].defAuditiva_79));
    memoTX2.Lines.Add('defMental_80='+Trim(S2205.Items[I].defMental_80));
    memoTX2.Lines.Add('defIntelectual_81='+Trim(S2205.Items[I].defIntelectual_81));
    memoTX2.Lines.Add('reabReadap_82='+Trim(S2205.Items[I].reabReadap_82));
    memoTX2.Lines.Add('infoCota_83='+Trim(S2205.Items[I].infoCota_83));
    memoTX2.Lines.Add('observacao_84='+Trim(S2205.Items[I].observacao_84));
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_85');
    memoTX2.Lines.Add('tpDep_86='+Trim(S2205.Items[I].tpDep_86));
    memoTX2.Lines.Add('nmDep_87='+Trim(S2205.Items[I].nmDep_87));
    memoTX2.Lines.Add('dtNascto_88='+Trim(S2205.Items[I].dtNascto_88));
    memoTX2.Lines.Add('cpfDep_89='+Trim(S2205.Items[I].cpfDep_89));
    memoTX2.Lines.Add('depIRRF_90='+Trim(S2205.Items[I].depIRRF_90));
    memoTX2.Lines.Add('depSF_91='+Trim(S2205.Items[I].depSF_91));
    memoTX2.Lines.Add('incTrab_93='+Trim(S2205.Items[I].incTrab_93));
    memoTX2.Lines.Add('SALVARDEPENDENTE_85');
    memoTX2.Lines.Add('trabAposent_95='+Trim(S2205.Items[I].trabAposent_95));
    memoTX2.Lines.Add('fonePrinc_97='+Trim(S2205.Items[I].fonePrinc_97));
    memoTX2.Lines.Add('foneAlternat_98='+Trim(S2205.Items[I].foneAlternat_98));
    memoTX2.Lines.Add('emailPrinc_99='+Trim(S2205.Items[I].emailPrinc_99));
    memoTX2.Lines.Add('emailAlternat_100='+Trim(S2205.Items[I].emailAlternat_100));
    memoTX2.Lines.Add('SALVARS2205');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2206;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2206: TS2206;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2206 := TS2206.Create;
  S2206.GetS2206(ArquivoTXT);
  for I := 0 to Pred(S2206.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2206');
    memoTX2.Lines.Add('indRetif_4='+Trim(S2206.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2206.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2206.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2206.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2206.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2206.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2206.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2206.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('nisTrab_14='+Trim(S2206.Items[I].nisTrab_14));
    memoTX2.Lines.Add('matricula_15='+Trim(S2206.Items[I].matricula_15));
    memoTX2.Lines.Add('dtAlteracao_17='+Trim(S2206.Items[I].dtAlteracao_17));
    memoTX2.Lines.Add('dtEf_18='+Trim(S2206.Items[I].dtEf_18));
    memoTX2.Lines.Add('dscAlt_19='+Trim(S2206.Items[I].dscAlt_19));
    memoTX2.Lines.Add('tpRegPrev_22='+Trim(S2206.Items[I].tpRegPrev_22));
    memoTX2.Lines.Add('tpRegJor_25='+Trim(S2206.Items[I].tpRegJor_25));
    memoTX2.Lines.Add('natAtividade_26='+Trim(S2206.Items[I].natAtividade_26));
    memoTX2.Lines.Add('dtBase_27='+Trim(S2206.Items[I].dtBase_27));
    memoTX2.Lines.Add('cnpjSindCategProf_28='+Trim(S2206.Items[I].cnpjSindCategProf_28));
    memoTX2.Lines.Add('justProrr_30='+Trim(S2206.Items[I].justProrr_30));
    memoTX2.Lines.Add('tpInsc_75='+Trim(S2206.Items[I].tpInsc_75));
    memoTX2.Lines.Add('nrInsc_76='+Trim(S2206.Items[I].nrInsc_76));
    memoTX2.Lines.Add('tpPlanRP_32='+Trim(S2206.Items[I].tpPlanRP_32));
    memoTX2.Lines.Add('codCargo_34='+Trim(S2206.Items[I].codCargo_34));
    memoTX2.Lines.Add('codFuncao_35='+Trim(S2206.Items[I].codFuncao_35));
    memoTX2.Lines.Add('codCateg_36='+Trim(S2206.Items[I].codCateg_36));
    memoTX2.Lines.Add('codCarreira_37='+Trim(S2206.Items[I].codCarreira_37));
    memoTX2.Lines.Add('dtIngrCarr_38='+Trim(S2206.Items[I].dtIngrCarr_38));
    memoTX2.Lines.Add('vrSalFx_40='+Trim(S2206.Items[I].vrSalFx_40));
    memoTX2.Lines.Add('undSalFixo_41='+Trim(S2206.Items[I].undSalFixo_41));
    memoTX2.Lines.Add('dscSalVar_42='+Trim(S2206.Items[I].dscSalVar_42));
    memoTX2.Lines.Add('tpContr_44='+Trim(S2206.Items[I].tpContr_44));
    memoTX2.Lines.Add('dtTerm_45='+Trim(S2206.Items[I].dtTerm_45));
    memoTX2.Lines.Add('tpInsc_48='+Trim(S2206.Items[I].tpInsc_48));
    memoTX2.Lines.Add('nrInsc_49='+Trim(S2206.Items[I].nrInsc_49));
    memoTX2.Lines.Add('descComp_50='+Trim(S2206.Items[I].descComp_50));
    memoTX2.Lines.Add('tpLograd_52='+Trim(S2206.Items[I].tpLograd_52));
    memoTX2.Lines.Add('dscLograd_53='+Trim(S2206.Items[I].dscLograd_53));
    memoTX2.Lines.Add('nrLograd_54='+Trim(S2206.Items[I].nrLograd_54));
    memoTX2.Lines.Add('complemento_55='+Trim(S2206.Items[I].complemento_55));
    memoTX2.Lines.Add('bairro_56='+Trim(S2206.Items[I].bairro_56));
    memoTX2.Lines.Add('cep_57='+Trim(S2206.Items[I].cep_57));
    memoTX2.Lines.Add('codMunic_58='+Trim(S2206.Items[I].codMunic_58));
    memoTX2.Lines.Add('uf_59='+Trim(S2206.Items[I].uf_59));
    memoTX2.Lines.Add('qtdHrsSem_61='+Trim(S2206.Items[I].qtdHrsSem_61));
    memoTX2.Lines.Add('tpJornada_62='+Trim(S2206.Items[I].tpJornada_62));
    memoTX2.Lines.Add('dscTpJorn_63='+Trim(S2206.Items[I].dscTpJorn_63));
    memoTX2.Lines.Add('tmpParc_64='+Trim(S2206.Items[I].tmpParc_64));
    memoTX2.Lines.Add('INCLUIRHORARIO_65');
    memoTX2.Lines.Add('dia_66='+Trim(S2206.Items[I].dia_66));
    memoTX2.Lines.Add('codHorContrat_67='+Trim(S2206.Items[I].codHorContrat_67));
    memoTX2.Lines.Add('SALVARHORARIO_65');
    memoTX2.Lines.Add('INCLUIRFILIACAOSINDICAL_68');
    memoTX2.Lines.Add('cnpjSindTrab_69='+Trim(S2206.Items[I].cnpjSindTrab_69));
    memoTX2.Lines.Add('SALVARFILIACAOSINDICAL_68');
    memoTX2.Lines.Add('nrProcJud_71='+Trim(S2206.Items[I].nrProcJud_71));
    memoTX2.Lines.Add('mtvAlter_73='+Trim(S2206.Items[I].mtvAlter_73));
    memoTX2.Lines.Add('INCLUIROBSERVACAO_74');
    memoTX2.Lines.Add('observacao_75='+Trim(S2206.Items[I].observacao_75));
    memoTX2.Lines.Add('SALVAROBSERVACAO_74');
    memoTX2.Lines.Add('SALVARS2206');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2210;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2210: TS2210;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2210 := TS2210.Create;
  S2210.GetS2210(ArquivoTXT);
  for I := 0 to Pred(S2210.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2210');
    memoTX2.Lines.Add('indRetif_4='+Trim(S2210.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2210.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2210.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2210.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2210.Items[I].verProc_8));
    memoTX2.Lines.Add('tpRegistrador_10='+Trim(S2210.Items[I].tpRegistrador_10));
    memoTX2.Lines.Add('tpInsc_11='+Trim(S2210.Items[I].tpInsc_11));
    memoTX2.Lines.Add('nrInsc_12='+Trim(S2210.Items[I].nrInsc_12));
    memoTX2.Lines.Add('tpInsc_14='+Trim(S2210.Items[I].tpInsc_14));
    memoTX2.Lines.Add('nrInsc_15='+Trim(S2210.Items[I].nrInsc_15));
    memoTX2.Lines.Add('cpfTrab_17='+Trim(S2210.Items[I].cpfTrab_17));
    memoTX2.Lines.Add('nisTrab_18='+Trim(S2210.Items[I].nisTrab_18));
    memoTX2.Lines.Add('dtAcid_20='+Trim(S2210.Items[I].dtAcid_20));
    memoTX2.Lines.Add('tpAcid_21='+Trim(S2210.Items[I].tpAcid_21));
    memoTX2.Lines.Add('hrAcid_22='+Trim(S2210.Items[I].hrAcid_22));
    memoTX2.Lines.Add('hrsTrabAntesAcid_23='+Trim(S2210.Items[I].hrsTrabAntesAcid_23));
    memoTX2.Lines.Add('tpCat_24='+Trim(S2210.Items[I].tpCat_24));
    memoTX2.Lines.Add('indCatObito_25='+Trim(S2210.Items[I].indCatObito_25));
    memoTX2.Lines.Add('dtObito_26='+Trim(S2210.Items[I].dtObito_26));
    memoTX2.Lines.Add('indComunPolicia_27='+Trim(S2210.Items[I].indComunPolicia_27));
    memoTX2.Lines.Add('codSitGeradora_28='+Trim(S2210.Items[I].codSitGeradora_28));
    memoTX2.Lines.Add('iniciatCAT_29='+Trim(S2210.Items[I].iniciatCAT_29));
    memoTX2.Lines.Add('observacao_30='+Trim(S2210.Items[I].observacao_30));
    memoTX2.Lines.Add('tpLocal_32='+Trim(S2210.Items[I].tpLocal_32));
    memoTX2.Lines.Add('dscLocal_33='+Trim(S2210.Items[I].dscLocal_33));
    memoTX2.Lines.Add('dscLograd_34='+Trim(S2210.Items[I].dscLograd_34));
    memoTX2.Lines.Add('nrLograd_35='+Trim(S2210.Items[I].nrLograd_35));
    memoTX2.Lines.Add('codMunic_36='+Trim(S2210.Items[I].codMunic_36));
    memoTX2.Lines.Add('uf_37='+Trim(S2210.Items[I].uf_37));
    memoTX2.Lines.Add('cnpjLocalAcid_38='+Trim(S2210.Items[I].cnpjLocalAcid_38));
    memoTX2.Lines.Add('pais_39='+Trim(S2210.Items[I].pais_39));
    memoTX2.Lines.Add('codPostal_40='+Trim(S2210.Items[I].codPostal_40));
    memoTX2.Lines.Add('INCLUIRPARTEATINGIDA_41');
    memoTX2.Lines.Add('codParteAting_42='+Trim(S2210.Items[I].codParteAting_42));
    memoTX2.Lines.Add('lateralidade_43='+Trim(S2210.Items[I].lateralidade_43));
    memoTX2.Lines.Add('SALVARPARTEATINGIDA_41');
    memoTX2.Lines.Add('INCLUIRAGENTECAUSADOR_44');
    memoTX2.Lines.Add('codAgntCausador_45='+Trim(S2210.Items[I].codAgntCausador_45));
    memoTX2.Lines.Add('SALVARAGENTECAUSADOR_44');
    memoTX2.Lines.Add('codCNES_47='+Trim(S2210.Items[I].codCNES_47));
    memoTX2.Lines.Add('dtAtendimento_48='+Trim(S2210.Items[I].dtAtendimento_48));
    memoTX2.Lines.Add('hrAtendimento_49='+Trim(S2210.Items[I].hrAtendimento_49));
    memoTX2.Lines.Add('indInternacao_50='+Trim(S2210.Items[I].indInternacao_50));
    memoTX2.Lines.Add('durTrat_51='+Trim(S2210.Items[I].durTrat_51));
    memoTX2.Lines.Add('indAfast_52='+Trim(S2210.Items[I].indAfast_52));
    memoTX2.Lines.Add('dscLesao_53='+Trim(S2210.Items[I].dscLesao_53));
    memoTX2.Lines.Add('dscCompLesao_54='+Trim(S2210.Items[I].dscCompLesao_54));
    memoTX2.Lines.Add('diagProvavel_55='+Trim(S2210.Items[I].diagProvavel_55));
    memoTX2.Lines.Add('codCID_56='+Trim(S2210.Items[I].codCID_56));
    memoTX2.Lines.Add('observacao_57='+Trim(S2210.Items[I].observacao_57));
    memoTX2.Lines.Add('nmEmit_59='+Trim(S2210.Items[I].nmEmit_59));
    memoTX2.Lines.Add('ideOC_60='+Trim(S2210.Items[I].ideOC_60));
    memoTX2.Lines.Add('nrOc_61='+Trim(S2210.Items[I].nrOc_61));
    memoTX2.Lines.Add('ufOC_62='+Trim(S2210.Items[I].ufOC_62));
    memoTX2.Lines.Add('dtCatOrig_64='+Trim(S2210.Items[I].dtCatOrig_64));
    memoTX2.Lines.Add('nrCatOrig_65='+Trim(S2210.Items[I].nrCatOrig_65));
    memoTX2.Lines.Add('SALVARS2210');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2230;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2230: TS2230;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2230 := TS2230.Create;
  S2230.GetS2230(ArquivoTXT);
  for I := 0 to Pred(S2230.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2230');
    memoTX2.Lines.Add('indRetif_4='+Trim(S2230.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2230.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2230.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2230.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2230.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2230.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2230.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2230.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('nisTrab_14='+Trim(S2230.Items[I].nisTrab_14));
    memoTX2.Lines.Add('matricula_15='+Trim(S2230.Items[I].matricula_15));
    memoTX2.Lines.Add('codCateg_60='+Trim(S2230.Items[I].codCateg_60));
    memoTX2.Lines.Add('dtIniAfast_18='+Trim(S2230.Items[I].dtIniAfast_18));
    memoTX2.Lines.Add('codMotAfast_19='+Trim(S2230.Items[I].codMotAfast_19));
    memoTX2.Lines.Add('infoMesmoMtv_20='+Trim(S2230.Items[I].infoMesmoMtv_20));
    memoTX2.Lines.Add('tpAcidTransito_21='+Trim(S2230.Items[I].tpAcidTransito_21));
    memoTX2.Lines.Add('observacao_22='+Trim(S2230.Items[I].observacao_22));
    memoTX2.Lines.Add('INCLUIRINFOATESTADO_23');
    memoTX2.Lines.Add('codCID_24='+Trim(S2230.Items[I].codCID_24));
    memoTX2.Lines.Add('qtdDiasAfast_25='+Trim(S2230.Items[I].qtdDiasAfast_25));
    memoTX2.Lines.Add('nmEmit_27='+Trim(S2230.Items[I].nmEmit_27));
    memoTX2.Lines.Add('ideOC_28='+Trim(S2230.Items[I].ideOC_28));
    memoTX2.Lines.Add('nrOc_29='+Trim(S2230.Items[I].nrOc_29));
    memoTX2.Lines.Add('ufOC_30='+Trim(S2230.Items[I].ufOC_30));
    memoTX2.Lines.Add('SALVARINFOATESTADO_23');
    memoTX2.Lines.Add('cnpjCess_32='+Trim(S2230.Items[I].cnpjCess_32));
    memoTX2.Lines.Add('infOnus_33='+Trim(S2230.Items[I].infOnus_33));
    memoTX2.Lines.Add('cnpjSind_35='+Trim(S2230.Items[I].cnpjSind_35));
    memoTX2.Lines.Add('infOnusRemun_36='+Trim(S2230.Items[I].infOnusRemun_36));
    memoTX2.Lines.Add('origRetif_57='+Trim(S2230.Items[I].origRetif_57));
    memoTX2.Lines.Add('tpProc_58='+Trim(S2230.Items[I].tpProc_58));
    memoTX2.Lines.Add('nrProc_59='+Trim(S2230.Items[I].nrProc_59));
    memoTX2.Lines.Add('dtTermAfast_53='+Trim(S2230.Items[I].dtTermAfast_53));
    memoTX2.Lines.Add('SALVARS2230');
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
    memoTX2.Lines.Add('indRetif_4='+Trim(S2250.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2250.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2250.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2250.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2250.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2250.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2250.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2250.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('nisTrab_14='+Trim(S2250.Items[I].nisTrab_14));
    memoTX2.Lines.Add('matricula_15='+Trim(S2250.Items[I].matricula_15));
    memoTX2.Lines.Add('dtAvPrv_18='+Trim(S2250.Items[I].dtAvPrv_18));
    memoTX2.Lines.Add('dtPrevDeslig_19='+Trim(S2250.Items[I].dtPrevDeslig_19));
    memoTX2.Lines.Add('tpAvPrevio_20='+Trim(S2250.Items[I].tpAvPrevio_20));
    memoTX2.Lines.Add('observacao_21='+Trim(S2250.Items[I].observacao_21));
    memoTX2.Lines.Add('dtCancAvPrv_23='+Trim(S2250.Items[I].dtCancAvPrv_23));
    memoTX2.Lines.Add('observacao_24='+Trim(S2250.Items[I].observacao_24));
    memoTX2.Lines.Add('mtvCancAvPrevio_25='+Trim(S2250.Items[I].mtvCancAvPrevio_25));
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
    memoTX2.Lines.Add('indRetif_4='+Trim(S2299.Items[I].indRetif_4));
    memoTX2.Lines.Add('nrRecibo_5='+Trim(S2299.Items[I].nrRecibo_5));
    memoTX2.Lines.Add('tpAmb_6='+Trim(S2299.Items[I].tpAmb_6));
    memoTX2.Lines.Add('procEmi_7='+Trim(S2299.Items[I].procEmi_7));
    memoTX2.Lines.Add('verProc_8='+Trim(S2299.Items[I].verProc_8));
    memoTX2.Lines.Add('tpInsc_10='+Trim(S2299.Items[I].tpInsc_10));
    memoTX2.Lines.Add('nrInsc_11='+Trim(S2299.Items[I].nrInsc_11));
    memoTX2.Lines.Add('cpfTrab_13='+Trim(S2299.Items[I].cpfTrab_13));
    memoTX2.Lines.Add('nisTrab_14='+Trim(S2299.Items[I].nisTrab_14));
    memoTX2.Lines.Add('matricula_15='+Trim(S2299.Items[I].matricula_15));
    memoTX2.Lines.Add('mtvDeslig_17='+Trim(S2299.Items[I].mtvDeslig_17));
    memoTX2.Lines.Add('dtDeslig_18='+Trim(S2299.Items[I].dtDeslig_18));
    memoTX2.Lines.Add('indPagtoAPI_19='+Trim(S2299.Items[I].indPagtoAPI_19));
    memoTX2.Lines.Add('dtProjFimAPI_20='+Trim(S2299.Items[I].dtProjFimAPI_20));
    memoTX2.Lines.Add('pensAlim_21='+Trim(S2299.Items[I].pensAlim_21));
    memoTX2.Lines.Add('percAliment_22='+Trim(S2299.Items[I].percAliment_22));
    memoTX2.Lines.Add('vrAlim_23='+Trim(S2299.Items[I].vrAlim_23));
    memoTX2.Lines.Add('nrCertObito_24='+Trim(S2299.Items[I].nrCertObito_24));
    memoTX2.Lines.Add('nrProcTrab_25='+Trim(S2299.Items[I].nrProcTrab_25));
    memoTX2.Lines.Add('indCumprParc_26='+Trim(S2299.Items[I].indCumprParc_26));
    memoTX2.Lines.Add('INCLUIROBSERVACOES_106');
    memoTX2.Lines.Add('observacao_107='+Trim(S2299.Items[I].observacao_107));
    memoTX2.Lines.Add('SALVAROBSERVACOES_106');
    memoTX2.Lines.Add('cnpjSucessora_29='+Trim(S2299.Items[I].cnpjSucessora_29));
    memoTX2.Lines.Add('cpfSubstituto_98='+Trim(S2299.Items[I].cpfSubstituto_98));
    memoTX2.Lines.Add('dtNascto_99='+Trim(S2299.Items[I].dtNascto_99));
    memoTX2.Lines.Add('INCLUIRDMDEV_31');
    memoTX2.Lines.Add('ideDmDev_32='+Trim(S2299.Items[I].ideDmDev_32));
    memoTX2.Lines.Add('INCLUIRIDEESTABLOT_34');
    memoTX2.Lines.Add('tpInsc_35='+Trim(S2299.Items[I].tpInsc_35));
    memoTX2.Lines.Add('nrInsc_36='+Trim(S2299.Items[I].nrInsc_36));
    memoTX2.Lines.Add('codLotacao_37='+Trim(S2299.Items[I].codLotacao_37));
    memoTX2.Lines.Add('INCLUIRDETVERBAS_38');
    memoTX2.Lines.Add('codRubr_39='+Trim(S2299.Items[I].codRubr_39));
    memoTX2.Lines.Add('ideTabRubr_40='+Trim(S2299.Items[I].ideTabRubr_40));
    memoTX2.Lines.Add('qtdRubr_41='+Trim(S2299.Items[I].qtdRubr_41));
    memoTX2.Lines.Add('fatorRubr_42='+Trim(S2299.Items[I].fatorRubr_42));
    memoTX2.Lines.Add('vrUnit_43='+Trim(S2299.Items[I].vrUnit_43));
    memoTX2.Lines.Add('vrRubr_44='+Trim(S2299.Items[I].vrRubr_44));
    memoTX2.Lines.Add('SALVARDETVERBAS_38');
    memoTX2.Lines.Add('INCLUIRDETOPER_46');
    memoTX2.Lines.Add('cnpjOper_47='+Trim(S2299.Items[I].cnpjOper_47));
    memoTX2.Lines.Add('regANS_48='+Trim(S2299.Items[I].regANS_48));
    memoTX2.Lines.Add('vrPgTit_49='+Trim(S2299.Items[I].vrPgTit_49));
    memoTX2.Lines.Add('INCLUIRDETPLANO_50');
    memoTX2.Lines.Add('tpDep_95='+Trim(S2299.Items[I].tpDep_95));
    memoTX2.Lines.Add('cpfDep_51='+Trim(S2299.Items[I].cpfDep_51));
    memoTX2.Lines.Add('nmDep_52='+Trim(S2299.Items[I].nmDep_52));
    memoTX2.Lines.Add('dtNascto_53='+Trim(S2299.Items[I].dtNascto_53));
    memoTX2.Lines.Add('vlrPgDep_54='+Trim(S2299.Items[I].vlrPgDep_54));
    memoTX2.Lines.Add('SALVARDETPLANO_50');
    memoTX2.Lines.Add('SALVARDETOPER_46');
    memoTX2.Lines.Add('grauExp_56='+Trim(S2299.Items[I].grauExp_56));
    memoTX2.Lines.Add('indSimples_58='+Trim(S2299.Items[I].indSimples_58));
    memoTX2.Lines.Add('SALVARIDEESTABLOT_34');
    memoTX2.Lines.Add('INCLUIRIDEADC_60');
    memoTX2.Lines.Add('dtAcConv_61='+Trim(S2299.Items[I].dtAcConv_61));
    memoTX2.Lines.Add('tpAcConv_62='+Trim(S2299.Items[I].tpAcConv_62));
    memoTX2.Lines.Add('compAcConv_96='+Trim(S2299.Items[I].compAcConv_96));
    memoTX2.Lines.Add('dtEfAcConv_63='+Trim(S2299.Items[I].dtEfAcConv_63));
    memoTX2.Lines.Add('dsc_64='+Trim(S2299.Items[I].dsc_64));
    memoTX2.Lines.Add('INCLUIRIDEPERIODO_65');
    memoTX2.Lines.Add('perRef_66='+Trim(S2299.Items[I].perRef_66));
    memoTX2.Lines.Add('INCLUIRIDEESTABLOT_67');
    memoTX2.Lines.Add('tpInsc_68='+Trim(S2299.Items[I].tpInsc_68));
    memoTX2.Lines.Add('nrInsc_69='+Trim(S2299.Items[I].nrInsc_69));
    memoTX2.Lines.Add('codLotacao_70='+Trim(S2299.Items[I].codLotacao_70));
    memoTX2.Lines.Add('INCLUIRDETVERBAS_71');
    memoTX2.Lines.Add('codRubr_72='+Trim(S2299.Items[I].codRubr_72));
    memoTX2.Lines.Add('ideTabRubr_73='+Trim(S2299.Items[I].ideTabRubr_73));
    memoTX2.Lines.Add('qtdRubr_74='+Trim(S2299.Items[I].qtdRubr_74));
    memoTX2.Lines.Add('fatorRubr_75='+Trim(S2299.Items[I].fatorRubr_75));
    memoTX2.Lines.Add('vrUnit_76='+Trim(S2299.Items[I].vrUnit_76));
    memoTX2.Lines.Add('vrRubr_77='+Trim(S2299.Items[I].vrRubr_77));
    memoTX2.Lines.Add('SALVARDETVERBAS_71');
    memoTX2.Lines.Add('grauExp_79='+Trim(S2299.Items[I].grauExp_79));
    memoTX2.Lines.Add('indSimples_81='+Trim(S2299.Items[I].indSimples_81));
    memoTX2.Lines.Add('SALVARIDEESTABLOT_6');
    memoTX2.Lines.Add('SALVARIDEPERIODO_65');
    memoTX2.Lines.Add('SALVARIDEADC_60');
    memoTX2.Lines.Add('INCLUIRINFOTRABINTERM_100');
    memoTX2.Lines.Add('codConv_101='+Trim(S2299.Items[I].codConv_101));
    memoTX2.Lines.Add('SALVARINFOTRABINTERM_100');
    memoTX2.Lines.Add('SALVARDMDEV_31');
    memoTX2.Lines.Add('INCLUIRPROCJUDTRAB_82');
    memoTX2.Lines.Add('tpTrib_83='+Trim(S2299.Items[I].tpTrib_83));
    memoTX2.Lines.Add('nrProcJud_84='+Trim(S2299.Items[I].nrProcJud_84));
    memoTX2.Lines.Add('codSusp_85='+Trim(S2299.Items[I].codSusp_85));
    memoTX2.Lines.Add('SALVARPROCJUDTRAB_82');
    memoTX2.Lines.Add('indMV_87='+Trim(S2299.Items[I].indMV_87));
    memoTX2.Lines.Add('INCLUIRREMUNOUTREMPR_88');
    memoTX2.Lines.Add('tpInsc_89='+Trim(S2299.Items[I].tpInsc_89));
    memoTX2.Lines.Add('nrInsc_90='+Trim(S2299.Items[I].nrInsc_90));
    memoTX2.Lines.Add('codCateg_91='+Trim(S2299.Items[I].codCateg_91));
    memoTX2.Lines.Add('vlrRemunOE_92='+Trim(S2299.Items[I].vlrRemunOE_92));
    memoTX2.Lines.Add('SALVARREMUNOUTREMPR_88');
    memoTX2.Lines.Add('dtFimQuar_94='+Trim(S2299.Items[I].dtFimQuar_94));
    memoTX2.Lines.Add('INCLUIRCONSIGFGTS_103');
    memoTX2.Lines.Add('insConsig_104='+Trim(S2299.Items[I].insConsig_104));
    memoTX2.Lines.Add('nrContr_105='+Trim(S2299.Items[I].nrContr_105));
    memoTX2.Lines.Add('SALVARCONSIGFGTS_103');
    memoTX2.Lines.Add('SALVARS2299');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2300;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2300: TS2300;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2300 := TS2300.Create;
  S2300.GetS2300(ArquivoTXT);
  for I := 0 to Pred(S2300.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2300');
    memoTX2.Lines.Add('indRetif_4='+IntToStr(StrToInt(Trim(S2300.Items[I].indRetif_4))));
    memoTX2.Lines.Add('nrRecibo_5='+IntToStr(StrToInt(Trim(S2300.Items[I].nrRecibo_5))));
    memoTX2.Lines.Add('tpAmb_6='+IntToStr(StrToInt(Trim(S2300.Items[I].tpAmb_6))));
    memoTX2.Lines.Add('procEmi_7='+IntToStr(StrToInt(Trim(S2300.Items[I].procEmi_7))));
    memoTX2.Lines.Add('verProc_8='+IntToStr(StrToInt(Trim(S2300.Items[I].verProc_8))));
    memoTX2.Lines.Add('tpInsc_10='+IntToStr(StrToInt(Trim(S2300.Items[I].tpInsc_10))));
    memoTX2.Lines.Add('nrInsc_11='+IntToStr(StrToInt(Trim(S2300.Items[I].nrInsc_11))));
    memoTX2.Lines.Add('cpfTrab_13='+IntToStr(StrToInt(Trim(S2300.Items[I].cpfTrab_13))));
    memoTX2.Lines.Add('nisTrab_14='+IntToStr(StrToInt(Trim(S2300.Items[I].nisTrab_14))));
    memoTX2.Lines.Add('nmTrab_15='+IntToStr(StrToInt(Trim(S2300.Items[I].nmTrab_15))));
    memoTX2.Lines.Add('sexo_16='+IntToStr(StrToInt(Trim(S2300.Items[I].sexo_16))));
    memoTX2.Lines.Add('racaCor_17='+IntToStr(StrToInt(Trim(S2300.Items[I].racaCor_17))));
    memoTX2.Lines.Add('estCiv_18='+IntToStr(StrToInt(Trim(S2300.Items[I].estCiv_18))));
    memoTX2.Lines.Add('grauInstr_19='+IntToStr(StrToInt(Trim(S2300.Items[I].grauInstr_19))));
    memoTX2.Lines.Add('nmSoc_20='+IntToStr(StrToInt(Trim(S2300.Items[I].nmSoc_20))));
    memoTX2.Lines.Add('dtNascto_22='+IntToStr(StrToInt(Trim(S2300.Items[I].dtNascto_22))));
    memoTX2.Lines.Add('codMunic_23='+IntToStr(StrToInt(Trim(S2300.Items[I].codMunic_23))));
    memoTX2.Lines.Add('uf_24='+IntToStr(StrToInt(Trim(S2300.Items[I].uf_24))));
    memoTX2.Lines.Add('paisNascto_25='+IntToStr(StrToInt(Trim(S2300.Items[I].paisNascto_25))));
    memoTX2.Lines.Add('paisNac_26='+IntToStr(StrToInt(Trim(S2300.Items[I].paisNac_26))));
    memoTX2.Lines.Add('nmMae_27='+IntToStr(StrToInt(Trim(S2300.Items[I].nmMae_27))));
    memoTX2.Lines.Add('nmPai_28='+IntToStr(StrToInt(Trim(S2300.Items[I].nmPai_28))));
    memoTX2.Lines.Add('nrCtps_31='+IntToStr(StrToInt(Trim(S2300.Items[I].nrCtps_31))));
    memoTX2.Lines.Add('serieCtps_32='+IntToStr(StrToInt(Trim(S2300.Items[I].serieCtps_32))));
    memoTX2.Lines.Add('ufCtps_33='+IntToStr(StrToInt(Trim(S2300.Items[I].ufCtps_33))));
    memoTX2.Lines.Add('nrRic_35='+IntToStr(StrToInt(Trim(S2300.Items[I].nrRic_35))));
    memoTX2.Lines.Add('orgaoEmissor_36='+IntToStr(StrToInt(Trim(S2300.Items[I].orgaoEmissor_36))));
    memoTX2.Lines.Add('dtExped_37='+IntToStr(StrToInt(Trim(S2300.Items[I].dtExped_37))));
    memoTX2.Lines.Add('nrRg_39='+IntToStr(StrToInt(Trim(S2300.Items[I].nrRg_39))));
    memoTX2.Lines.Add('orgaoEmissor_40='+IntToStr(StrToInt(Trim(S2300.Items[I].orgaoEmissor_40))));
    memoTX2.Lines.Add('dtExped_41='+IntToStr(StrToInt(Trim(S2300.Items[I].dtExped_41))));
    memoTX2.Lines.Add('nrRne_43='+IntToStr(StrToInt(Trim(S2300.Items[I].nrRne_43))));
    memoTX2.Lines.Add('orgaoEmissor_44='+IntToStr(StrToInt(Trim(S2300.Items[I].orgaoEmissor_44))));
    memoTX2.Lines.Add('dtExped_45='+IntToStr(StrToInt(Trim(S2300.Items[I].dtExped_45))));
    memoTX2.Lines.Add('nrOc_47='+IntToStr(StrToInt(Trim(S2300.Items[I].nrOc_47))));
    memoTX2.Lines.Add('orgaoEmissor_48='+IntToStr(StrToInt(Trim(S2300.Items[I].orgaoEmissor_48))));
    memoTX2.Lines.Add('dtExped_49='+IntToStr(StrToInt(Trim(S2300.Items[I].dtExped_49))));
    memoTX2.Lines.Add('dtValid_50='+IntToStr(StrToInt(Trim(S2300.Items[I].dtValid_50))));
    memoTX2.Lines.Add('nrRegCnh_52='+IntToStr(StrToInt(Trim(S2300.Items[I].nrRegCnh_52))));
    memoTX2.Lines.Add('dtExped_53='+IntToStr(StrToInt(Trim(S2300.Items[I].dtExped_53))));
    memoTX2.Lines.Add('ufCnh_54='+IntToStr(StrToInt(Trim(S2300.Items[I].ufCnh_54))));
    memoTX2.Lines.Add('dtValid_55='+IntToStr(StrToInt(Trim(S2300.Items[I].dtValid_55))));
    memoTX2.Lines.Add('dtPriHab_56='+IntToStr(StrToInt(Trim(S2300.Items[I].dtPriHab_56))));
    memoTX2.Lines.Add('categoriaCnh_57='+IntToStr(StrToInt(Trim(S2300.Items[I].categoriaCnh_57))));
    memoTX2.Lines.Add('tpLograd_60='+IntToStr(StrToInt(Trim(S2300.Items[I].tpLograd_60))));
    memoTX2.Lines.Add('dscLograd_61='+IntToStr(StrToInt(Trim(S2300.Items[I].dscLograd_61))));
    memoTX2.Lines.Add('nrLograd_62='+IntToStr(StrToInt(Trim(S2300.Items[I].nrLograd_62))));
    memoTX2.Lines.Add('complemento_63='+IntToStr(StrToInt(Trim(S2300.Items[I].complemento_63))));
    memoTX2.Lines.Add('bairro_64='+IntToStr(StrToInt(Trim(S2300.Items[I].bairro_64))));
    memoTX2.Lines.Add('cep_65='+IntToStr(StrToInt(Trim(S2300.Items[I].cep_65))));
    memoTX2.Lines.Add('codMunic_66='+IntToStr(StrToInt(Trim(S2300.Items[I].codMunic_66))));
    memoTX2.Lines.Add('uf_67='+IntToStr(StrToInt(Trim(S2300.Items[I].uf_67))));
    memoTX2.Lines.Add('paisResid_69='+IntToStr(StrToInt(Trim(S2300.Items[I].paisResid_69))));
    memoTX2.Lines.Add('dscLograd_70='+IntToStr(StrToInt(Trim(S2300.Items[I].dscLograd_70))));
    memoTX2.Lines.Add('nrLograd_71='+IntToStr(StrToInt(Trim(S2300.Items[I].nrLograd_71))));
    memoTX2.Lines.Add('complemento_72='+IntToStr(StrToInt(Trim(S2300.Items[I].complemento_72))));
    memoTX2.Lines.Add('bairro_73='+IntToStr(StrToInt(Trim(S2300.Items[I].bairro_73))));
    memoTX2.Lines.Add('nmCid_74='+IntToStr(StrToInt(Trim(S2300.Items[I].nmCid_74))));
    memoTX2.Lines.Add('codPostal_75='+IntToStr(StrToInt(Trim(S2300.Items[I].codPostal_75))));
    memoTX2.Lines.Add('dtChegada_77='+IntToStr(StrToInt(Trim(S2300.Items[I].dtChegada_77))));
    memoTX2.Lines.Add('classTrabEstrang_78='+IntToStr(StrToInt(Trim(S2300.Items[I].classTrabEstrang_78))));
    memoTX2.Lines.Add('casadoBr_79='+IntToStr(StrToInt(Trim(S2300.Items[I].casadoBr_79))));
    memoTX2.Lines.Add('filhosBr_80='+IntToStr(StrToInt(Trim(S2300.Items[I].filhosBr_80))));
    memoTX2.Lines.Add('defFisica_82='+IntToStr(StrToInt(Trim(S2300.Items[I].defFisica_82))));
    memoTX2.Lines.Add('defVisual_83='+IntToStr(StrToInt(Trim(S2300.Items[I].defVisual_83))));
    memoTX2.Lines.Add('defAuditiva_84='+IntToStr(StrToInt(Trim(S2300.Items[I].defAuditiva_84))));
    memoTX2.Lines.Add('defMental_85='+IntToStr(StrToInt(Trim(S2300.Items[I].defMental_85))));
    memoTX2.Lines.Add('defIntelectual_86='+IntToStr(StrToInt(Trim(S2300.Items[I].defIntelectual_86))));
    memoTX2.Lines.Add('reabReadap_87='+IntToStr(StrToInt(Trim(S2300.Items[I].reabReadap_87))));
    memoTX2.Lines.Add('observacao_88='+IntToStr(StrToInt(Trim(S2300.Items[I].observacao_88))));
    memoTX2.Lines.Add('INCLUIRDEPENDENTE_89');
    memoTX2.Lines.Add('tpDep_90='+IntToStr(StrToInt(Trim(S2300.Items[I].tpDep_90))));
    memoTX2.Lines.Add('nmDep_91='+IntToStr(StrToInt(Trim(S2300.Items[I].nmDep_91))));
    memoTX2.Lines.Add('dtNascto_92='+IntToStr(StrToInt(Trim(S2300.Items[I].dtNascto_92))));
    memoTX2.Lines.Add('cpfDep_93='+IntToStr(StrToInt(Trim(S2300.Items[I].cpfDep_93))));
    memoTX2.Lines.Add('depIRRF_94='+IntToStr(StrToInt(Trim(S2300.Items[I].depIRRF_94))));
    memoTX2.Lines.Add('depSF_95='+IntToStr(StrToInt(Trim(S2300.Items[I].depSF_95))));
    memoTX2.Lines.Add('incTrab_97='+IntToStr(StrToInt(Trim(S2300.Items[I].incTrab_97))));
    memoTX2.Lines.Add('SALVARDEPENDENTE_89');
    memoTX2.Lines.Add('fonePrinc_99='+IntToStr(StrToInt(Trim(S2300.Items[I].fonePrinc_99))));
    memoTX2.Lines.Add('foneAlternat_100='+IntToStr(StrToInt(Trim(S2300.Items[I].foneAlternat_100))));
    memoTX2.Lines.Add('emailPrinc_101='+IntToStr(StrToInt(Trim(S2300.Items[I].emailPrinc_101))));
    memoTX2.Lines.Add('emailAlternat_102='+IntToStr(StrToInt(Trim(S2300.Items[I].emailAlternat_102))));
    memoTX2.Lines.Add('cadIni_164='+IntToStr(StrToInt(Trim(S2300.Items[I].cadIni_164))));
    memoTX2.Lines.Add('codCateg_104='+IntToStr(StrToInt(Trim(S2300.Items[I].codCateg_104))));
    memoTX2.Lines.Add('dtInicio_105='+IntToStr(StrToInt(Trim(S2300.Items[I].dtInicio_105))));
    memoTX2.Lines.Add('natAtividade_106='+IntToStr(StrToInt(Trim(S2300.Items[I].natAtividade_106))));
    memoTX2.Lines.Add('codCargo_109='+IntToStr(StrToInt(Trim(S2300.Items[I].codCargo_109))));
    memoTX2.Lines.Add('codFuncao_110='+IntToStr(StrToInt(Trim(S2300.Items[I].codFuncao_110))));
    memoTX2.Lines.Add('vrSalFx_112='+IntToStr(StrToInt(Trim(S2300.Items[I].vrSalFx_112))));
    memoTX2.Lines.Add('undSalFixo_113='+IntToStr(StrToInt(Trim(S2300.Items[I].undSalFixo_113))));
    memoTX2.Lines.Add('dscSalVar_114='+IntToStr(StrToInt(Trim(S2300.Items[I].dscSalVar_114))));
    memoTX2.Lines.Add('opcFGTS_116='+IntToStr(StrToInt(Trim(S2300.Items[I].opcFGTS_116))));
    memoTX2.Lines.Add('dtOpcFGTS_117='+IntToStr(StrToInt(Trim(S2300.Items[I].dtOpcFGTS_117))));
    memoTX2.Lines.Add('categOrig_119='+IntToStr(StrToInt(Trim(S2300.Items[I].categOrig_119))));
    memoTX2.Lines.Add('cnpjOrigem_120='+IntToStr(StrToInt(Trim(S2300.Items[I].cnpjOrigem_120))));
    memoTX2.Lines.Add('dtAdmOrig_121='+IntToStr(StrToInt(Trim(S2300.Items[I].dtAdmOrig_121))));
    memoTX2.Lines.Add('matricOrig_122='+IntToStr(StrToInt(Trim(S2300.Items[I].matricOrig_122))));
    memoTX2.Lines.Add('categOrig_124='+IntToStr(StrToInt(Trim(S2300.Items[I].categOrig_124))));
    memoTX2.Lines.Add('cnpjCednt_125='+IntToStr(StrToInt(Trim(S2300.Items[I].cnpjCednt_125))));
    memoTX2.Lines.Add('matricCed_126='+IntToStr(StrToInt(Trim(S2300.Items[I].matricCed_126))));
    memoTX2.Lines.Add('dtAdmCed_127='+IntToStr(StrToInt(Trim(S2300.Items[I].dtAdmCed_127))));
    memoTX2.Lines.Add('tpRegTrab_128='+IntToStr(StrToInt(Trim(S2300.Items[I].tpRegTrab_128))));
    memoTX2.Lines.Add('tpRegPrev_129='+IntToStr(StrToInt(Trim(S2300.Items[I].tpRegPrev_129))));
    memoTX2.Lines.Add('infOnus_130='+IntToStr(StrToInt(Trim(S2300.Items[I].infOnus_130))));
    memoTX2.Lines.Add('natEstagio_132='+IntToStr(StrToInt(Trim(S2300.Items[I].natEstagio_132))));
    memoTX2.Lines.Add('nivEstagio_133='+IntToStr(StrToInt(Trim(S2300.Items[I].nivEstagio_133))));
    memoTX2.Lines.Add('areaAtuacao_134='+IntToStr(StrToInt(Trim(S2300.Items[I].areaAtuacao_134))));
    memoTX2.Lines.Add('nrApol_135='+IntToStr(StrToInt(Trim(S2300.Items[I].nrApol_135))));
    memoTX2.Lines.Add('vlrBolsa_136='+IntToStr(StrToInt(Trim(S2300.Items[I].vlrBolsa_136))));
    memoTX2.Lines.Add('dtPrevTerm_137='+IntToStr(StrToInt(Trim(S2300.Items[I].dtPrevTerm_137))));
    memoTX2.Lines.Add('cnpjInstEnsino_139='+IntToStr(StrToInt(Trim(S2300.Items[I].cnpjInstEnsino_139))));
    memoTX2.Lines.Add('nmRazao_140='+IntToStr(StrToInt(Trim(S2300.Items[I].nmRazao_140))));
    memoTX2.Lines.Add('dscLograd_141='+IntToStr(StrToInt(Trim(S2300.Items[I].dscLograd_141))));
    memoTX2.Lines.Add('nrLograd_142='+IntToStr(StrToInt(Trim(S2300.Items[I].nrLograd_142))));
    memoTX2.Lines.Add('bairro_143='+IntToStr(StrToInt(Trim(S2300.Items[I].bairro_143))));
    memoTX2.Lines.Add('cep_144='+IntToStr(StrToInt(Trim(S2300.Items[I].cep_144))));
    memoTX2.Lines.Add('codMunic_145='+IntToStr(StrToInt(Trim(S2300.Items[I].codMunic_145))));
    memoTX2.Lines.Add('uf_146='+IntToStr(StrToInt(Trim(S2300.Items[I].uf_146))));
    memoTX2.Lines.Add('cnpjAgntInteg_148='+IntToStr(StrToInt(Trim(S2300.Items[I].cnpjAgntInteg_148))));
    memoTX2.Lines.Add('nmRazao_149='+IntToStr(StrToInt(Trim(S2300.Items[I].nmRazao_149))));
    memoTX2.Lines.Add('dscLograd_150='+IntToStr(StrToInt(Trim(S2300.Items[I].dscLograd_150))));
    memoTX2.Lines.Add('nrLograd_151='+IntToStr(StrToInt(Trim(S2300.Items[I].nrLograd_151))));
    memoTX2.Lines.Add('bairro_152='+IntToStr(StrToInt(Trim(S2300.Items[I].bairro_152))));
    memoTX2.Lines.Add('cep_153='+IntToStr(StrToInt(Trim(S2300.Items[I].cep_153))));
    memoTX2.Lines.Add('codMunic_154='+IntToStr(StrToInt(Trim(S2300.Items[I].codMunic_154))));
    memoTX2.Lines.Add('uf_155='+IntToStr(StrToInt(Trim(S2300.Items[I].uf_155))));
    memoTX2.Lines.Add('cpfSupervisor_157='+IntToStr(StrToInt(Trim(S2300.Items[I].cpfSupervisor_157))));
    memoTX2.Lines.Add('nmSuperv_158='+IntToStr(StrToInt(Trim(S2300.Items[I].nmSuperv_158))));
    memoTX2.Lines.Add('dtIniAfast_160='+IntToStr(StrToInt(Trim(S2300.Items[I].dtIniAfast_160))));
    memoTX2.Lines.Add('codMotAfast_161='+IntToStr(StrToInt(Trim(S2300.Items[I].codMotAfast_161))));
    memoTX2.Lines.Add('dtTerm_163='+IntToStr(StrToInt(Trim(S2300.Items[I].dtTerm_163))));
    memoTX2.Lines.Add('SALVARS2300');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2306;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2306: TS2306;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2306 := TS2306.Create;
  S2306.GetS2306(ArquivoTXT);
  for I := 0 to Pred(S2306.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2306');
    memoTX2.Lines.Add('indRetif_4='+IntToStr(StrToInt(Trim(S2306.Items[I].indRetif_4))));
    memoTX2.Lines.Add('nrRecibo_5='+IntToStr(StrToInt(Trim(S2306.Items[I].nrRecibo_5))));
    memoTX2.Lines.Add('tpAmb_6='+IntToStr(StrToInt(Trim(S2306.Items[I].tpAmb_6))));
    memoTX2.Lines.Add('procEmi_7='+IntToStr(StrToInt(Trim(S2306.Items[I].procEmi_7))));
    memoTX2.Lines.Add('verProc_8='+IntToStr(StrToInt(Trim(S2306.Items[I].verProc_8))));
    memoTX2.Lines.Add('tpInsc_10='+IntToStr(StrToInt(Trim(S2306.Items[I].tpInsc_10))));
    memoTX2.Lines.Add('nrInsc_11='+IntToStr(StrToInt(Trim(S2306.Items[I].nrInsc_11))));
    memoTX2.Lines.Add('cpfTrab_13='+IntToStr(StrToInt(Trim(S2306.Items[I].cpfTrab_13))));
    memoTX2.Lines.Add('nisTrab_14='+IntToStr(StrToInt(Trim(S2306.Items[I].nisTrab_14))));
    memoTX2.Lines.Add('codCateg_15='+IntToStr(StrToInt(Trim(S2306.Items[I].codCateg_15))));
    memoTX2.Lines.Add('dtAlteracao_17='+IntToStr(StrToInt(Trim(S2306.Items[I].dtAlteracao_17))));
    memoTX2.Lines.Add('natAtividade_18='+IntToStr(StrToInt(Trim(S2306.Items[I].natAtividade_18))));
    memoTX2.Lines.Add('codCargo_21='+IntToStr(StrToInt(Trim(S2306.Items[I].codCargo_21))));
    memoTX2.Lines.Add('codFuncao_22='+IntToStr(StrToInt(Trim(S2306.Items[I].codFuncao_22))));
    memoTX2.Lines.Add('vrSalFx_24='+IntToStr(StrToInt(Trim(S2306.Items[I].vrSalFx_24))));
    memoTX2.Lines.Add('undSalFixo_25='+IntToStr(StrToInt(Trim(S2306.Items[I].undSalFixo_25))));
    memoTX2.Lines.Add('dscSalVar_26='+IntToStr(StrToInt(Trim(S2306.Items[I].dscSalVar_26))));
    memoTX2.Lines.Add('natEstagio_28='+IntToStr(StrToInt(Trim(S2306.Items[I].natEstagio_28))));
    memoTX2.Lines.Add('nivEstagio_29='+IntToStr(StrToInt(Trim(S2306.Items[I].nivEstagio_29))));
    memoTX2.Lines.Add('areaAtuacao_30='+IntToStr(StrToInt(Trim(S2306.Items[I].areaAtuacao_30))));
    memoTX2.Lines.Add('nrApol_31='+IntToStr(StrToInt(Trim(S2306.Items[I].nrApol_31))));
    memoTX2.Lines.Add('vlrBolsa_32='+IntToStr(StrToInt(Trim(S2306.Items[I].vlrBolsa_32))));
    memoTX2.Lines.Add('dtPrevTerm_33='+IntToStr(StrToInt(Trim(S2306.Items[I].dtPrevTerm_33))));
    memoTX2.Lines.Add('cnpjInstEnsino_35='+IntToStr(StrToInt(Trim(S2306.Items[I].cnpjInstEnsino_35))));
    memoTX2.Lines.Add('nmRazao_36='+IntToStr(StrToInt(Trim(S2306.Items[I].nmRazao_36))));
    memoTX2.Lines.Add('dscLograd_37='+IntToStr(StrToInt(Trim(S2306.Items[I].dscLograd_37))));
    memoTX2.Lines.Add('nrLograd_38='+IntToStr(StrToInt(Trim(S2306.Items[I].nrLograd_38))));
    memoTX2.Lines.Add('bairro_39='+IntToStr(StrToInt(Trim(S2306.Items[I].bairro_39))));
    memoTX2.Lines.Add('cep_40='+IntToStr(StrToInt(Trim(S2306.Items[I].cep_40))));
    memoTX2.Lines.Add('codMunic_41='+IntToStr(StrToInt(Trim(S2306.Items[I].codMunic_41))));
    memoTX2.Lines.Add('uf_42='+IntToStr(StrToInt(Trim(S2306.Items[I].uf_42))));
    memoTX2.Lines.Add('cnpjAgntInteg_44='+IntToStr(StrToInt(Trim(S2306.Items[I].cnpjAgntInteg_44))));
    memoTX2.Lines.Add('nmRazao_45='+IntToStr(StrToInt(Trim(S2306.Items[I].nmRazao_45))));
    memoTX2.Lines.Add('dscLograd_46='+IntToStr(StrToInt(Trim(S2306.Items[I].dscLograd_46))));
    memoTX2.Lines.Add('nrLograd_47='+IntToStr(StrToInt(Trim(S2306.Items[I].nrLograd_47))));
    memoTX2.Lines.Add('bairro_48='+IntToStr(StrToInt(Trim(S2306.Items[I].bairro_48))));
    memoTX2.Lines.Add('cep_49='+IntToStr(StrToInt(Trim(S2306.Items[I].cep_49))));
    memoTX2.Lines.Add('codMunic_50='+IntToStr(StrToInt(Trim(S2306.Items[I].codMunic_50))));
    memoTX2.Lines.Add('uf_51='+IntToStr(StrToInt(Trim(S2306.Items[I].uf_51))));
    memoTX2.Lines.Add('cpfSupervisor_53='+IntToStr(StrToInt(Trim(S2306.Items[I].cpfSupervisor_53))));
    memoTX2.Lines.Add('nmSuperv_54='+IntToStr(StrToInt(Trim(S2306.Items[I].nmSuperv_54))));
    memoTX2.Lines.Add('SALVARS2306');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2399;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2399: TS2399;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2399 := TS2399.Create;
  S2399.GetS2399(ArquivoTXT);
  for I := 0 to Pred(S2399.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2399');
    memoTX2.Lines.Add('indRetif_4='+IntToStr(StrToInt(Trim(S2399.Items[I].indRetif_4))));
    memoTX2.Lines.Add('nrRecibo_5='+IntToStr(StrToInt(Trim(S2399.Items[I].nrRecibo_5))));
    memoTX2.Lines.Add('tpAmb_6='+IntToStr(StrToInt(Trim(S2399.Items[I].tpAmb_6))));
    memoTX2.Lines.Add('procEmi_7='+IntToStr(StrToInt(Trim(S2399.Items[I].procEmi_7))));
    memoTX2.Lines.Add('verProc_8='+IntToStr(StrToInt(Trim(S2399.Items[I].verProc_8))));
    memoTX2.Lines.Add('tpInsc_10='+IntToStr(StrToInt(Trim(S2399.Items[I].tpInsc_10))));
    memoTX2.Lines.Add('nrInsc_11='+IntToStr(StrToInt(Trim(S2399.Items[I].nrInsc_11))));
    memoTX2.Lines.Add('cpfTrab_13='+IntToStr(StrToInt(Trim(S2399.Items[I].cpfTrab_13))));
    memoTX2.Lines.Add('nisTrab_14='+IntToStr(StrToInt(Trim(S2399.Items[I].nisTrab_14))));
    memoTX2.Lines.Add('codCateg_15='+IntToStr(StrToInt(Trim(S2399.Items[I].codCateg_15))));
    memoTX2.Lines.Add('dtTerm_17='+IntToStr(StrToInt(Trim(S2399.Items[I].dtTerm_17))));
    memoTX2.Lines.Add('mtvDesligTSV_18='+IntToStr(StrToInt(Trim(S2399.Items[I].mtvDesligTSV_18))));
    memoTX2.Lines.Add('INCLUIRDMDEV_20');
    memoTX2.Lines.Add('ideDmDev_21='+IntToStr(StrToInt(Trim(S2399.Items[I].ideDmDev_21))));
    memoTX2.Lines.Add('INCLUIRIDEESTABLOT_22');
    memoTX2.Lines.Add('tpInsc_23='+IntToStr(StrToInt(Trim(S2399.Items[I].tpInsc_23))));
    memoTX2.Lines.Add('nrInsc_24='+IntToStr(StrToInt(Trim(S2399.Items[I].nrInsc_24))));
    memoTX2.Lines.Add('codLotacao_25='+IntToStr(StrToInt(Trim(S2399.Items[I].codLotacao_25))));
    memoTX2.Lines.Add('INCLUIRDETVERBAS_26');
    memoTX2.Lines.Add('codRubr_27='+IntToStr(StrToInt(Trim(S2399.Items[I].codRubr_27))));
    memoTX2.Lines.Add('ideTabRubr_28='+IntToStr(StrToInt(Trim(S2399.Items[I].ideTabRubr_28))));
    memoTX2.Lines.Add('qtdRubr_29='+IntToStr(StrToInt(Trim(S2399.Items[I].qtdRubr_29))));
    memoTX2.Lines.Add('fatorRubr_30='+IntToStr(StrToInt(Trim(S2399.Items[I].fatorRubr_30))));
    memoTX2.Lines.Add('vrUnit_31='+IntToStr(StrToInt(Trim(S2399.Items[I].vrUnit_31))));
    memoTX2.Lines.Add('vrRubr_32='+IntToStr(StrToInt(Trim(S2399.Items[I].vrRubr_32))));
    memoTX2.Lines.Add('SALVARDETVERBAS_26');
    memoTX2.Lines.Add('INCLUIRDETOPER_34');
    memoTX2.Lines.Add('cnpjOper_35='+IntToStr(StrToInt(Trim(S2399.Items[I].cnpjOper_35))));
    memoTX2.Lines.Add('regANS_36='+IntToStr(StrToInt(Trim(S2399.Items[I].regANS_36))));
    memoTX2.Lines.Add('vrPgTit_37='+IntToStr(StrToInt(Trim(S2399.Items[I].vrPgTit_37))));
    memoTX2.Lines.Add('INCLUIRDETPLANO_38');
    memoTX2.Lines.Add('tpDep_60='+IntToStr(StrToInt(Trim(S2399.Items[I].tpDep_60))));
    memoTX2.Lines.Add('cpfDep_39='+IntToStr(StrToInt(Trim(S2399.Items[I].cpfDep_39))));
    memoTX2.Lines.Add('nmDep_40='+IntToStr(StrToInt(Trim(S2399.Items[I].nmDep_40))));
    memoTX2.Lines.Add('dtNascto_41='+IntToStr(StrToInt(Trim(S2399.Items[I].dtNascto_41))));
    memoTX2.Lines.Add('vlrPgDep_42='+IntToStr(StrToInt(Trim(S2399.Items[I].vlrPgDep_42))));
    memoTX2.Lines.Add('SALVARDETPLANO_38');
    memoTX2.Lines.Add('SALVARDETOPER_34');
    memoTX2.Lines.Add('grauExp_44='+IntToStr(StrToInt(Trim(S2399.Items[I].grauExp_44))));
    memoTX2.Lines.Add('indSimples_46='+IntToStr(StrToInt(Trim(S2399.Items[I].indSimples_46))));
    memoTX2.Lines.Add('SALVARIDEESTABLOT_22');
    memoTX2.Lines.Add('SALVARDMDEV_20');
    memoTX2.Lines.Add('INCLUIRPROCJUDTRAB_47');
    memoTX2.Lines.Add('tpTrib_48='+IntToStr(StrToInt(Trim(S2399.Items[I].tpTrib_48))));
    memoTX2.Lines.Add('nrProcJud_49='+IntToStr(StrToInt(Trim(S2399.Items[I].nrProcJud_49))));
    memoTX2.Lines.Add('codSusp_50='+IntToStr(StrToInt(Trim(S2399.Items[I].codSusp_50))));
    memoTX2.Lines.Add('SALVARPROCJUDTRAB_47');
    memoTX2.Lines.Add('indMV_52='+IntToStr(StrToInt(Trim(S2399.Items[I].indMV_52))));
    memoTX2.Lines.Add('INCLUIRREMUNOUTREMPR_53');
    memoTX2.Lines.Add('tpInsc_54='+IntToStr(StrToInt(Trim(S2399.Items[I].tpInsc_54))));
    memoTX2.Lines.Add('nrInsc_55='+IntToStr(StrToInt(Trim(S2399.Items[I].nrInsc_55))));
    memoTX2.Lines.Add('codCateg_56='+IntToStr(StrToInt(Trim(S2399.Items[I].codCateg_56))));
    memoTX2.Lines.Add('vlrRemunOE_57='+IntToStr(StrToInt(Trim(S2399.Items[I].vlrRemunOE_57))));
    memoTX2.Lines.Add('SALVARREMUNOUTREMPR_53');
    memoTX2.Lines.Add('dtFimQuar_59='+IntToStr(StrToInt(Trim(S2399.Items[I].dtFimQuar_59))));
    memoTX2.Lines.Add('SALVARS2399');
  end;
end;

procedure TfrmPrincipal.GeraTX2S2400;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S2400: TS2400;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S2400 := TS2400.Create;
  S2400.GetS2400(ArquivoTXT);
  for I := 0 to Pred(S2400.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS2400');
    memoTX2.Lines.Add('indRetif_4='+IntToStr(StrToInt(Trim(S2400.Items[I].indRetif_4))));
    memoTX2.Lines.Add('nrRecibo_5='+IntToStr(StrToInt(Trim(S2400.Items[I].nrRecibo_5))));
    memoTX2.Lines.Add('tpAmb_6='+IntToStr(StrToInt(Trim(S2400.Items[I].tpAmb_6))));
    memoTX2.Lines.Add('procEmi_7='+IntToStr(StrToInt(Trim(S2400.Items[I].procEmi_7))));
    memoTX2.Lines.Add('verProc_8='+IntToStr(StrToInt(Trim(S2400.Items[I].verProc_8))));
    memoTX2.Lines.Add('tpInsc_10='+IntToStr(StrToInt(Trim(S2400.Items[I].tpInsc_10))));
    memoTX2.Lines.Add('nrInsc_11='+IntToStr(StrToInt(Trim(S2400.Items[I].nrInsc_11))));
    memoTX2.Lines.Add('cpfBenef_13='+IntToStr(StrToInt(Trim(S2400.Items[I].cpfBenef_13))));
    memoTX2.Lines.Add('nmBenefic_14='+IntToStr(StrToInt(Trim(S2400.Items[I].nmBenefic_14))));
    memoTX2.Lines.Add('dtNascto_19='+IntToStr(StrToInt(Trim(S2400.Items[I].dtNascto_19))));
    memoTX2.Lines.Add('codMunic_20='+IntToStr(StrToInt(Trim(S2400.Items[I].codMunic_20))));
    memoTX2.Lines.Add('uf_21='+IntToStr(StrToInt(Trim(S2400.Items[I].uf_21))));
    memoTX2.Lines.Add('paisNascto_22='+IntToStr(StrToInt(Trim(S2400.Items[I].paisNascto_22))));
    memoTX2.Lines.Add('paisNac_23='+IntToStr(StrToInt(Trim(S2400.Items[I].paisNac_23))));
    memoTX2.Lines.Add('nmMae_24='+IntToStr(StrToInt(Trim(S2400.Items[I].nmMae_24))));
    memoTX2.Lines.Add('nmPai_25='+IntToStr(StrToInt(Trim(S2400.Items[I].nmPai_25))));
    memoTX2.Lines.Add('tpLograd_28='+IntToStr(StrToInt(Trim(S2400.Items[I].tpLograd_28))));
    memoTX2.Lines.Add('dscLograd_29='+IntToStr(StrToInt(Trim(S2400.Items[I].dscLograd_29))));
    memoTX2.Lines.Add('nrLograd_30='+IntToStr(StrToInt(Trim(S2400.Items[I].nrLograd_30))));
    memoTX2.Lines.Add('complemento_31='+IntToStr(StrToInt(Trim(S2400.Items[I].complemento_31))));
    memoTX2.Lines.Add('bairro_32='+IntToStr(StrToInt(Trim(S2400.Items[I].bairro_32))));
    memoTX2.Lines.Add('cep_33='+IntToStr(StrToInt(Trim(S2400.Items[I].cep_33))));
    memoTX2.Lines.Add('codMunic_34='+IntToStr(StrToInt(Trim(S2400.Items[I].codMunic_34))));
    memoTX2.Lines.Add('uf_35='+IntToStr(StrToInt(Trim(S2400.Items[I].uf_35))));
    memoTX2.Lines.Add('paisResid_37='+IntToStr(StrToInt(Trim(S2400.Items[I].paisResid_37))));
    memoTX2.Lines.Add('dscLograd_38='+IntToStr(StrToInt(Trim(S2400.Items[I].dscLograd_38))));
    memoTX2.Lines.Add('nrLograd_39='+IntToStr(StrToInt(Trim(S2400.Items[I].nrLograd_39))));
    memoTX2.Lines.Add('complemento_40='+IntToStr(StrToInt(Trim(S2400.Items[I].complemento_40))));
    memoTX2.Lines.Add('bairro_41='+IntToStr(StrToInt(Trim(S2400.Items[I].bairro_41))));
    memoTX2.Lines.Add('nmCid_42='+IntToStr(StrToInt(Trim(S2400.Items[I].nmCid_42))));
    memoTX2.Lines.Add('codPostal_43='+IntToStr(StrToInt(Trim(S2400.Items[I].codPostal_43))));
    memoTX2.Lines.Add('tpPlanRP_45='+IntToStr(StrToInt(Trim(S2400.Items[I].tpPlanRP_45))));
    memoTX2.Lines.Add('tpBenef_47='+IntToStr(StrToInt(Trim(S2400.Items[I].tpBenef_47))));
    memoTX2.Lines.Add('nrBenefic_48='+IntToStr(StrToInt(Trim(S2400.Items[I].nrBenefic_48))));
    memoTX2.Lines.Add('dtIniBenef_49='+IntToStr(StrToInt(Trim(S2400.Items[I].dtIniBenef_49))));
    memoTX2.Lines.Add('vrBenef_50='+IntToStr(StrToInt(Trim(S2400.Items[I].vrBenef_50))));
    memoTX2.Lines.Add('idQuota_52='+IntToStr(StrToInt(Trim(S2400.Items[I].idQuota_52))));
    memoTX2.Lines.Add('cpfInst_53='+IntToStr(StrToInt(Trim(S2400.Items[I].cpfInst_53))));
    memoTX2.Lines.Add('tpBenef_55='+IntToStr(StrToInt(Trim(S2400.Items[I].tpBenef_55))));
    memoTX2.Lines.Add('nrBenefic_56='+IntToStr(StrToInt(Trim(S2400.Items[I].nrBenefic_56))));
    memoTX2.Lines.Add('dtIniBenef_57='+IntToStr(StrToInt(Trim(S2400.Items[I].dtIniBenef_57))));
    memoTX2.Lines.Add('vrBenef_58='+IntToStr(StrToInt(Trim(S2400.Items[I].vrBenef_58))));
    memoTX2.Lines.Add('idQuota_60='+IntToStr(StrToInt(Trim(S2400.Items[I].idQuota_60))));
    memoTX2.Lines.Add('cpfInst_61='+IntToStr(StrToInt(Trim(S2400.Items[I].cpfInst_61))));
    memoTX2.Lines.Add('tpBenef_63='+IntToStr(StrToInt(Trim(S2400.Items[I].tpBenef_63))));
    memoTX2.Lines.Add('nrBenefic_64='+IntToStr(StrToInt(Trim(S2400.Items[I].nrBenefic_64))));
    memoTX2.Lines.Add('dtFimBenef_65='+IntToStr(StrToInt(Trim(S2400.Items[I].dtFimBenef_65))));
    memoTX2.Lines.Add('mtvFim_66='+IntToStr(StrToInt(Trim(S2400.Items[I].mtvFim_66))));
    memoTX2.Lines.Add('SALVARS24000');
  end;
end;

procedure TfrmPrincipal.GeraTX2S3000;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S3000: TS3000;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S3000 := TS3000.Create;
  S3000.GetS3000(ArquivoTXT);
  for I := 0 to Pred(S3000.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS3000');
    memoTX2.Lines.Add('tpAmb_4='+IntToStr(StrToInt(Trim(S3000.Items[I].tpAmb_4))));
    memoTX2.Lines.Add('procEmi_5='+IntToStr(StrToInt(Trim(S3000.Items[I].procEmi_5))));
    memoTX2.Lines.Add('verProc_6='+IntToStr(StrToInt(Trim(S3000.Items[I].verProc_6))));
    memoTX2.Lines.Add('tpInsc_8='+IntToStr(StrToInt(Trim(S3000.Items[I].tpInsc_8))));
    memoTX2.Lines.Add('nrInsc_9='+IntToStr(StrToInt(Trim(S3000.Items[I].nrInsc_9))));
    memoTX2.Lines.Add('tpEvento_11='+IntToStr(StrToInt(Trim(S3000.Items[I].tpEvento_11))));
    memoTX2.Lines.Add('nrRecEvt_12='+IntToStr(StrToInt(Trim(S3000.Items[I].nrRecEvt_12))));
    memoTX2.Lines.Add('cpfTrab_14='+IntToStr(StrToInt(Trim(S3000.Items[I].cpfTrab_14))));
    memoTX2.Lines.Add('nisTrab_15='+IntToStr(StrToInt(Trim(S3000.Items[I].nisTrab_15))));
    memoTX2.Lines.Add('indApuracao_17='+IntToStr(StrToInt(Trim(S3000.Items[I].indApuracao_17))));
    memoTX2.Lines.Add('perApur_18='+IntToStr(StrToInt(Trim(S3000.Items[I].perApur_18))));
    memoTX2.Lines.Add('SALVARS3000');
  end;
end;

procedure TfrmPrincipal.GeraTX2S5002;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S5002: TS5002;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S5002 := TS5002.Create;
  S5002.GetS5002(ArquivoTXT);
  for I := 0 to Pred(S5002.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS5002');
    memoTX2.Lines.Add('perApur_5='+IntToStr(StrToInt(Trim(S5002.Items[I].perApur_5))));
    memoTX2.Lines.Add('tpInsc_7='+IntToStr(StrToInt(Trim(S5002.Items[I].tpInsc_7))));
    memoTX2.Lines.Add('nrInsc_8='+IntToStr(StrToInt(Trim(S5002.Items[I].nrInsc_8))));
    memoTX2.Lines.Add('cpfTrab_10='+IntToStr(StrToInt(Trim(S5002.Items[I].cpfTrab_10))));
    memoTX2.Lines.Add('INCLUIRINFOIRRF_13');
    memoTX2.Lines.Add('indResBr_15='+IntToStr(StrToInt(Trim(S5002.Items[I].indResBr_15))));
    memoTX2.Lines.Add('INCLUIRBASESIRRF_16');
    memoTX2.Lines.Add('tpValor_17='+IntToStr(StrToInt(Trim(S5002.Items[I].tpValor_17))));
    memoTX2.Lines.Add('valor_18='+IntToStr(StrToInt(Trim(S5002.Items[I].valor_18))));
    memoTX2.Lines.Add('SALVARBASESIRRF_16');
    memoTX2.Lines.Add('SALVARINFOIRRF_13');
    memoTX2.Lines.Add('SALVARS5002');
  end;
end;

procedure TfrmPrincipal.GeraTX2S5011;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S5011: TS5011;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S5011 := TS5011.Create;
  S5011.GetS5011(ArquivoTXT);
  for I := 0 to Pred(S5011.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS5011');
    memoTX2.Lines.Add('indApuracao_4='+IntToStr(StrToInt(Trim(S5011.Items[I].indApuracao_4))));
    memoTX2.Lines.Add('perApur_5='+IntToStr(StrToInt(Trim(S5011.Items[I].perApur_5))));
    memoTX2.Lines.Add('tpInsc_7='+IntToStr(StrToInt(Trim(S5011.Items[I].tpInsc_7))));
    memoTX2.Lines.Add('nrInsc_8='+IntToStr(StrToInt(Trim(S5011.Items[I].nrInsc_8))));
    memoTX2.Lines.Add('indExistInfo_11='+IntToStr(StrToInt(Trim(S5011.Items[I].indExistInfo_11))));
    memoTX2.Lines.Add('classTrib_16='+IntToStr(StrToInt(Trim(S5011.Items[I].classTrib_16))));
    memoTX2.Lines.Add('SALVARS5011');
  end;
end;

procedure TfrmPrincipal.GeraTX2S5012;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S5012: TS5012;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  memoTX2.Lines.Clear;
  S5012 := TS5012.Create;
  S5012.GetS5012(ArquivoTXT);
  for I := 0 to Pred(S5012.Count) do
  begin
    memoTX2.Lines.Add('INCLUIRS5012');
    memoTX2.Lines.Add('perApur_4='+IntToStr(StrToInt(Trim(S5012.Items[I].perApur_4))));
    memoTX2.Lines.Add('tpInsc_6='+IntToStr(StrToInt(Trim(S5012.Items[I].tpInsc_6))));
    memoTX2.Lines.Add('nrInsc_7='+IntToStr(StrToInt(Trim(S5012.Items[I].nrInsc_7))));
    memoTX2.Lines.Add('indExistInfo_10='+IntToStr(StrToInt(Trim(S5012.Items[I].indExistInfo_10))));
    memoTX2.Lines.Add('INCLUIRINFOCRCONTRIB_11');
    memoTX2.Lines.Add('tpCR_12='+IntToStr(StrToInt(Trim(S5012.Items[I].tpCR_12))));
    memoTX2.Lines.Add('vrCR_13='+IntToStr(StrToInt(Trim(S5012.Items[I].vrCR_13))));
    memoTX2.Lines.Add('SALVARINFOCRCONTRIB_11');
    memoTX2.Lines.Add('SALVARS5012');
  end;
end;

procedure TfrmPrincipal.RGArqTX2Click(Sender: TObject);
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
             GeraTX2S1035 else
             GeraTX2S1035ALT;
         end;
      6: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1040 else
             GeraTX2S1040ALT;
         end;
      7: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1050 else
             GeraTX2S1050ALT;
         end;
      8: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S1060 else
             GeraTX2S1060ALT;
         end;
      9: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2190 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     10: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2200 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     11: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2205 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     12: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2206 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     13: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2210 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     14: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2230 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     15: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2250 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     16: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2299 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     17: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2205 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     18: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2300 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     19: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2306 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     20: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2399 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     21: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S2400 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     22: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S3000 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     23: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S5002 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     24: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S5011 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
     25: begin
           if (RGTipoTX2.ItemIndex=0) then
             GeraTX2S5012 else
             Application.MessageBox('Não existe arquivo TX2 de alteração.','Atenção',MB_OK+MB_ICONINFORMATION);
         end;
    end;
    frmPrincipal.Enabled := True;
  end;
end;

procedure TfrmPrincipal.SaveTX2(aNameTX2: String);
begin
  if (sDirTX2='') then
    memoTX2.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\'+aNameTX2) else
    memoTX2.Lines.SaveToFile(sDirTX2+'\'+aNameTX2)
end;

end.
