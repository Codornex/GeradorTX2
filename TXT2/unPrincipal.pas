unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.StdCtrls, Contnrs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, IniFiles;

type
  TfrmPrincipal = class(TForm)
    Memo1: TMemo;
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
    procedure GeraTX2S1000;
    procedure GeraTX2S1005;
    procedure GeraTX2S1010;
    procedure GeraTX2S1020;
    procedure GeraTX2S1030;
    procedure GeraTX2S1050;
    procedure GeraTX2S2190;
    procedure GeraTX2S2200;
    procedure sbGeraTx2Click(Sender: TObject);
    procedure sbConfiguracaoClick(Sender: TObject);
    procedure ConfiracoesIniciais;
    procedure RGArqTX2Click(Sender: TObject);
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

uses UTS1000, UTS1005, UTS1010, UTS1020, UTS1030, UTS1050, UTS2190, UTS2200,
     unConfiguracoes;

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
      0: GeraTX2S1000;
      1: GeraTX2S1005;
      2: GeraTX2S1010;
      3: GeraTX2S1020;
      4: GeraTX2S1030;
      5: GeraTX2S1050;
      6: GeraTX2S2190;
      7: GeraTX2S2200;
    end;
    frmPrincipal.Enabled := True;
  end;
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
  Memo1.Lines.Clear;
  S1000 := TS1000.Create;
  S1000.GetS1000(ArquivoTXT);
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
  Memo1.Lines.Clear;
  S1005 := TS1005.Create;
  S1005.GetS1005(ArquivoTXT);
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
end;

procedure TfrmPrincipal.GeraTX2S1010;
var
  Lista: TStringList;
  ArquivoTXT: TStringList;
  I,J: Integer;
  S1010: TS1010;
