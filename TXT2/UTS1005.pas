unit UTS1005;

interface

uses
  Contnrs, System.Classes;

type
  TS1005 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1005;
    function Add: TS1005;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    tpInsc_13: String;
    nrInsc_14: String;
    iniValid_15: String;
    fimValid_16: String;
    cnaePrep_18: String;
    aliqRat_20: String;
    fap_21: String;
    aliqRatAjust_22: String;
    regPt_36: String;
    contApr_38: String;
    property Items[Index: Integer]: TS1005 read GetItem; default;
    procedure GetS1005(const Arq: TStringList);
  end;

implementation

{ TS1005 }

function TS1005.Add: TS1005;
begin
  Result := TS1005.Create;
  inherited Add(Result);
end;

function TS1005.GetItem(Index: Integer): TS1005;
begin
  Result := TS1005(inherited Items[Index]);
end;

procedure TS1005.GetS1005(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1005'then
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
        tpInsc_13 := Lista[6];
        nrInsc_14 := Lista[7];
        iniValid_15 := Lista[8];
        fimValid_16 := Lista[9];
        cnaePrep_18 := Lista[10];
        aliqRat_20 := Lista[11];
        fap_21 := Lista[12];
        aliqRatAjust_22 := Lista[13];
        regPt_36 := Lista[22];
        contApr_38 := Lista[23];
      end;
      Lista.Free;
    end;
end;

end.
