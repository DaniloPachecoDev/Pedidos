unit uDAOPedidos;
interface
uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, uDAOFDConn, uPedidosModel;

type
  TDAOPedido = class
    private
      FQueryPedido: TFDQuery;
    public
      constructor Create(pConexao: TDAOFDConn);
      destructor Destroy; override;

      function GetID(aTabela: String): Integer;
      //function CarregaCliente(pPesquisa: String): TPedido;
      function Inserir(pPedido: TPedido): Boolean;
      function Alterar(pPedido: TPedido): Boolean;
      function Excluir(pIDPedido: Integer): Boolean;
      function Pesquisa(pNumero: String): TPedido;
  end;
type
  TDAOItemPedido = class
    private
      FQueryItemPedido: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      //function GetID(aTabela: String): Integer;
      //function Pesquisa(pNome: String): TItemPedido;
      //function CarregaItemPedido(pPesquisa: String): TItemPedido;
      function Inserir(pItemPedido: TItemPedido): Boolean;
      function Alterar(pItemPedido: TItemPedido): Boolean;
      //function Excluir(pIDCliente: Integer): Boolean;
  end;
type
  TDAOPagamentoPedido = class
    private
      FQueryItemPedido: TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      //function GetID(aTabela: String): Integer;
      //function Pesquisa(pNome: String): TPagamentoPedido;
      //function CarregaPagamento(pPesquisa: String): TPagamentoPedido;
      function Inserir(pPagPedido: TPagamentoPedido): Boolean;
      function Alterar(pPagPedido: TPagamentoPedido): Boolean;
      //function Excluir(pIDCliente: Integer): Boolean;
  end;

implementation
{ TDAOPedido }
constructor TDAOPedido.Create;
begin
  inherited Create;
end;
destructor TDAOPedido.Destroy;
begin
  inherited;
end;
function TDAOPedido.GetID(aTabela: String): Integer;
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

function TDAOPedido.Inserir(pPedido: TPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' INSERT INTO PEDIDO (ID, Num_Pedido, Data_Emissao, '+
                         '                     Cod_Cliente, Tot_Pedido) VALUES '+
                         '                    (:pID, :pNumPedido, :pDataEmissao, '+
                         '                     :pCodCliente, :pTot_Pedido) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value          := pPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pNumPedido').Value   := pPedido.Num_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pDataEmissao').Value := pPedido.Data_Emissao;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodCliente').Value  := pPedido.Cod_Cliente;
      xConexaoLocal.FDQuery.Params.ParamByName('pTot_Pedido').Value  := pPedido.Tot_Pedido;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo PEDIDO.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOPedido.Alterar(pPedido: TPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE PEDIDO '+
                                        'SET Num_Pedido = :pNumPedido, '+
                                        '    Data_Emissao = :pDataEmissao, '+
                                        '    Cod_Cliente = :pCodCliente, '+
                                        '    Tot_Pedido = :pTotPedido '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value          := pPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pNumPedido').Value   := pPedido.Num_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pDataEmissao').Value := pPedido.Data_Emissao;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodCliente').Value  := pPedido.Cod_Cliente;
      xConexaoLocal.FDQuery.Params.ParamByName('pTotPedido').Value   := pPedido.Tot_Pedido;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOPedido.Excluir(pIDPedido: Integer): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'DELETE FROM PEDIDO '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value := pIDPedido;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao EXCLUIR um pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

function TDAOPedido.Pesquisa(pNumero: String): TPedido;
var
  xConexaoLocal: TDAOFDConn;
  xPedido: TPedido;
