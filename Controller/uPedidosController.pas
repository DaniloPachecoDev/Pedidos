unit uPedidosController;

interface

uses uPedidosModel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, uDAOFDConn,
     FireDAC.Comp.Client, System.SysUtils, uDAOPedidos;

type TPedidoController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoPedido: TDAOPedido;
    procedure Pesquisa(pNumero: String);
    //procedure CarregaProduto(pPesquisa: String);
    function Inserir(oPedido: TPedido; var sErro: String): Boolean;
    function Alterar(oPedido: TPedido; var sErro: String): Boolean;
    function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;

type TItemPedidoController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoItemPedido: TDAOItemPedido;
    procedure Pesquisa(pNome: String);
    //procedure CarregaProduto(pPesquisa: String);
    function Inserir(oItemPedido: TItemPedido; var sErro: String): Boolean;
    function Alterar(oItemPedido: TItemPedido; var sErro: String): Boolean;
    //function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;

type TPagamentoPedidoController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoPagamentoPedido: TDAOPagamentoPedido;
    procedure Pesquisa(pNome: String);
    //procedure CarregaProduto(pPesquisa: String);
    function Inserir(oPagamentoPedido: TPagamentoPedido; var sErro: String): Boolean;
    function Alterar(oPagamentoPedido: TPagamentoPedido; var sErro: String): Boolean;
    //function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;


implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FDaoPedido := TDAOPedido.Create(nil);
end;

destructor TPedidoController.Destroy;
begin
  FreeAndNil(FDaoPedido);
  inherited;
end;

function TPedidoController.Inserir(oPedido: TPedido; var sErro: String): Boolean;
begin
  Result := FDaoPedido.Inserir(oPedido);
end;

function TPedidoController.Alterar(oPedido: TPedido; var sErro: String): Boolean;
begin
  Result := FDaoPedido.Alterar(oPedido);
end;

function TPedidoController.Excluir(iCodigo: Integer; var sErro: String): Boolean;
begin
  Result := FDaoPedido.Excluir(iCodigo);
end;

procedure TPedidoController.Pesquisa(pNumero: String);
begin
  FDaoPedido.Pesquisa(pNumero);
end;

{ TItemPedidoController }

constructor TItemPedidoController.Create;
begin
  inherited Create; //FDaoItemPedido := TDAOItemPedido.Create;
end;

destructor TItemPedidoController.Destroy;
begin
  FreeAndNil(FDaoItemPedido);
  inherited;
end;

function TItemPedidoController.Inserir(oItemPedido: TItemPedido; var sErro: String): Boolean;
begin
  Result := FDaoItemPedido.Inserir(oItemPedido);
end;

function TItemPedidoController.Alterar(oItemPedido: TItemPedido; var sErro: String): Boolean;
begin
  Result := FDaoItemPedido.Alterar(oItemPedido);
end;

procedure TItemPedidoController.Pesquisa(pNome: String);
begin
  //
end;

{ TPagamentoPedidoController }

constructor TPagamentoPedidoController.Create;
begin
  FDaoPagamentoPedido := TDAOPagamentoPedido.Create;
end;

destructor TPagamentoPedidoController.Destroy;
begin
  FreeAndNil(FDaoPagamentoPedido);
  inherited;
end;

function TPagamentoPedidoController.Inserir(oPagamentoPedido: TPagamentoPedido; var sErro: String): Boolean;
begin
  Result := FDaoPagamentoPedido.Inserir(oPagamentoPedido);
end;

function TPagamentoPedidoController.Alterar(oPagamentoPedido: TPagamentoPedido; var sErro: String): Boolean;
begin
  Result := FDaoPagamentoPedido.Alterar(oPagamentoPedido);
end;

procedure TPagamentoPedidoController.Pesquisa(pNome: String);
begin
//
end;

end.
