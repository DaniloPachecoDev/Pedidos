inherited FrmFornecedores: TFrmFornecedores
  Caption = 'Cadastro de Fornecedores'
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
              FieldName = 'razao'
              Title.Caption = 'Raz'#227'o Social'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inscricao'
              Title.Caption = 'CNPJ'
              Width = 100
              Visible = True
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
        inherited BtnConfirma: TBitBtn
          Left = 16
          Top = 72
          TabOrder = 2
          ExplicitLeft = 16
          ExplicitTop = 72
        end
        object LabEdtRazaoSocial: TLabeledEdit
          Left = 16
          Top = 32
          Width = 547
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = 'Raz'#227'o Social'
          TabOrder = 0
        end
        object LabEdtCnpjCpf: TLabeledEdit
          Left = 569
          Top = 32
          Width = 121
          Height = 21
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Inscri'#231#227'o'
          TabOrder = 1
          OnExit = LabEdtCnpjCpfExit
        end
      end
    end
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 778
    Top = 288
  end
end
