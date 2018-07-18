unit UTS2306;

interface

uses
  Contnrs, System.Classes;

type
  TS2306 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2306;
    function Add: TS2306;
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
    dtAlteracao_17: String;
    natAtividade_18: String;
    codCargo_21: String;
    codFuncao_22: String;
    vrSalFx_24: String;
    undSalFixo_25: String;
    dscSalVar_26: String;
    natEstagio_28: String;
    nivEstagio_29: String;
    areaAtuacao_30: String;
    nrApol_31: String;
    vlrBolsa_32: String;
    dtPrevTerm_33: String;
    cnpjInstEnsino_35: String;
    nmRazao_36: String;
    dscLograd_37: String;
    nrLograd_38: String;
    bairro_39: String;
    cep_40: String;
    codMunic_41: String;
    uf_42: String;
    cnpjAgntInteg_44: String;
    nmRazao_45: String;
    dscLograd_46: String;
    nrLograd_47: String;
    bairro_48: String;
    cep_49: String;
    codMunic_50: String;
    uf_51: String;
    cpfSupervisor_53: String;
    nmSuperv_54: String;
    property Items[Index: Integer]: TS2306 read GetItem; default;
    procedure GetS2306(const Arq: TStringList);
  end;

implementation

{ TS2306 }

function TS2306.Add: TS2306;
begin
  Result := TS2306.Create;
  inherited Add(Result);
end;

function TS2306.GetItem(Index: Integer): TS2306;
begin
  Result := TS2306(inherited Items[Index]);
end;

procedure TS2306.GetS2306(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I], 0, Pred(Pos('|', Arq[I]))) = 'S2306' then
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
        dtAlteracao_17 := Lista[11];
        natAtividade_18 := Lista[12];
        codCargo_21 := Lista[13];
        codFuncao_22 := Lista[14];
        vrSalFx_24 := Lista[15];
        undSalFixo_25 := Lista[16];
        dscSalVar_26 := Lista[17];
        natEstagio_28 := Lista[18];
        nivEstagio_29 := Lista[19];
        areaAtuacao_30 := Lista[20];
        nrApol_31 := Lista[21];
        vlrBolsa_32 := Lista[22];
        dtPrevTerm_33 := Lista[23];
        cnpjInstEnsino_35 := Lista[24];
        nmRazao_36 := Lista[25];
        dscLograd_37 := Lista[26];
        nrLograd_38 := Lista[27];
        bairro_39 := Lista[28];
        cep_40 := Lista[29];
        codMunic_41 := Lista[30];
        uf_42 := Lista[31];
        cnpjAgntInteg_44 := Lista[32];
        nmRazao_45 := Lista[33];
        dscLograd_46 := Lista[34];
        nrLograd_47 := Lista[35];
        bairro_48 := Lista[36];
        cep_49 := Lista[37];
        codMunic_50 := Lista[38];
        uf_51 := Lista[39];
        cpfSupervisor_53 := Lista[40];
        nmSuperv_54 := Lista[41];
      end;
      Lista.Free;
    end;
end;

end.
