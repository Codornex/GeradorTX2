unit UTS2210;

interface

uses
  Contnrs, System.Classes;

type
  TS2210 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2210;
    function Add: TS2210;
  public
    indRetif_4: String;
    nrRecibo_5: String;
    tpAmb_6: String;
    procEmi_7: String;
    verProc_8: String;
    tpRegistrador_10: String;
    tpInsc_11: String;
    nrInsc_12: String;
    tpInsc_14: String;
    nrInsc_15: String;
    cpfTrab_17: String;
    nisTrab_18: String;
    dtAcid_20: String;
    tpAcid_21: String;
    hrAcid_22: String;
    hrsTrabAntesAcid_23: String;
    tpCat_24: String;
    indCatObito_25: String;
    dtObito_26: String;
    indComunPolicia_27: String;
    codSitGeradora_28: String;
    iniciatCAT_29: String;
    observacao_30: String;
    tpLocal_32: String;
    dscLocal_33: String;
    dscLograd_34: String;
    nrLograd_35: String;
    codMunic_36: String;
    uf_37: String;
    cnpjLocalAcid_38: String;
    pais_39: String;
    codPostal_40: String;
    codParteAting_42: String;
    lateralidade_43: String;
    codAgntCausador_45: String;
    codCNES_47: String;
    dtAtendimento_48: String;
    hrAtendimento_49: String;
    indInternacao_50: String;
    durTrat_51: String;
    indAfast_52: String;
    dscLesao_53: String;
    dscCompLesao_54: String;
    diagProvavel_55: String;
    codCID_56: String;
    observacao_57: String;
    nmEmit_59: String;
    ideOC_60: String;
    nrOc_61: String;
    ufOC_62: String;
    dtCatOrig_64: String;
    nrCatOrig_65: String;
    property Items[Index: Integer]: TS2210 read GetItem; default;
    procedure GetS2210(const Arq: TStringList);
  end;

implementation

{ TS2210 }

function TS2210.Add: TS2210;
begin
  Result := TS2210.Create;
  inherited Add(Result);
end;

function TS2210.GetItem(Index: Integer): TS2210;
begin
  Result := TS2210(inherited Items[Index]);
end;

procedure TS2210.GetS2210(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2210' then
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
        tpRegistrador_10 := Lista[6];
        tpInsc_11 := Lista[7];
        nrInsc_12 := Lista[8];
        tpInsc_14 := Lista[9];
        nrInsc_15 := Lista[10];
        cpfTrab_17 := Lista[11];
        nisTrab_18 := Lista[12];
        dtAcid_20 := Lista[13];
        tpAcid_21 := Lista[14];
        hrAcid_22 := Lista[15];
        hrsTrabAntesAcid_23 := Lista[16];
        tpCat_24 := Lista[17];
        indCatObito_25 := Lista[18];
        dtObito_26 := Lista[19];
        indComunPolicia_27 := Lista[20];
        codSitGeradora_28 := Lista[21];
        iniciatCAT_29 := Lista[22];
        observacao_30 := Lista[23];
        tpLocal_32 := Lista[24];
        dscLocal_33 := Lista[25];
        dscLograd_34 := Lista[26];
        nrLograd_35 := Lista[27];
        codMunic_36 := Lista[28];
        uf_37 := Lista[29];
        cnpjLocalAcid_38 := Lista[30];
        pais_39 := Lista[31];
        codPostal_40 := Lista[32];
        codParteAting_42 := Lista[33];
        lateralidade_43 := Lista[34];
        codAgntCausador_45 := Lista[35];
        codCNES_47 := Lista[36];
        dtAtendimento_48 := Lista[37];
        hrAtendimento_49 := Lista[38];
        indInternacao_50 := Lista[39];
        durTrat_51 := Lista[40];
        indAfast_52 := Lista[41];
        dscLesao_53 := Lista[42];
        dscCompLesao_54 := Lista[43];
        diagProvavel_55 := Lista[44];
        codCID_56 := Lista[45];
        observacao_57 := Lista[46];
        nmEmit_59 := Lista[47];
        ideOC_60 := Lista[48];
        nrOc_61 := Lista[49];
        ufOC_62 := Lista[50];
        dtCatOrig_64 := Lista[51];
        nrCatOrig_65 := Lista[52];
      end;
      Lista.Free;
    end;
end;

end.
