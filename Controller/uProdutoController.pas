unit uProdutoController;

interface

uses uProdutoModel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, uDAOFDConn,
     FireDAC.Comp.Client, System.SysUtils, uDAOProduto;

type TProdutoController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoProduto: TDAOProduto;
    procedure Pesquisa(pNome: String);
    procedure CarregaProduto(pPesquisa: String);
    function Inserir(oProduto: TProduto; var sErro: String): Boolean;
    function Alterar(oProduto: TProduto; var sErro: String): Boolean;
    function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;

implementation

{ TProdutoController }


function TProdutoController.Alterar(oProduto: TProduto; var sErro: String): Boolean;
begin
  Result := FDaoProduto.Alterar(oProduto);
end;

constructor TProdutoController.Create;
begin
  FDaoProduto := TDAOProduto.Create(nil);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(FDaoProduto);
  inherited;
end;

function TProdutoController.Excluir(iCodigo: Integer; var sErro: String): Boolean;
begin
  Result := FDaoProduto.Excluir(iCodigo);
end;

function TProdutoController.Inserir(oProduto: TProduto; var sErro: String): Boolean;
begin
  Result := FDaoProduto.Inserir(oProduto);
end;

procedure TProdutoController.Pesquisa(pNome: String);
begin
  FDaoProduto.Pesquisa(pNome);
end;

procedure TProdutoController.CarregaProduto(pPesquisa: String);
begin
  FDaoProduto.CarregaProduto(pPesquisa);
end;

end.
