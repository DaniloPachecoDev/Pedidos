unit uDAOProduto;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, uDAOFDConn, uProdutoModel;


type TDAOProduto = class
  private
    FQuery: TFDQuery;
  public
    constructor Create(pConexao: TDAOFDConn);
    destructor Destroy; override;

    function GetID(aTabela: String): Integer;
    function Pesquisa(pNome: String): TProduto;
    function CarregaProduto(pPesquisa: String): TProduto;
    function Inserir(pProduto: TProduto): Boolean;
    function Alterar(pProduto: TProduto): Boolean;
    function Excluir(pIDProduto: Integer): Boolean;
end;

implementation

{ TDAOProduto }


constructor TDAOProduto.Create(pConexao: TDAOFDConn);
begin
  inherited Create;
end;

destructor TDAOProduto.Destroy;
begin
  inherited;
end;

function TDAOProduto.CarregaProduto(pPesquisa: String): TProduto;
var
  xConexaoLocal: TDAOFDConn;
  xProduto: TProduto;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xProduto   := TProduto.Create;
  try
    xConexaoLocal.FDQuery.SQL.Clear;
    xConexaoLocal.FDQuery.SQL.Text :=
                       ' SELECT ID, DESCRICAO, VALOR, CODFORN '+
                       ' FROM Produto '+
                       ' WHERE DESCRICAO LIKE '+QuotedStr('%'+pPesquisa+'%');
    xConexaoLocal.FDQuery.Open;

    xProduto.ID        := xConexaoLocal.FDQuery.FieldByName('ID').Value;
    xProduto.Descricao := xConexaoLocal.FDQuery.FieldByName('Descricao').Value;
    xProduto.Valor     := xConexaoLocal.FDQuery.FieldByName('Valor').Value;
    xProduto.CodForn   := xConexaoLocal.FDQuery.FieldByName('CodForn').Value;
    Result := xProduto;
  except
    raise Exception.Create('erro ao CONSULTAR um Produto.');
  end;
end;

function TDAOProduto.Pesquisa(pNome: String): TProduto;
var
  xConexaoLocal: TDAOFDConn;
  xProduto: TProduto;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xProduto := TProduto.Create;
  try
    try
      xConexaoLocal.FDQuery.SQL.Clear;
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' SELECT ID, DESCRICAO, VALOR, CODFORN '+
                         ' FROM Produto '+
                         ' WHERE DESCRICAO LIKE '+QuotedStr('%'+pNome);
      xConexaoLocal.FDQuery.Open;

      xProduto.ID        := xConexaoLocal.FDQuery.FieldByName('ID').AsInteger;
      xProduto.Descricao := xConexaoLocal.FDQuery.FieldByName('Descricao').AsString;
      xProduto.Valor     := xConexaoLocal.FDQuery.FieldByName('valor').AsFloat;
      xProduto.CodForn   := xConexaoLocal.FDQuery.FieldByName('CodForn').AsInteger;
      Result := xProduto;
    except
      raise Exception.Create('erro ao CONSULTAR um Produto.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
    FreeAndNil(xProduto);
  end;
end;

function TDAOProduto.Inserir(pProduto: TProduto): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
      ' INSERT INTO Produto (ID, DESCRICAO, VALOR, CODFORN, CODIGO) VALUES '+
      '                     (:pID, :pDESCRICAO, :pVALOR, :pCODFORN, :pCODIGO) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value        := pProduto.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pDescricao').Value := pProduto.Descricao;
      xConexaoLocal.FDQuery.Params.ParamByName('pValor').Value     := pProduto.Valor;
      xConexaoLocal.FDquery.Params.ParamByName('pCodForn').Value   := pProduto.CodForn;
      xConexaoLocal.FDquery.Params.ParamByName('pCODIGO').Value    := pProduto.Codigo;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo Produto.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOProduto.Alterar(pProduto: TProduto): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE PRODUTO '+
                                        'SET DESCRICAO = :pDescricao, '+
                                        '    VALOR     = :pValor, '+
                                        '    CODFORN   = :pCodForn, '+
                                        '    CODIGO    = :pCodigo '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value        := pProduto.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pDescricao').Value := pProduto.Descricao;
      xConexaoLocal.FDQuery.Params.ParamByName('pValor').Value     := pProduto.Valor;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodForn').Value   := pProduto.CodForn;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodigo').Value   := pProduto.Codigo;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um produto.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOProduto.Excluir(pIDProduto: Integer): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'DELETE FROM Produto '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value := pIDProduto;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao EXCLUIR um Produto.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOProduto.GetID(aTabela: String): Integer;
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


end.
