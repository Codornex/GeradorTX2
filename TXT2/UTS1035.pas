unit UTS1035;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS1035 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1035;
    function Add: TS1035;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codCarreira_13: String;
    iniValid_14: String;
    fimValid_15: String;
    dscCarreira_17: String;
    leiCarr_18: String;
    dtLeiCarr_19: String;
    sitCarr_20: String;
    property Items[Index: Integer]: TS1035 read GetItem; default;
    procedure GetS1035(const Arq: TStringList);
  end;

implementation

{ TS1035 }

function TS1035.Add: TS1035;
begin
  Result := TS1035.Create;
  inherited Add(Result);
end;

function TS1035.GetItem(Index: Integer): TS1035;
begin
  Result := TS1035(inherited Items[Index]);
end;

procedure TS1035.GetS1035(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1035'then
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
        codCarreira_13 := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14 := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        dscCarreira_17 := Utils.RemoveZerosEsp(Lista[9]);
        leiCarr_18 := Utils.RemoveZerosEsp(Lista[10]);
        dtLeiCarr_19 := Utils.RemoveZerosEsp(Lista[11]);
        sitCarr_20 := Utils.RemoveZerosEsp(Lista[12]);
      end;
      Lista.Free;
    end;
end;

end.
