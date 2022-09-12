unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uClienteController, uClienteModel, FireDAC.Stan.Intf, uDAOFDConn,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrSocket, ACBrCEP,
  ACBrValidador;

type
  TOperacao = (opNovo, opAlterar, opNavegar);


type
  TFrmClientes = class(TFrmPadrao)
    LabEdtNome: TLabeledEdit;
    LabEdtCnpjCpf: TLabeledEdit;
    rdgTipoPessoa: TRadioGroup;
    LabEdtCEP: TLabeledEdit;
    LabEdtEndereco: TLabeledEdit;
    rdgStatus: TRadioGroup;
    LabEdtLimite: TLabeledEdit;
    LabEdtNumero: TLabeledEdit;
    LabEdtComplemento: TLabeledEdit;
    ACBrCEP: TACBrCEP;
    ACBrValidador: TACBrValidador;
    procedure BtnCancelaClick(Sender: TObject);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDadosDblClick(Sender: TObject);
    procedure LabEdtCEPExit(Sender: TObject);
    procedure LabEdtCnpjCpfExit(Sender: TObject);
    procedure LabEdtLimiteExit(Sender: TObject);
    procedure LabEdtLimiteChange(Sender: TObject);
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
    procedure CarregarCliente;
    procedure Configuracoes;
    procedure HabilitarControle(aOpr: TOperacao);
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}


{ TFrmClientes }

procedure TFrmClientes.HabilitarControle(aOpr: TOperacao);
begin
  case aOpr of
    opNovo, opAlterar:
    begin
      LabEdtNome.Enabled        := True;
      LabEdtCnpjCpf.Enabled     := True;
      rdgTipoPessoa.Enabled     := True;
      LabEdtCEP.Enabled         := True;
      LabEdtEndereco.Enabled    := True;
      LabEdtNumero.Enabled      := True;
      LabEdtComplemento.Enabled := True;
      LabEdtLimite.Enabled      := True;
      rdgStatus.Enabled         := True;
    end
    else
    begin
      LabEdtNome.Enabled        := False;
      LabEdtCnpjCpf.Enabled     := False;
      rdgTipoPessoa.Enabled     := False;
      LabEdtCEP.Enabled         := False;
      LabEdtEndereco.Enabled    := False;
      LabEdtNumero.Enabled      := False;
      LabEdtComplemento.Enabled := False;
      LabEdtLimite.Enabled      := False;
      rdgStatus.Enabled         := False;
    end;
  end;
end;

procedure TFrmClientes.Configuracoes;
begin
  TabSheet2.Visible := False;
  PageControl1.ActivePage := TabSheet1;
  Pesquisar;
  dsPadrao.DataSet := DAOFDConn.FDQuery;
  DAOFDConn.FDQuery.SQL.Text := ' SELECT ID, NOME, TIPO, INSCRICAO, ENDERECO, '+
                                '        CEP, NUMERO, COMPLEMENTO, STATUS, LIMITE  '+
                                ' FROM CLIENTE ';
  DAOFDConn.FDQuery.Open;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  Configuracoes;
end;

procedure TFrmClientes.Novo;
begin
  FOperacao := OpNovo;
  PageControl1.ActivePage := TabSheet2; //Dados
  LabEdtNome.SetFocus;
end;

procedure TFrmClientes.Gravar;
var
  objClienteController: TClienteController;
begin
  objClienteController := TClienteController.Create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    objClienteController.Pesquisa(EditPesqNome.Text);
    Configuracoes;
  finally
    FreeAndNil(objClienteController);
  end;
end;

procedure TFrmClientes.Inserir;
var
  objCliente: TCliente;
  objClienteController: TClienteController;
  xErro: String;
begin
  objCliente := TCliente.Create;
  objClienteController := TClienteController.Create;
  try
     objCliente.ID          := objClienteController.FDaoCliente.GetID('CLIENTE');
     objCliente.Nome        := LabEdtNome.Text;
     objCliente.Tipo        := IntToStr(rdgTipoPessoa.ItemIndex);
     objCliente.Inscricao   := LabEdtCnpjCpf.Text;
     objCliente.Endereco    := LabEdtEndereco.Text;
     objCliente.Numero      := LabEdtNumero.Text;
     objCliente.Complemento := LabEdtComplemento.Text;
     objCliente.CEP         := StrToInt(LabEdtCEP.Text);
     objCliente.Status      := rdgStatus.ItemIndex;
     objCliente.Limite      := StrToFloat(LabEdtLimite.Text);
     if objClienteController.Inserir(objCliente,xErro) then
       ShowMessage('Cliente inserido com sucesso.');
  finally
    FreeAndNil(objCliente);
    FreeAndNil(objClienteController);
  end;
