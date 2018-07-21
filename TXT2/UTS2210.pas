unit UTS2210;

interface

uses
  Contnrs, System.Classes, unUtils;

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
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2210' then
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
        tpRegistrador_10 := Utils.RemoveZerosEsp(Lista[6]);
        tpInsc_11 := Utils.RemoveZerosEsp(Lista[7]);
        nrInsc_12 := Utils.RemoveZerosEsp(Lista[8]);
        tpInsc_14 := Utils.RemoveZerosEsp(Lista[9]);
        nrInsc_15 := Utils.RemoveZerosEsp(Lista[10]);
        cpfTrab_17 := Utils.RemoveZerosEsp(Lista[11]);
        nisTrab_18 := Utils.RemoveZerosEsp(Lista[12]);
        dtAcid_20 := Utils.RemoveZerosEsp(Lista[13]);
        tpAcid_21 := Utils.RemoveZerosEsp(Lista[14]);
        hrAcid_22 := Utils.RemoveZerosEsp(Lista[15]);
        hrsTrabAntesAcid_23 := Utils.RemoveZerosEsp(Lista[16]);
        tpCat_24 := Utils.RemoveZerosEsp(Lista[17]);
        indCatObito_25 := Utils.RemoveZerosEsp(Lista[18]);
        dtObito_26 := Utils.RemoveZerosEsp(Lista[19]);
        indComunPolicia_27 := Utils.RemoveZerosEsp(Lista[20]);
        codSitGeradora_28 := Utils.RemoveZerosEsp(Lista[21]);
        iniciatCAT_29 := Utils.RemoveZerosEsp(Lista[22]);
        observacao_30 := Utils.RemoveZerosEsp(Lista[23]);
        tpLocal_32 := Utils.RemoveZerosEsp(Lista[24]);
        dscLocal_33 := Utils.RemoveZerosEsp(Lista[25]);
        dscLograd_34 := Utils.RemoveZerosEsp(Lista[26]);
        nrLograd_35 := Utils.RemoveZerosEsp(Lista[27]);
        codMunic_36 := Utils.RemoveZerosEsp(Lista[28]);
        uf_37 := Utils.RemoveZerosEsp(Lista[29]);
        cnpjLocalAcid_38 := Utils.RemoveZerosEsp(Lista[30]);
        pais_39 := Utils.RemoveZerosEsp(Lista[31]);
        codPostal_40 := Utils.RemoveZerosEsp(Lista[32]);
        codParteAting_42 := Utils.RemoveZerosEsp(Lista[33]);
        lateralidade_43 := Utils.RemoveZerosEsp(Lista[34]);
        codAgntCausador_45 := Utils.RemoveZerosEsp(Lista[35]);
        codCNES_47 := Utils.RemoveZerosEsp(Lista[36]);
        dtAtendimento_48 := Utils.RemoveZerosEsp(Lista[37]);
        hrAtendimento_49 := Utils.RemoveZerosEsp(Lista[38]);
        indInternacao_50 := Utils.RemoveZerosEsp(Lista[39]);
        durTrat_51 := Utils.RemoveZerosEsp(Lista[40]);
        indAfast_52 := Utils.RemoveZerosEsp(Lista[41]);
        dscLesao_53 := Utils.RemoveZerosEsp(Lista[42]);
        dscCompLesao_54 := Utils.RemoveZerosEsp(Lista[43]);
        diagProvavel_55 := Utils.RemoveZerosEsp(Lista[44]);
        codCID_56 := Utils.RemoveZerosEsp(Lista[45]);
        observacao_57 := Utils.RemoveZerosEsp(Lista[46]);
        nmEmit_59 := Utils.RemoveZerosEsp(Lista[47]);
        ideOC_60 := Utils.RemoveZerosEsp(Lista[48]);
        nrOc_61 := Utils.RemoveZerosEsp(Lista[49]);
        ufOC_62 := Utils.RemoveZerosEsp(Lista[50]);
        dtCatOrig_64 := Utils.RemoveZerosEsp(Lista[51]);
        nrCatOrig_65 := Utils.RemoveZerosEsp(Lista[52]);
      end;
      Lista.Free;
    end;
end;

end.
