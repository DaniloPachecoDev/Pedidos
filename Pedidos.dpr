program Pedidos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmPadrao in 'View\uFrmPadrao.pas' {FrmPadrao},
  uFrmClientes in 'View\uFrmClientes.pas' {FrmClientes},
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas',
  uDAOCliente in 'DAO\uDAOCliente.pas',
  uDAOFDConn in 'DAO\uDAOFDConn.pas' {DAOFDConn: TDataModule},
  uFrmFornecedores in 'View\uFrmFornecedores.pas' {FrmFornecedores},
  uDAOFornecedor in 'DAO\uDAOFornecedor.pas',
  uFornecedorModel in 'Model\uFornecedorModel.pas',
  uFornecedorController in 'Controller\uFornecedorController.pas',
  uProdutoController in 'Controller\uProdutoController.pas',
  uProdutoModel in 'Model\uProdutoModel.pas',
  uDAOProduto in 'DAO\uDAOProduto.pas',
  uFrmProdutos in 'View\uFrmProdutos.pas' {FrmProdutos},
  uDAOPedidos in 'DAO\uDAOPedidos.pas',
  uPedidosModel in 'Model\uPedidosModel.pas',
  uPedidosController in 'Controller\uPedidosController.pas',
  uFrmPedidos in 'View\uFrmPedidos.pas' {FrmPedidos},
  uFrmRelPedidos in '..\SysPedidos-master\SysPedidos-master\uFrmRelPedidos.pas' {FrmRelPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDAOFDConn, DAOFDConn);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
