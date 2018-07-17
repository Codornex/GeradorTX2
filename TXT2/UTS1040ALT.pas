unit UTS1040ALT;

interface

uses
  Contnrs, System.Classes;

type
  TS1040ALT = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1040ALT;
    function Add: TS1040ALT;
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
    iniValid_19: String;
    fimValid_20: String;
    property Items[Index: Integer]: TS1040ALT read GetItem; default;
    procedure GetS1040ALT(const Arq: TStringList);
  end;

implementation

{ TS1040ALT }

function TS1040ALT.Add: TS1040ALT;
begin
  Result := TS1040ALT.Create;
  inherited Add(Result);
end;

function TS1040ALT.GetItem(Index: Integer): TS1040ALT;
begin
  Result := TS1040ALT(inherited Items[Index]);
end;

procedure TS1040ALT.GetS1040ALT(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1040'then
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
        codFuncao_13 := Lista[6];
        iniValid_14 := Lista[7];
        fimValid_15 := Lista[8];
        dscFuncao_17 := Lista[9];
        codCBO_18 := Lista[10];
        iniValid_19 := Lista[11];
        fimValid_20 := Lista[12];
      end;
      Lista.Free;
    end;
end;

end.
