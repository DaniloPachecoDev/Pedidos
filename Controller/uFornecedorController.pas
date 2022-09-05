unit uFornecedorController;

interface

uses uFornecedorModel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, uDAOFDConn,
     FireDAC.Comp.Client, System.SysUtils, uDAOFornecedor;

type TFornecedorController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoFornecedor: TDAOFornecedor;
    procedure Pesquisa(pNome: String);
    procedure CarregaFornecedor(pPesquisa: String);
    function Inserir(oFornecedor: TFornecedor; var sErro: String): Boolean;
    function Alterar(oFornecedor: TFornecedor; var sErro: String): Boolean;
    function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;

implementation

{ TFornecedorController }


function TFornecedorController.Alterar(oFornecedor: TFornecedor; var sErro: String): Boolean;
begin
  Result := FDaoFornecedor.Alterar(oFornecedor);
end;

constructor TFornecedorController.Create;
begin
  FDaoFornecedor := TDAOFornecedor.Create(nil);
end;

destructor TFornecedorController.Destroy;
begin
  FreeAndNil(FDaoFornecedor);
  inherited;
end;

function TFornecedorController.Excluir(iCodigo: Integer; var sErro: String): Boolean;
begin
  Result := FDaoFornecedor.Excluir(iCodigo);
end;

function TFornecedorController.Inserir(oFornecedor: TFornecedor; var sErro: String): Boolean;
begin
  Result := FDaoFornecedor.Inserir(oFornecedor);
end;

procedure TFornecedorController.Pesquisa(pNome: String);
begin
  FDaoFornecedor.Pesquisa(pNome);
end;

procedure TFornecedorController.CarregaFornecedor(pPesquisa: String);
begin
  FDaoFornecedor.CarregaFornecedor(pPesquisa);
end;

end.
