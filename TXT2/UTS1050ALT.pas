unit UTS1050ALT;

interface

uses
  Contnrs, System.Classes, unUtils;

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
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1050'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        tpAmb_4  := Utils.RemoveZerosEsp(Lista[1]);
        procEmi_5  := Utils.RemoveZerosEsp(Lista[2]);
        verProc_6  := Utils.RemoveZerosEsp(Lista[3]);
        tpInsc_8  := Utils.RemoveZerosEsp(Lista[4]);
        nrInsc_9  := Utils.RemoveZerosEsp(Lista[5]);
        codHorContrat_13  := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14  := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15  := Utils.RemoveZerosEsp(Lista[8]);
        hrEntr_17  := Utils.RemoveZerosEsp(Lista[9]);
        hrSaida_18  := Utils.RemoveZerosEsp(Lista[10]);
        durJornada_19  := Utils.RemoveZerosEsp(Lista[11]);
        perHorFlexivel_20  := Utils.RemoveZerosEsp(Lista[12]);
        tpInterv_22 := Utils.RemoveZerosEsp(Lista[13]);
        durInterv_23 := Utils.RemoveZerosEsp(Lista[14]);
        iniInterv_24 := Utils.RemoveZerosEsp(Lista[15]);
        termInterv_25 := Utils.RemoveZerosEsp(Lista[16]);
        iniValid_26 := Utils.RemoveZerosEsp(Lista[17]);
        fimValid_27 := Utils.RemoveZerosEsp(Lista[18]);
      end;
      Lista.Free;
    end;
end;

end.
