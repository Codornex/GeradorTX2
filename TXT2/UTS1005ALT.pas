unit UTS1005ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1005ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1005ALT;
    function Add: TS1005ALT;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    tpInsc_13: String;
    nrInsc_14: String;
    iniValid_15: String;
    fimValid_16: String;
    cnaePrep_18: String;
    aliqRat_20: String;
    fap_21: String;
    aliqRatAjust_22: String;
    tpProc_24: String;
    nrProc_25: String;
    codSusp_26: String;
    tpProc_28: String;
    nrProc_29: String;
    codSusp_30: String;
    tpCaepf_32: String;
    indSubstPatrObra_34: String;
    regPt_36: String;
    contApr_38: String;
    nrProcJud_39: String;
    contEntEd_40: String;
    nrInsc_42: String;
    contPCD_44: String;
    nrProcJud_45: String;
    iniValid_46: String;
    fimValid_47: String;
    property Items[Index: Integer]: TS1005ALT read GetItem; default;
    procedure GetS1005ALT(const Arq: TStringList);
  end;

implementation

{ TS1005ALT }

function TS1005ALT.Add: TS1005ALT;
begin
  Result := TS1005ALT.Create;
  inherited Add(Result);
end;

function TS1005ALT.GetItem(Index: Integer): TS1005ALT;
begin
  Result := TS1005ALT(inherited Items[Index]);
end;

procedure TS1005ALT.GetS1005ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1005'then
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
        tpInsc_13 := Lista[6];
        nrInsc_14 := Lista[7];
        iniValid_15 := Lista[8];
        fimValid_16 := Lista[9];
        cnaePrep_18 := Lista[10];
        aliqRat_20 := Lista[11];
        fap_21 := Lista[12];
        aliqRatAjust_22 := Lista[13];
        tpProc_24 := Lista[14];
        nrProc_25 := Lista[15];
        codSusp_26 := Lista[16];
        tpProc_28 := Lista[17];
        nrProc_29 := Lista[18];
        codSusp_30 := Lista[19];
        tpCaepf_32 := Lista[20];
        indSubstPatrObra_34 := Lista[21];
        regPt_36 := Lista[22];
        contApr_38 := Lista[23];
        nrProcJud_39 := Lista[24];
        contEntEd_40 := Lista[25];
        nrInsc_42 := Lista[26];
        contPCD_44 := Lista[27];
        nrProcJud_45 := Lista[28];
        iniValid_46 := Lista[19];
        fimValid_47 := Lista[30];
      end;
      Lista.Free;
    end;
end;

end.
