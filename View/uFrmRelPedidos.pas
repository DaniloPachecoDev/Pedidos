unit uFrmRelPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, ppDB, ppDBPipe, ppParameter, ppCtrls, ppBands,
  ppDesignLayer, ppReport, ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, Datasnap.Provider, Datasnap.DBClient;

type
  TFrmRelPedidos = class(TForm)
    DBGridPedidos: TDBGrid;
    btnImprimir: TBitBtn;
    cdsPedidos: TClientDataSet;
    dsPedidos: TDataSource;
    dspPedidos: TDataSetProvider;
    cdsPedSelecionado: TClientDataSet;
    dsPedSel: TDataSource;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline1: TppDBPipeline;
    dsImpItens: TDataSource;
    cdsImpItens: TClientDataSet;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    btnImprimeTodos: TBitBtn;
    cdsPedidosID: TIntegerField;
    cdsPedidosNUM_Pedido: TIntegerField;
    cdsPedidosCod_Cliente: TIntegerField;
    cdsPedidosNOME: TStringField;
    btnFechar: TBitBtn;
    cdsPedidosData_Emissao: TDateTimeField;
    cdsPedidosTOT_Pedido: TFMTBCDField;
    NUM_PEDIDO: TppField;
    DATA_EMISSAO: TppField;
    COD_CLIENTE: TppField;
    NOME: TppField;
    TOT_PEDIDO: TppField;
    ID: TppField;
    cdsPedSelecionadoID: TIntegerField;
    cdsPedSelecionadoCOD_CLIENTE: TIntegerField;
    cdsPedSelecionadoNOME: TStringField;
    cdsPedSelecionadoDATA_EMISSAO: TDateField;
    cdsPedSelecionadoTOT_PEDIDO: TFMTBCDField;
    cdsPedSelecionadoNUM_PEDIDO: TIntegerField;
    cdsImpItensID: TIntegerField;
    cdsImpItensID_PEDIDO: TIntegerField;
    cdsImpItensCOD_PRODUTO: TIntegerField;
    cdsImpItensQTD: TIntegerField;
    cdsImpItensVR_UNIT: TFMTBCDField;
    cdsImpItensTOT_ITEM: TFMTBCDField;
    ppDBPipeline2ppField1: TppField;
    ppDBPipeline2ppField2: TppField;
    ppDBPipeline2ppField3: TppField;
    ppDBPipeline2ppField4: TppField;
    ppDBPipeline2ppField5: TppField;
    ppDBPipeline2ppField6: TppField;
    ppDBPipeline2ppField7: TppField;
    cdsImpItensDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimeTodosClick(Sender: TObject);
    procedure cdsPedidosAfterScroll(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure cdsPedSelecionadoAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    pIDPedido: Integer;
    pMovimento: Boolean;
  end;

var
  FrmRelPedidos: TFrmRelPedidos;

implementation

{$R *.dfm}

procedure TFrmRelPedidos.FormShow(Sender: TObject);
begin
  cdsPedidos.Close;
  cdsPedidos.CommandText := 'SELECT P.ID, P.NUM_Pedido, P.Data_Emissao, '+
                            '       P.COD_Cliente, P.TOT_Pedido, C.NOME '+
                            'FROM PEDIDO P                              '+
                            'INNER JOIN CLIENTE C ON C.ID = P.COD_Cliente ';
  cdsPedidos.Open;
  cdsPedSelecionado.CreateDataSet;
end;

procedure TFrmRelPedidos.cdsPedidosAfterScroll(DataSet: TDataSet);
begin
  cdsImpItens.Close;
  cdsImpItens.CommandText := 'SELECT I.ID, I.ID_PEDIDO, I.COD_PRODUTO,     '+
                             '       I.QTD, I.VR_UNIT, I.TOT_ITEM, P.DESCRICAO  '+
                             'FROM ITEMPED I                                    '+
                             'INNER JOIN PRODUTO P ON P.ID = I.COD_PRODUTO '+
                             'WHERE ID_PEDIDO = :pIDPedido ';
  cdsImpItens.Params.ParamByName('pIDPedido').AsInteger := cdsPedidos.FieldByName('ID').AsInteger;
  cdsImpItens.Open;
end;

procedure TFrmRelPedidos.cdsPedSelecionadoAfterScroll(DataSet: TDataSet);
begin
  cdsImpItens.Close;
  cdsImpItens.CommandText := 'SELECT I.ID, I.ID_PEDIDO, I.COD_PRODUTO,     '+
                             '       I.QTD, I.VR_UNIT, I.TOT_ITEM, P.DESCRICAO  '+
                             'FROM ITEMPED I                                    '+
                             'INNER JOIN PRODUTO P ON P.ID = I.COD_PRODUTO '+
                             'WHERE ID_PEDIDO = :pIDPedido ';
  cdsImpItens.Params.ParamByName('pIDPedido').AsInteger := cdsPedSelecionado.FieldByName('ID').AsInteger;
  cdsImpItens.Open;
end;

procedure TFrmRelPedidos.btnImprimeTodosClick(Sender: TObject);
begin
  cdsPedSelecionado.Close;
  cdsPedSelecionado.CommandText := 'SELECT P.ID, P.NUM_Pedido, P.Data_Emissao, '+
                                   '       P.COD_Cliente, P.TOT_Pedido, C.NOME '+
                                   'FROM PEDIDO P                              '+
                                   'INNER JOIN CLIENTE C ON C.ID = P.COD_Cliente ';
  cdsPedSelecionado.Open;
  ppReport1.Print;
end;

procedure TFrmRelPedidos.btnImprimirClick(Sender: TObject);
begin
  cdsPedSelecionado.Close;
  cdsPedSelecionado.CommandText := 'SELECT P.ID, P.NUM_Pedido, P.Data_Emissao, '+
                                   '       P.COD_Cliente, P.TOT_Pedido, C.NOME '+
                                   'FROM PEDIDO P                              '+
                                   'INNER JOIN CLIENTE C ON C.ID = P.COD_Cliente '+
                                   'WHERE P.ID = :pIDPedido ';
  if pMovimento then
    cdsPedSelecionado.Params.ParamByName('pIDPedido').AsInteger := pIDPedido
  else
    cdsPedSelecionado.Params.ParamByName('pIDPedido').AsInteger := cdsPedidos.FieldByName('ID').AsInteger;

  cdsPedSelecionado.Open;

  ppReport1.Print;
end;

procedure TFrmRelPedidos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TFrmRelPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
