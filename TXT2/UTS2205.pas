unit UTS2205;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS2205 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2205;
    function Add: TS2205;
  public
    indRetif_4: String;
    nrRecibo_5: String;
    tpAmb_6: String;
    procEmi_7: String;
    verProc_8: String;
    tpInsc_10: String;
    nrInsc_11: String;
    cpfTrab_13: String;
    dtAlteracao_15: String;
    nisTrab_17: String;
    nmTrab_18: String;
    sexo_19: String;
    racaCor_20: String;
    estCiv_21: String;
    grauInstr_22: String;
    nmSoc_23: String;
    dtNascto_101: String;
    codMunic_102: String;
    uf_103: String;
    paisNascto_104: String;
    paisNac_105: String;
    nmMae_106: String;
    nmPai_107: String;
    nrCtps_26: String;
    serieCtps_27: String;
    ufCtps_28: String;
    nrRic_30: String;
    orgaoEmissor_31: String;
    dtExped_32: String;
    nrRg_34: String;
    orgaoEmissor_35: String;
    dtExped_36: String;
    nrRne_38: String;
    orgaoEmissor_39: String;
    dtExped_40: String;
    nrOc_42: String;
    orgaoEmissor_43: String;
    dtExped_44: String;
    dtValid_45: String;
    nrRegCnh_47: String;
    dtExped_48: String;
    ufCnh_49: String;
    dtValid_50: String;
    dtPriHab_51: String;
    categoriaCnh_52: String;
    tpLograd_55: String;
    dscLograd_56: String;
    nrLograd_57: String;
    complemento_58: String;
    bairro_59: String;
    cep_60: String;
    codMunic_61: String;
    uf_62: String;
    paisResid_64: String;
    dscLograd_65: String;
    nrLograd_66: String;
    complemento_67: String;
    bairro_68: String;
    nmCid_69: String;
    codPostal_70: String;
    dtChegada_72: String;
    classTrabEstrang_73: String;
    casadoBr_74: String;
    filhosBr_75: String;
    defFisica_77: String;
    defVisual_78: String;
    defAuditiva_79: String;
    defMental_80: String;
    defIntelectual_81: String;
    reabReadap_82: String;
    infoCota_83: String;
    observacao_84: String;
    tpDep_86: String;
    nmDep_87: String;
    dtNascto_88: String;
    cpfDep_89: String;
    depIRRF_90: String;
    depSF_91: String;
    incTrab_93: String;
    trabAposent_95: String;
    fonePrinc_97: String;
    foneAlternat_98: String;
    emailPrinc_99: String;
    emailAlternat_100: String;
    property Items[Index: Integer]: TS2205 read GetItem; default;
    procedure GetS2205(const Arq: TStringList);
  end;

implementation

{ TS2190 }

function TS2205.Add: TS2205;
begin
  Result := TS2205.Create;
  inherited Add(Result);
end;

function TS2205.GetItem(Index: Integer): TS2205;
begin
  Result := TS2205(inherited Items[Index]);
end;

