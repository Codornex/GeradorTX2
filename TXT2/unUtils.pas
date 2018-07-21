unit unUtils;

interface

uses
  Contnrs, System.Classes;

type
  TUtils = class(TObjectList)
  private
    function GetItem(Index: Integer): TUtils;
    function Add: TUtils;
  public
    property Items[Index: Integer]: TUtils read GetItem; default;
    function RemoveZerosEsp(S: string): string;
  end;

implementation

{ TUtils }

function TUtils.Add: TUtils;
begin
  Result := TUtils.Create;
  inherited Add(Result);
end;

function TUtils.GetItem(Index: Integer): TUtils;
begin
  Result := TUtils(inherited Items[Index]);
end;

function TUtils.RemoveZerosEsp(S: string): string;
var
  I, J : Integer;
begin
  I := Length(S);
  while (I > 0) and (S[I] <= ' ') do
  begin
    Dec(I);
  end;
  J := 1;
  while (J < I) and ((S[J] <= ' ') or (S[J] = '0')) do
  begin
    Inc(J);
  end;
  Result := Copy(S, J, (I-J)+1);
end;

end.
