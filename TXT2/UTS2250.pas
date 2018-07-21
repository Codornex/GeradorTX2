unit UTS2250;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS2250 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2250;
    function Add: TS2250;
  public
    indRetif_4: String;
    nrRecibo_5: String;
    tpAmb_6: String;
    procEmi_7: String;
    verProc_8: String;
    tpInsc_10: String;
    nrInsc_11: String;
    cpfTrab_13: String;
    nisTrab_14: String;
    matricula_15: String;
    dtAvPrv_18: String;
    dtPrevDeslig_19: String;
    tpAvPrevio_20: String;
    observacao_21: String;
    dtCancAvPrv_23: String;
    observacao_24: String;
    mtvCancAvPrevio_25: String;
    property Items[Index: Integer]: TS2250 read GetItem; default;
    procedure GetS2250(const Arq: TStringList);
  end;

implementation

{ TS1010 }

function TS2250.Add: TS2250;
begin
  Result := TS2250.Create;
  inherited Add(Result);
end;

function TS2250.GetItem(Index: Integer): TS2250;
begin
  Result := TS2250(inherited Items[Index]);
end;

procedure TS2250.GetS2250(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2250'then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        indRetif_4 := Utils.RemoveZerosEsp(Lista[1]);
        nrRecibo_5 := Utils.RemoveZerosEsp(Lista[2]);
        tpAmb_6 := Utils.RemoveZerosEsp(Lista[3]);
        procEmi_7 := Utils.RemoveZerosEsp(Lista[4]);
        verProc_8 := Utils.RemoveZerosEsp(Lista[5]);
        tpInsc_10 := Utils.RemoveZerosEsp(Lista[6]);
        nrInsc_11 := Utils.RemoveZerosEsp(Lista[7]);
        cpfTrab_13 := Utils.RemoveZerosEsp(Lista[8]);
        nisTrab_14 := Utils.RemoveZerosEsp(Lista[9]);
        matricula_15 := Utils.RemoveZerosEsp(Lista[10]);
        dtAvPrv_18 := Utils.RemoveZerosEsp(Lista[11]);
        dtPrevDeslig_19 := Utils.RemoveZerosEsp(Lista[12]);
        tpAvPrevio_20 := Utils.RemoveZerosEsp(Lista[13]);
        observacao_21 := Utils.RemoveZerosEsp(Lista[14]);
        dtCancAvPrv_23 := Utils.RemoveZerosEsp(Lista[15]);
        observacao_24 := Utils.RemoveZerosEsp(Lista[16]);
        mtvCancAvPrevio_25 := Utils.RemoveZerosEsp(Lista[17]);
      end;
      Lista.Free;
    end;
end;

end.
