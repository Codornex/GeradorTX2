unit UTS1030ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1030ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1030ALT;
    function Add: TS1030ALT;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codCargo_13: String;
    iniValid_14: String;
    fimValid_15: String;
    nmCargo_17: String;
    codCBO_18: String;
    acumCargo_20: String;
    contagemEsp_21: String;
    dedicExcl_22: String;
    nrLei_24: String;
    dtLei_25: String;
    sitCargo_26: String;
    iniValid_27: String;
    fimValid_28: String;
    property Items[Index: Integer]: TS1030ALT read GetItem; default;
    procedure GetS1030ALT(const Arq: TStringList);
  end;

implementation

{ TS1030ALT }

function TS1030ALT.Add: TS1030ALT;
begin
  Result := TS1030ALT.Create;
  inherited Add(Result);
end;

function TS1030ALT.GetItem(Index: Integer): TS1030ALT;
begin
  Result := TS1030ALT(inherited Items[Index]);
end;

procedure TS1030ALT.GetS1030ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1030'then
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
        codCargo_13 := Lista[6];
        iniValid_14 := Lista[7];
        fimValid_15 := Lista[8];
        nmCargo_17 := Lista[9];
        codCBO_18 := Lista[10];
        acumCargo_20 := Lista[11];
        contagemEsp_21 := Lista[12];
        dedicExcl_22 := Lista[13];
        nrLei_24 := Lista[14];
        dtLei_25 := Lista[15];
        sitCargo_26 := Lista[16];
        iniValid_27 := Lista[17];
        fimValid_28 := Lista[18];
      end;
      Lista.Free;
    end;
end;

end.
