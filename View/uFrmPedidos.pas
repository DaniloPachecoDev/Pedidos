unit uFrmPedidos;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, DBXCommon, ppReport, ppPrnabl, ppClass, ppStrtch, ppSubRpt,
  ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppCtrls, ppVar, uDAOPedidos, uPedidosController,
  uPedidosModel, uDAOFDConn, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uFrmRelPedidos;

type
  TFrmPedidos = class(TFrmPadrao)
    GroupBox1: TGroupBox;
    GrpItens: TGroupBox;
    GrpPagamento: TGroupBox;
    dbEditPedido: TDBEdit;
    dtpDataPedido: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dblcbxCliente: TDBLookupComboBox;
    Label3: TLabel;
    dsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cbxTipPag: TComboBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PnlItens: TPanel;
    PgCtrlItens: TPageControl;
    TabListaItens: TTabSheet;
    DBGridListaItens: TDBGrid;
    btnNovoItem: TBitBtn;
    btnEditaItem: TBitBtn;
    btnExcluiItem: TBitBtn;
    TabEditarItens: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dblcbxProduto: TDBLookupComboBox;
    btnConfItem: TBitBtn;
    btnCancItem: TBitBtn;
    cdsProdutoID: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsClientesID: TIntegerField;
    cdsClientesNOME: TStringField;
    dspServer: TDataSetProvider;
    cdsTempItens: TClientDataSet;
    cdsTempItensCOD_PRODUTO: TIntegerField;
    cdsTempItensQUANTIDADE: TIntegerField;
    cdsTempItensVALOR_UNITARIO: TFloatField;
    cdsTempItensVALOR_TOTAL: TFloatField;
    dsTempItem: TDataSource;
    cdsPedido: TClientDataSet;
    dspPedidos: TDataSetProvider;
    dsPedidos: TDataSource;
    cdsAux: TClientDataSet;
    cdsTempItensID_PEDIDO: TIntegerField;
    dtpDatVencimento: TDateTimePicker;
    cdsAuxItem: TClientDataSet;
    edtQtd: TEdit;
    edtVrUnit: TEdit;
    edtVrTotal: TEdit;
    dsParPed: TDataSource;
    edtValorTotalPedido: TEdit;
    Label10: TLabel;
    cdsTempItensDESC_PROD: TStringField;
    cdsParcelamento: TClientDataSet;
    cdsParcelamentoID_PEDIDO: TIntegerField;
    cdsParcelamentoFORMA_PAG: TIntegerField;
    edtValorTotalPar: TEdit;
    cdsPedidoNUM_Pedido: TIntegerField;
    cdsPedidoCOD_Cliente: TIntegerField;
    cdsPedidoData_Emissao: TDateTimeField;
    cdsPedidoID: TIntegerField;
    cdsPedidoTOT_Pedido: TFMTBCDField;
    cdsParcelamentoVAL_PARCELA: TFMTBCDField;
    cdsParcelamentoDAT_VENCIMENTO: TDateField;
    FDStoredProc: TFDStoredProc;
    procedure FormShow(Sender: TObject);
    procedure btnConfItemClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure btnEditaItemClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure btnCancItemClick(Sender: TObject);
    procedure cbxTipPagExit(Sender: TObject);
    procedure EditPesqNomeChange(Sender: TObject);
    procedure dbEditValorParcelasExit(Sender: TObject);
    procedure edtVrTotalEnter(Sender: TObject);
    procedure edtVrUnitExit(Sender: TObject);
  private
    pValorTotalPedido: Double;
    pInsere: Boolean;
    pInsereProduto: Boolean;
    function Valida: Boolean;
    function ValidaItem: Boolean;
    procedure AtualizaValorTotal(pClientDataSet: TClientDataSet);
    procedure PreencheAuxiliarItem(pCodigo: Integer);
    procedure PreencheAuxiliarPagamento(pCodigo: Integer);
    procedure ExecutaProcedureCliente(pValor: Double; pCodCliente: Integer);
    procedure ChamaRelatorioPedido(pCodPedido: Integer);
    procedure VerificaLimiteCliente(pIDCliente: Integer; out pTemLimite: Boolean);
  public
    pTipOperacao: Integer;
    pProxCodigo: String;
  end;
