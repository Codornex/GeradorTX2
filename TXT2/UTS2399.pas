unit UTS2399;

interface

uses
  Contnrs, System.Classes;

type
  TS2399 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2399;
    function Add: TS2399;
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
    codCateg_15: String;
    dtTerm_17: String;
    mtvDesligTSV_18: String;
    ideDmDev_21: String;
    tpInsc_23: String;
    nrInsc_24: String;
    codLotacao_25: String;
    codRubr_27: String;
    ideTabRubr_28: String;
    qtdRubr_29: String;
    fatorRubr_30: String;
    vrUnit_31: String;
    vrRubr_32: String;
    cnpjOper_35: String;
    regANS_36: String;
    vrPgTit_37: String;
    tpDep_60: String;
    cpfDep_39: String;
    nmDep_40: String;
    dtNascto_41: String;
    vlrPgDep_42: String;
    grauExp_44: String;
    indSimples_46: String;
    tpTrib_48: String;
    nrProcJud_49: String;
    codSusp_50: String;
    indMV_52: String;
    tpInsc_54: String;
    nrInsc_55: String;
    codCateg_56: String;
    vlrRemunOE_57: String;
    dtFimQuar_59: String;
    property Items[Index: Integer]: TS2399 read GetItem; default;
    procedure GetS2399(const Arq: TStringList);
  end;

implementation

{ TS2399 }

function TS2399.Add: TS2399;
begin
  Result := TS2399.Create;
  inherited Add(Result);
end;

function TS2399.GetItem(Index: Integer): TS2399;
begin
  Result := TS2399(inherited Items[Index]);
end;

procedure TS2399.GetS2399(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2399' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'], [], PChar(Arq[I]), Lista);
      with Add do
      begin
        indRetif_4 := Lista[1];
        nrRecibo_5 := Lista[2];
        tpAmb_6 := Lista[3];
        procEmi_7 := Lista[4];
        verProc_8 := Lista[5];
        tpInsc_10 := Lista[6];
        nrInsc_11 := Lista[7];
        cpfTrab_13 := Lista[8];
        nisTrab_14 := Lista[9];
        codCateg_15 := Lista[10];
        dtTerm_17 := Lista[11];
        mtvDesligTSV_18 := Lista[12];
        ideDmDev_21 := Lista[13];
        tpInsc_23 := Lista[14];
        nrInsc_24 := Lista[15];
        codLotacao_25 := Lista[16];
        codRubr_27 := Lista[17];
        ideTabRubr_28 := Lista[18];
        qtdRubr_29 := Lista[19];
        fatorRubr_30 := Lista[20];
        vrUnit_31 := Lista[21];
        vrRubr_32 := Lista[22];
        cnpjOper_35 := Lista[23];
        regANS_36 := Lista[24];
        vrPgTit_37 := Lista[25];
        tpDep_60 := Lista[26];
        cpfDep_39 := Lista[27];
        nmDep_40 := Lista[28];
        dtNascto_41 := Lista[29];
        vlrPgDep_42 := Lista[30];
        grauExp_44 := Lista[31];
        indSimples_46 := Lista[32];
        tpTrib_48 := Lista[33];
        nrProcJud_49 := Lista[34];
        codSusp_50 := Lista[35];
        indMV_52 := Lista[36];
        tpInsc_54 := Lista[37];
        nrInsc_55 := Lista[38];
        codCateg_56 := Lista[39];
        vlrRemunOE_57 := Lista[40];
        dtFimQuar_59 := Lista[41];
      end;
      Lista.Free;
    end;
end;

end.
