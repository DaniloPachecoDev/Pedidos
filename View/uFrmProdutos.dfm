inherited FrmProdutos: TFrmProdutos
  Caption = 'Cadastro de Produtos'
  OnCreate = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    ExplicitLeft = 715
    ExplicitHeight = 459
  end
  inherited PanelPrincipal: TPanel
    ExplicitWidth = 715
    ExplicitHeight = 459
    inherited PageControl1: TPageControl
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        Caption = 'Lista'
        inherited DBGridDados: TDBGrid
          OnDblClick = DBGridDadosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'codigo'
              Title.Caption = 'Codigo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'codforn'
              Title.Caption = 'Codigo do Fornecedor'
              Visible = False
            end>
        end
        inherited PnlCabecalho: TPanel
          ExplicitWidth = 701
          inherited EditPesqNome: TEdit
            OnChange = EditPesqNomeChange
            ExplicitWidth = 699
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Dados'
        object lbFornecedor: TLabel [0]
          Left = 143
          Top = 69
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
        end
        inherited BtnConfirma: TBitBtn
          Left = 16
          Top = 128
          TabOrder = 4
          ExplicitLeft = 16
          ExplicitTop = 128
        end
        object LabeledEditCodigo: TLabeledEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo'
          TabOrder = 0
        end
        object LabeledEditDescricao: TLabeledEdit
          Left = 143
          Top = 32
          Width = 538
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descricao'
          TabOrder = 1
        end
        object LabeledEditValor: TLabeledEdit
          Left = 16
          Top = 86
          Width = 121
          Height = 21
          EditLabel.Width = 24
          EditLabel.Height = 13
          EditLabel.Caption = 'Valor'
          TabOrder = 2
        end
        object cbxFornecedor: TDBLookupComboBox
          Left = 143
          Top = 86
          Width = 538
          Height = 21
          KeyField = 'ID'
          ListField = 'RAZAO'
          ListSource = dsFornecedor
          TabOrder = 3
        end
      end
    end
  end
  inherited dsPadrao: TDataSource
    Left = 760
    Top = 264
  end
  object dsFornecedor: TDataSource
    DataSet = QryFornecedor
    Left = 476
    Top = 120
  end
  object QryFornecedor: TFDQuery
    SQL.Strings = (
      'SELECT ID, RAZAO FROM FORNECEDOR')
    Left = 404
    Top = 120
  end
end