var
  FrmPedidos: TFrmPedidos;
implementation

{$R *.dfm}
procedure TFrmPedidos.FormShow(Sender: TObject);
begin
  inherited;
  cdsClientes.Open;
  cdsProduto.Open;
  cdsParcelamento.Open;
  pValorTotalPedido := 0;
  PgCtrlItens.ActivePage := TabListaItens;
  cdsTempItens.CreateDataSet;
  dtpDataPedido.Date    := Now;
  dtpDatVencimento.Date := Now;
end;

// FUNÇÕES DOS ITENS DENTRO DO PEDIDO.
procedure TFrmPedidos.btnNovoItemClick(Sender: TObject);
begin
  PgCtrlItens.ActivePage := TabEditarItens;
  pInsereProduto := True;
  dblcbxProduto.KeyValue := -1;
  edtQtd.Text     := '';
  edtVrUnit.Text  := '';
  edtVrTotal.Text := '';
end;
procedure TFrmPedidos.btnEditaItemClick(Sender: TObject);
begin
  inherited;
  PgCtrlItens.ActivePage := TabEditarItens;
  pInsereProduto := False;
  dblcbxProduto.KeyValue := cdsTempItens.FieldByName('COD_PRODUTO').AsInteger;
  edtQtd.Text            := cdsTempItens.FieldByName('QUANTIDADE').AsString;
  edtVrUnit.Text         := cdsTempItens.FieldByName('VALOR_UNITARIO').AsString;
  edtVrTotal.Text        := cdsTempItens.FieldByName('VALOR_TOTAL').AsString;
end;
procedure TFrmPedidos.btnExcluiItemClick(Sender: TObject);
var
  Resp: Integer;
begin
  Resp := MessageBoxEx(Handle,'Deseja Excluir o registro?', 'Confirmação', MB_YESNO,LANG_PORTUGUESE);
  if Resp = IDYES then
  begin
    if cdsTempItens.Locate('COD_PRODUTO',DBGridListaItens.Columns.Items[0].Field.Value,[loCaseInsensitive]) then
    begin
      cdsTempItens.Delete;
      ShowMessage('Produto do pedido excluido com sucesso.');
      AtualizaValorTotal(cdsTempItens);
    end;
  end;
end;
// Cancela temporariamente o item do pedido
procedure TFrmPedidos.btnCancItemClick(Sender: TObject);
begin
  PgCtrlItens.ActivePage := TabListaItens;
end;
// Inserindo temporariamente os itens do pedido
procedure TFrmPedidos.btnConfItemClick(Sender: TObject);
begin
  if ValidaItem then
  begin
    try
      try
        if not cdsTempItens.Locate('COD_PRODUTO',dblcbxProduto.KeyValue,[loCaseInsensitive]) then
          cdsTempItens.Append
        else
          cdsTempItens.Edit;
          cdsTempItens.FieldByName('ID_PEDIDO').AsInteger    := StrToInt(pProxCodigo);
          cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := dblcbxProduto.KeyValue;
          cdsTempItens.FieldByName('DESC_PROD').AsString     := dblcbxProduto.Text;
          cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := StrToInt(edtQtd.Text);
          cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := StrToFloat(edtVrUnit.Text);
          cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := StrToFloat(edtVrTotal.Text);
          cdsTempItens.Post;
          AtualizaValorTotal(cdsTempItens);
      except
        cdsTempItens.Delete;
      end;
    finally
      edtQtd.Clear;
      edtVrUnit.Clear;
      edtVrTotal.Clear;
      PgCtrlItens.ActivePage := TabListaItens;
    end;
  end;
