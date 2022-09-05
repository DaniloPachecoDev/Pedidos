unit uFrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, uDAOFDConn, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrSocket, ACBrCEP,  ACBrValidador, uProdutoController,
  uProdutoModel, Vcl.DBCtrls;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

type
  TFrmProdutos = class(TFrmPadrao)
    LabeledEditCodigo: TLabeledEdit;
    LabeledEditDescricao: TLabeledEdit;
    LabeledEditValor: TLabeledEdit;
    cbxFornecedor: TDBLookupComboBox;
    QryFornecedor: TFDQuery;
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure Novo;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure Pesquisar;
    procedure CarregaGrid;
    procedure CarregaCampos;
  public
    procedure CarregarProduto;
    procedure Configuracoes;
    procedure HabilitarControle(aOpr: TOperacao);
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

{$R *.dfm}

procedure TFrmProdutos.Inserir;
var
  objProduto: TProduto;
  objProdutoController: TProdutoController;
  xErro: String;
begin
  objProduto := TProduto.Create;
  objProdutoController := TProdutoController.Create;
  try
     objProduto.ID        := objProdutoController.FDaoProduto.GetID('Produto');
     objProduto.Descricao := LabeledEditDescricao.Text;
     objProduto.Valor     := StrToFloat(LabeledEditValor.Text);
     objProduto.CodForn   := cbxFornecedor.KeyValue;
     objProduto.Codigo    := StrToInt(LabeledEditCodigo.Text);
     if objProdutoController.Inserir(objProduto,xErro) then
       ShowMessage('Produto inserido com sucesso.');
  finally
    FreeAndNil(objProduto);
    FreeAndNil(objProdutoController);
  end;
end;

procedure TFrmProdutos.Novo;
begin
  inherited;
  FOperacao := OpNovo;
  PageControl1.ActivePage := TabSheet2; //Dados
  LabeledEditCodigo.SetFocus;
end;

procedure TFrmProdutos.Alterar;
var
  objProduto: TProduto;
  objProdutoController: TProdutoController;
  xErro: String;
begin
  objProduto := TProduto.Create;
  objProdutoController := TProdutoController.Create;
  try
     objProduto.ID          := DBGridDados.DataSource.DataSet.FieldByName('ID').Value;
     objProduto.Descricao   := LabeledEditDescricao.Text;
     objProduto.Valor       := StrToFloat(LabeledEditValor.Text);
     objProduto.CodForn     := cbxFornecedor.KeyValue;
     objProduto.Codigo      := StrToInt(LabeledEditCodigo.Text);
     if objProdutoController.Alterar(objProduto,xErro) then
       ShowMessage('Produto alterado com sucesso.');

  finally
    FreeAndNil(objProduto);
    FreeAndNil(objProdutoController);
  end;
end;

procedure TFrmProdutos.Excluir;
var
  objProdutoController: TProdutoController;
  xErro: String;
