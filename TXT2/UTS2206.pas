unit UTS2206;

interface

uses
  Contnrs, System.Classes;

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
begin
  inherited Clear;
  for I := 0 to Pred(Arq.Count) do
    if Copy(Arq[I],0,Pred(Pos('|',Arq[I]))) = 'S2206' then
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
        dtAlteracao_17 := Lista[11];
        dtEf_18 := Lista[12];
        dscAlt_19 := Lista[13];
        tpRegPrev_22 := Lista[14];
        tpRegJor_25 := Lista[15];
        natAtividade_26 := Lista[16];
        dtBase_27 := Lista[17];
        cnpjSindCategProf_28 := Lista[18];
        justProrr_30 := Lista[19];
        tpInsc_75 := Lista[20];
        nrInsc_76 := Lista[21];
        tpPlanRP_32 := Lista[22];
        codCargo_34 := Lista[23];
        codFuncao_35 := Lista[24];
        codCateg_36 := Lista[25];
        codCarreira_37 := Lista[26];
        dtIngrCarr_38 := Lista[27];
        vrSalFx_40 := Lista[28];
        undSalFixo_41 := Lista[29];
        dscSalVar_42 := Lista[30];
        tpContr_44 := Lista[31];
        dtTerm_45 := Lista[32];
        tpInsc_48 := Lista[33];
        nrInsc_49 := Lista[34];
        descComp_50 := Lista[35];
        tpLograd_52 := Lista[36];
        dscLograd_53 := Lista[37];
        nrLograd_54 := Lista[38];
        complemento_55 := Lista[39];
        bairro_56 := Lista[40];
        cep_57 := Lista[41];
        codMunic_58 := Lista[42];
        uf_59 := Lista[43];
        qtdHrsSem_61 := Lista[44];
        tpJornada_62 := Lista[45];
        dscTpJorn_63 := Lista[46];
        tmpParc_64 := Lista[47];
        dia_66 := Lista[48];
        codHorContrat_67 := Lista[49];
        cnpjSindTrab_69 := Lista[50];
        nrProcJud_71 := Lista[51];
        mtvAlter_73 := Lista[52];
        observacao_75 := Lista[53];
      end;
      Lista.Free;
    end;
end;

end.
