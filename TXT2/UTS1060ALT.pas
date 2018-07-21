unit UTS1060ALT;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS1060ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1060ALT;
    function Add: TS1060ALT;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codAmb_13: String;
    iniValid_14: String;
    fimValid_15: String;
    dscAmb_17: String;
    localAmb_18: String;
    tpInsc_19: String;
    nrInsc_20: String;
    codFatRis_22: String;
    iniValid_23: String;
    fimValid_24: String;
    property Items[Index: Integer]: TS1060ALT read GetItem; default;
    procedure GetS1060ALT(const Arq: TStringList);
  end;

implementation

{ TS1060ALT }

function TS1060ALT.Add: TS1060ALT;
begin
  Result := TS1060ALT.Create;
  inherited Add(Result);
end;

function TS1060ALT.GetItem(Index: Integer): TS1060ALT;
begin
  Result := TS1060ALT(inherited Items[Index]);
end;

procedure TS1060ALT.GetS1060ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1060' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        tpAmb_4 := Utils.RemoveZerosEsp(Lista[1]);
        procEmi_5 := Utils.RemoveZerosEsp(Lista[2]);
        verProc_6 := Utils.RemoveZerosEsp(Lista[3]);
        tpInsc_8 := Utils.RemoveZerosEsp(Lista[4]);
        nrInsc_9 := Utils.RemoveZerosEsp(Lista[5]);
        codAmb_13 := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14 := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        dscAmb_17 := Utils.RemoveZerosEsp(Lista[9]);
        localAmb_18 := Utils.RemoveZerosEsp(Lista[10]);
        tpInsc_19 := Utils.RemoveZerosEsp(Lista[11]);
        nrInsc_20 := Utils.RemoveZerosEsp(Lista[12]);
        codFatRis_22 := Utils.RemoveZerosEsp(Lista[13]);
        iniValid_23 := Utils.RemoveZerosEsp(Lista[14]);
        fimValid_24 := Utils.RemoveZerosEsp(Lista[15]);
      end;
      Lista.Free;
    end;
end;

end.