end;
procedure TFrmPedidos.edtVrUnitExit(Sender: TObject);
begin
  inherited;
  if edtVrUnit.Text <> '' then
    edtVrUnit.Text := StringReplace(edtVrUnit.Text,'.',',',[rfReplaceAll]);
end;

procedure TFrmPedidos.edtVrTotalEnter(Sender: TObject);
var
  ValorCalculado: Currency;
begin
  //inherited;
  if (edtQtd.Text <> '') and (edtVrUnit.Text <> '')then
  begin
    ValorCalculado := (StrToFloat(edtQtd.Text) *
                       StrToFLoat(edtVrUnit.Text));
    edtVrTotal.Text := FloatToStrF(ValorCalculado,ffFixed,18,2);
    pValorTotalPedido := pValorTotalPedido + ValorCalculado;
  end;
end;
function TFrmPedidos.ValidaItem: Boolean;
begin
  Result := True;
  if dblcbxProduto.ListFieldIndex = -1 then
  begin
    ShowMessage('Campo PRODUTO inválido');
    dblcbxProduto.SetFocus;
    Result := False;
  end
  else
  if edtQtd.Text = '' then
  begin
    ShowMessage('Campo QUANTIDADE inválido');
    edtQtd.SetFocus;
    Result := False;
  end
  else
  if edtVrUnit.Text = '' then
  begin
    ShowMessage('Campo VALOR UNITÁRIO inválido');
    edtVrUnit.SetFocus;
    Result := False;
  end;
end;

procedure TFrmPedidos.AtualizaValorTotal(pClientDataSet: TClientDataSet);
begin
  // Atualiza o Edit do Valor Total com os restantes dos produtos do pedido
  edtValorTotalPedido.Text := '0';
  pClientDataSet.First;
  while not pClientDataSet.Eof do
  begin
    edtValorTotalPedido.Text := FloatToStrF(StrToFloat(edtValorTotalPedido.Text) + StrToFloat(pClientDataSet.FieldByName('VALOR_TOTAL').AsString),ffFixed,18,2);
    edtValorTotalPedido.Text := FormatCurr('#,##0.00',StrToFloat(edtValorTotalPedido.Text));
    edtValorTotalPedido.Refresh;
    pClientDataSet.Next;
  end;
end;
// FIM - DAS FUNÇÕES DOS ITENS
procedure TFrmPedidos.PreencheAuxiliarItem(pCodigo: Integer);
begin
  cdsAuxItem.Close;
  cdsAuxItem.CommandText := 'SELECT I.ID_PEDIDO,  '+
                            '       I.COD_PRODUTO, '+
                            '       I.QTD,         '+
                            '       I.VR_UNIT,     '+
                            '       I.TOT_ITEM,    '+
                            '       P.DESCRICAO    '+
                            'FROM ITEMPED I        '+
                            'INNER JOIN PRODUTO P ON P.ID = I.COD_PRODUTO '+
                            'WHERE ID_PEDIDO = :pIDPEDIDO ';
  cdsAuxItem.Params.ParamByName('pIDPEDIDO').AsInteger := pCodigo;
  cdsAuxItem.Open;
end;
procedure TFrmPedidos.PreencheAuxiliarPagamento(pCodigo: Integer);
begin
  cdsParcelamento.Close;
  cdsParcelamento.CommandText := 'SELECT ID_PEDIDO,      '+
                                 '       FORMA_PAG,      '+
                                 '       DAT_VENCIMENTO, '+
                                 '       VAL_PARCELA     '+
                                 'FROM PARPED            '+
                                 'WHERE ID_PEDIDO = :pIDPedido ';
  cdsParcelamento.Params.ParamByName('pIDPedido').AsInteger := pCodigo;
  cdsParcelamento.Open;
