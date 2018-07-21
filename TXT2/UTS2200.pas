unit UTS2200;

interface

uses
  Contnrs, System.Classes, unUtils;

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
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2200' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        indRetif_4 := Utils.RemoveZerosEsp(Lista[1]);
        tpAmb_6 := Utils.RemoveZerosEsp(Lista[3]);
        procEmi_7 := Utils.RemoveZerosEsp(Lista[4]);
        verProc_8 := Utils.RemoveZerosEsp(Lista[5]);
        tpInsc_10 := Utils.RemoveZerosEsp(Lista[6]);
        nrInsc_11 := Utils.RemoveZerosEsp(Lista[7]);
        cpfTrab_13 := Utils.RemoveZerosEsp(Lista[8]);
        nisTrab_14 := Utils.RemoveZerosEsp(Lista[9]);
        nmTrab_15 := Utils.RemoveZerosEsp(Lista[10]);
        sexo_16 := Utils.RemoveZerosEsp(Lista[11]);
        racaCor_17 := Utils.RemoveZerosEsp(Lista[12]);
        estCiv_18 := Utils.RemoveZerosEsp(Lista[13]);
        grauInstr_19 := Utils.RemoveZerosEsp(Lista[14]);
        indPriEmpr_20 := Utils.RemoveZerosEsp(Lista[15]);
        dtNascto_23 := Utils.RemoveZerosEsp(Lista[16]);
        codMunic_24 := Utils.RemoveZerosEsp(Lista[17]);
        uf_25 := Utils.RemoveZerosEsp(Lista[18]);
        paisNascto_26 := Utils.RemoveZerosEsp(Lista[19]);
        paisNac_27 := Utils.RemoveZerosEsp(Lista[20]);
        nmMae_28 := Utils.RemoveZerosEsp(Lista[21]);
        nmPai_29 := Utils.RemoveZerosEsp(Lista[22]);
        nrCtps_32 := Utils.RemoveZerosEsp(Lista[23]);
        serieCtps_33 := Utils.RemoveZerosEsp(Lista[24]);
        ufCtps_34 := Utils.RemoveZerosEsp(Lista[25]);
        nrRg_40 := Utils.RemoveZerosEsp(Lista[26]);
        orgaoEmissor_41 := Utils.RemoveZerosEsp(Lista[27]);
        dtExped_42 := Utils.RemoveZerosEsp(Lista[28]);
        nrRegCnh_53 := Utils.RemoveZerosEsp(Lista[29]);
        dtExped_54 := Utils.RemoveZerosEsp(Lista[30]);
        ufCnh_55 := Utils.RemoveZerosEsp(Lista[31]);
        dtValid_56 := Utils.RemoveZerosEsp(Lista[32]);
        dtPriHab_57 := Utils.RemoveZerosEsp(Lista[33]);
        categoriaCnh_58 := Utils.RemoveZerosEsp(Lista[34]);
        tpLograd_61 := Utils.RemoveZerosEsp(Lista[35]);
        dscLograd_62 := Utils.RemoveZerosEsp(Lista[36]);
        nrLograd_63 := Utils.RemoveZerosEsp(Lista[37]);
        bairro_65 := Utils.RemoveZerosEsp(Lista[38]);
        cep_66 := Utils.RemoveZerosEsp(Lista[39]);
        codMunic_67 := Utils.RemoveZerosEsp(Lista[40]);
        uf_68 := Utils.RemoveZerosEsp(Lista[41]);
        defFisica_83 := Utils.RemoveZerosEsp(Lista[42]);
        defVisual_84 := Utils.RemoveZerosEsp(Lista[43]);
        defAuditiva_85 := Utils.RemoveZerosEsp(Lista[44]);
        defMental_86 := Utils.RemoveZerosEsp(Lista[45]);
        defIntelectual_87 := Utils.RemoveZerosEsp(Lista[46]);
        reabReadap_88 := Utils.RemoveZerosEsp(Lista[47]);
        infoCota_89 := Utils.RemoveZerosEsp(Lista[48]);
        tpDep_92 := Utils.RemoveZerosEsp(Lista[49]);
        nmDep_93 := Utils.RemoveZerosEsp(Lista[50]);
        dtNascto_94 := Utils.RemoveZerosEsp(Lista[51]);
        cpfDep_95 := Utils.RemoveZerosEsp(Lista[52]);
        depIRRF_96 := Utils.RemoveZerosEsp(Lista[53]);
        depSF_97 := Utils.RemoveZerosEsp(Lista[54]);
        incTrab_99 := Utils.RemoveZerosEsp(Lista[55]);
        trabAposent_101 := Utils.RemoveZerosEsp(Lista[56]);
        fonePrinc_103 := Utils.RemoveZerosEsp(Lista[57]);
        matricula_108 := Utils.RemoveZerosEsp(Lista[58]);
        tpRegTrab_109 := Utils.RemoveZerosEsp(Lista[59]);
        tpRegPrev_110 := Utils.RemoveZerosEsp(Lista[60]);
        cadIni_197 := Utils.RemoveZerosEsp(Lista[61]);
        dtAdm_114 := Utils.RemoveZerosEsp(Lista[62]);
        tpAdmissao_115 := Utils.RemoveZerosEsp(Lista[63]);
        indAdmissao_116 := Utils.RemoveZerosEsp(Lista[64]);
        tpRegJor_117 := Utils.RemoveZerosEsp(Lista[65]);
        natAtividade_118 := Utils.RemoveZerosEsp(Lista[66]);
        dtBase_119 := Utils.RemoveZerosEsp(Lista[67]);
        cnpjSindCategProf_120 := Utils.RemoveZerosEsp(Lista[68]);
        opcFGTS_122 := Utils.RemoveZerosEsp(Lista[69]);
        dtOpcFGTS_123 := Utils.RemoveZerosEsp(Lista[70]);
        codCargo_150 := Utils.RemoveZerosEsp(Lista[71]);
        codFuncao_151 := Utils.RemoveZerosEsp(Lista[72]);
        codCateg_152 := Utils.RemoveZerosEsp(Lista[73]);
        vrSalFx_155 := Utils.RemoveZerosEsp(Lista[74]);
        undSalFixo_156 := Utils.RemoveZerosEsp(Lista[75]);
        tpContr_159 := Utils.RemoveZerosEsp(Lista[76]);
        tpInsc_163 := Utils.RemoveZerosEsp(Lista[77]);
        nrInsc_164 := Utils.RemoveZerosEsp(Lista[78]);
        tpLograd_167 := Utils.RemoveZerosEsp(Lista[79]);
        dscLograd_168 := Utils.RemoveZerosEsp(Lista[80]);
        nrLograd_169 := Utils.RemoveZerosEsp(Lista[81]);
        bairro_171 := Utils.RemoveZerosEsp(Lista[82]);
        cep_172 := Utils.RemoveZerosEsp(Lista[83]);
        codMunic_173 := Utils.RemoveZerosEsp(Lista[84]);
        uf_174 := Utils.RemoveZerosEsp(Lista[85]);
        qtdHrsSem_176 := Utils.RemoveZerosEsp(Lista[86]);
        tpJornada_177 := Utils.RemoveZerosEsp(Lista[87]);
        dia_181 := Utils.RemoveZerosEsp(Lista[88]);
        codHorContrat_182 := Utils.RemoveZerosEsp(Lista[89]);
        cnpjSindTrab_184 := Utils.RemoveZerosEsp(Lista[90]);
        observacao_205 := Utils.RemoveZerosEsp(Lista[91]);
      end;
      Lista.Free;
    end;
end;

end.
