unit uPedidosModel;

interface

uses
  System.SysUtils;

type
  TPedido = class
    private
      FID: Integer;
      FNum_Pedido: String;
      FData_Emissao: TDatetime;
      FCod_Cliente: Integer;
      FTot_Pedido: Double;
    public
      property ID: Integer read FID write FID;
      property Num_Pedido: String read FNum_Pedido write FNum_Pedido;
      property Data_Emissao: TDatetime read FData_Emissao write FData_Emissao;
      property Cod_Cliente: Integer read FCod_Cliente write FCod_Cliente;
      property Tot_Pedido: Double read FTot_Pedido write FTot_Pedido;

end;

type
  TItemPedido = class
    private
      FID: Integer;
      FID_Pedido: Integer;
      FCod_Produto: Integer;
      FQTD: Integer;
      FVR_Unit: Double;
      FTOT_Item: Double;
    public
      property ID: Integer read FID write FID;
      property ID_Pedido: Integer read FID_Pedido write FID_Pedido;
      property Cod_Produto: Integer read FCod_Produto write FCod_Produto;
      property QTD: Integer read FQTD write FQTD;
      property VR_Unit: Double read FVR_Unit write FVR_Unit;
      property TOT_Item: Double read FTOT_Item write FTOT_Item;

end;

type
  TPagamentoPedido = class
    private
      FID: Integer;
      FID_Pedido: Integer;
      FForma_Pag: Integer;
      FDat_Vencimento: TDatetime;
      FVal_Parcela: Double;
    public
      property ID: Integer read FID write FID;
      property ID_Pedido: Integer read FID_Pedido write FID_Pedido;
      property Forma_Pag: Integer read FForma_Pag write FForma_Pag;
      property Dat_Vencimento: TDatetime read FDat_Vencimento write FDat_Vencimento;
      property Val_Parcela: Double read FVal_Parcela write FVal_Parcela;
end;

implementation


end.