begin
  objProdutoController := TProdutoController.Create;
  try
     if (dsPadrao.DataSet.Active) and (dsPadrao.DataSet.RecordCount > 0) then
     begin
       if MessageDlg('Deseja excluir esse registro?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = IDYES then
       begin
         if objProdutoController.Excluir(dsPadrao.DataSet.FieldByName('ID').AsInteger, xErro) then
           objProdutoController.Pesquisa(EditPesqNome.Text);
       end;
     end
     else
       raise Exception.Create('Não há registro selecionado para exclusão.');
  finally
    FreeAndNil(objProdutoController);
  end;
end;

procedure TFrmProdutos.Gravar;
var
  objProdutoController: TProdutoController;
begin
  objProdutoController := TProdutoController.Create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    objProdutoController.Pesquisa(EditPesqNome.Text);
    Configuracoes;
  finally
    FreeAndNil(objProdutoController);
  end;
end;

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
  inherited;
  QryFornecedor.Connection := uDAOFDConn.DAOFDConn.FDConnection;
  Configuracoes;
end;

procedure TFrmProdutos.CarregaGrid;
var
  ProdutoController: TProdutoController;
begin
  ProdutoController := TProdutoController.Create;
  try
    ProdutoController.CarregaProduto(EditPesqNome.Text);
  finally
    FreeAndNil(ProdutoController);
  end;
end;

procedure TFrmProdutos.CarregarProduto;
var
  objProduto: TProduto;
  objProdutoController: TProdutoController;
begin
  objProduto := TProduto.Create;
  objProdutoController := TProdutoController.Create;
  try
    objProdutoController.Pesquisa(dsPadrao.DataSet.FieldByName('NOME').AsString);
    LabeledEditCodigo.Text    := IntToStr(objProduto.Codigo);
    LabeledEditDescricao.Text := objProduto.Descricao;
    LabeledEditValor.Text     := FloatToStr(objProduto.Valor);
    cbxFornecedor.KeyValue    := objProduto.ID;
  finally
    FreeAndNil(objProduto);
    FreeAndNil(objProdutoController);
  end;
end;

procedure TFrmProdutos.Configuracoes;
begin
  TabSheet2.Visible := False;
  PageControl1.ActivePage := TabSheet1;
  Pesquisar;
  dsPadrao.DataSet := DAOFDConn.FDQuery;
  DAOFDConn.FDQuery.SQL.Text := ' SELECT ID, DESCRICAO, VALOR, CODFORN, CODIGO '+
                                ' FROM PRODUTO ';
  DAOFDConn.FDQuery.Open;

  QryFornecedor.Close;
  QryFornecedor.Open;
end;

procedure TFrmProdutos.HabilitarControle(aOpr: TOperacao);
begin
  case aOpr of
    opNovo, opAlterar:
    begin
      LabeledEditDescricao.Enabled := True;
      LabeledEditValor.Enabled     := True;
      LabeledEditCodigo.Enabled    := True;
      cbxFornecedor.Enabled        := True;
      PageControl1.ActivePage := TabSheet2;
    end
    else
    begin
      LabeledEditDescricao.Enabled := False;
      LabeledEditValor.Enabled     := False;
      LabeledEditCodigo.Enabled    := False;
      cbxFornecedor.Enabled        := False;
    end;
  end;
end;

procedure TFrmProdutos.Pesquisar;
var
  ProdutoController: TProdutoController;
begin
  ProdutoController := TProdutoController.Create;
  try
    ProdutoController.Pesquisa(EditPesqNome.Text);
  finally
    FreeAndNil(ProdutoController);
  end;
end;

procedure TFrmProdutos.DBGridDadosDblClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  BtnEdita.Click();
end;

procedure TFrmProdutos.EditPesqNomeChange(Sender: TObject);
begin
  inherited;
  CarregaGrid;
end;

procedure TFrmProdutos.BtnNovoClick(Sender: TObject);
begin
  inherited;
  Novo;
  FOperacao := opNovo;
  HabilitarControle(opNovo);
end;

procedure TFrmProdutos.BtnEditaClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  CarregaCampos;
  HabilitarControle(opAlterar);
end;

procedure TFrmProdutos.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmProdutos.BtnConfirmaClick(Sender: TObject);
begin
  if cbxFornecedor.KeyValue = -1 then
  begin
    ShowMessage('Informe um Fornecedor para esse produto');
    cbxFornecedor.SetFocus;
    Exit;
  end;

  Gravar;
  HabilitarControle(opNavegar);
  inherited;
end;

procedure TFrmProdutos.CarregaCampos;
begin
  LabeledEditDescricao.Text := DBGridDados.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
  LabeledEditValor.Text     := DBGridDados.DataSource.DataSet.FieldByName('VALOR').AsString;
  LabeledEditCodigo.Text    := DBGridDados.DataSource.DataSet.FieldByName('CODIGO').AsString;
  cbxFornecedor.KeyValue    := DBGridDados.DataSource.DataSet.FieldByName('CODFORN').AsInteger;
end;

end.