end;

procedure TFrmClientes.BtnConfirmaClick(Sender: TObject);
var
  objClienteController: TClienteController;
begin
  objClienteController := TClienteController.Create;
  try
    if FOperacao = opNovo then
    begin
      if objClienteController.FDaoCliente.VerificaInscricao(LabEdtCnpjCpf.Text) then
      begin
        ShowMessage('CPF ou CNPJ já utilizado em outro CLIENTE.');
        LabEdtCnpjCpf.SetFocus;
        Exit;
      end;
    end;
  finally
    FreeAndNil(objClienteController);
  end;

  if LabEdtLimite.Text = EmptyStr then
  begin
    ShowMessage('Limite inicial não informado ao cliente.');
    LabEdtLimite.SetFocus;
    Exit;
  end;

  Gravar;
  HabilitarControle(opNavegar);
  inherited;
end;


procedure TFrmClientes.Alterar;
var
  objCliente: TCliente;
  objClienteController: TClienteController;
  xErro: String;
begin
  objCliente := TCliente.Create;
  objClienteController := TClienteController.Create;
  try
     objCliente.ID          := DBGridDados.DataSource.DataSet.FieldByName('ID').Value;
     objCliente.Nome        := LabEdtNome.Text;
     objCliente.Tipo        := IntToStr(rdgTipoPessoa.ItemIndex);
     objCliente.Inscricao   := LabEdtCnpjCpf.Text;
     objCliente.Endereco    := LabEdtEndereco.Text;
     objCliente.Numero      := LabEdtNumero.Text;
     objCliente.Complemento := LabEdtComplemento.Text;
     objCliente.CEP         := StrToInt(LabEdtCEP.Text);
     objCliente.Status      := rdgStatus.ItemIndex;
     objCliente.Limite      := StrToFloat(LabEdtLimite.Text);
     if objClienteController.Alterar(objCliente,xErro) then
       ShowMessage('Cliente alterado com sucesso.');

  finally
    FreeAndNil(objCliente);
    FreeAndNil(objClienteController);
  end;
end;

procedure TFrmClientes.EditPesqNomeChange(Sender: TObject);
begin
  inherited;
  CarregaGrid;
end;

procedure TFrmClientes.Excluir;
var
  objClienteController: TClienteController;
  xErro: String;
