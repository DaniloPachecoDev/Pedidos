unit uClienteController;

interface

uses uClienteModel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
     FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, uDAOFDConn,
     FireDAC.Comp.Client, System.SysUtils, uDAOCliente;

type TClienteController = class
  private
    constructor Create;
    destructor Destroy; override;
  public
    FDaoCliente: TDAOCliente;
    procedure Pesquisa(pNome: String);
    procedure CarregaCliente(pPesquisa: String);
    function Inserir(oCliente: TCliente; var sErro: String): Boolean;
    function Alterar(oCliente: TCliente; var sErro: String): Boolean;
    function Excluir(iCodigo: Integer; var sErro: String): Boolean;
end;

implementation

{ TClienteController }


function TClienteController.Alterar(oCliente: TCliente; var sErro: String): Boolean;
begin
  Result := FDaoCliente.Alterar(oCliente);
end;

constructor TClienteController.Create;
begin
  FDaoCliente := TDAOCliente.Create;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FDaoCliente);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer; var sErro: String): Boolean;
begin
  Result := FDaoCliente.Excluir(iCodigo);
end;

function TClienteController.Inserir(oCliente: TCliente; var sErro: String): Boolean;
begin
  Result := FDaoCliente.Inserir(oCliente);
end;

procedure TClienteController.Pesquisa(pNome: String);
begin
  FDaoCliente.Pesquisa(pNome);
end;

procedure TClienteController.CarregaCliente(pPesquisa: String);
begin
  FDaoCliente.CarregaCliente(pPesquisa);
end;

end.
