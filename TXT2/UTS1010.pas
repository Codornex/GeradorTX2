unit UTS1010;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS1010 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1010;
    function Add: TS1010;
  public
    tpAmb_4 : String;
    procEmi_5 : String;
    verProc_6 : String;
    tpInsc_8 : String;
    nrInsc_9 : String;
    codRubr_13 : String;
    ideTabRubr_14 : String;
    iniValid_15 : String;
    fimValid_16 : String;
    dscRubr_18 : String;
    natRubr_19 : String;
    tpRubr_20 : String;
    codIncCP_21 : String;
    codIncIRRF_22 : String;
    codIncFGTS_23 : String;
    codIncSIND_24 : String;
    observacao_29 : String;
    property Items[Index: Integer]: TS1010 read GetItem; default;
    procedure GetS1010(const Arq: TStringList);
  end;

implementation

{ TS1010 }

function TS1010.Add: TS1010;
begin
  Result := TS1010.Create;
  inherited Add(Result);
end;

function TS1010.GetItem(Index: Integer): TS1010;
begin
  Result := TS1010(inherited Items[Index]);
end;

procedure TS1010.GetS1010(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1010'then
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
        codRubr_13 := Utils.RemoveZerosEsp(Lista[6]);
        ideTabRubr_14 := Utils.RemoveZerosEsp(Lista[7]);
        iniValid_15 := Utils.RemoveZerosEsp(Lista[8]);
        fimValid_16 := Utils.RemoveZerosEsp(Lista[9]);
        dscRubr_18 := Utils.RemoveZerosEsp(Lista[10]);
        natRubr_19 := Utils.RemoveZerosEsp(Lista[11]);
        tpRubr_20 := Utils.RemoveZerosEsp(Lista[12]);
        codIncCP_21 := Utils.RemoveZerosEsp(Lista[13]);
        codIncIRRF_22 := Utils.RemoveZerosEsp(Lista[14]);
        codIncFGTS_23 := Utils.RemoveZerosEsp(Lista[15]);
        codIncSIND_24 := Utils.RemoveZerosEsp(Lista[16]);
        observacao_29 := Utils.RemoveZerosEsp(Lista[17]);
      end;
      Lista.Free;
    end;
end;

end.
