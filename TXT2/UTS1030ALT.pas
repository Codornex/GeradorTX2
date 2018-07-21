unit UTS1030ALT;

interface

uses
  Contnrs, System.Classes, unUtils;

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
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1030'then
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
        codCargo_13 := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14 := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        nmCargo_17 := Utils.RemoveZerosEsp(Lista[9]);
        codCBO_18 := Utils.RemoveZerosEsp(Lista[10]);
        acumCargo_20 := Utils.RemoveZerosEsp(Lista[11]);
        contagemEsp_21 := Utils.RemoveZerosEsp(Lista[12]);
        dedicExcl_22 := Utils.RemoveZerosEsp(Lista[13]);
        nrLei_24 := Utils.RemoveZerosEsp(Lista[14]);
        dtLei_25 := Utils.RemoveZerosEsp(Lista[15]);
        sitCargo_26 := Utils.RemoveZerosEsp(Lista[16]);
        iniValid_27 := Utils.RemoveZerosEsp(Lista[17]);
        fimValid_28 := Utils.RemoveZerosEsp(Lista[18]);
      end;
      Lista.Free;
    end;
end;

end.