begin
  xConexaoLocal := TDAOFDConn.Create(nil);
  xPedido := TPedido.Create;
  try
    try
      xConexaoLocal.FDQuery.SQL.Clear;
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' SELECT ID, Num_Pedido, Data_Emissao, '+
                         '        Cod_Cliente, Tot_Pedido  '+
                         ' FROM PEDIDO '+
                         ' WHERE NUM_PEDIDO LIKE '+QuotedStr('%'+pNumero);
      xConexaoLocal.FDQuery.Open;

      xPedido.ID           := xConexaoLocal.FDQuery.FieldByName('ID').AsInteger;
      xPedido.Num_Pedido   := xConexaoLocal.FDQuery.FieldByName('Num_Pedido').AsString;
      xPedido.Data_Emissao := xConexaoLocal.FDQuery.FieldByName('Data_Emissao').AsDateTime;
      xPedido.Cod_Cliente  := xConexaoLocal.FDQuery.FieldByName('Cod_Cliente').AsInteger;
      xPedido.Tot_Pedido   := xConexaoLocal.FDQuery.FieldByName('Tot_Pedido').AsFloat;
      Result := xPedido;
    except
      raise Exception.Create('erro ao CONSULTAR um cliente.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
    FreeAndNil(xPedido);
  end;
end;

{ TItemPedidoCrud }
constructor TDAOItemPedido.Create;
begin
  inherited Create;
end;
destructor TDAOItemPedido.Destroy;
begin
  inherited;
end;
function TDAOItemPedido.Inserir(pItemPedido: TItemPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' INSERT INTO ITEMPED (ID, ID_Pedido, Cod_Produto, '+
                         '                      QTD, VR_Unit, TOT_Item) VALUES '+
                         '                     (:pID, :pIDPedido, :pCodProduto, '+
                         '                      :pQTD, :pVRUnit, :pTOTItem) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value         := pItemPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pIDPedido').Value   := pItemPedido.ID_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodProduto').Value := pItemPedido.Cod_Produto;
      xConexaoLocal.FDQuery.Params.ParamByName('pQTD').Value        := pItemPedido.QTD;
      xConexaoLocal.FDQuery.Params.ParamByName('pVRUnit').Value     := pItemPedido.VR_Unit;
      xConexaoLocal.FDQuery.Params.ParamByName('pTOTItem').Value    := pItemPedido.TOT_Item;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo Item do Pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;
function TDAOItemPedido.Alterar(pItemPedido: TItemPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE ITEMPED '+
                                        'SET ID_Pedido = :pIDPedido, '+
                                        '    Cod_Produto = :pCodProduto, '+
                                        '    QTD = :pQTD, '+
                                        '    VR_Unit = :pVRUnit, '+
                                        '    TOT_Item = :pTOTItem '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value         := pItemPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pIDPedido').Value   := pItemPedido.ID_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pCodProduto').Value := pItemPedido.Cod_Produto;
      xConexaoLocal.FDQuery.Params.ParamByName('pQTD').Value        := pItemPedido.QTD;
      xConexaoLocal.FDQuery.Params.ParamByName('pVRUnit').Value     := pItemPedido.VR_Unit;
      xConexaoLocal.FDQuery.Params.ParamByName('pTOTItem').Value    := pItemPedido.TOT_Item;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um Item do Pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;
{ TPagamentoPedidoCrud }
constructor TDAOPagamentoPedido.Create;
begin
  inherited Create;
end;
destructor TDAOPagamentoPedido.Destroy;
begin
  inherited;
end;
function TDAOPagamentoPedido.Inserir(pPagPedido: TPagamentoPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text :=
                         ' INSERT INTO PARPED (ID, ID_Pedido, Forma_Pag, '+
                         '                     Dat_Vencimento, Val_Parcela) VALUES '+
                         '                    (:pID, :pIDPedido, :pFormaPag, '+
                         '                     :pDatVenc, :pValParcela) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value         := pPagPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pIDPedido').Value   := pPagPedido.ID_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pFormaPag').Value   := pPagPedido.Forma_Pag;
      xConexaoLocal.FDQuery.Params.ParamByName('pDatVenc').Value    := pPagPedido.Dat_Vencimento;
      xConexaoLocal.FDQuery.Params.ParamByName('pValParcela').Value := pPagPedido.Val_Parcela;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao INSERIR um novo Pagamento do Pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;
function TDAOPagamentoPedido.Alterar(pPagPedido: TPagamentoPedido): Boolean;
var
  xConexaoLocal: TDAOFDConn;
begin
  Result := False;
  xConexaoLocal := TDAOFDConn.Create(nil);
  try
    try
      xConexaoLocal.FDQuery.SQL.Text := 'UPDATE PARPED '+
                                        'SET ID_Pedido = :pIDPedido, '+
                                        '    Forma_Pag = :pFormaPag, '+
                                        '    Dat_Vencimento = :pDatVenc, '+
                                        '    Val_Parcela = :pValParcela '+
                                        'WHERE (ID = :pID) ';

      xConexaoLocal.FDQuery.Params.ParamByName('pID').Value         := pPagPedido.ID;
      xConexaoLocal.FDQuery.Params.ParamByName('pIDPedido').Value   := pPagPedido.ID_Pedido;
      xConexaoLocal.FDQuery.Params.ParamByName('pFormaPag').Value   := pPagPedido.Forma_Pag;
      xConexaoLocal.FDQuery.Params.ParamByName('pDatVenc').Value    := pPagPedido.Dat_Vencimento;
      xConexaoLocal.FDQuery.Params.ParamByName('pValParcela').Value := pPagPedido.Val_Parcela;
      xConexaoLocal.FDQuery.ExecSQL;
      Result := True;
    except
      raise Exception.Create('erro ao ALTERAR um Pagamento do Pedido.');
    end;
  finally
    FreeAndNil(xConexaoLocal);
  end;
end;

end.
