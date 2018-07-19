unit UTS2399;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

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
        indRetif_4 := IfThen(Trim(Lista[1]) = '', '0', Lista[1]);
        nrRecibo_5 := IfThen(Trim(Lista[2]) = '', '0', Lista[2]);
        tpAmb_6 := IfThen(Trim(Lista[3]) = '', '0', Lista[3]);
        procEmi_7 := IfThen(Trim(Lista[4]) = '', '0', Lista[4]);
        verProc_8 := IfThen(Trim(Lista[5]) = '', '0', Lista[5]);
        tpInsc_10 := IfThen(Trim(Lista[6]) = '', '0', Lista[6]);
        nrInsc_11 := IfThen(Trim(Lista[7]) = '', '0', Lista[7]);
        cpfTrab_13 := IfThen(Trim(Lista[8]) = '', '0', Lista[8]);
        nisTrab_14 := IfThen(Trim(Lista[9]) = '', '0', Lista[9]);
        codCateg_15 := IfThen(Trim(Lista[10]) = '', '0', Lista[10]);
        dtTerm_17 := IfThen(Trim(Lista[11]) = '', '0', Lista[11]);
        mtvDesligTSV_18 := IfThen(Trim(Lista[12]) = '', '0', Lista[12]);
        ideDmDev_21 := IfThen(Trim(Lista[13]) = '', '0', Lista[13]);
        tpInsc_23 := IfThen(Trim(Lista[14]) = '', '0', Lista[14]);
        nrInsc_24 := IfThen(Trim(Lista[15]) = '', '0', Lista[15]);
        codLotacao_25 := IfThen(Trim(Lista[16]) = '', '0', Lista[16]);
        codRubr_27 := IfThen(Trim(Lista[17]) = '', '0', Lista[17]);
        ideTabRubr_28 := IfThen(Trim(Lista[18]) = '', '0', Lista[18]);
        qtdRubr_29 := IfThen(Trim(Lista[19]) = '', '0', Lista[19]);
        fatorRubr_30 := IfThen(Trim(Lista[20]) = '', '0', Lista[20]);
        vrUnit_31 := IfThen(Trim(Lista[21]) = '', '0', Lista[21]);
        vrRubr_32 := IfThen(Trim(Lista[22]) = '', '0', Lista[22]);
        cnpjOper_35 := IfThen(Trim(Lista[23]) = '', '0', Lista[23]);
        regANS_36 := IfThen(Trim(Lista[24]) = '', '0', Lista[24]);
        vrPgTit_37 := IfThen(Trim(Lista[25]) = '', '0', Lista[25]);
        tpDep_60 := IfThen(Trim(Lista[26]) = '', '0', Lista[26]);
        cpfDep_39 := IfThen(Trim(Lista[27]) = '', '0', Lista[27]);
        nmDep_40 := IfThen(Trim(Lista[28]) = '', '0', Lista[28]);
        dtNascto_41 := IfThen(Trim(Lista[29]) = '', '0', Lista[29]);
        vlrPgDep_42 := IfThen(Trim(Lista[30]) = '', '0', Lista[30]);
        grauExp_44 := IfThen(Trim(Lista[31]) = '', '0', Lista[31]);
        indSimples_46 := IfThen(Trim(Lista[32]) = '', '0', Lista[32]);
        tpTrib_48 := IfThen(Trim(Lista[33]) = '', '0', Lista[33]);
        nrProcJud_49 := IfThen(Trim(Lista[34]) = '', '0', Lista[34]);
        codSusp_50 := IfThen(Trim(Lista[35]) = '', '0', Lista[35]);
        indMV_52 := IfThen(Trim(Lista[36]) = '', '0', Lista[36]);
        tpInsc_54 := IfThen(Trim(Lista[37]) = '', '0', Lista[37]);
        nrInsc_55 := IfThen(Trim(Lista[38]) = '', '0', Lista[38]);
        codCateg_56 := IfThen(Trim(Lista[39]) = '', '0', Lista[39]);
        vlrRemunOE_57 := IfThen(Trim(Lista[40]) = '', '0', Lista[40]);
        dtFimQuar_59 := IfThen(Trim(Lista[41]) = '', '0', Lista[41]);
      end;
      Lista.Free;
    end;
end;

end.
