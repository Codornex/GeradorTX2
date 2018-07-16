unit UTS1050ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1050ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1050ALT;
    function Add: TS1050ALT;
  public
    tpAmb_4 : String;
    procEmi_5 : String;
    verProc_6 : String;
    tpInsc_8 : String;
    nrInsc_9 : String;
    codHorContrat_13 : String;
    iniValid_14 : String;
    fimValid_15 : String;
    hrEntr_17 : String;
    hrSaida_18 : String;
    durJornada_19 : String;
    perHorFlexivel_20 : String;
    tpInterv_22: String;
    durInterv_23: String;
    iniInterv_24: String;
    termInterv_25: String;
    iniValid_26: String;
    fimValid_27: String;
    property Items[Index: Integer]: TS1050ALT read GetItem; default;
    procedure GetS1050ALT(const Arq: TStringList);
  end;

implementation

{ TS1050ALT }

function TS1050ALT.Add: TS1050ALT;
begin
  Result := TS1050ALT.Create;
  inherited Add(Result);
end;

function TS1050ALT.GetItem(Index: Integer): TS1050ALT;
begin
  Result := TS1050ALT(inherited Items[Index]);
end;

procedure TS1050ALT.GetS1050ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1050'then
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
        codHorContrat_13  := Lista[6];
        iniValid_14  := Lista[7];
        fimValid_15  := Lista[8];
        hrEntr_17  := Lista[9];
        hrSaida_18  := Lista[10];
        durJornada_19  := Lista[11];
        perHorFlexivel_20  := Lista[12];
        tpInterv_22 := Lista[13];
        durInterv_23 := Lista[14];
        iniInterv_24 := Lista[15];
        termInterv_25 := Lista[16];
        iniValid_26 := Lista[17];
        fimValid_27 := Lista[18];
      end;
      Lista.Free;
    end;
end;

end.
