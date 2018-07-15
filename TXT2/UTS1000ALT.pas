unit UTS1000ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1000ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1000ALT;
    function Add: TS1000ALT;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    iniValid_13: String;
    fimValid_14: String;
    nmRazao_15: String;
    classTrib_16: String;
    natJurid_17: String;
    indCoop_18: String;
    indConstr_19: String;
    indDesFolha_20: String;
    indOptRegEletron_21: String;
    indEntEd_23: String;
    indEtt_24: String;
    nrRegEtt_25: String;
    ideMinLei_27: String;
    nrCertif_28: String;
    dtEmisCertif_29: String;
    dtVencCertif_30: String;
    nrProtRenov_31: String;
    dtProtRenov_32: String;
    dtDou_33: String;
    pagDou_34: String;
    nmCtt_36: String;
    cpfCtt_37: String;
    foneFixo_38: String;
    foneCel_39: String;
    email_40: String;
    nrSiafi_42: String;
    ideEFR_44: String;
    cnpjEFR_45: String;
    nmEnte_47: String;
    uf_48: String;
    codMunic_49: String;
    indRPPS_50: String;
    subteto_51: String;
    vrSubteto_52: String;
    indAcordoIsenMulta_54: String;
    cnpjSoftHouse_56: String;
    nmRazao_57: String;
    nmCont_58: String;
    telefone_59: String;
    email_60: String;
    indSitPJ_63: String;
    indSitPF_65: String;
    iniValid_66: String;
    fimValid_67: String;
    property Items[Index: Integer]: TS1000ALT read GetItem; default;
    procedure GetS1000ALT(const Arq: TStringList);
  end;

implementation

{ TS1000ALT }

function TS1000ALT.Add: TS1000ALT;
begin
  Result := TS1000ALT.Create;
  inherited Add(Result);
end;

function TS1000ALT.GetItem(Index: Integer): TS1000ALT;
begin
  Result := TS1000ALT(inherited Items[Index]);
end;

procedure TS1000ALT.GetS1000ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1000'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        tpAmb_4 := Lista[1];
        procEmi_5 := Lista[2];
        verProc_6 := Lista[3];
        tpInsc_8 := Lista[4];
        nrInsc_9 := Lista[5];
        iniValid_13 := Lista[6];
        fimValid_14 := Lista[7];
        nmRazao_15 := Lista[8];
        classTrib_16 := Lista[9];
        natJurid_17 := Lista[10];
        indCoop_18 := Lista[11];
        indConstr_19 := Lista[12];
        indDesFolha_20 := Lista[13];
        indOptRegEletron_21 := Lista[14];
        indEntEd_23 := Lista[15];
        indEtt_24 := Lista[16];
        nrRegEtt_25 := Lista[17];
        ideMinLei_27 := Lista[18];
        nrCertif_28 := Lista[19];
        dtEmisCertif_29 := Lista[20];
        dtVencCertif_30 := Lista[21];
        nrProtRenov_31 := Lista[22];
        dtProtRenov_32 := Lista[23];
        dtDou_33 := Lista[24];
        pagDou_34 := Lista[25];
        nmCtt_36 := Lista[26];
        cpfCtt_37 := Lista[27];
        foneFixo_38 := Lista[28];
        foneCel_39 := Lista[29];
        email_40 := Lista[30];
        nrSiafi_42 := Lista[31];
        ideEFR_44 := Lista[32];
        cnpjEFR_45 := Lista[33];
        nmEnte_47 := Lista[34];
        uf_48 := Lista[35];
        codMunic_49 := Lista[36];
        indRPPS_50 := Lista[37];
        subteto_51 := Lista[38];
        vrSubteto_52 := Lista[39];
        indAcordoIsenMulta_54 := Lista[40];
        cnpjSoftHouse_56 := Lista[41];
        nmRazao_57 := Lista[42];
        nmCont_58 := Lista[43];
        telefone_59 := Lista[44];
        email_60 := Lista[45];
        indSitPJ_63 := Lista[46];
        indSitPF_65 := Lista[47];
        iniValid_66 := Lista[48];
        fimValid_67 := Lista[49];
      end;
      Lista.Free;
    end;
end;

end.