procedure TS2205.GetS2205(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2205'then
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
        dtAlteracao_15 := Utils.RemoveZerosEsp(Lista[9]);
        nisTrab_17 := Utils.RemoveZerosEsp(Lista[10]);
        nmTrab_18 := Utils.RemoveZerosEsp(Lista[11]);
        sexo_19 := Utils.RemoveZerosEsp(Lista[12]);
        racaCor_20 := Utils.RemoveZerosEsp(Lista[13]);
        estCiv_21 := Utils.RemoveZerosEsp(Lista[14]);
        grauInstr_22 := Utils.RemoveZerosEsp(Lista[15]);
        nmSoc_23 := Utils.RemoveZerosEsp(Lista[16]);
        dtNascto_101 := Utils.RemoveZerosEsp(Lista[17]);
        codMunic_102 := Utils.RemoveZerosEsp(Lista[18]);
        uf_103 := Utils.RemoveZerosEsp(Lista[19]);
        paisNascto_104 := Utils.RemoveZerosEsp(Lista[20]);
        paisNac_105 := Utils.RemoveZerosEsp(Lista[21]);
        nmMae_106 := Utils.RemoveZerosEsp(Lista[22]);
        nmPai_107 := Utils.RemoveZerosEsp(Lista[23]);
        nrCtps_26 := Utils.RemoveZerosEsp(Lista[24]);
        serieCtps_27 := Utils.RemoveZerosEsp(Lista[25]);
        ufCtps_28 := Utils.RemoveZerosEsp(Lista[26]);
        nrRic_30 := Utils.RemoveZerosEsp(Lista[27]);
        orgaoEmissor_31 := Utils.RemoveZerosEsp(Lista[28]);
        dtExped_32 := Utils.RemoveZerosEsp(Lista[29]);
        nrRg_34 := Utils.RemoveZerosEsp(Lista[30]);
        orgaoEmissor_35 := Utils.RemoveZerosEsp(Lista[31]);
        dtExped_36 := Utils.RemoveZerosEsp(Lista[32]);
        nrRne_38 := Utils.RemoveZerosEsp(Lista[33]);
        orgaoEmissor_39 := Utils.RemoveZerosEsp(Lista[34]);
        dtExped_40 := Utils.RemoveZerosEsp(Lista[35]);
        nrOc_42 := Utils.RemoveZerosEsp(Lista[36]);
        orgaoEmissor_43 := Utils.RemoveZerosEsp(Lista[37]);
        dtExped_44 := Utils.RemoveZerosEsp(Lista[38]);
        dtValid_45 := Utils.RemoveZerosEsp(Lista[39]);
        nrRegCnh_47 := Utils.RemoveZerosEsp(Lista[40]);
        dtExped_48 := Utils.RemoveZerosEsp(Lista[41]);
        ufCnh_49 := Utils.RemoveZerosEsp(Lista[42]);
        dtValid_50 := Utils.RemoveZerosEsp(Lista[43]);
        dtPriHab_51 := Utils.RemoveZerosEsp(Lista[44]);
        categoriaCnh_52 := Utils.RemoveZerosEsp(Lista[45]);
        tpLograd_55 := Utils.RemoveZerosEsp(Lista[46]);
        dscLograd_56 := Utils.RemoveZerosEsp(Lista[47]);
        nrLograd_57 := Utils.RemoveZerosEsp(Lista[48]);
        complemento_58 := Utils.RemoveZerosEsp(Lista[49]);
        bairro_59 := Utils.RemoveZerosEsp(Lista[50]);
        cep_60 := Utils.RemoveZerosEsp(Lista[51]);
        codMunic_61 := Utils.RemoveZerosEsp(Lista[52]);
        uf_62 := Utils.RemoveZerosEsp(Lista[53]);
        paisResid_64 := Utils.RemoveZerosEsp(Lista[54]);
        dscLograd_65 := Utils.RemoveZerosEsp(Lista[55]);
        nrLograd_66 := Utils.RemoveZerosEsp(Lista[56]);
        complemento_67 := Utils.RemoveZerosEsp(Lista[57]);
        bairro_68 := Utils.RemoveZerosEsp(Lista[58]);
        nmCid_69 := Utils.RemoveZerosEsp(Lista[59]);
        codPostal_70 := Utils.RemoveZerosEsp(Lista[60]);
        dtChegada_72 := Utils.RemoveZerosEsp(Lista[61]);
        classTrabEstrang_73 := Utils.RemoveZerosEsp(Lista[62]);
        casadoBr_74 := Utils.RemoveZerosEsp(Lista[63]);
        filhosBr_75 := Utils.RemoveZerosEsp(Lista[64]);
        defFisica_77 := Utils.RemoveZerosEsp(Lista[65]);
        defVisual_78 := Utils.RemoveZerosEsp(Lista[66]);
        defAuditiva_79 := Utils.RemoveZerosEsp(Lista[67]);
        defMental_80 := Utils.RemoveZerosEsp(Lista[68]);
        defIntelectual_81 := Utils.RemoveZerosEsp(Lista[69]);
        reabReadap_82 := Utils.RemoveZerosEsp(Lista[70]);
        infoCota_83 := Utils.RemoveZerosEsp(Lista[71]);
        observacao_84 := Utils.RemoveZerosEsp(Lista[72]);
        tpDep_86 := Utils.RemoveZerosEsp(Lista[73]);
        nmDep_87 := Utils.RemoveZerosEsp(Lista[74]);
        dtNascto_88 := Utils.RemoveZerosEsp(Lista[75]);
        cpfDep_89 := Utils.RemoveZerosEsp(Lista[76]);
        depIRRF_90 := Utils.RemoveZerosEsp(Lista[77]);
        depSF_91 := Utils.RemoveZerosEsp(Lista[78]);
        incTrab_93 := Utils.RemoveZerosEsp(Lista[79]);
        trabAposent_95 := Utils.RemoveZerosEsp(Lista[80]);
        fonePrinc_97 := Utils.RemoveZerosEsp(Lista[81]);
        foneAlternat_98 := Utils.RemoveZerosEsp(Lista[82]);
        emailPrinc_99 := Utils.RemoveZerosEsp(Lista[83]);
        emailAlternat_100 := Utils.RemoveZerosEsp(Lista[84]);
      end;
      Lista.Free;
    end;
end;

end.
