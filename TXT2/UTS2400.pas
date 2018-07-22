unit UTS2400;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

type
  TS2400 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2400;
    function Add: TS2400;
  public
    indRetif_4: String;
    nrRecibo_5: String;
    tpAmb_6: String;
    procEmi_7: String;
    verProc_8: String;
    tpInsc_10: String;
    nrInsc_11: String;
    cpfBenef_13: String;
    nmBenefic_14: String;
    dtNascto_19: String;
    codMunic_20: String;
    uf_21: String;
    paisNascto_22: String;
    paisNac_23: String;
    nmMae_24: String;
    nmPai_25: String;
    tpLograd_28: String;
    dscLograd_29: String;
    nrLograd_30: String;
    complemento_31: String;
    bairro_32: String;
    cep_33: String;
    codMunic_34: String;
    uf_35: String;
    paisResid_37: String;
    dscLograd_38: String;
    nrLograd_39: String;
    complemento_40: String;
    bairro_41: String;
    nmCid_42: String;
    codPostal_43: String;
    tpPlanRP_45: String;
    tpBenef_47: String;
    nrBenefic_48: String;
    dtIniBenef_49: String;
    vrBenef_50: String;
    idQuota_52: String;
    cpfInst_53: String;
    tpBenef_55: String;
    nrBenefic_56: String;
    dtIniBenef_57: String;
    vrBenef_58: String;
    idQuota_60: String;
    cpfInst_61: String;
    tpBenef_63: String;
    nrBenefic_64: String;
    dtFimBenef_65: String;
    mtvFim_66: String;
    property Items[Index: Integer]: TS2400 read GetItem; default;
    procedure GetS2400(const Arq: TStringList);
  end;

implementation

{ TS2400 }

function TS2400.Add: TS2400;
begin
  Result := TS2400.Create;
  inherited Add(Result);
end;

function TS2400.GetItem(Index: Integer): TS2400;
begin
  Result := TS2400(inherited Items[Index]);
end;

procedure TS2400.GetS2400(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2400' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        indRetif_4 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        nrRecibo_5 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        tpAmb_6 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        procEmi_7 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        verProc_8 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        tpInsc_10 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
        nrInsc_11 := IfThen(Trim(Lista[7]) = '', '0', Lista[7]);
        cpfBenef_13 := IfThen(Trim(Lista[8]) = '', '0', Lista[8]);
        nmBenefic_14 := IfThen(Trim(Lista[9]) = '', '0', Lista[9]);
        dtNascto_19 := IfThen(Trim(Lista[10]) = '', '0', Lista[10]);
        codMunic_20 := IfThen(Trim(Lista[11]) = '', '0', Lista[11]);
        uf_21 := IfThen(Trim(Lista[12]) = '', '0', Lista[12]);
        paisNascto_22 := IfThen(Trim(Lista[13]) = '', '0', Lista[13]);
        paisNac_23 := IfThen(Trim(Lista[14]) = '', '0', Lista[14]);
        nmMae_24 := IfThen(Trim(Lista[15]) = '', '0', Lista[15]);
        nmPai_25 := IfThen(Trim(Lista[16]) = '', '0', Lista[16]);
        tpLograd_28 := IfThen(Trim(Lista[17]) = '', '0', Lista[17]);
        dscLograd_29 := IfThen(Trim(Lista[18]) = '', '0', Lista[18]);
        nrLograd_30 := IfThen(Trim(Lista[19]) = '', '0', Lista[19]);
        complemento_31 := IfThen(Trim(Lista[20]) = '', '0', Lista[20]);
        bairro_32 := IfThen(Trim(Lista[21]) = '', '0', Lista[21]);
        cep_33 := IfThen(Trim(Lista[22]) = '', '0', Lista[22]);
        codMunic_34 := IfThen(Trim(Lista[23]) = '', '0', Lista[23]);
        uf_35 := IfThen(Trim(Lista[24]) = '', '0', Lista[24]);
        paisResid_37 := IfThen(Trim(Lista[25]) = '', '0', Lista[25]);
        dscLograd_38 := IfThen(Trim(Lista[26]) = '', '0', Lista[26]);
        nrLograd_39 := IfThen(Trim(Lista[27]) = '', '0', Lista[27]);
        complemento_40 := IfThen(Trim(Lista[28]) = '', '0', Lista[28]);
        bairro_41 := IfThen(Trim(Lista[29]) = '', '0', Lista[29]);
        nmCid_42 := IfThen(Trim(Lista[30]) = '', '0', Lista[30]);
        codPostal_43 := IfThen(Trim(Lista[31]) = '', '0', Lista[31]);
        tpPlanRP_45 := IfThen(Trim(Lista[32]) = '', '0', Lista[32]);
        tpBenef_47 := IfThen(Trim(Lista[33]) = '', '0', Lista[33]);
        nrBenefic_48 := IfThen(Trim(Lista[34]) = '', '0', Lista[34]);
        dtIniBenef_49 := IfThen(Trim(Lista[35]) = '', '0', Lista[35]);
        vrBenef_50 := IfThen(Trim(Lista[36]) = '', '0', Lista[36]);
        idQuota_52 := IfThen(Trim(Lista[37]) = '', '0', Lista[37]);
        cpfInst_53 := IfThen(Trim(Lista[38]) = '', '0', Lista[38]);
        tpBenef_55 := IfThen(Trim(Lista[39]) = '', '0', Lista[39]);
        nrBenefic_56 := IfThen(Trim(Lista[40]) = '', '0', Lista[40]);
        dtIniBenef_57 := IfThen(Trim(Lista[41]) = '', '0', Lista[41]);
        vrBenef_58 := IfThen(Trim(Lista[42]) = '', '0', Lista[42]);
        idQuota_60 := IfThen(Trim(Lista[43]) = '', '0', Lista[43]);
        cpfInst_61 := IfThen(Trim(Lista[44]) = '', '0', Lista[44]);
        tpBenef_63 := IfThen(Trim(Lista[45]) = '', '0', Lista[45]);
        nrBenefic_64 := IfThen(Trim(Lista[46]) = '', '0', Lista[46]);
        dtFimBenef_65 := IfThen(Trim(Lista[47]) = '', '0', Lista[47]);
        mtvFim_66 := IfThen(Trim(Lista[48]) = '', '0', Lista[48]);
      end;
      Lista.Free;
    end;
end;

end.