begin
  ArquivoTXT := TStringList.Create;
  ArquivoTXT.LoadFromFile(FLBOrigem.FileName);
  Memo1.Lines.Clear;
  S1010 := TS1010.Create;
  S1010.GetS1010(ArquivoTXT);
  for I := 0 to Pred(S1010.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1010');
    Memo1.Lines.Add('tpAmb_4 = ' + S1010.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1010.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1010.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1010.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1010.Items[I].nrInsc_9);
    Memo1.Lines.Add('codRubr_13 = ' + S1010.Items[I].codRubr_13);
    Memo1.Lines.Add('ideTabRubr_14 = ' + S1010.Items[I].ideTabRubr_14);
    Memo1.Lines.Add('iniValid_15 = ' + S1010.Items[I].iniValid_15);
    Memo1.Lines.Add('fimValid_16 = ' + S1010.Items[I].fimValid_16);
    Memo1.Lines.Add('dscRubr_18 = ' + S1010.Items[I].dscRubr_18);
    Memo1.Lines.Add('natRubr_19 = ' + S1010.Items[I].natRubr_19);
    Memo1.Lines.Add('tpRubr_20 = ' + S1010.Items[I].tpRubr_20);
    Memo1.Lines.Add('codIncCP_21 = ' + S1010.Items[I].codIncCP_21);
    Memo1.Lines.Add('codIncIRRF_22 = ' + S1010.Items[I].codIncIRRF_22);
    Memo1.Lines.Add('codIncFGTS_23 = ' + S1010.Items[I].codIncFGTS_23);
    Memo1.Lines.Add('codIncSIND_24 = ' + S1010.Items[I].codIncSIND_24);
    Memo1.Lines.Add('observacao_29 = ' + S1010.Items[I].observacao_29);
    Memo1.Lines.Add('SALVARS1010');
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
  Memo1.Lines.Clear;
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
  Memo1.Lines.Clear;
  S1030 := TS1030.Create;
  S1030.GetS1030(ArquivoTXT);
  for I := 0 to Pred(S1030.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1030');
    Memo1.Lines.Add('tpAmb_4 = ' + S1030.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1030.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1030.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1030.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1030.Items[I].nrInsc_9);
    Memo1.Lines.Add('codCargo_13 = ' + S1030.Items[I].codCargo_13);
    Memo1.Lines.Add('iniValid_14 = ' + S1030.Items[I].iniValid_14);
    Memo1.Lines.Add('fimValid_15 = ' + S1030.Items[I].fimValid_15);
    Memo1.Lines.Add('nmCargo_17 = ' + S1030.Items[I].nmCargo_17);
    Memo1.Lines.Add('codCBO_18 = ' + S1030.Items[I].codCBO_18);
    Memo1.Lines.Add('SALVARS1030');
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
  Memo1.Lines.Clear;
  S1050 := TS1050.Create;
  S1050.GetS1050(ArquivoTXT);
  for I := 0 to Pred(S1050.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS1050');
    Memo1.Lines.Add('tpAmb_4 = ' + S1050.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S1050.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S1050.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S1050.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S1050.Items[I].nrInsc_9);
    Memo1.Lines.Add('codHorContrat_13 = ' + S1050.Items[I].codHorContrat_13);
    Memo1.Lines.Add('iniValid_14 = ' + S1050.Items[I].iniValid_14);
    Memo1.Lines.Add('fimValid_15 = ' + S1050.Items[I].fimValid_15);
    Memo1.Lines.Add('hrEntr_17 = ' + S1050.Items[I].hrEntr_17);
    Memo1.Lines.Add('hrSaida_18 = ' + S1050.Items[I].hrSaida_18);
    Memo1.Lines.Add('durJornada_19 = ' + S1050.Items[I].durJornada_19);
    Memo1.Lines.Add('perHorFlexivel_20 = ' + S1050.Items[I].perHorFlexivel_20);
    Memo1.Lines.Add('INCLUIRHORARIOINTERVALO_21');
    Memo1.Lines.Add('tpInterv_22 = ' + S1050.Items[I].tpInterv_22);
    Memo1.Lines.Add('durInterv_23 = ' + S1050.Items[I].durInterv_23);
    Memo1.Lines.Add('iniInterv_24 = ' + S1050.Items[I].iniInterv_24);
    Memo1.Lines.Add('termInterv_25 = ' + S1050.Items[I].termInterv_25);
    Memo1.Lines.Add('SALVARHORARIOINTERVALO_21');
    Memo1.Lines.Add('SALVARS1050');
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
  Memo1.Lines.Clear;
  S2190 := TS2190.Create;
  S2190.GetS2190(ArquivoTXT);
  for I := 0 to Pred(S2190.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS2190');
    Memo1.Lines.Add('tpAmb_4 = ' + S2190.Items[I].tpAmb_4);
    Memo1.Lines.Add('procEmi_5 = ' + S2190.Items[I].procEmi_5);
    Memo1.Lines.Add('verProc_6 = ' + S2190.Items[I].verProc_6);
    Memo1.Lines.Add('tpInsc_8 = ' + S2190.Items[I].tpInsc_8);
    Memo1.Lines.Add('nrInsc_9 = ' + S2190.Items[I].nrInsc_9);
    Memo1.Lines.Add('cpfTrab_11 = ' + S2190.Items[I].cpfTrab_11);
    Memo1.Lines.Add('dtNascto_12 = ' + S2190.Items[I].dtNascto_12);
    Memo1.Lines.Add('dtAdm_13 = ' + S2190.Items[I].dtAdm_13);
    Memo1.Lines.Add('SALVARS2190');
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
  Memo1.Lines.Clear;
  S2200 := TS2200.Create;
  S2200.GetS2200(ArquivoTXT);
  for I := 0 to Pred(S2200.Count) do
  begin
    Memo1.Lines.Add('INCLUIRS2200');
    Memo1.Lines.Add('indRetif_4= ' + S2200.Items[I].indRetif_4);
    Memo1.Lines.Add('tpAmb_6= ' + S2200.Items[I].tpAmb_6);
    Memo1.Lines.Add('procEmi_7= ' + S2200.Items[I].procEmi_7);
    Memo1.Lines.Add('verProc_8= ' + S2200.Items[I].verProc_8);
    Memo1.Lines.Add('tpInsc_10= ' + S2200.Items[I].tpInsc_10);
    Memo1.Lines.Add('nrInsc_11= ' + S2200.Items[I].nrInsc_11);
    Memo1.Lines.Add('cpfTrab_13= ' + S2200.Items[I].cpfTrab_13);
    Memo1.Lines.Add('nisTrab_14= ' + S2200.Items[I].nisTrab_14);
    Memo1.Lines.Add('nmTrab_15= ' + S2200.Items[I].nmTrab_15);
    Memo1.Lines.Add('sexo_16= ' + S2200.Items[I].sexo_16);
    Memo1.Lines.Add('racaCor_17= ' + S2200.Items[I].racaCor_17);
    Memo1.Lines.Add('estCiv_18= ' + S2200.Items[I].estCiv_18);
    Memo1.Lines.Add('grauInstr_19= ' + S2200.Items[I].grauInstr_19);
    Memo1.Lines.Add('indPriEmpr_20= ' + S2200.Items[I].indPriEmpr_20);
    Memo1.Lines.Add('dtNascto_23= ' + S2200.Items[I].dtNascto_23);
    Memo1.Lines.Add('codMunic_24= ' + S2200.Items[I].codMunic_24);
    Memo1.Lines.Add('uf_25= ' + S2200.Items[I].uf_25);
    Memo1.Lines.Add('paisNascto_26= ' + S2200.Items[I].paisNascto_26);
    Memo1.Lines.Add('paisNac_27= ' + S2200.Items[I].paisNac_27);
    Memo1.Lines.Add('nmMae_28= ' + S2200.Items[I].nmMae_28);
    Memo1.Lines.Add('nmPai_29= ' + S2200.Items[I].nmPai_29);
    Memo1.Lines.Add('nrCtps_32= ' + S2200.Items[I].nrCtps_32);
    Memo1.Lines.Add('serieCtps_33= ' + S2200.Items[I].serieCtps_33);
    Memo1.Lines.Add('ufCtps_34= ' + S2200.Items[I].ufCtps_34);
    Memo1.Lines.Add('nrRg_40= ' + S2200.Items[I].nrRg_40);
    Memo1.Lines.Add('orgaoEmissor_41= ' + S2200.Items[I].orgaoEmissor_41);
    Memo1.Lines.Add('dtExped_42= ' + S2200.Items[I].dtExped_42);
    Memo1.Lines.Add('nrRegCnh_53= ' + S2200.Items[I].nrRegCnh_53);
    Memo1.Lines.Add('dtExped_54= ' + S2200.Items[I].dtExped_54);
    Memo1.Lines.Add('ufCnh_55= ' + S2200.Items[I].ufCnh_55);
    Memo1.Lines.Add('dtValid_56= ' + S2200.Items[I].dtValid_56);
    Memo1.Lines.Add('dtPriHab_57= ' + S2200.Items[I].dtPriHab_57);
    Memo1.Lines.Add('categoriaCnh_58= ' + S2200.Items[I].categoriaCnh_58);
    Memo1.Lines.Add('tpLograd_61= ' + S2200.Items[I].tpLograd_61);
    Memo1.Lines.Add('dscLograd_62= ' + S2200.Items[I].dscLograd_62);
    Memo1.Lines.Add('nrLograd_63= ' + S2200.Items[I].nrLograd_63);
    Memo1.Lines.Add('bairro_65= ' + S2200.Items[I].bairro_65);
    Memo1.Lines.Add('cep_66= ' + S2200.Items[I].cep_66);
    Memo1.Lines.Add('codMunic_67= ' + S2200.Items[I].codMunic_67);
    Memo1.Lines.Add('uf_68= ' + S2200.Items[I].uf_68);
    Memo1.Lines.Add('defFisica_83= ' + S2200.Items[I].defFisica_83);
    Memo1.Lines.Add('defVisual_84= ' + S2200.Items[I].defVisual_84);
    Memo1.Lines.Add('defAuditiva_85= ' + S2200.Items[I].defAuditiva_85);
    Memo1.Lines.Add('defMental_86= ' + S2200.Items[I].defMental_86);
    Memo1.Lines.Add('defIntelectual_87= ' + S2200.Items[I].defIntelectual_87);
    Memo1.Lines.Add('reabReadap_88= ' + S2200.Items[I].reabReadap_88);
    Memo1.Lines.Add('infoCota_89= ' + S2200.Items[I].infoCota_89);
    Memo1.Lines.Add('INCLUIRDEPENDENTE_91');
    Memo1.Lines.Add('tpDep_92= ' + S2200.Items[I].tpDep_92);
    Memo1.Lines.Add('nmDep_93= ' + S2200.Items[I].nmDep_93);
    Memo1.Lines.Add('dtNascto_94= ' + S2200.Items[I].dtNascto_94);
    Memo1.Lines.Add('cpfDep_95= ' + S2200.Items[I].cpfDep_95);
    Memo1.Lines.Add('depIRRF_96= ' + S2200.Items[I].depIRRF_96);
    Memo1.Lines.Add('depSF_97= ' + S2200.Items[I].depSF_97);
    Memo1.Lines.Add('incTrab_99= ' + S2200.Items[I].incTrab_99);
    Memo1.Lines.Add('SALVARDEPENDENTE_91');
    Memo1.Lines.Add('INCLUIRDEPENDENTE_91');
    Memo1.Lines.Add('tpDep_92= ' + S2200.Items[I].tpDep_92);
    Memo1.Lines.Add('nmDep_93= ' + S2200.Items[I].nmDep_93);
    Memo1.Lines.Add('dtNascto_94= ' + S2200.Items[I].dtNascto_94);
    Memo1.Lines.Add('cpfDep_95= ' + S2200.Items[I].cpfDep_95);
    Memo1.Lines.Add('depIRRF_96= ' + S2200.Items[I].depIRRF_96);
    Memo1.Lines.Add('depSF_97= ' + S2200.Items[I].depSF_97);
    Memo1.Lines.Add('incTrab_99= ' + S2200.Items[I].incTrab_99);
    Memo1.Lines.Add('SALVARDEPENDENTE_91');
    Memo1.Lines.Add('trabAposent_101= ' + S2200.Items[I].trabAposent_101);
    Memo1.Lines.Add('fonePrinc_103= ' + S2200.Items[I].fonePrinc_103);
    Memo1.Lines.Add('matricula_108= ' + S2200.Items[I].matricula_108);
    Memo1.Lines.Add('tpRegTrab_109= ' + S2200.Items[I].tpRegTrab_109);
    Memo1.Lines.Add('tpRegPrev_110= ' + S2200.Items[I].tpRegPrev_110);
    Memo1.Lines.Add('cadIni_197= ' + S2200.Items[I].cadIni_197);
    Memo1.Lines.Add('dtAdm_114= ' + S2200.Items[I].dtAdm_114);
    Memo1.Lines.Add('tpAdmissao_115= ' + S2200.Items[I].tpAdmissao_115);
    Memo1.Lines.Add('indAdmissao_116= ' + S2200.Items[I].indAdmissao_116);
    Memo1.Lines.Add('tpRegJor_117= ' + S2200.Items[I].tpRegJor_117);
    Memo1.Lines.Add('natAtividade_118= ' + S2200.Items[I].natAtividade_118);
    Memo1.Lines.Add('dtBase_119= ' + S2200.Items[I].dtBase_119);
    Memo1.Lines.Add('cnpjSindCategProf_120= ' + S2200.Items[I].cnpjSindCategProf_120);
    Memo1.Lines.Add('opcFGTS_122= ' + S2200.Items[I].opcFGTS_122);
    Memo1.Lines.Add('dtOpcFGTS_123= ' + S2200.Items[I].dtOpcFGTS_123);
    Memo1.Lines.Add('codCargo_150= ' + S2200.Items[I].codCargo_150);
    Memo1.Lines.Add('codFuncao_151= ' + S2200.Items[I].codFuncao_151);
    Memo1.Lines.Add('codCateg_152= ' + S2200.Items[I].codCateg_152);
    Memo1.Lines.Add('vrSalFx_155= ' + S2200.Items[I].vrSalFx_155);
    Memo1.Lines.Add('undSalFixo_156= ' + S2200.Items[I].undSalFixo_156);
    Memo1.Lines.Add('tpContr_159= ' + S2200.Items[I].tpContr_159);
    Memo1.Lines.Add('tpInsc_163= ' + S2200.Items[I].tpInsc_163);
    Memo1.Lines.Add('nrInsc_164= ' + S2200.Items[I].nrInsc_164);
    Memo1.Lines.Add('tpLograd_167= ' + S2200.Items[I].tpLograd_167);
    Memo1.Lines.Add('dscLograd_168= ' + S2200.Items[I].dscLograd_168);
    Memo1.Lines.Add('nrLograd_169= ' + S2200.Items[I].nrLograd_169);
    Memo1.Lines.Add('bairro_171= ' + S2200.Items[I].bairro_171);
    Memo1.Lines.Add('cep_172= ' + S2200.Items[I].cep_172);
    Memo1.Lines.Add('codMunic_173= ' + S2200.Items[I].codMunic_173);
    Memo1.Lines.Add('uf_174= ' + S2200.Items[I].uf_174);
    Memo1.Lines.Add('qtdHrsSem_176= ' + S2200.Items[I].qtdHrsSem_176);
    Memo1.Lines.Add('tpJornada_177= ' + S2200.Items[I].tpJornada_177);
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRHORARIO_180');
    Memo1.Lines.Add('dia_181= ' + S2200.Items[I].dia_181);
    Memo1.Lines.Add('codHorContrat_182= ' + S2200.Items[I].codHorContrat_182);
    Memo1.Lines.Add('SALVARHORARIO_180');
    Memo1.Lines.Add('INCLUIRFILIACAOSINDICAL_183');
    Memo1.Lines.Add('cnpjSindTrab_184= ' + S2200.Items[I].cnpjSindTrab_184);
    Memo1.Lines.Add('SALVARFILIACAOSINDICAL_183');
    Memo1.Lines.Add('INCLUIROBSERVACAO_204');
    Memo1.Lines.Add('observacao_205= ' + S2200.Items[I].observacao_205);
    Memo1.Lines.Add('SALVAROBSERVACAO_204');
    Memo1.Lines.Add('SALVARS2200');
  end;
end;

procedure TfrmPrincipal.RGArqTX2Click(Sender: TObject);
begin
  if (FLBOrigem.Count=1) then
  begin
    FLBOrigem.Selected[0] := True;
  end;
end;

end.
