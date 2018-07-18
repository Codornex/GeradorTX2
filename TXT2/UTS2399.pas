unit UTS2399;

interface

uses
  Contnrs, System.Classes;

type
  TS2399 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2399;
    function Add: TS2399;
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
    nmTrab_15: String;
    sexo_16: String;
    racaCor_17: String;
    estCiv_18: String;
    grauInstr_19: String;
    nmSoc_20: String;
    dtNascto_22: String;
    codMunic_23: String;
    uf_24: String;
    paisNascto_25: String;
    paisNac_26: String;
    nmMae_27: String;
    nmPai_28: String;
    nrCtps_31: String;
    serieCtps_32: String;
    ufCtps_33: String;
    nrRic_35: String;
    orgaoEmissor_36: String;
    dtExped_37: String;
    nrRg_39: String;
    orgaoEmissor_40: String;
    dtExped_41: String;
    nrRne_43: String;
    orgaoEmissor_44: String;
    dtExped_45: String;
    nrOc_47: String;
    orgaoEmissor_48: String;
    dtExped_49: String;
    dtValid_50: String;
    nrRegCnh_52: String;
    dtExped_53: String;
    ufCnh_54: String;
    dtValid_55: String;
    dtPriHab_56: String;
    categoriaCnh_57: String;
    tpLograd_60: String;
    dscLograd_61: String;
    nrLograd_62: String;
    complemento_63: String;
    bairro_64: String;
    cep_65: String;
    codMunic_66: String;
    uf_67: String;
    paisResid_69: String;
    dscLograd_70: String;
    nrLograd_71: String;
    complemento_72: String;
    bairro_73: String;
    nmCid_74: String;
    codPostal_75: String;
    dtChegada_77: String;
    classTrabEstrang_78: String;
    casadoBr_79: String;
    filhosBr_80: String;
    defFisica_82: String;
    defVisual_83: String;
    defAuditiva_84: String;
    defMental_85: String;
    defIntelectual_86: String;
    reabReadap_87: String;
    observacao_88: String;
    tpDep_90: String;
    nmDep_91: String;
    dtNascto_92: String;
    cpfDep_93: String;
    depIRRF_94: String;
    depSF_95: String;
    incTrab_97: String;
    fonePrinc_99: String;
    foneAlternat_100: String;
    emailPrinc_101: String;
    emailAlternat_102: String;
    cadIni_164: String;
    codCateg_104: String;
    dtInicio_105: String;
    natAtividade_106: String;
    codCargo_109: String;
    codFuncao_110: String;
    vrSalFx_112: String;
    undSalFixo_113: String;
    dscSalVar_114: String;
    opcFGTS_116: String;
    dtOpcFGTS_117: String;
    categOrig_119: String;
    cnpjOrigem_120: String;
    dtAdmOrig_121: String;
    matricOrig_122: String;
    categOrig_124: String;
    cnpjCednt_125: String;
    matricCed_126: String;
    dtAdmCed_127: String;
    tpRegTrab_128: String;
    tpRegPrev_129: String;
    infOnus_130: String;
    natEstagio_132: String;
    nivEstagio_133: String;
    areaAtuacao_134: String;
    nrApol_135: String;
    vlrBolsa_136: String;
    dtPrevTerm_137: String;
    cnpjInstEnsino_139: String;
    nmRazao_140: String;
    dscLograd_141: String;
    nrLograd_142: String;
    bairro_143: String;
    cep_144: String;
    codMunic_145: String;
    uf_146: String;
    cnpjAgntInteg_148: String;
    nmRazao_149: String;
    dscLograd_150: String;
    nrLograd_151: String;
    bairro_152: String;
    cep_153: String;
    codMunic_154: String;
    uf_155: String;
    cpfSupervisor_157: String;
    nmSuperv_158: String;
    dtIniAfast_160: String;
    codMotAfast_161: String;
    dtTerm_163: String;
    property Items[Index: Integer]: TS2399 read GetItem; default;
    procedure GetS2399(const Arq: TStringList);
  end;

implementation

{ TS2399 }

function TS2399.Add: TS2399;
begin
  Result := TS2399.Create;
  inherited Add(Result);
end;

function TS2399.GetItem(Index: Integer): TS2399;
begin
  Result := TS2399(inherited Items[Index]);
end;

