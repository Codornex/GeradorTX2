unit UTS2306;

interface

uses
  Contnrs, System.Classes, StrUtils, SysUtils;

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
        dtAlteracao_17 := IfThen(Trim(Lista[11]) = '', '0', Lista[11]);
        natAtividade_18 := IfThen(Trim(Lista[12]) = '', '0', Lista[12]);
        codCargo_21 := IfThen(Trim(Lista[13]) = '', '0', Lista[13]);
        codFuncao_22 := IfThen(Trim(Lista[14]) = '', '0', Lista[14]);
        vrSalFx_24 := IfThen(Trim(Lista[15]) = '', '0', Lista[15]);
        undSalFixo_25 := IfThen(Trim(Lista[16]) = '', '0', Lista[16]);
        dscSalVar_26 := IfThen(Trim(Lista[17]) = '', '0', Lista[17]);
        natEstagio_28 := IfThen(Trim(Lista[18]) = '', '0', Lista[18]);
        nivEstagio_29 := IfThen(Trim(Lista[19]) = '', '0', Lista[19]);
        areaAtuacao_30 := IfThen(Trim(Lista[20]) = '', '0', Lista[20]);
        nrApol_31 := IfThen(Trim(Lista[21]) = '', '0', Lista[21]);
        vlrBolsa_32 := IfThen(Trim(Lista[22]) = '', '0', Lista[22]);
        dtPrevTerm_33 := IfThen(Trim(Lista[23]) = '', '0', Lista[23]);
        cnpjInstEnsino_35 := IfThen(Trim(Lista[24]) = '', '0', Lista[24]);
        nmRazao_36 := IfThen(Trim(Lista[25]) = '', '0', Lista[25]);
        dscLograd_37 := IfThen(Trim(Lista[26]) = '', '0', Lista[26]);
        nrLograd_38 := IfThen(Trim(Lista[27]) = '', '0', Lista[27]);
        bairro_39 := IfThen(Trim(Lista[28]) = '', '0', Lista[28]);
        cep_40 := IfThen(Trim(Lista[29]) = '', '0', Lista[29]);
        codMunic_41 := IfThen(Trim(Lista[30]) = '', '0', Lista[30]);
        uf_42 := IfThen(Trim(Lista[31]) = '', '0', Lista[31]);
        cnpjAgntInteg_44 := IfThen(Trim(Lista[32]) = '', '0', Lista[32]);
        nmRazao_45 := IfThen(Trim(Lista[33]) = '', '0', Lista[33]);
        dscLograd_46 := IfThen(Trim(Lista[34]) = '', '0', Lista[34]);
        nrLograd_47 := IfThen(Trim(Lista[35]) = '', '0', Lista[35]);
        bairro_48 := IfThen(Trim(Lista[36]) = '', '0', Lista[36]);
        cep_49 := IfThen(Trim(Lista[37]) = '', '0', Lista[37]);
        codMunic_50 := IfThen(Trim(Lista[38]) = '', '0', Lista[38]);
        uf_51 := IfThen(Trim(Lista[39]) = '', '0', Lista[39]);
        cpfSupervisor_53 := IfThen(Trim(Lista[40]) = '', '0', Lista[40]);
        nmSuperv_54 := IfThen(Trim(Lista[41]) = '', '0', Lista[41]);
      end;
      Lista.Free;
    end;
end;

end.
