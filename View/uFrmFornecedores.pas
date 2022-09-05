unit uFrmFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, uDAOFDConn, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrSocket, ACBrCEP,  ACBrValidador, uFornecedorController,
  uFornecedorModel;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

type
  TFrmFornecedores = class(TFrmPadrao)
    LabEdtRazaoSocial: TLabeledEdit;
    LabEdtCnpjCpf: TLabeledEdit;
    ACBrValidador: TACBrValidador;
    procedure FormShow(Sender: TObject);
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure LabEdtCnpjCpfExit(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    FQueryLocal: TFDQuery;
    procedure Novo;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure Pesquisar;
    procedure CarregaGrid;
    procedure CarregaCampos;
  public
    procedure CarregarFornecedor;
    procedure Configuracoes;
    procedure HabilitarControle(aOpr: TOperacao);
  end;

var
  FrmFornecedores: TFrmFornecedores;

implementation

{$R *.dfm}

{ TFrmFornecedores }
procedure TFrmFornecedores.FormShow(Sender: TObject);
begin
  inherited;
  Configuracoes;
end;


procedure TFrmFornecedores.Novo;
begin
  FOperacao := OpNovo;
  PageControl1.ActivePage := TabSheet2; //Dados
  LabEdtRazaoSocial.SetFocus;
end;

procedure TFrmFornecedores.Alterar;
var
  objFornecedor: TFornecedor;
  objFornecedorController: TFornecedorController;
  xErro: String;
begin
  objFornecedor := TFornecedor.Create;
  objFornecedorController := TFornecedorController.Create;
  try
     objFornecedor.ID          := DBGridDados.DataSource.DataSet.FieldByName('ID').Value;
     objFornecedor.Razao       := LabEdtRazaoSocial.Text;
     objFornecedor.Inscricao   := LabEdtCnpjCpf.Text;
     if objFornecedorController.Alterar(objFornecedor,xErro) then
       ShowMessage('Fornecedor alterado com sucesso.');

  finally
    FreeAndNil(objFornecedor);
    FreeAndNil(objFornecedorController);
  end;
end;


procedure TFrmFornecedores.Excluir;
var
  objFornecedorController: TFornecedorController;
  xErro: String;
begin
  objFornecedorController := TFornecedorController.Create;
  try
     if (dsPadrao.DataSet.Active) and (dsPadrao.DataSet.RecordCount > 0) then
     begin
       if MessageDlg('Deseja excluir esse registro?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = IDYES then
       begin
         if objFornecedorController.Excluir(dsPadrao.DataSet.FieldByName('ID').AsInteger, xErro) then
           objFornecedorController.Pesquisa(EditPesqNome.Text);
       end;
     end
     else
       raise Exception.Create('Não há registro selecionado para exclusão.');
  finally
    FreeAndNil(objFornecedorController);
  end;
end;

procedure TFrmFornecedores.Gravar;
var
  objFornecedorController: TFornecedorController;
begin
  objFornecedorController := TFornecedorController.Create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    objFornecedorController.Pesquisa(EditPesqNome.Text);
    Configuracoes;
  finally
    FreeAndNil(objFornecedorController);
  end;
end;

procedure TFrmFornecedores.Inserir;
var
  objFornecedor: TFornecedor;
  objFornecedorController: TFornecedorController;
  xErro: String;
begin
  objFornecedor := TFornecedor.Create;
  objFornecedorController := TFornecedorController.Create;
  try
     objFornecedor.ID          := objFornecedorController.FDaoFornecedor.GetID('Fornecedor');
     objFornecedor.Razao       := LabEdtRazaoSocial.Text;
     objFornecedor.Inscricao   := LabEdtCnpjCpf.Text;
     if objFornecedorController.Inserir(objFornecedor,xErro) then
       ShowMessage('Fornecedor inserido com sucesso.');
  finally
    FreeAndNil(objFornecedor);
    FreeAndNil(objFornecedorController);
  end;
end;

procedure TFrmFornecedores.Pesquisar;
var
  FornecedorController: TFornecedorController;
begin
  FornecedorController := TFornecedorController.Create;
  try
    FornecedorController.Pesquisa(EditPesqNome.Text);
  finally
    FreeAndNil(FornecedorController);
  end;
end;

procedure TFrmFornecedores.CarregaGrid;
var
  FornecedorController: TFornecedorController;
begin
  FornecedorController := TFornecedorController.Create;
  try
    FornecedorController.CarregaFornecedor(EditPesqNome.Text);
  finally
    FreeAndNil(FornecedorController);
  end;
end;

procedure TFrmFornecedores.HabilitarControle(aOpr: TOperacao);
begin
  case aOpr of
    opNovo, opAlterar:
    begin
      LabEdtRazaoSocial.Enabled := True;
      LabEdtCnpjCpf.Enabled     := True;
    end
    else
    begin
      LabEdtRazaoSocial.Enabled := False;
      LabEdtCnpjCpf.Enabled     := False;
    end;
  end;
end;

procedure TFrmFornecedores.CarregarFornecedor;
var
  objFornecedor: TFornecedor;
  objFornecedorController: TFornecedorController;
begin
  objFornecedor := TFornecedor.Create;
  objFornecedorController := TFornecedorController.Create;
  try
    objFornecedorController.Pesquisa(dsPadrao.DataSet.FieldByName('NOME').AsString);
    LabEdtRazaoSocial.Text  := objFornecedor.Razao;
    LabEdtCnpjCpf.Text      := objFornecedor.Inscricao;
  finally
    FreeAndNil(objFornecedor);
    FreeAndNil(objFornecedorController);
  end;
end;

procedure TFrmFornecedores.Configuracoes;
begin
  TabSheet2.Visible := False;
  PageControl1.ActivePage := TabSheet1;
  Pesquisar;
  dsPadrao.DataSet := DAOFDConn.FDQuery;
  DAOFDConn.FDQuery.SQL.Text := ' SELECT ID, RAZAO, INSCRICAO '+
                                ' FROM FORNECEDOR ';
  DAOFDConn.FDQuery.Open;
end;

procedure TFrmFornecedores.DBGridDadosDblClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  BtnEdita.Click();
  CarregaCampos;
end;

procedure TFrmFornecedores.EditPesqNomeChange(Sender: TObject);
begin
  inherited;
  CarregaGrid;
end;

procedure TFrmFornecedores.BtnNovoClick(Sender: TObject);
begin
  inherited;
  Novo;
  FOperacao := opNovo;
  HabilitarControle(opNovo);
end;

procedure TFrmFornecedores.BtnEditaClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  HabilitarControle(opAlterar);
  CarregaCampos;
end;

procedure TFrmFornecedores.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmFornecedores.BtnConfirmaClick(Sender: TObject);
var
  objFornecedorController: TFornecedorController;
begin
  objFornecedorController := TFornecedorController.Create;
  try
    if FOperacao = opNovo then
    begin
      if objFornecedorController.FDaoFornecedor.VerificaInscricao(LabEdtCnpjCpf.Text) then
      begin
        ShowMessage('CNPJ já utilizado em outro FORNECEDOR.');
        LabEdtCnpjCpf.SetFocus;
        Exit;
      end;
    end;
  finally
    FreeAndNil(objFornecedorController);
  end;

  Gravar;
  HabilitarControle(opNavegar);
  inherited;
end;

procedure TFrmFornecedores.LabEdtCnpjCpfExit(Sender: TObject);
begin
  if LabEdtCnpjCpf.Text <> '' then
  begin
    ACBrValidador.Documento := LabEdtCnpjCpf.Text;
    if Length(LabEdtCnpjCpf.Text) = 14 then
      ACBrValidador.TipoDocto := docCNPJ;

    if not ACBrValidador.Validar then
    begin
      Application.MessageBox('Inscrição digitada com erro','ATENÇÃO',MB_ICONERROR + MB_OK);
      LabEdtCnpjCpf.SetFocus;
    end;
  end;
  inherited;
end;

procedure TFrmFornecedores.CarregaCampos;
begin
  LabEdtRazaoSocial.Text  := DBGridDados.DataSource.DataSet.FieldByName('RAZAO').AsString;
  LabEdtCnpjCpf.Text      := DBGridDados.DataSource.DataSet.FieldByName('INSCRICAO').AsString;
  PageControl1.ActivePage := TabSheet2;
end;

end.