end;
procedure TFrmPedidos.cbxTipPagExit(Sender: TObject);
begin
  inherited;
  dtpDatVencimento.Enabled := True;
  if cbxTipPag.ItemIndex = 0 then
  begin
    dtpDatVencimento.Date     := Now;
    dtpDatVencimento.Enabled  := False;
    edtValorTotalPar.SetFocus;
  end;
  edtValorTotalPar.Text := edtValorTotalPedido.Text;
end;
procedure TFrmPedidos.dbEditValorParcelasExit(Sender: TObject);
begin
  inherited;
  BtnConfirma.SetFocus;
end;
function TFrmPedidos.Valida: Boolean;
begin
  Result := True;
  if edtValorTotalPar.Text <> edtValorTotalPedido.Text then
  begin
    ShowMessage('Valor total da Forma de Pagamento está diferente do Valor total do PEDIDO');
    cbxTipPag.SetFocus;
    Result := False;
  end;
  if cbxTipPag.ItemIndex = 1 then
  begin
    if FormatDateTime('dd/mm/yyyy', dtpDatVencimento.DateTime) < FormatDateTime('dd/mm/yyyy', Now) then
    begin
      ShowMessage('Data de Vencimento não pode ser inferior a HOJE.');
      dtpDatVencimento.SetFocus;
      Result := False;
    end;
  end;
end;
procedure TFrmPedidos.BtnNovoClick(Sender: TObject);
var
  objPedidoController: TPedidoController;
begin
  objPedidoController := TPedidoController.Create;
  try
    PageControl1.ActivePage := TabSheet2;
    pInsere := True;
    edtValorTotalPar.Text    := '';
    edtValorTotalPedido.Text := '';
    dblcbxCliente.KeyValue   := -1;
    inherited;
    dbEditPedido.SetFocus;
    pProxCodigo := IntToStr(objPedidoController.FDaoPedido.GetID('PEDIDO'));
    cdsTempItens.EmptyDataSet;
  finally
    FreeAndNil(objPedidoController);
  end;
end;
procedure TFrmPedidos.BtnEditaClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  pInsere := False;
  edtValorTotalPar.Text  := '';
  // Pega o código do PEDIDO a parte devido ao mesmo ser IDENTITY
  cdsAux.Close;
  cdsAux.CommandText := 'SELECT COD_CLIENTE, ID, TOT_Pedido FROM PEDIDO WHERE NUM_PEDIDO = '+QuotedStr(cdsPedido.FieldByName('NUM_PEDIDO').AsString);
  cdsAux.Open;
  dblcbxCliente.KeyValue := cdsAux.FieldByName('COD_CLIENTE').AsInteger;
  pValorTotalPedido      := cdsAux.FieldByName('TOT_Pedido').AsFloat;
  edtValorTotalPedido.Text := FloatToStrF(cdsAux.FieldByName('TOT_Pedido').AsFloat,ffFixed,18,2);
  //
  PreencheAuxiliarItem(cdsAux.FieldByName('ID').AsInteger);
  cdsAuxItem.First;
  while not cdsAuxItem.Eof do
  begin
    if cdsTempItens.Locate('COD_PRODUTO',cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger,[loCaseInsensitive]) then
      cdsTempItens.Edit
    else
      cdsTempItens.Append;
    cdsTempItens.FieldByName('ID_PEDIDO').AsInteger    := cdsAux.FieldByName('ID').AsInteger;
    cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger;
    cdsTempItens.FieldByName('DESC_PROD').AsString     := cdsAuxItem.FieldByName('DESCRICAO').AsString;
    cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := cdsAuxItem.FieldByName('QTD').AsInteger;
    cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := cdsAuxItem.FieldByName('VR_UNIT').AsFloat;
    cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := cdsAuxItem.FieldByName('TOT_ITEM').AsFloat;
    cdsTempItens.Post;
    cdsAuxItem.Next;
  end;
  //
  PreencheAuxiliarPagamento(cdsAux.FieldByName('ID').AsInteger);
  cbxTipPag.ItemIndex   := cdsParcelamento.FieldByName('FORMA_PAG').AsInteger;
  dtpDatVencimento.Date := cdsParcelamento.FieldByName('DAT_VENCIMENTO').Value;
  edtValorTotalPar.Text := FloatToStrF(cdsParcelamento.FieldByName('VAL_PARCELA').AsFloat,ffFixed,18,2);
  //
  pProxCodigo := IntToStr(cdsAux.FieldByName('ID').AsInteger);
  inherited;
