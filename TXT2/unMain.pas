unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.FileCtrl;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbESocial: TGroupBox;
    tvESocial: TTreeView;
    ImageList1: TImageList;
    gbArqTXT: TGroupBox;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    gbArqTX2: TGroupBox;
    memoTX2: TMemo;
    sbGeraTx2: TSpeedButton;
    sbCopiarTX2: TSpeedButton;
    GroupBox1: TGroupBox;
    cbCertificado: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Empresa: TLabel;
    cbEmpresa: TComboBox;
    edtMes: TEdit;
    edtAno: TEdit;
    Label2: TLabel;
    sbConfig: TSpeedButton;
    rbInclusao: TRadioButton;
    rbAlteracao: TRadioButton;
    gbArqTXTOrigem: TGroupBox;
    FLBOrigem: TFileListBox;
    procedure GeraTX2S1000;
    procedure GeraTX2S1000ALT;
    procedure GeraTX2S1005;
    procedure GeraTX2S1010;
    procedure GeraTX2S1020;
    procedure GeraTX2S1030;
    procedure GeraTX2S1050;
    procedure GeraTX2S2190;
    procedure GeraTX2S2200;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbConfigClick(Sender: TObject);
    procedure tvESocialDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  sDirTX2: String;

implementation

{$R *.dfm}

uses UTS1000, UTS1000ALT, UTS1005, UTS1010, UTS1020, UTS1030, UTS1050, UTS2190, UTS2200,
     unConfiguracoes;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  tvESocial.Items.Item[1].ImageIndex := 1;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  edtMes.Text := FormatDateTime('MM',Now);
  edtAno.Text := FormatDateTime('YYYY',Now);
end;

procedure TfrmMain.sbConfigClick(Sender: TObject);
begin
  frmConfiguracoes := TfrmConfiguracoes.Create(frmConfiguracoes);
  frmConfiguracoes.ShowModal;
  FreeAndNil(frmConfiguracoes);
end;

procedure TfrmMain.tvESocialDblClick(Sender: TObject);
begin
  case (tvESocial.Selected.Index) of
    0: begin
         if (rbInclusao.Checked) then
           GeraTX2S1000 else
           GeraTX2S1000ALT;
       end;
    1: begin
         if (rbInclusao.Checked) then
           GeraTX2S1005;
       end;
    2: begin
         if (rbInclusao.Checked) then
           GeraTX2S1010;
       end;
    3: begin
         if (rbInclusao.Checked) then
           GeraTX2S1020;
       end;
    4: begin
         if (rbInclusao.Checked) then
           GeraTX2S1030;
       end;
    5: begin
         if (rbInclusao.Checked) then
           GeraTX2S1050;
       end;
    6: begin
         if (rbInclusao.Checked) then
           GeraTX2S2190;
       end;
    7: begin
         if (rbInclusao.Checked) then
           GeraTX2S2200;
       end;
  end;
end;

procedure TfrmMain.GeraTX2S1000;
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

procedure TfrmMain.GeraTX2S1000ALT;
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

procedure TfrmMain.GeraTX2S1005;
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

procedure TfrmMain.GeraTX2S1010;
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

procedure TfrmMain.GeraTX2S1020;
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

procedure TfrmMain.GeraTX2S1030;
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

procedure TfrmMain.GeraTX2S1050;
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

procedure TfrmMain.GeraTX2S2190;
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

procedure TfrmMain.GeraTX2S2200;
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

end.
