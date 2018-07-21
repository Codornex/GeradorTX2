unit UTS2206;

interface

uses
  Contnrs, System.Classes, unUtils;

type
  TS2206 = class(TObjectList)
  private
    function GetItem(Index: Integer): TS2206;
    function Add: TS2206;
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
    dtAlteracao_17: String;
    dtEf_18: String;
    dscAlt_19: String;
    tpRegPrev_22: String;
    tpRegJor_25: String;
    natAtividade_26: String;
    dtBase_27: String;
    cnpjSindCategProf_28: String;
    justProrr_30: String;
    tpInsc_75: String;
    nrInsc_76: String;
    tpPlanRP_32: String;
    codCargo_34: String;
    codFuncao_35: String;
    codCateg_36: String;
    codCarreira_37: String;
    dtIngrCarr_38: String;
    vrSalFx_40: String;
    undSalFixo_41: String;
    dscSalVar_42: String;
    tpContr_44: String;
    dtTerm_45: String;
    tpInsc_48: String;
    nrInsc_49: String;
    descComp_50: String;
    tpLograd_52: String;
    dscLograd_53: String;
    nrLograd_54: String;
    complemento_55: String;
    bairro_56: String;
    cep_57: String;
    codMunic_58: String;
    uf_59: String;
    qtdHrsSem_61: String;
    tpJornada_62: String;
    dscTpJorn_63: String;
    tmpParc_64: String;
    dia_66: String;
    codHorContrat_67: String;
    cnpjSindTrab_69: String;
    nrProcJud_71: String;
    mtvAlter_73: String;
    observacao_75: String;
    property Items[Index: Integer]: TS2206 read GetItem; default;
    procedure GetS2206(const Arq: TStringList);
  end;

implementation

{ TS2206 }

function TS2206.Add: TS2206;
begin
  Result := TS2206.Create;
  inherited Add(Result);
end;

function TS2206.GetItem(Index: Integer): TS2206;
begin
  Result := TS2206(inherited Items[Index]);
end;

procedure TS2206.GetS2206(const Arq: TStringList);
var
  I: Integer;
  Lista: TStringList;
  Utils: TUtils;
begin
  Utils := TUtils.Create;
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2206' then
    begin
      Lista := TStringList.Create;
      ExtractStrings(['|'],[],PChar(Arq[I]),Lista);
      with Add do
      begin
        indRetif_4 := Utils.RemoveZerosEsp(Lista[1]);
        nrRecibo_5 := Utils.RemoveZerosEsp(Lista[2]);
        tpAmb_6 := Utils.RemoveZerosEsp(Lista[3]);
        procEmi_7 := Utils.RemoveZerosEsp(Lista[4]);
        verProc_8 := Utils.RemoveZerosEsp(Lista[5]);
        tpInsc_10 := Utils.RemoveZerosEsp(Lista[6]);
        nrInsc_11 := Utils.RemoveZerosEsp(Lista[7]);
        cpfTrab_13 := Utils.RemoveZerosEsp(Lista[8]);
        nisTrab_14 := Utils.RemoveZerosEsp(Lista[9]);
        matricula_15 := Utils.RemoveZerosEsp(Lista[10]);
        dtAlteracao_17 := Utils.RemoveZerosEsp(Lista[11]);
        dtEf_18 := Utils.RemoveZerosEsp(Lista[12]);
        dscAlt_19 := Utils.RemoveZerosEsp(Lista[13]);
        tpRegPrev_22 := Utils.RemoveZerosEsp(Lista[14]);
        tpRegJor_25 := Utils.RemoveZerosEsp(Lista[15]);
        natAtividade_26 := Utils.RemoveZerosEsp(Lista[16]);
        dtBase_27 := Utils.RemoveZerosEsp(Lista[17]);
        cnpjSindCategProf_28 := Utils.RemoveZerosEsp(Lista[18]);
        justProrr_30 := Utils.RemoveZerosEsp(Lista[19]);
        tpInsc_75 := Utils.RemoveZerosEsp(Lista[20]);
        nrInsc_76 := Utils.RemoveZerosEsp(Lista[21]);
        tpPlanRP_32 := Utils.RemoveZerosEsp(Lista[22]);
        codCargo_34 := Utils.RemoveZerosEsp(Lista[23]);
        codFuncao_35 := Utils.RemoveZerosEsp(Lista[24]);
        codCateg_36 := Utils.RemoveZerosEsp(Lista[25]);
        codCarreira_37 := Utils.RemoveZerosEsp(Lista[26]);
        dtIngrCarr_38 := Utils.RemoveZerosEsp(Lista[27]);
        vrSalFx_40 := Utils.RemoveZerosEsp(Lista[28]);
        undSalFixo_41 := Utils.RemoveZerosEsp(Lista[29]);
        dscSalVar_42 := Utils.RemoveZerosEsp(Lista[30]);
        tpContr_44 := Utils.RemoveZerosEsp(Lista[31]);
        dtTerm_45 := Utils.RemoveZerosEsp(Lista[32]);
        tpInsc_48 := Utils.RemoveZerosEsp(Lista[33]);
        nrInsc_49 := Utils.RemoveZerosEsp(Lista[34]);
        descComp_50 := Utils.RemoveZerosEsp(Lista[35]);
        tpLograd_52 := Utils.RemoveZerosEsp(Lista[36]);
        dscLograd_53 := Utils.RemoveZerosEsp(Lista[37]);
        nrLograd_54 := Utils.RemoveZerosEsp(Lista[38]);
        complemento_55 := Utils.RemoveZerosEsp(Lista[39]);
        bairro_56 := Utils.RemoveZerosEsp(Lista[40]);
        cep_57 := Utils.RemoveZerosEsp(Lista[41]);
        codMunic_58 := Utils.RemoveZerosEsp(Lista[42]);
        uf_59 := Utils.RemoveZerosEsp(Lista[43]);
        qtdHrsSem_61 := Utils.RemoveZerosEsp(Lista[44]);
        tpJornada_62 := Utils.RemoveZerosEsp(Lista[45]);
        dscTpJorn_63 := Utils.RemoveZerosEsp(Lista[46]);
        tmpParc_64 := Utils.RemoveZerosEsp(Lista[47]);
        dia_66 := Utils.RemoveZerosEsp(Lista[48]);
        codHorContrat_67 := Utils.RemoveZerosEsp(Lista[49]);
        cnpjSindTrab_69 := Utils.RemoveZerosEsp(Lista[50]);
        nrProcJud_71 := Utils.RemoveZerosEsp(Lista[51]);
        mtvAlter_73 := Utils.RemoveZerosEsp(Lista[52]);
        observacao_75 := Utils.RemoveZerosEsp(Lista[53]);
      end;
      Lista.Free;
    end;
end;

end.