end;
procedure TFrmPedidos.BtnExcluirClick(Sender: TObject);
var
  xPedido: TPedidoController;
  xErro: String;
begin
  xPedido := TPedidoController.Create;
  try
    // Pega o código do PEDIDO a parte devido ao mesmo ser IDENTITY
    cdsAux.Close;
    cdsAux.CommandText := 'SELECT ID FROM PEDIDO WHERE NUM_PEDIDO = '+QuotedStr(cdsPedido.FieldByName('NUM_PEDIDO').AsString);
    cdsAux.Open;
    //
    PreencheAuxiliarItem(cdsAux.FieldByName('ID').AsInteger);
    cdsAuxItem.First;
    while not cdsAuxItem.Eof do
    begin
      if cdsTempItens.Locate('COD_PRODUTO',cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger,[loCaseInsensitive]) then
        cdsTempItens.Edit
      else
        cdsTempItens.Append;
      cdsTempItens.FieldByName('ID_PEDIDO').AsInteger   := cdsAux.FieldByName('ID').AsInteger;
      cdsTempItens.FieldByName('COD_PRODUTO').AsInteger  := cdsAuxItem.FieldByName('COD_PRODUTO').AsInteger;
      cdsTempItens.FieldByName('DESC_PROD').AsString     := cdsAuxItem.FieldByName('DESCRICAO').AsString;
      cdsTempItens.FieldByName('QUANTIDADE').AsInteger   := cdsAuxItem.FieldByName('QTD').AsInteger;
      cdsTempItens.FieldByName('VALOR_UNITARIO').AsFloat := cdsAuxItem.FieldByName('VR_UNIT').AsFloat;
      cdsTempItens.FieldByName('VALOR_TOTAL').AsFloat    := cdsAuxItem.FieldByName('TOT_ITEM').AsFloat;
      cdsTempItens.Post;
      cdsAuxItem.Next;
    end;
    //
    PreencheAuxiliarPagamento(cdsAux.FieldByName('ID').AsInteger);
    cbxTipPag.ItemIndex   := cdsParcelamento.FieldByName('FORMA_PAG').AsInteger;
    dtpDatVencimento.Date := cdsParcelamento.FieldByName('DAT_VENCIMENTO').Value;
    edtValorTotalPar.Text := FloatToStrF(cdsParcelamento.FieldByName('VAL_PARCELA').AsFloat,ffFixed,18,2);

    xPedido.Excluir(cdsAux.FieldByName('ID').AsInteger, xErro);
    PageControl1.ActivePage := TabSheet2;
    inherited;
  finally
    PageControl1.ActivePage := TabSheet1;
  end;

end;
procedure TFrmPedidos.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;
procedure TFrmPedidos.BtnConfirmaClick(Sender: TObject);
var
  Crud: TPedido;
  PedidoController: TPedidoController;
  CrudItem: TItemPedido;
  ItemPedController: TItemPedidoController;
  CrudPagamento: TPagamentoPedido;
  PagController: TPagamentoPedidoController;
  xErro: String;
  xTemLimite: Boolean;
  procedure Habilita;
  begin
    BtnNovo.Enabled     := not(dsPadrao.DataSet.State in [dsInsert, dsEdit]);
    BtnConfirma.Enabled := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
    BtnEdita.Enabled    := (dsPadrao.DataSet.State in [dsBrowse]);
    BtnExcluir.Enabled  := (dsPadrao.DataSet.State in [dsBrowse, dsEdit]);
    BtnCancela.Enabled  := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
  end;
