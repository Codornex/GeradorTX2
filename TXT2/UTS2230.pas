unit UTS2230;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS2230 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2230;
    function Add: TS2230;
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
    codCateg_60: String;
    dtIniAfast_18: String;
    codMotAfast_19: String;
    infoMesmoMtv_20: String;
    tpAcidTransito_21: String;
    observacao_22: String;
    codCID_24: String;
    qtdDiasAfast_25: String;
    nmEmit_27: String;
    ideOC_28: String;
    nrOc_29: String;
    ufOC_30: String;
    cnpjCess_32: String;
    infOnus_33: String;
    cnpjSind_35: String;
    infOnusRemun_36: String;
    origRetif_57: String;
    tpProc_58: String;
    nrProc_59: String;
    dtTermAfast_53: String;
    property Items[Index: Integer]: TS2230 read GetItem; default;
    procedure GetS2230(const Arq: TStringList);
  end;

implementation

{ TS2230 }

function TS2230.Add: TS2230;
begin
  Result := TS2230.Create;
  inherited Add(Result);
end;

function TS2230.GetItem(Index: Integer): TS2230;
begin
  Result := TS2230(inherited Items[Index]);
end;

procedure TS2230.GetS2230(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2230' then
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
        codCateg_60 := Utils.RemoveZerosEsp(Lista[11]);
        dtIniAfast_18 := Utils.RemoveZerosEsp(Lista[12]);
        codMotAfast_19 := Utils.RemoveZerosEsp(Lista[13]);
        infoMesmoMtv_20 := Utils.RemoveZerosEsp(Lista[14]);
        tpAcidTransito_21 := Utils.RemoveZerosEsp(Lista[15]);
        observacao_22 := Utils.RemoveZerosEsp(Lista[16]);
        codCID_24 := Utils.RemoveZerosEsp(Lista[17]);
        qtdDiasAfast_25 := Utils.RemoveZerosEsp(Lista[18]);
        nmEmit_27 := Utils.RemoveZerosEsp(Lista[19]);
        ideOC_28 := Utils.RemoveZerosEsp(Lista[20]);
        nrOc_29 := Utils.RemoveZerosEsp(Lista[21]);
        ufOC_30 := Utils.RemoveZerosEsp(Lista[22]);
        cnpjCess_32 := Utils.RemoveZerosEsp(Lista[23]);
        infOnus_33 := Utils.RemoveZerosEsp(Lista[24]);
        cnpjSind_35 := Utils.RemoveZerosEsp(Lista[25]);
        infOnusRemun_36 := Utils.RemoveZerosEsp(Lista[26]);
        origRetif_57 := Utils.RemoveZerosEsp(Lista[27]);
        tpProc_58 := Utils.RemoveZerosEsp(Lista[28]);
        nrProc_59 := Utils.RemoveZerosEsp(Lista[29]);
        dtTermAfast_53 := Utils.RemoveZerosEsp(Lista[30]);
      end;
      Lista.Free;
    end;
end;

end.
