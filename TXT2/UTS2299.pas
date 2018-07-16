unit UTS2299;

interface

uses
  Contnrs, System.Classes;

type
  TS2299 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2299;
    function Add: TS2299;
  public
    indRetif_4: String;
    nrRecibo_5: String;
    tpAmb_6: String;
    procEmi_7: String;
    verProc_8: String;
    tpInsc_10: String;
    nrInsc_11: String;
    cpfTrab_13: String;
    nisTrab_14: String;
    matricula_15: String;
    mtvDeslig_17: String;
    dtDeslig_18: String;
    indPagtoAPI_19: String;
    dtProjFimAPI_20: String;
    pensAlim_21: String;
    percAliment_22: String;
    vrAlim_23: String;
    nrCertObito_24: String;
    nrProcTrab_25: String;
    indCumprParc_26: String;
    INCLUIROBSERVACOES_106: String;
    observacao_107: String;
    SALVAROBSERVACOES_106: String;
    cnpjSucessora_29: String;
    cpfSubstituto_98: String;
    dtNascto_99: String;
    INCLUIRDMDEV_31: String;
    ideDmDev_32: String;
    INCLUIRIDEESTABLOT_34: String;
    tpInsc_35: String;
    nrInsc_36: String;
    codLotacao_37: String;
    INCLUIRDETVERBAS_38: String;
    codRubr_39: String;
    ideTabRubr_40: String;
    qtdRubr_41: String;
    fatorRubr_42: String;
    vrUnit_43: String;
    vrRubr_44: String;
    SALVARDETVERBAS_38: String;
    INCLUIRDETOPER_46: String;
    cnpjOper_47: String;
    regANS_48: String;
    vrPgTit_49: String;
    INCLUIRDETPLANO_50: String;
    tpDep_95: String;
    cpfDep_51: String;
    nmDep_52: String;
    dtNascto_53: String;
    vlrPgDep_54: String;
    SALVARDETPLANO_50: String;
    SALVARDETOPER_46: String;
    grauExp_56: String;
    indSimples_58: String;
    SALVARIDEESTABLOT_34: String;
    INCLUIRIDEADC_60: String;
    dtAcConv_61: String;
    tpAcConv_62: String;
    compAcConv_96: String;
    dtEfAcConv_63: String;
    dsc_64: String;
    INCLUIRIDEPERIODO_65: String;
    perRef_66: String;
    INCLUIRIDEESTABLOT_67: String;
    tpInsc_68: String;
    nrInsc_69: String;
    codLotacao_70: String;
    INCLUIRDETVERBAS_71: String;
    codRubr_72: String;
    ideTabRubr_73: String;
    qtdRubr_74: String;
    fatorRubr_75: String;
    vrUnit_76: String;
    vrRubr_77: String;
    SALVARDETVERBAS_71: String;
    grauExp_79: String;
    indSimples_81: String;
    SALVARIDEESTABLOT_6: String;
    SALVARIDEPERIODO_65: String;
    SALVARIDEADC_60: String;
    INCLUIRINFOTRABINTERM_100: String;
    codConv_101: String;
    SALVARINFOTRABINTERM_100: String;
    SALVARDMDEV_31: String;
    INCLUIRPROCJUDTRAB_82: String;
    tpTrib_83: String;
    nrProcJud_84: String;
    codSusp_85: String;
    SALVARPROCJUDTRAB_82: String;
    indMV_87: String;
    INCLUIRREMUNOUTREMPR_88: String;
    tpInsc_89: String;
    nrInsc_90: String;
    codCateg_91: String;
    vlrRemunOE_92: String;
    SALVARREMUNOUTREMPR_88: String;
    dtFimQuar_94: String;
    INCLUIRCONSIGFGTS_103: String;
    insConsig_104: String;
    nrContr_105: String;
    SALVARCONSIGFGTS_103: String;
    property Items[Index: Integer]: TS2299 read GetItem; default;
    procedure GetS2299(const Arq: TStringList);
  end;

implementation

{ TS1010 }

function TS2299.Add: TS2299;
begin
  Result := TS2299.Create;
  inherited Add(Result);
end;

function TS2299.GetItem(Index: Integer): TS2299;
begin
  Result := TS2299(inherited Items[Index]);
end;