begin
  // Valida os campos da tela para evitar problemas futuros.
  if Valida then
  begin
    try
      PedidoController  := TPedidoController.Create;
      ItemPedController := TItemPedidoController.Create;
      PagController     := TPagamentoPedidoController.Create;
      try
        uDAOFDConn.DAOFDConn.FDConnection.Transaction.StartTransaction;

        cdsTempItens.First;
        edtValorTotalPedido.Text := StringReplace(edtValorTotalPedido.Text,'.','',[rfReplaceAll]);
        edtValorTotalPar.Text    := StringReplace(edtValorTotalPar.Text,'.','',[rfReplaceAll]);
        Crud := TPedido.Create;
        Crud.ID           := StrToInt(pProxCodigo);
        Crud.Num_Pedido   := dbEditPedido.Text;
        Crud.Data_Emissao := dtpDataPedido.Date;
        Crud.Cod_Cliente  := dblcbxCliente.KeyValue;
        Crud.Tot_Pedido   := StrToFloat(edtValorTotalPedido.Text);

        CrudPagamento := TPagamentoPedido.Create;
        CrudPagamento.ID             := PedidoController.FDaoPedido.GetID('PARPED');
        CrudPagamento.ID_Pedido      := StrToInt(pProxCodigo);
        CrudPagamento.Forma_Pag      := cbxTipPag.ItemIndex;
        CrudPagamento.Dat_Vencimento := dtpDatVencimento.Date;
        CrudPagamento.Val_Parcela    := StrToFloat(edtValorTotalPar.Text);

        CrudItem := TItemPedido.Create;
        if pInsere then
        begin
          if PedidoController.Inserir(Crud, xErro) then
          begin
            while not cdsTempItens.Eof do
            begin
              try
                CrudItem.ID          := PedidoController.FDaoPedido.GetID('ITEMPED');
                CrudItem.ID_Pedido   := StrToInt(pProxCodigo);
                CrudItem.Cod_Produto := cdsTempItensCOD_PRODUTO.Value;
                CrudItem.QTD         := cdsTempItensQUANTIDADE.Value;
                CrudItem.VR_Unit     := cdsTempItensVALOR_UNITARIO.Value;
                CrudItem.TOT_Item    := cdsTempItensVALOR_TOTAL.Value;
                if ItemPedController.Inserir(CrudItem, xErro) then
                  cdsTempItens.Next;
              except
                ShowMessage('Erro ao incluir o ITEM do pedido.');
                Exit;
              end;
            end;
            if PagController.Inserir(CrudPagamento, xErro) then
            begin
              ExecutaProcedureCliente(Crud.Tot_Pedido,
                                      Crud.Cod_Cliente);
              ShowMessage('Pedido INCLUIDO com sucesso.');
            end;
          end;
        end
        else
        begin
          Crud.ID := StrToInt(cdsAux.FieldByName('ID').AsString);
          CrudPagamento.ID_Pedido := StrToInt(cdsAux.FieldByName('ID').AsString);
          if PedidoController.Alterar(Crud, xErro) then
          begin
            while not cdsTempItens.Eof do
            begin
              try
                CrudItem.ID          := PedidoController.FDaoPedido.GetID('ITEMPED');
                CrudItem.ID_Pedido   := StrToInt(pProxCodigo);
                CrudItem.Cod_Produto := cdsTempItensCOD_PRODUTO.Value;
                CrudItem.QTD         := cdsTempItensQUANTIDADE.Value;
                CrudItem.VR_Unit     := cdsTempItensVALOR_UNITARIO.Value;
                CrudItem.TOT_Item    := cdsTempItensVALOR_TOTAL.Value;
                if ItemPedController.Alterar(CrudItem, xErro) then
                  cdsTempItens.Next;
              except
                ShowMessage('Erro ao alterar um ITEM do pedido.');
                Exit;
              end;
            end;
            if PagController.Alterar(CrudPagamento, xErro) then
            begin
              ShowMessage('Pedido ALTERADO com sucesso.');
            end;
          end;
        end;
        uDAOFDConn.DAOFDConn.FDConnection.Transaction.Commit;
        ChamaRelatorioPedido(Crud.ID);
        VerificaLimiteCliente(Crud.Cod_Cliente, xTemLimite);
        if not xTemLimite then
          ShowMessage('Cliente: '+dblcbxCliente.Text+' não possui mais Limite');
      except
        uDAOFDConn.DAOFDConn.FDConnection.Transaction.Rollback;
        raise Exception.Create('Erro na inclusão ou alteração do PEDIDO.');
      end;
    finally
      FreeAndNil(Crud);
      FreeAndNil(PedidoController);
      FreeAndNil(CrudItem);
      FreeAndNil(ItemPedController);
      FreeAndNil(CrudPagamento);
      FreeAndNil(PagController);
      cdsPedido.Close;
      cdsPedido.Open;
      cdsTempItens.EmptyDataSet;
      PageControl1.ActivePage := TabSheet1;
    end;
    Habilita;
  end;
