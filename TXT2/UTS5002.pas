unit UTS5002;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

type
  TS5002 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS5002;
    function Add: TS5002;
  public
    perApur_5: String;
    tpInsc_7: String;
    nrInsc_8: String;
    cpfTrab_10: String;
    indResBr_15: String;
    tpValor_17: String;
    valor_18: String;
    property Items[Index: Integer]: TS5002 read GetItem; default;
    procedure GetS5002(const Arq: TStringList);
  end;

implementation

{ TS5002 }

function TS5002.Add: TS5002;
begin
  Result := TS5002.Create;
  inherited Add(Result);
end;

function TS5002.GetItem(Index: Integer): TS5002;
begin
  Result := TS5002(inherited Items[Index]);
end;

procedure TS5002.GetS5002(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S5002' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        perApur_5 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        tpInsc_7 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        nrInsc_8 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        cpfTrab_10 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        indResBr_15 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        tpValor_17 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
        valor_18 := IfThen(Trim(Lista[7]) = '', '0', Lista[7]);
      end;
      Lista.Free;
    end;
end;

end.
