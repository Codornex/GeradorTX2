unit UTS5012;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

type
  TS5012 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS5012;
    function Add: TS5012;
  public
    perApur_4: String;
    tpInsc_6: String;
    nrInsc_7: String;
    indExistInfo_10: String;
    tpCR_12: String;
    vrCR_13: String;
    property Items[Index: Integer]: TS5012 read GetItem; default;
    procedure GetS5012(const Arq: TStringList);
  end;

implementation

{ TS5012 }

function TS5012.Add: TS5012;
begin
  Result := TS5012.Create;
  inherited Add(Result);
end;

function TS5012.GetItem(Index: Integer): TS5012;
begin
  Result := TS5012(inherited Items[Index]);
end;

procedure TS5012.GetS5012(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S5012' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        perApur_4 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        tpInsc_6 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        nrInsc_7 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        indExistInfo_10 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        tpCR_12 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        vrCR_13 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
      end;
      Lista.Free;
    end;
end;

end