end;
procedure TFrmPedidos.EditPesqNomeChange(Sender: TObject);
begin
  if EditPesqNome.Text = '' then
    EditPesqNome.Text := '0';
  cdsPedido.Locate('NUM_Pedido',StrToInt(EditPesqNome.Text),[loCaseInsensitive]);
  inherited;
end;

procedure TFrmPedidos.ExecutaProcedureCliente(pValor: Double; pCodCliente: Integer);
begin
  try
    FDStoredProc.Connection := uDAOFDConn.DAOFDConn.FDConnection;
    FDStoredProc.ExecProc('SALDO_CLIENTE',[pCodCliente, pValor]);
  except on E: Exception do
    raise Exception.Create('Erro na validação do Limite do Cliente: '+E.Message);
  end;
end;

procedure TFrmPedidos.ChamaRelatorioPedido(pCodPedido: Integer);
var
  Relatorio : TFrmRelPedidos;
begin
  Relatorio := TFrmRelPedidos.Create(nil);
  try
    Relatorio.pIDPedido  := pCodPedido;
    Relatorio.pMovimento := True;
    Relatorio.btnImprimir.OnClick(Self);
  finally
    FreeAndNil(Relatorio);
  end;
end;

procedure TFrmPedidos.VerificaLimiteCliente(pIDCliente: Integer; out pTemLimite: Boolean);
var
  Qry: TFDQuery;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      Qry : TFDQuery;
      vLimite: Double;
    begin
       Qry := TFDQuery.Create(nil);
       try
         Qry.Connection := uDAOFDConn.DAOFDConn.FDConnection;
         Qry.Close;
         Qry.SQL.Clear;
         Qry.SQL.Text := 'SELECT LIMITE FROM CLIENTE '+
                         ' WHERE CLIENTE.ID = '+IntToStr(pIDCliente);
         Qry.Open;
         vLimite := Qry.FieldByName('LIMITE').AsFloat;
         if vLimite <= 0 then
         begin
           Qry.Close;
           Qry.SQL.Clear;
           Qry.SQL.Text := 'UPDATE CLIENTE SET '+
                           ' STATUS = 0 '+
                           ' WHERE CLIENTE.ID = '+IntToStr(pIDCliente);
           Qry.ExecSQL;
         end;
       finally
         FreeAndNil(Qry);
       end;
    end
  ).Start;

  Qry := TFDQuery.Create(nil);
  pTemLimite := True;
  try
     Qry.Connection := uDAOFDConn.DAOFDConn.FDConnection;
     Qry.Close;
     Qry.SQL.Clear;
     Qry.SQL.Text := 'SELECT LIMITE FROM CLIENTE '+
                     ' WHERE CLIENTE.ID = '+IntToStr(pIDCliente);
     Qry.Open;
     if Qry.FieldByName('LIMITE').AsFloat <= 0 then
       pTemLimite := False;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
