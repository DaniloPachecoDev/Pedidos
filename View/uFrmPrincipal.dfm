object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 96
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Fornecedor1: TMenuItem
        Caption = 'Fornecedores'
        OnClick = Fornecedor1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Movimento1: TMenuItem
      Caption = 'Movimento'
      object PedidodeVenda1: TMenuItem
        Caption = 'Pedido de Venda'
        OnClick = PedidodeVenda1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object RelatriodeVenda1: TMenuItem
        Caption = 'Relat'#243'rio de Venda'
        OnClick = RelatriodeVenda1Click
      end
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 80
    Top = 136
  end
  object FDTableAdapter1: TFDTableAdapter
    Left = 80
    Top = 72
  end
end
