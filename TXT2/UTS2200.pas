unit UTS2200;

interface

uses
  Contnrs, System.Classes;

type
  TS2200 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2200;
    function Add: TS2200;
  public
    indRetif_4: String;
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
    indPriEmpr_20: String;
    dtNascto_23: String;
    codMunic_24: String;
    uf_25: String;
    paisNascto_26: String;
    paisNac_27: String;
    nmMae_28: String;
    nmPai_29: String;
    nrCtps_32: String;
    serieCtps_33: String;
    ufCtps_34: String;
    nrRg_40: String;
    orgaoEmissor_41: String;
    dtExped_42: String;
    nrRegCnh_53: String;
    dtExped_54: String;
    ufCnh_55: String;
    dtValid_56: String;
    dtPriHab_57: String;
    categoriaCnh_58: String;
    tpLograd_61: String;
    dscLograd_62: String;
    nrLograd_63: String;
    bairro_65: String;
    cep_66: String;
    codMunic_67: String;
    uf_68: String;
    defFisica_83: String;
    defVisual_84: String;
    defAuditiva_85: String;
    defMental_86: String;
    defIntelectual_87: String;
    reabReadap_88: String;
    infoCota_89: String;
    tpDep_92: String;
    nmDep_93: String;
    dtNascto_94: String;
    cpfDep_95: String;
    depIRRF_96: String;
    depSF_97: String;
    incTrab_99: String;
    trabAposent_101: String;
    fonePrinc_103: String;
    matricula_108: String;
    tpRegTrab_109: String;
    tpRegPrev_110: String;
    cadIni_197: String;
    dtAdm_114: String;
    tpAdmissao_115: String;
    indAdmissao_116: String;
    tpRegJor_117: String;
    natAtividade_118: String;
    dtBase_119: String;
    cnpjSindCategProf_120: String;
    opcFGTS_122: String;
    dtOpcFGTS_123: String;
    codCargo_150: String;
    codFuncao_151: String;
    codCateg_152: String;
    vrSalFx_155: String;
    undSalFixo_156: String;
    tpContr_159: String;
    tpInsc_163: String;
    nrInsc_164: String;
    tpLograd_167: String;
    dscLograd_168: String;
    nrLograd_169: String;
    bairro_171: String;
    cep_172: String;
    codMunic_173: String;
    uf_174: String;
    qtdHrsSem_176: String;
    tpJornada_177: String;
    dia_181: String;
    codHorContrat_182: String;
    cnpjSindTrab_184: String;
    observacao_205: String;
    property Items[Index: Integer]: TS2200 read GetItem; default;
    procedure GetS2200(const Arq: TStringList);
  end;

implementation

{ TS2200 }

function TS2200.Add: TS2200;
begin
  Result := TS2200.Create;
  inherited Add(Result);
end;

function TS2200.GetItem(Index: Integer): TS2200;
begin
  Result := TS2200(inherited Items[Index]);
end;

procedure TS2200.GetS2200(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2200' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        indRetif_4 := Lista[1];
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
        indPriEmpr_20 := Lista[15];
        dtNascto_23 := Lista[16];
        codMunic_24 := Lista[17];
        uf_25 := Lista[18];
        paisNascto_26 := Lista[19];
        paisNac_27 := Lista[20];
        nmMae_28 := Lista[21];
        nmPai_29 := Lista[22];
        nrCtps_32 := Lista[23];
        serieCtps_33 := Lista[24];
        ufCtps_34 := Lista[25];
        nrRg_40 := Lista[26];
        orgaoEmissor_41 := Lista[27];
        dtExped_42 := Lista[28];
        nrRegCnh_53 := Lista[29];
        dtExped_54 := Lista[30];
        ufCnh_55 := Lista[31];
        dtValid_56 := Lista[32];
        dtPriHab_57 := Lista[33];
        categoriaCnh_58 := Lista[34];
        tpLograd_61 := Lista[35];
        dscLograd_62 := Lista[36];
        nrLograd_63 := Lista[37];
        bairro_65 := Lista[38];
        cep_66 := Lista[39];
        codMunic_67 := Lista[40];
        uf_68 := Lista[41];
        defFisica_83 := Lista[42];
        defVisual_84 := Lista[43];
        defAuditiva_85 := Lista[44];
        defMental_86 := Lista[45];
        defIntelectual_87 := Lista[46];
        reabReadap_88 := Lista[47];
        infoCota_89 := Lista[48];
        tpDep_92 := Lista[49];
        nmDep_93 := Lista[50];
        dtNascto_94 := Lista[51];
        cpfDep_95 := Lista[52];
        depIRRF_96 := Lista[53];
        depSF_97 := Lista[54];
        incTrab_99 := Lista[55];
        trabAposent_101 := Lista[56];
        fonePrinc_103 := Lista[57];
        matricula_108 := Lista[58];
        tpRegTrab_109 := Lista[59];
        tpRegPrev_110 := Lista[60];
        cadIni_197 := Lista[61];
        dtAdm_114 := Lista[62];
        tpAdmissao_115 := Lista[63];
        indAdmissao_116 := Lista[64];
        tpRegJor_117 := Lista[65];
        natAtividade_118 := Lista[66];
        dtBase_119 := Lista[67];
        cnpjSindCategProf_120 := Lista[68];
        opcFGTS_122 := Lista[69];
        dtOpcFGTS_123 := Lista[70];
        codCargo_150 := Lista[71];
        codFuncao_151 := Lista[72];
        codCateg_152 := Lista[73];
        vrSalFx_155 := Lista[74];
        undSalFixo_156 := Lista[75];
        tpContr_159 := Lista[76];
        tpInsc_163 := Lista[77];
        nrInsc_164 := Lista[78];
        tpLograd_167 := Lista[79];
        dscLograd_168 := Lista[80];
        nrLograd_169 := Lista[81];
        bairro_171 := Lista[82];
        cep_172 := Lista[83];
        codMunic_173 := Lista[84];
        uf_174 := Lista[85];
        qtdHrsSem_176 := Lista[86];
        tpJornada_177 := Lista[87];
        dia_181 := Lista[88];
        codHorContrat_182 := Lista[89];
        cnpjSindTrab_184 := Lista[90];
        observacao_205 := Lista[91];
      end;
      Lista.Free;
    end;
end;

end.
