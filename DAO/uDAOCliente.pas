unit uDAOCliente;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, uDAOFDConn, uClienteModel;


type TDAOCliente = class
  private
    FQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    function GetID(aTabela: String): Integer;
    function Pesquisa(pNome: String): TCliente;
    function CarregaCliente(pPesquisa: String): TCliente;
    function VerificaInscricao(pCPFCNPJ: String): Boolean;
    function Inserir(pCliente: TCliente): Boolean;
    function Alterar(pCliente: TCliente): Boolean;
    function Excluir(pIDCliente: Integer): Boolean;
end;

implementation

{ TDAOCliente }


constructor TDAOCliente.Create;
begin
  inherited Create;
end;

destructor TDAOCliente.Destroy;
begin
  inherited;
end;

function TDAOCliente.CarregaCliente(pPesquisa: String): TCliente;
var
  xConexaoLocal: TDAOFDConn;
  xCliente: TCliente;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xCliente := TCliente.Create;
  try
    xConexaoLocal.FDQuery.SQL.Clear;
    xConexaoLocal.FDQuery.SQL.Text :=
                       ' SELECT ID, NOME, TIPO, INSCRICAO, ENDERECO, '+
                       '        CEP, NUMERO, COMPLEMENTO, STATUS, LIMITE  '+
                       ' FROM CLIENTE '+
                       ' WHERE NOME LIKE '+QuotedStr('%'+pPesquisa+'%');
    xConexaoLocal.FDQuery.Open;
    //xConexaoLocal.FDQuery.FieldByName('ID').Required := False;
    xCliente.ID          := xConexaoLocal.FDQuery.FieldByName('ID').Value;
    xCliente.Nome        := xConexaoLocal.FDQuery.FieldByName('Nome').Value;
    xCliente.Tipo        := xConexaoLocal.FDQuery.FieldByName('Tipo').Value;
    xCliente.Inscricao   := xConexaoLocal.FDQuery.FieldByName('Inscricao').Value;
    xCliente.Endereco    := xConexaoLocal.FDQuery.FieldByName('Endereco').Value;
    xCliente.Numero      := xConexaoLocal.FDQuery.FieldByName('Numero').Value;
    xCliente.Complemento := xConexaoLocal.FDQuery.FieldByName('Complemento').Value;
    xCliente.CEP         := xConexaoLocal.FDQuery.FieldByName('CEP').AsInteger;
    xCliente.Status      := xConexaoLocal.FDQuery.FieldByName('Status').Value;
    xCliente.Limite      := xConexaoLocal.FDQuery.FieldByName('Limite').Value;
    Result := xCliente;
  except
    raise Exception.Create('erro ao CONSULTAR um cliente.');
  end;
end;

