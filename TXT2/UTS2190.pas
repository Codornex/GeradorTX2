unit UTS2190;

interface

uses
  Contnrs, System.Classes;

type
  TS2190 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2190;
    function Add: TS2190;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    cpfTrab_11: String;
    dtNascto_12: String;
    dtAdm_13: String;
    property Items[Index: Integer]: TS2190 read GetItem; default;
    procedure GetS2190(const Arq: TStringList);
  end;

implementation

{ TS2190 }

function TS2190.Add: TS2190;
begin
  Result := TS2190.Create;
  inherited Add(Result);
end;

function TS2190.GetItem(Index: Integer): TS2190;
begin
  Result := TS2190(inherited Items[Index]);
end;

procedure TS2190.GetS2190(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2190'then
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
        cpfTrab_11 := Lista[6];
        dtNascto_12 := Lista[7];
        dtAdm_13 := Lista[8];
      end;
      Lista.Free;
    end;
end;

end.
