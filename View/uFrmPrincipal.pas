unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Movimento1: TMenuItem;
    Relatrio1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedor1: TMenuItem;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    PedidodeVenda1: TMenuItem;
    RelatriodeVenda1: TMenuItem;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDTableAdapter1: TFDTableAdapter;
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure PedidodeVenda1Click(Sender: TObject);
    procedure RelatriodeVenda1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uFrmClientes, uFrmFornecedores, uFrmProdutos,
     uFrmPedidos, uFrmRelPedidos;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
   FrmClientes := TFrmClientes.Create(nil);
   try
     FrmClientes.ShowModal;
   finally
     FreeAndNil(FrmClientes);
   end;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
   FrmFornecedores := TFrmFornecedores.Create(nil);
   try
     FrmFornecedores.ShowModal;
   finally
     FreeAndNil(FrmFornecedores);
   end;
end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
begin
   FrmProdutos := TFrmProdutos.Create(nil);
   try
     FrmProdutos.ShowModal;
   finally
     FreeAndNil(FrmProdutos);
   end;
end;

procedure TFrmPrincipal.PedidodeVenda1Click(Sender: TObject);
begin
   FrmPedidos := TFrmPedidos.Create(nil);
   try
     FrmPedidos.ShowModal;
   finally
     FreeAndNil(FrmPedidos);
   end;

end;

procedure TFrmPrincipal.RelatriodeVenda1Click(Sender: TObject);
begin
    FrmRelPedidos := TFrmRelPedidos.Create(nil) ;
    try
      FrmRelPedidos.pMovimento := False;
      FrmRelPedidos.ShowModal;
    finally
      FreeAndNil(FrmRelPedidos);
    end;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.