function TDAOCliente.Pesquisa(pNome: String): TCliente;
var
  xConexaoLocal: TDAOFDConn;
  xCliente: TCliente;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xCliente := TCliente.Create;
  try
    try
      xConexaoLocal.FDQuery.SQL.Clear;
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' SELECT ID, NOME, TIPO, INSCRICAO, ENDERECO, '+
                         '        CEP, NUMERO, COMPLEMENTO, STATUS, LIMITE  '+
                         ' FROM CLIENTE '+
                         ' WHERE NOME LIKE '+QuotedStr('%'+pNome);
      xConexaoLocal.FDQuery.Open;

      xCliente.ID          := xConexaoLocal.FDQuery.FieldByName('ID').AsInteger;
      xCliente.Nome        := xConexaoLocal.FDQuery.FieldByName('Nome').AsString;
      xCliente.Tipo        := xConexaoLocal.FDQuery.FieldByName('Tipo').AsString;
      xCliente.Inscricao   := xConexaoLocal.FDQuery.FieldByName('Inscricao').AsString;
      xCliente.Endereco    := xConexaoLocal.FDQuery.FieldByName('Endereco').AsString;
      xCliente.Numero      := xConexaoLocal.FDQuery.FieldByName('Numero').AsString;
      xCliente.Complemento := xConexaoLocal.FDQuery.FieldByName('Complemento').AsString;
      xCliente.CEP         := xConexaoLocal.FDQuery.FieldByName('CEP').AsInteger;
      xCliente.Status      := xConexaoLocal.FDQuery.FieldByName('Status').AsInteger;
      xCliente.Limite      := xConexaoLocal.FDQuery.FieldByName('Limite').AsFloat;
      Result := xCliente;
    except
      raise Exception.Create('erro ao CONSULTAR um cliente.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
    FreeAndNil(xCliente);
  end;
end;

function TDAOCliente.Inserir(pCliente: TCliente): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' INSERT INTO CLIENTE (ID, NOME, TIPO, INSCRICAO, '+
                         '                      ENDERECO, NUMERO, COMPLEMENTO, '+
                         '                      CEP, STATUS, LIMITE) VALUES '+
                         '(:pID, :pNome, :pTipo, :pInscricao, :pEndereco, :pNumero, '+
                         ' :pComplemento, :pCEP, :pStatus, :pLimite) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value          := pCliente.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pNome').Value        := pCliente.Nome;
      xConexaoLocal.FDQuery.Params.ParamByName('pTipo').Value        := pCliente.Tipo;
      xConexaoLocal.FDQuery.Params.ParamByName('pInscricao').Value   := pCliente.Inscricao;
      xConexaoLocal.FDQuery.Params.ParamByName('pEndereco').Value    := pCliente.Endereco;
      xConexaoLocal.FDQuery.Params.ParamByName('pNumero').Value      := pCliente.Numero;
      xConexaoLocal.FDQuery.Params.ParamByName('pComplemento').Value := pCliente.Complemento;
      xConexaoLocal.FDQuery.Params.ParamByName('pCEP').Value         := pCliente.CEP;
      xConexaoLocal.FDQuery.Params.ParamByName('pStatus').Value      := pCliente.Status;
      xConexaoLocal.FDQuery.Params.ParamByName('pLimite').Value      := pCliente.Limite;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo cliente.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOCliente.Alterar(pCliente: TCliente): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE CLIENTE '+
                                        'SET NOME        = :pNome, '+
                                        '    TIPO        = :pTipo, '+
                                        '    INSCRICAO   = :pInscricao, '+
                                        '    ENDERECO    = :pEndereco, '+
                                        '    NUMERO      = :pNumero, '+
                                        '    COMPLEMENTO = :pComplemento, '+
                                        '    CEP         = :pCEP, '+
                                        '    STATUS      = :pStatus, '+
                                        '    LIMITE      = :pLimite '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value          := pCliente.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pNome').Value        := pCliente.Nome;
      xConexaoLocal.FDQuery.Params.ParamByName('pTipo').Value        := pCliente.Tipo;
      xConexaoLocal.FDQuery.Params.ParamByName('pInscricao').Value   := pCliente.Inscricao;
      xConexaoLocal.FDQuery.Params.ParamByName('pEndereco').Value    := pCliente.Endereco;
      xConexaoLocal.FDQuery.Params.ParamByName('pNumero').Value      := pCliente.Numero;
      xConexaoLocal.FDQuery.Params.ParamByName('pComplemento').Value := pCliente.Complemento;
      xConexaoLocal.FDQuery.Params.ParamByName('pCEP').Value         := pCliente.CEP;
      xConexaoLocal.FDQuery.Params.ParamByName('pStatus').Value      := pCliente.Status;
      xConexaoLocal.FDQuery.Params.ParamByName('pLimite').Value      := pCliente.Limite;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um cliente.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOCliente.Excluir(pIDCliente: Integer): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'DELETE FROM CLIENTE '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value := pIDCliente;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao EXCLUIR um cliente.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOCliente.GetID(aTabela: String): Integer;
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

function TDAOCliente.VerificaInscricao(pCPFCNPJ: String): Boolean;
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
    Qry.Open('SELECT ID FROM CLIENTE WHERE INSCRICAO = '+QuotedStr(pCPFCNPJ));
    if Qry.FieldByName('ID').AsInteger > 0 then
      Result := True;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