procedure TS2299.GetS2299(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2299'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        indRetif_4 := Lista[1];
        nrRecibo_5 := Lista[2];
        tpAmb_6 := Lista[3];
        procEmi_7 := Lista[4];
        verProc_8 := Lista[5];
        tpInsc_10 := Lista[6];
        nrInsc_11 := Lista[7];
        cpfTrab_13 := Lista[8];
        nisTrab_14 := Lista[9];
        matricula_15 := Lista[10];
        mtvDeslig_17 := Lista[11];
        dtDeslig_18 := Lista[12];
        indPagtoAPI_19 := Lista[13];
        dtProjFimAPI_20 := Lista[14];
        pensAlim_21 := Lista[15];
        percAliment_22 := Lista[16];
        vrAlim_23 := Lista[17];
        nrCertObito_24 := Lista[18];
        nrProcTrab_25 := Lista[19];
        indCumprParc_26 := Lista[20];
        INCLUIROBSERVACOES_106 := Lista[21];
        observacao_107 := Lista[22];
        SALVAROBSERVACOES_106 := Lista[23];
        cnpjSucessora_29 := Lista[24];
        cpfSubstituto_98 := Lista[25];
        dtNascto_99 := Lista[26];
        INCLUIRDMDEV_31 := Lista[27];
        ideDmDev_32 := Lista[28];
        INCLUIRIDEESTABLOT_34 := Lista[29];
        tpInsc_35 := Lista[30];
        nrInsc_36 := Lista[31];
        codLotacao_37 := Lista[32];
        INCLUIRDETVERBAS_38 := Lista[33];
        codRubr_39 := Lista[34];
        ideTabRubr_40 := Lista[35];
        qtdRubr_41 := Lista[36];
        fatorRubr_42 := Lista[37];
        vrUnit_43 := Lista[38];
        vrRubr_44 := Lista[39];
        SALVARDETVERBAS_38 := Lista[40];
        INCLUIRDETOPER_46 := Lista[41];
        cnpjOper_47 := Lista[42];
        regANS_48 := Lista[43];
        vrPgTit_49 := Lista[44];
        INCLUIRDETPLANO_50 := Lista[45];
        tpDep_95 := Lista[46];
        cpfDep_51 := Lista[47];
        nmDep_52 := Lista[48];
        dtNascto_53 := Lista[49];
        vlrPgDep_54 := Lista[50];
        SALVARDETPLANO_50 := Lista[51];
        SALVARDETOPER_46 := Lista[52];
        grauExp_56 := Lista[53];
        indSimples_58 := Lista[54];
        SALVARIDEESTABLOT_34 := Lista[55];
        INCLUIRIDEADC_60 := Lista[56];
        dtAcConv_61 := Lista[57];
        tpAcConv_62 := Lista[58];
        compAcConv_96 := Lista[59];
        dtEfAcConv_63 := Lista[60];
        dsc_64 := Lista[61];
        INCLUIRIDEPERIODO_65 := Lista[62];
        perRef_66 := Lista[63];
        INCLUIRIDEESTABLOT_67 := Lista[64];
        tpInsc_68 := Lista[65];
        nrInsc_69 := Lista[66];
        codLotacao_70 := Lista[67];
        INCLUIRDETVERBAS_71 := Lista[68];
        codRubr_72 := Lista[69];
        ideTabRubr_73 := Lista[70];
        qtdRubr_74 := Lista[71];
        fatorRubr_75 := Lista[72];
        vrUnit_76 := Lista[73];
        vrRubr_77 := Lista[74];
        SALVARDETVERBAS_71 := Lista[75];
        grauExp_79 := Lista[76];
        indSimples_81 := Lista[77];
        SALVARIDEESTABLOT_6 := Lista[78];
        SALVARIDEPERIODO_65 := Lista[79];
        SALVARIDEADC_60 := Lista[80];
        INCLUIRINFOTRABINTERM_100 := Lista[81];
        codConv_101 := Lista[82];
        SALVARINFOTRABINTERM_100 := Lista[83];
        SALVARDMDEV_31 := Lista[84];
        INCLUIRPROCJUDTRAB_82 := Lista[85];
        tpTrib_83 := Lista[86];
        nrProcJud_84 := Lista[87];
        codSusp_85 := Lista[88];
        SALVARPROCJUDTRAB_82 := Lista[89];
        indMV_87 := Lista[90];
        INCLUIRREMUNOUTREMPR_88 := Lista[91];
        tpInsc_89 := Lista[92];
        nrInsc_90 := Lista[93];
        codCateg_91 := Lista[94];
        vlrRemunOE_92 := Lista[95];
        SALVARREMUNOUTREMPR_88 := Lista[96];
        dtFimQuar_94 := Lista[97];
        INCLUIRCONSIGFGTS_103 := Lista[98];
        insConsig_104 := Lista[99];
        nrContr_105 := Lista[100];
        SALVARCONSIGFGTS_103 := Lista[101];

      end;
      Lista.Free;
    end;
end;

end.
