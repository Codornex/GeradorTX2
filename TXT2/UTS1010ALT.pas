unit UTS1010ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1010ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1010ALT;
    function Add: TS1010ALT;
  public
    tpAmb_4 : String;
    procEmi_5 : String;
    verProc_6 : String;
    tpInsc_8 : String;
    nrInsc_9 : String;
    codRubr_13 : String;
    ideTabRubr_14 : String;
    iniValid_15 : String;
    fimValid_16 : String;
    dscRubr_18 : String;
    natRubr_19 : String;
    tpRubr_20 : String;
    codIncCP_21 : String;
    codIncIRRF_22 : String;
    codIncFGTS_23 : String;
    codIncSIND_24 : String;
    observacao_29 : String;
    tpProc_31 : String;
    nrProc_32 : String;
    extDecisao_33 : String;
    codSusp_34 : String;
    nrProc_36 : String;
    codSusp_37 : String;
    nrProc_39 : String;
    nrProc_42 : String;
    iniValid_44 : String;
    fimValid_45 : String;
    property Items[Index: Integer]: TS1010ALT read GetItem; default;
    procedure GetS1010ALT(const Arq: TStringList);
  end;

implementation

{ TS1010ALT }

function TS1010ALT.Add: TS1010ALT;
begin
  Result := TS1010ALT.Create;
  inherited Add(Result);
end;

function TS1010ALT.GetItem(Index: Integer): TS1010ALT;
begin
  Result := TS1010ALT(inherited Items[Index]);
end;

procedure TS1010ALT.GetS1010ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1010'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        tpAmb_4  := Lista[1];
        procEmi_5  := Lista[2];
        verProc_6  := Lista[3];
        tpInsc_8  := Lista[4];
        nrInsc_9  := Lista[5];
        codRubr_13  := Lista[6];
        ideTabRubr_14  := Lista[7];
        iniValid_15  := Lista[8];
        fimValid_16  := Lista[9];
        dscRubr_18  := Lista[10];
        natRubr_19  := Lista[11];
        tpRubr_20  := Lista[12];
        codIncCP_21  := Lista[13];
        codIncIRRF_22  := Lista[14];
        codIncFGTS_23  := Lista[15];
        codIncSIND_24  := Lista[16];
        observacao_29  := Lista[17];
        tpProc_31 := Lista[18];
        nrProc_32 := Lista[19];
        extDecisao_33 := Lista[20];
        codSusp_34 := Lista[21];
        nrProc_36 := Lista[22];
        codSusp_37 := Lista[23];
        nrProc_39 := Lista[24];
        nrProc_42 := Lista[25];
        iniValid_44 := Lista[26];
        fimValid_45 := Lista[27];
      end;
      Lista.Free;
    end;
end;

end.
