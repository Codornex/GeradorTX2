unit UTS1040;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS1040 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1040;
    function Add: TS1040;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codFuncao_13: String;
    iniValid_14: String;
    fimValid_15: String;
    dscFuncao_17: String;
    codCBO_18: String;
    property Items[Index: Integer]: TS1040 read GetItem; default;
    procedure GetS1040(const Arq: TStringList);
  end;

implementation

{ TS1040 }

function TS1040.Add: TS1040;
begin
  Result := TS1040.Create;
  inherited Add(Result);
end;

function TS1040.GetItem(Index: Integer): TS1040;
begin
  Result := TS1040(inherited Items[Index]);
end;

procedure TS1040.GetS1040(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1040' then
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
        codFuncao_13 := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14 := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        dscFuncao_17 := Utils.RemoveZerosEsp(Lista[9]);
        codCBO_18 := Utils.RemoveZerosEsp(Lista[10]);
      end;
      Lista.Free;
    end;
end;

end.
