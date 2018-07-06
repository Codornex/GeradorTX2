unit UTS1000;

interface

uses
  Contnrs, System.Classes;

type
  TS1000 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS1000;
    function Add: TS1000;
  public
    tpAmb_4: String;
    procEmi_5: String;
    verProc_6: String;
    tpInsc_8: String;
    nrInsc_9: String;
    iniValid_13: String;
    fimValid_14: String;
    nmRazao_15: String;
    classTrib_16: String;
    natJurid_17: String;
    indCoop_18: String;
    indConstr_19: String;
    indDesFolha_20: String;
    indOptRegEletron_21: String;
    indEntEd_23: String;
    indEtt_24: String;
    nmCtt_36: String;
    cpfCtt_37: String;
    foneFixo_38: String;
    email_40: String;
    cnpjSoftHouse_56: String;
    nmRazao_57: String;
    nmCont_58: String;
    telefone_59: String;
    email_60: String;
    indSitPJ_63: String;
    property Items[Index: Integer]: TS1000 read GetItem; default;
    procedure GetS1000(const Arq: TStringList);
  end;

implementation

{ TS1000 }

function TS1000.Add: TS1000;
begin
  Result := TS1000.Create;
  inherited Add(Result);
end;

function TS1000.GetItem(Index: Integer): TS1000;
begin
  Result := TS1000(inherited Items[Index]);
end;

procedure TS1000.GetS1000(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S1000'then
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
        iniValid_13 := Lista[6];
        fimValid_14 := Lista[7];
        nmRazao_15 := Lista[8];
        classTrib_16 := Lista[9];
        natJurid_17 := Lista[10];
        indCoop_18 := Lista[11];
        indConstr_19 := Lista[12];
        indDesFolha_20 := Lista[13];
        indOptRegEletron_21 := Lista[14];
        indEntEd_23 := Lista[15];
        indEtt_24 := Lista[16];
        nmCtt_36 := Lista[26];
        cpfCtt_37 := Lista[27];
        foneFixo_38 := Lista[28];
        email_40 := Lista[30];
        cnpjSoftHouse_56 := Lista[41];
        nmRazao_57 := Lista[42];
        nmCont_58 := Lista[43];
        telefone_59 := Lista[44];
        email_60 := Lista[45];
        indSitPJ_63 := Lista[46];
      end;
      Lista.Free;
    end;
end;

end.
