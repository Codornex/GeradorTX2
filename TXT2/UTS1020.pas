unit UTS1020;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS1020 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1020;
    function Add: TS1020;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    codLotacao_13 : String;
    iniValid_14: String;
    fimValid_15: String;
    tpLotacao_17: String;
    fpas_21: String;
    codTercs_22: String;
    property Items[Index: Integer]: TS1020 read GetItem; default;
    procedure GetS1020(const Arq: TStringList);
  end;

implementation


{ TS1020 }

function TS1020.Add: TS1020;
begin
  Result := TS1020.Create;
  inherited Add(Result);
end;

function TS1020.GetItem(Index: Integer): TS1020;
begin
  Result := TS1020(inherited Items[Index]);
end;

procedure TS1020.GetS1020(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1020'then
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
        codLotacao_13 := Utils.RemoveZerosEsp(Lista[6]);
        iniValid_14 := Utils.RemoveZerosEsp(Lista[7]);
        fimValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        tpLotacao_17 := Utils.RemoveZerosEsp(Lista[9]);
        fpas_21 := Utils.RemoveZerosEsp(Lista[12]);
        codTercs_22 := Utils.RemoveZerosEsp(Lista[13]);
      end;
      Lista.Free;
    end;
end;

end.