procedure TS2399.GetS2399(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2399' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
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
        nmTrab_15 := Lista[10];
        sexo_16 := Lista[11];
        racaCor_17 := Lista[12];
        estCiv_18 := Lista[13];
        grauInstr_19 := Lista[14];
        nmSoc_20 := Lista[15];
        dtNascto_22 := Lista[16];
        codMunic_23 := Lista[17];
        uf_24 := Lista[18];
        paisNascto_25 := Lista[19];
        paisNac_26 := Lista[20];
        nmMae_27 := Lista[21];
        nmPai_28 := Lista[22];
        nrCtps_31 := Lista[23];
        serieCtps_32 := Lista[24];
        ufCtps_33 := Lista[25];
        nrRic_35 := Lista[26];
        orgaoEmissor_36 := Lista[27];
        dtExped_37 := Lista[28];
        nrRg_39 := Lista[29];
        orgaoEmissor_40 := Lista[30];
        dtExped_41 := Lista[31];
        nrRne_43 := Lista[32];
        orgaoEmissor_44 := Lista[33];
        dtExped_45 := Lista[34];
        nrOc_47 := Lista[35];
        orgaoEmissor_48 := Lista[36];
        dtExped_49 := Lista[37];
        dtValid_50 := Lista[38];
        nrRegCnh_52 := Lista[39];
        dtExped_53 := Lista[40];
        ufCnh_54 := Lista[41];
        dtValid_55 := Lista[42];
        dtPriHab_56 := Lista[43];
        categoriaCnh_57 := Lista[44];
        tpLograd_60 := Lista[45];
        dscLograd_61 := Lista[46];
        nrLograd_62 := Lista[47];
        complemento_63 := Lista[48];
        bairro_64 := Lista[49];
        cep_65 := Lista[50];
        codMunic_66 := Lista[51];
        uf_67 := Lista[52];
        paisResid_69 := Lista[53];
        dscLograd_70 := Lista[54];
        nrLograd_71 := Lista[55];
        complemento_72 := Lista[56];
        bairro_73 := Lista[57];
        nmCid_74 := Lista[58];
        codPostal_75 := Lista[59];
        dtChegada_77 := Lista[60];
        classTrabEstrang_78 := Lista[61];
        casadoBr_79 := Lista[62];
        filhosBr_80 := Lista[63];
        defFisica_82 := Lista[64];
        defVisual_83 := Lista[65];
        defAuditiva_84 := Lista[66];
        defMental_85 := Lista[67];
        defIntelectual_86 := Lista[68];
        reabReadap_87 := Lista[69];
        observacao_88 := Lista[70];
        tpDep_90 := Lista[71];
        nmDep_91 := Lista[72];
        dtNascto_92 := Lista[73];
        cpfDep_93 := Lista[74];
        depIRRF_94 := Lista[75];
        depSF_95 := Lista[76];
        incTrab_97 := Lista[77];
        fonePrinc_99 := Lista[78];
        foneAlternat_100 := Lista[79];
        emailPrinc_101 := Lista[80];
        emailAlternat_102 := Lista[81];
        cadIni_164 := Lista[82];
        codCateg_104 := Lista[83];
        dtInicio_105 := Lista[84];
        natAtividade_106 := Lista[85];
        codCargo_109 := Lista[86];
        codFuncao_110 := Lista[87];
        vrSalFx_112 := Lista[88];
        undSalFixo_113 := Lista[89];
        dscSalVar_114 := Lista[90];
        opcFGTS_116 := Lista[91];
        dtOpcFGTS_117 := Lista[92];
        categOrig_119 := Lista[93];
        cnpjOrigem_120 := Lista[94];
        dtAdmOrig_121 := Lista[95];
        matricOrig_122 := Lista[96];
        categOrig_124 := Lista[97];
        cnpjCednt_125 := Lista[98];
        matricCed_126 := Lista[99];
        dtAdmCed_127 := Lista[100];
        tpRegTrab_128 := Lista[101];
        tpRegPrev_129 := Lista[102];
        infOnus_130 := Lista[103];
        natEstagio_132 := Lista[104];
        nivEstagio_133 := Lista[105];
        areaAtuacao_134 := Lista[106];
        nrApol_135 := Lista[107];
        vlrBolsa_136 := Lista[108];
        dtPrevTerm_137 := Lista[109];
        cnpjInstEnsino_139 := Lista[110];
        nmRazao_140 := Lista[111];
        dscLograd_141 := Lista[112];
        nrLograd_142 := Lista[113];
        bairro_143 := Lista[114];
        cep_144 := Lista[115];
        codMunic_145 := Lista[116];
        uf_146 := Lista[117];
        cnpjAgntInteg_148 := Lista[118];
        nmRazao_149 := Lista[119];
        dscLograd_150 := Lista[120];
        nrLograd_151 := Lista[121];
        bairro_152 := Lista[122];
        cep_153 := Lista[123];
        codMunic_154 := Lista[124];
        uf_155 := Lista[125];
        cpfSupervisor_157 := Lista[126];
        nmSuperv_158 := Lista[127];
        dtIniAfast_160 := Lista[128];
        codMotAfast_161 := Lista[129];
        dtTerm_163 := Lista[130];
      end;
      Lista.Free;
    end;
end;

end.