begin
  objClienteController := TClienteController.Create;
  try
     if (dsPadrao.DataSet.Active) and (dsPadrao.DataSet.RecordCount > 0) then
     begin
       if MessageDlg('Deseja excluir esse registro?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = IDYES then
       begin
         if objClienteController.Excluir(dsPadrao.DataSet.FieldByName('ID').AsInteger, xErro) then
           objClienteController.Pesquisa(EditPesqNome.Text);
       end;
     end
     else
       raise Exception.Create('Não há registro selecionado para exclusão.');
  finally
    FreeAndNil(objClienteController);
  end;
end;

procedure TFrmClientes.CarregaGrid;
var
  ClienteController: TClienteController;
begin
  ClienteController := TClienteController.Create;
  try
    ClienteController.CarregaCliente(EditPesqNome.Text);
  finally
    FreeAndNil(ClienteController);
  end;
end;

procedure TFrmClientes.Pesquisar;
var
  ClienteController: TClienteController;
begin
  ClienteController := TClienteController.Create;
  try
    ClienteController.Pesquisa(EditPesqNome.Text);
  finally
    FreeAndNil(ClienteController);
  end;
end;

procedure TFrmClientes.CarregarCliente;
var
  objCliente: TCliente;
  objClienteController: TClienteController;
begin
  objCliente := TCliente.Create;
  objClienteController := TClienteController.Create;
  try
    objClienteController.Pesquisa(dsPadrao.DataSet.FieldByName('NOME').AsString);
    LabEdtNome.Text         := objCliente.Nome;
    rdgTipoPessoa.ItemIndex := StrToInt(objCliente.Tipo);
    LabEdtCnpjCpf.Text      := objCliente.Inscricao;
    LabEdtEndereco.Text     := objCliente.Endereco;
    LabEdtNumero.Text       := objCliente.Numero;
    LabEdtComplemento.Text  := objCliente.Complemento;
    LabEdtCEP.Text          := IntToStr(objCliente.CEP);
    rdgStatus.ItemIndex     := objCliente.Status;
    LabEdtLimite.Text       := FormatFloat('#0,00', objCliente.Limite);
  finally
    FreeAndNil(objCliente);
    FreeAndNil(objClienteController);
  end;
end;

procedure TFrmClientes.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmClientes.BtnNovoClick(Sender: TObject);
begin
  inherited;
  Novo;
  HabilitarControle(opNovo);
end;

procedure TFrmClientes.BtnEditaClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  HabilitarControle(opAlterar);
  CarregaCampos;
end;

procedure TFrmClientes.DBGridDadosDblClick(Sender: TObject);
begin
  inherited;
  FOperacao := opAlterar;
  BtnEdita.Click();
  CarregaCampos;
end;

procedure TFrmClientes.LabEdtCEPExit(Sender: TObject);
begin
  if Trim(LabEdtCEP.Text) <> '' then
  begin
    ACBrCEP.BuscarPorCEP(LabEdtCEP.Text);
    if ACBrCEP.Enderecos.Count <= 0 then
    begin
      ShowMessage('CEP Inválido.');
      LabEdtCEP.SetFocus;
      Exit;
    end
    else
    begin
      LabEdtEndereco.Text    := ACBrCEP.Enderecos[0].Logradouro;
      LabEdtComplemento.Text := ACBrCEP.Enderecos[0].Complemento;
      LabEdtNumero.SetFocus;
    end;
  end;
  inherited;
end;

procedure TFrmClientes.LabEdtCnpjCpfExit(Sender: TObject);
begin
  if LabEdtCnpjCpf.Text <> '' then
  begin
    ACBrValidador.Documento := LabEdtCnpjCpf.Text;
    if Length(LabEdtCnpjCpf.Text) = 11 then
    begin
      ACBrValidador.TipoDocto := docCPF;
      rdgTipoPessoa.ItemIndex := 0;
    end
    else
    if Length(LabEdtCnpjCpf.Text) = 14 then
    begin
      ACBrValidador.TipoDocto := docCNPJ;
      rdgTipoPessoa.ItemIndex := 1;
    end;

    if not ACBrValidador.Validar then
    begin
      Application.MessageBox('Inscrição digitada com erro','ATENÇÃO',MB_ICONERROR + MB_OK);
      LabEdtCnpjCpf.SetFocus;
    end;
  end;
  rdgTipoPessoa.SetFocus;
  inherited;
end;

procedure TFrmClientes.LabEdtLimiteChange(Sender: TObject);
begin
  inherited;
  LabEdtLimite.Font.Color := clWindowText;
  if StrToFloat(LabEdtLimite.Text) <= 0 then
  begin
    LabEdtLimite.Font.Color := clRed;
  end;

end;

procedure TFrmClientes.LabEdtLimiteExit(Sender: TObject);
begin
  inherited;
  LabEdtLimite.Font.Color := clWindowText;
  if StrToFloat(LabEdtLimite.Text) <= 0 then
  begin
    LabEdtLimite.Font.Color := clRed;
    ShowMessage('Limite menor ou igual a 0');
    LabEdtLimite.SetFocus;
  end;
end;

procedure TFrmClientes.CarregaCampos;
begin
  LabEdtNome.Text     := DBGridDados.DataSource.DataSet.FieldByName('NOME').AsString;
  LabEdtCnpjCpf.Text  := DBGridDados.DataSource.DataSet.FieldByName('INSCRICAO').AsString;
  LabEdtCEP.Text      := DBGridDados.DataSource.DataSet.FieldByName('CEP').AsString;
  LabEdtEndereco.Text := DBGridDados.DataSource.DataSet.FieldByName('ENDERECO').AsString;
  LabEdtNumero.Text   := DBGridDados.DataSource.DataSet.FieldByName('NUMERO').AsString;
  LabEdtComplemento.Text  := DBGridDados.DataSource.DataSet.FieldByName('COMPLEMENTO').AsString;
  LabEdtLimite.Text       := DBGridDados.DataSource.DataSet.FieldByName('LIMITE').AsString;
  rdgTipoPessoa.ItemIndex := StrToInt(DBGridDados.DataSource.DataSet.FieldByName('TIPO').AsString);
  rdgStatus.ItemIndex     := StrToInt(DBGridDados.DataSource.DataSet.FieldByName('STATUS').AsString);
  PageControl1.ActivePage := TabSheet2;
end;


end.
