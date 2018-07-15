unit UTS1020ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1020ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1020ALT;
    function Add: TS1020ALT;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codLotacao_13 : String;
    iniValid_14: String;
    fimValid_15: String;
    tpLotacao_17: String;
    tpInsc_18: String;
    nrInsc_19: String;
    fpas_21: String;
    codTercs_22: String;
    codTercsSusp_23: String;
    tpInscContrat_30: String;
    nrInscContrat_31: String;
    tpInscProp_32: String;
    nrInscProp_33: String;
    codTerc_26: String;
    nrProcJud_27: String;
    codSusp_28: String;
    iniValid_34: String;
    fimValid_35: String;
    property Items[Index: Integer]: TS1020ALT read GetItem; default;
    procedure GetS1020ALT(const Arq: TStringList);
  end;

implementation


{ TS1020 }

function TS1020ALT.Add: TS1020ALT;
begin
  Result := TS1020ALT.Create;
  inherited Add(Result);
end;

function TS1020ALT.GetItem(Index: Integer): TS1020ALT;
begin
  Result := TS1020ALT(inherited Items[Index]);
end;

procedure TS1020ALT.GetS1020ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1020'then
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
        codLotacao_13 := Lista[6];
        iniValid_14 := Lista[7];
        fimValid_15 := Lista[8];
        tpLotacao_17 := Lista[9];
        tpInsc_18 := Lista[10];
        nrInsc_19 := Lista[11];
        fpas_21 := Lista[12];
        codTercs_22 := Lista[13];
        codTercsSusp_23 := Lista[14];
        tpInscContrat_30 := Lista[15];
        nrInscContrat_31 := Lista[16];
        tpInscProp_32 := Lista[17];
        nrInscProp_33 := Lista[18];
        codTerc_26 := Lista[19];
        nrProcJud_27 := Lista[20];
        codSusp_28 := Lista[21];
        iniValid_34 := Lista[22];
        fimValid_35 := Lista[23];
      end;
      Lista.Free;
    end;
end;

end.

