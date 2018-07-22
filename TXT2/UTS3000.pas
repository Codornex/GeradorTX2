unit UTS3000;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

type
  TS3000 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS3000;
    function Add: TS3000;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    tpEvento_11: String;
    nrRecEvt_12: String;
    cpfTrab_14: String;
    nisTrab_15: String;
    indApuracao_17: String;
    perApur_18: String;
    property Items[Index: Integer]: TS3000 read GetItem; default;
    procedure GetS3000(const Arq: TStringList);
  end;

implementation

{ TS3000 }

function TS3000.Add: TS3000;
begin
  Result := TS3000.Create;
  inherited Add(Result);
end;

function TS3000.GetItem(Index: Integer): TS3000;
begin
  Result := TS3000(inherited Items[Index]);
end;

procedure TS3000.GetS3000(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S3000' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        tpAmb_4 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        procEmi_5 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        verProc_6 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        tpInsc_8 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        nrInsc_9 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        tpEvento_11 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
        nrRecEvt_12 := IfThen(Trim(Lista[7]) = '', '0', Lista[7]);
        cpfTrab_14 := IfThen(Trim(Lista[8]) = '', '0', Lista[8]);
        nisTrab_15 := IfThen(Trim(Lista[9]) = '', '0', Lista[9]);
        indApuracao_17 := IfThen(Trim(Lista[10]) = '', '0', Lista[10]);
        perApur_18 := IfThen(Trim(Lista[11]) = '', '0', Lista[11]);
      end;
      Lista.Free;
    end;
end;

end.
