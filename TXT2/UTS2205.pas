unit UTS2205;

interface

uses
  Contnrs, System.Classes;

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
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2205'then
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
        dtAlteracao_15 := Lista[9];
        nisTrab_17 := Lista[10];
        nmTrab_18 := Lista[11];
        sexo_19 := Lista[12];
        racaCor_20 := Lista[13];
        estCiv_21 := Lista[14];
        grauInstr_22 := Lista[15];
        nmSoc_23 := Lista[16];
        dtNascto_101 := Lista[17];
        codMunic_102 := Lista[18];
        uf_103 := Lista[19];
        paisNascto_104 := Lista[20];
        paisNac_105 := Lista[21];
        nmMae_106 := Lista[22];
        nmPai_107 := Lista[23];
        nrCtps_26 := Lista[24];
        serieCtps_27 := Lista[25];
        ufCtps_28 := Lista[26];
        nrRic_30 := Lista[27];
        orgaoEmissor_31 := Lista[28];
        dtExped_32 := Lista[29];
        nrRg_34 := Lista[30];
        orgaoEmissor_35 := Lista[31];
        dtExped_36 := Lista[32];
        nrRne_38 := Lista[33];
        orgaoEmissor_39 := Lista[34];
        dtExped_40 := Lista[35];
        nrOc_42 := Lista[36];
        orgaoEmissor_43 := Lista[37];
        dtExped_44 := Lista[38];
        dtValid_45 := Lista[39];
        nrRegCnh_47 := Lista[40];
        dtExped_48 := Lista[41];
        ufCnh_49 := Lista[42];
        dtValid_50 := Lista[43];
        dtPriHab_51 := Lista[44];
        categoriaCnh_52 := Lista[45];
        tpLograd_55 := Lista[46];
        dscLograd_56 := Lista[47];
        nrLograd_57 := Lista[48];
        complemento_58 := Lista[49];
        bairro_59 := Lista[50];
        cep_60 := Lista[51];
        codMunic_61 := Lista[52];
        uf_62 := Lista[53];
        paisResid_64 := Lista[54];
        dscLograd_65 := Lista[55];
        nrLograd_66 := Lista[56];
        complemento_67 := Lista[57];
        bairro_68 := Lista[58];
        nmCid_69 := Lista[59];
        codPostal_70 := Lista[60];
        dtChegada_72 := Lista[61];
        classTrabEstrang_73 := Lista[62];
        casadoBr_74 := Lista[63];
        filhosBr_75 := Lista[64];
        defFisica_77 := Lista[65];
        defVisual_78 := Lista[66];
        defAuditiva_79 := Lista[67];
        defMental_80 := Lista[68];
        defIntelectual_81 := Lista[69];
        reabReadap_82 := Lista[70];
        infoCota_83 := Lista[71];
        observacao_84 := Lista[72];
        tpDep_86 := Lista[73];
        nmDep_87 := Lista[74];
        dtNascto_88 := Lista[75];
        cpfDep_89 := Lista[76];
        depIRRF_90 := Lista[77];
        depSF_91 := Lista[78];
        incTrab_93 := Lista[79];
        trabAposent_95 := Lista[80];
        fonePrinc_97 := Lista[81];
        foneAlternat_98 := Lista[82];
        emailPrinc_99 := Lista[83];
        emailAlternat_100 := Lista[84];
      end;
      Lista.Free;
    end;
end;

end.
