unit UTS2230;

interface

uses
  Contnrs, System.Classes;

type
  TS2230 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2230;
    function Add: TS2230;
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
    codCateg_60: String;
    dtIniAfast_18: String;
    codMotAfast_19: String;
    infoMesmoMtv_20: String;
    tpAcidTransito_21: String;
    observacao_22: String;
    codCID_24: String;
    qtdDiasAfast_25: String;
    nmEmit_27: String;
    ideOC_28: String;
    nrOc_29: String;
    ufOC_30: String;
    cnpjCess_32: String;
    infOnus_33: String;
    cnpjSind_35: String;
    infOnusRemun_36: String;
    origRetif_57: String;
    tpProc_58: String;
    nrProc_59: String;
    dtTermAfast_53: String;
    property Items[Index: Integer]: TS2230 read GetItem; default;
    procedure GetS2230(const Arq: TStringList);
  end;

implementation

{ TS2230 }

function TS2230.Add: TS2230;
begin
  Result := TS2230.Create;
  inherited Add(Result);
end;

function TS2230.GetItem(Index: Integer): TS2230;
begin
  Result := TS2230(inherited Items[Index]);
end;

procedure TS2230.GetS2230(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2230' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
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
        matricula_15 := Lista[10];
        codCateg_60 := Lista[11];
        dtIniAfast_18 := Lista[12];
        codMotAfast_19 := Lista[13];
        infoMesmoMtv_20 := Lista[14];
        tpAcidTransito_21 := Lista[15];
        observacao_22 := Lista[16];
        codCID_24 := Lista[17];
        qtdDiasAfast_25 := Lista[18];
        nmEmit_27 := Lista[19];
        ideOC_28 := Lista[20];
        nrOc_29 := Lista[21];
        ufOC_30 := Lista[22];
        cnpjCess_32 := Lista[23];
        infOnus_33 := Lista[24];
        cnpjSind_35 := Lista[25];
        infOnusRemun_36 := Lista[26];
        origRetif_57 := Lista[27];
        tpProc_58 := Lista[28];
        nrProc_59 := Lista[29];
        dtTermAfast_53 := Lista[30];
      end;
      Lista.Free;
    end;
end;

end.
