unit UTS2299;

interface

uses
  Contnrs, System.Classes, unUtils;

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
    observacao_107: String;
    cnpjSucessora_29: String;
    cpfSubstituto_98: String;
    dtNascto_99: String;
    ideDmDev_32: String;
    tpInsc_35: String;
    nrInsc_36: String;
    codLotacao_37: String;
    codRubr_39: String;
    ideTabRubr_40: String;
    qtdRubr_41: String;
    fatorRubr_42: String;
    vrUnit_43: String;
    vrRubr_44: String;
    cnpjOper_47: String;
    regANS_48: String;
    vrPgTit_49: String;
    tpDep_95: String;
    cpfDep_51: String;
    nmDep_52: String;
    dtNascto_53: String;
    vlrPgDep_54: String;
    grauExp_56: String;
    indSimples_58: String;
    dtAcConv_61: String;
    tpAcConv_62: String;
    compAcConv_96: String;
    dtEfAcConv_63: String;
    dsc_64: String;
    perRef_66: String;
    tpInsc_68: String;
    nrInsc_69: String;
    codLotacao_70: String;
    codRubr_72: String;
    ideTabRubr_73: String;
    qtdRubr_74: String;
    fatorRubr_75: String;
    vrUnit_76: String;
    vrRubr_77: String;
    grauExp_79: String;
    indSimples_81: String;
    codConv_101: String;
    tpTrib_83: String;
    nrProcJud_84: String;
    codSusp_85: String;
    indMV_87: String;
    tpInsc_89: String;
    nrInsc_90: String;
    codCateg_91: String;
    vlrRemunOE_92: String;
    dtFimQuar_94: String;
    insConsig_104: String;
    nrContr_105: String;
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
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2299'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        indRetif_4 := Utils.RemoveZerosEsp(Lista[1]);
        nrRecibo_5 := Utils.RemoveZerosEsp(Lista[2]);
        tpAmb_6 := Utils.RemoveZerosEsp(Lista[3]);
        procEmi_7 := Utils.RemoveZerosEsp(Lista[4]);
        verProc_8 := Utils.RemoveZerosEsp(Lista[5]);
        tpInsc_10 := Utils.RemoveZerosEsp(Lista[6]);
        nrInsc_11 := Utils.RemoveZerosEsp(Lista[7]);
        cpfTrab_13 := Utils.RemoveZerosEsp(Lista[8]);
        nisTrab_14 := Utils.RemoveZerosEsp(Lista[9]);
        matricula_15 := Utils.RemoveZerosEsp(Lista[10]);
        mtvDeslig_17 := Utils.RemoveZerosEsp(Lista[11]);
        dtDeslig_18 := Utils.RemoveZerosEsp(Lista[12]);
        indPagtoAPI_19 := Utils.RemoveZerosEsp(Lista[13]);
        dtProjFimAPI_20 := Utils.RemoveZerosEsp(Lista[14]);
        pensAlim_21 := Utils.RemoveZerosEsp(Lista[15]);
        percAliment_22 := Utils.RemoveZerosEsp(Lista[16]);
        vrAlim_23 := Utils.RemoveZerosEsp(Lista[17]);
        nrCertObito_24 := Utils.RemoveZerosEsp(Lista[18]);
        nrProcTrab_25 := Utils.RemoveZerosEsp(Lista[19]);
        indCumprParc_26 := Utils.RemoveZerosEsp(Lista[20]);
        observacao_107 := Utils.RemoveZerosEsp(Lista[21]);
        cnpjSucessora_29 := Utils.RemoveZerosEsp(Lista[22]);
        cpfSubstituto_98 := Utils.RemoveZerosEsp(Lista[23]);
        dtNascto_99 := Utils.RemoveZerosEsp(Lista[24]);
        ideDmDev_32 := Utils.RemoveZerosEsp(Lista[25]);
        tpInsc_35 := Utils.RemoveZerosEsp(Lista[26]);
        nrInsc_36 := Utils.RemoveZerosEsp(Lista[27]);
        codLotacao_37 := Utils.RemoveZerosEsp(Lista[28]);
        codRubr_39 := Utils.RemoveZerosEsp(Lista[29]);
        ideTabRubr_40 := Utils.RemoveZerosEsp(Lista[30]);
        qtdRubr_41 := Utils.RemoveZerosEsp(Lista[31]);
        fatorRubr_42 := Utils.RemoveZerosEsp(Lista[32]);
        vrUnit_43 := Utils.RemoveZerosEsp(Lista[33]);
        vrRubr_44 := Utils.RemoveZerosEsp(Lista[34]);
        cnpjOper_47 := Utils.RemoveZerosEsp(Lista[35]);
        regANS_48 := Utils.RemoveZerosEsp(Lista[36]);
        vrPgTit_49 := Utils.RemoveZerosEsp(Lista[37]);
        tpDep_95 := Utils.RemoveZerosEsp(Lista[38]);
        cpfDep_51 := Utils.RemoveZerosEsp(Lista[39]);
        nmDep_52 := Utils.RemoveZerosEsp(Lista[40]);
        dtNascto_53 := Utils.RemoveZerosEsp(Lista[41]);
        vlrPgDep_54 := Utils.RemoveZerosEsp(Lista[42]);
        grauExp_56 := Utils.RemoveZerosEsp(Lista[43]);
        indSimples_58 := Utils.RemoveZerosEsp(Lista[44]);
        dtAcConv_61 := Utils.RemoveZerosEsp(Lista[45]);
        tpAcConv_62 := Utils.RemoveZerosEsp(Lista[46]);
        compAcConv_96 := Utils.RemoveZerosEsp(Lista[47]);
        dtEfAcConv_63 := Utils.RemoveZerosEsp(Lista[48]);
        dsc_64 := Utils.RemoveZerosEsp(Lista[49]);
        perRef_66 := Utils.RemoveZerosEsp(Lista[50]);
        tpInsc_68 := Utils.RemoveZerosEsp(Lista[51]);
        nrInsc_69 := Utils.RemoveZerosEsp(Lista[52]);
        codLotacao_70 := Utils.RemoveZerosEsp(Lista[53]);
        codRubr_72 := Utils.RemoveZerosEsp(Lista[54]);
        ideTabRubr_73 := Utils.RemoveZerosEsp(Lista[55]);
        qtdRubr_74 := Utils.RemoveZerosEsp(Lista[56]);
        fatorRubr_75 := Utils.RemoveZerosEsp(Lista[57]);
        vrUnit_76 := Utils.RemoveZerosEsp(Lista[58]);
        vrRubr_77 := Utils.RemoveZerosEsp(Lista[59]);
        grauExp_79 := Utils.RemoveZerosEsp(Lista[60]);
        indSimples_81 := Utils.RemoveZerosEsp(Lista[61]);
        codConv_101 := Utils.RemoveZerosEsp(Lista[62]);
        tpTrib_83 := Utils.RemoveZerosEsp(Lista[64]);
        nrProcJud_84 := Utils.RemoveZerosEsp(Lista[65]);
        codSusp_85 := Utils.RemoveZerosEsp(Lista[66]);
        indMV_87 := Utils.RemoveZerosEsp(Lista[67]);
        tpInsc_89 := Utils.RemoveZerosEsp(Lista[68]);
        nrInsc_90 := Utils.RemoveZerosEsp(Lista[69]);
        codCateg_91 := Utils.RemoveZerosEsp(Lista[70]);
        vlrRemunOE_92 := Utils.RemoveZerosEsp(Lista[71]);
        dtFimQuar_94 := Utils.RemoveZerosEsp(Lista[72]);
        insConsig_104 := Utils.RemoveZerosEsp(Lista[73]);
        nrContr_105 := Utils.RemoveZerosEsp(Lista[74]);
      end;
      Lista.Free;
    end;
end;

end.
