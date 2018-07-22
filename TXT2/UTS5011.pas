unit UTS5011;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

type
  TS5011 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS5011;
    function Add: TS5011;
  public
    indApuracao_4: String;
    perApur_5: String;
    tpInsc_7: String;
    nrInsc_8: String;
    indExistInfo_11: String;
    classTrib_16: String;
    property Items[Index: Integer]: TS5011 read GetItem; default;
    procedure GetS5011(const Arq: TStringList);
  end;

implementation

{ TS5011 }

function TS5011.Add: TS5011;
begin
  Result := TS5011.Create;
  inherited Add(Result);
end;

function TS5011.GetItem(Index: Integer): TS5011;
begin
  Result := TS5011(inherited Items[Index]);
end;

procedure TS5011.GetS5011(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S5011' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        indApuracao_4 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        perApur_5 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        tpInsc_7 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        nrInsc_8 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        indExistInfo_11 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        classTrib_16 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
      end;
      Lista.Free;
    end;
end;

end.
