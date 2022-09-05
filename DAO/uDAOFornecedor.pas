unit uDAOFornecedor;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, uDAOFDConn, uFornecedorModel;


type TDAOFornecedor = class
  private
    FQuery: TFDQuery;
  public
    constructor Create(pConexao: TDAOFDConn);
    destructor Destroy; override;

    function GetID(aTabela: String): Integer;
    function Pesquisa(pNome: String): TFornecedor;
    function CarregaFornecedor(pPesquisa: String): TFornecedor;
    function VerificaInscricao(pCPFCNPJ: String): Boolean;
    function Inserir(pFornecedor: TFornecedor): Boolean;
    function Alterar(pFornecedor: TFornecedor): Boolean;
    function Excluir(pIDFornecedor: Integer): Boolean;
end;

implementation

{ TDAOFornecedor }


constructor TDAOFornecedor.Create(pConexao: TDAOFDConn);
begin
  inherited Create;
end;

destructor TDAOFornecedor.Destroy;
begin
  inherited;
end;

function TDAOFornecedor.CarregaFornecedor(pPesquisa: String): TFornecedor;
var
  xConexaoLocal: TDAOFDConn;
  xFornecedor: TFornecedor;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xFornecedor   := TFornecedor.Create;
  try
    xConexaoLocal.FDQuery.SQL.Clear;
    xConexaoLocal.FDQuery.SQL.Text :=
                       ' SELECT ID, RAZAO, INSCRICAO '+
                       ' FROM FORNECEDOR '+
                       ' WHERE RAZAO LIKE '+QuotedStr('%'+pPesquisa+'%');
    xConexaoLocal.FDQuery.Open;

    xFornecedor.ID        := xConexaoLocal.FDQuery.FieldByName('ID').Value;
    xFornecedor.Razao     := xConexaoLocal.FDQuery.FieldByName('Razao').Value;
    xFornecedor.Inscricao := xConexaoLocal.FDQuery.FieldByName('Inscricao').Value;
    Result := xFornecedor;
  except
    raise Exception.Create('erro ao CONSULTAR um fornecedor.');
  end;
end;

function TDAOFornecedor.Pesquisa(pNome: String): TFornecedor;
var
  xConexaoLocal: TDAOFDConn;
  xFornecedor: TFornecedor;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xFornecedor := TFornecedor.Create;
  try
    try
      xConexaoLocal.FDQuery.SQL.Clear;
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' SELECT ID, RAZAO, INSCRICAO '+
                         ' FROM FORNECEDOR '+
                         ' WHERE RAZAO LIKE '+QuotedStr('%'+pNome);
      xConexaoLocal.FDQuery.Open;

      xFornecedor.ID        := xConexaoLocal.FDQuery.FieldByName('ID').AsInteger;
      xFornecedor.Razao     := xConexaoLocal.FDQuery.FieldByName('Razao').AsString;
      xFornecedor.Inscricao := xConexaoLocal.FDQuery.FieldByName('Inscricao').AsString;
      Result := xFornecedor;
    except
      raise Exception.Create('erro ao CONSULTAR um fornecedor.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
    FreeAndNil(xFornecedor);
  end;
end;

function TDAOFornecedor.Inserir(pFornecedor: TFornecedor): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' INSERT INTO FORNECEDOR (ID, RAZAO, INSCRICAO ) VALUES '+
                         '                        (:pID, :pRazao, :pInscricao) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value        := pFornecedor.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pRazao').Value     := pFornecedor.Razao;
      xConexaoLocal.FDQuery.Params.ParamByName('pInscricao').Value := pFornecedor.Inscricao;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo fornecedor.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOFornecedor.Alterar(pFornecedor: TFornecedor): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE FORNECEDOR '+
                                        'SET RAZAO       = :pRazao, '+
                                        '    INSCRICAO   = :pInscricao '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value        := pFornecedor.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pRazao').Value     := pFornecedor.Razao;
      xConexaoLocal.FDQuery.Params.ParamByName('pInscricao').Value := pFornecedor.Inscricao;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um fornecedor.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOFornecedor.Excluir(pIDFornecedor: Integer): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'DELETE FROM FORNECEDOR '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value := pIDFornecedor;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao EXCLUIR um fornecedor.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOFornecedor.GetID(aTabela: String): Integer;
var
  Qry: TFDQuery;
  xConexaoLocal: TDAOFDConn;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := xConexaoLocal.GetConexao;
    Qry.SQL.Clear;
    Qry.Open('SELECT COALESCE(MAX(ID),0) + 1 as SEQ FROM '+aTabela+' ');
    Result := Qry.FieldByName('SEQ').AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

function TDAOFornecedor.VerificaInscricao(pCPFCNPJ: String): Boolean;
var
  Qry: TFDQuery;
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := xConexaoLocal.GetConexao;
    Qry.SQL.Clear;
    Qry.Open('SELECT ID FROM FORNECEDOR WHERE INSCRICAO = '+QuotedStr(pCPFCNPJ));
    if Qry.FieldByName('ID').AsInteger > 0 then
      Result := True;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
