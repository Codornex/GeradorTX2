unit UTS1060;

interface

uses
  Contnrs, System.Classes;

type
  TS1060 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1060;
    function Add: TS1060;
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
    property Items[Index: Integer]: TS1060 read GetItem; default;
    procedure GetS1060(const Arq: TStringList);
  end;

implementation

{ TS1060 }

function TS1060.Add: TS1060;
begin
  Result := TS1060.Create;
  inherited Add(Result);
end;

function TS1060.GetItem(Index: Integer): TS1060;
begin
  Result := TS1060(inherited Items[Index]);
end;

procedure TS1060.GetS1060(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1060' then
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
        codAmb_13 := Lista[6];
        iniValid_14 := Lista[7];
        fimValid_15 := Lista[8];
        dscAmb_17 := Lista[9];
        localAmb_18 := Lista[10];
        tpInsc_19 := Lista[11];
        nrInsc_20 := Lista[12];
        codFatRis_22 := Lista[13];
      end;
      Lista.Free;
    end;
end;

end.
