inherited FrmClientes: TFrmClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 360
  ClientWidth = 850
  OnCreate = nil
  ExplicitWidth = 866
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBotoes: TPanel
    Left = 714
    Height = 360
    ExplicitLeft = 714
    ExplicitHeight = 360
  end
  inherited PanelPrincipal: TPanel
    Width = 714
    Height = 360
    ExplicitWidth = 714
    ExplicitHeight = 360
    inherited PageControl1: TPageControl
      Left = 4
      Height = 345
      ActivePage = TabSheet2
      ExplicitLeft = 4
      ExplicitHeight = 345
      inherited TabSheet1: TTabSheet
        Caption = 'Lista'
        ExplicitHeight = 317
        inherited DBGridDados: TDBGrid
          Height = 270
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
          OnDblClick = DBGridDadosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'inscricao'
              Title.Caption = 'CPF/CNPJ'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'limite'
              Title.Caption = 'Limite'
              Width = 150
              Visible = True
            end>
        end
        inherited PnlCabecalho: TPanel
          ExplicitWidth = 701
          inherited EditPesqNome: TEdit
            CharCase = ecUpperCase
            OnChange = EditPesqNomeChange
            ExplicitWidth = 699
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Dados'
        ExplicitHeight = 317
        inherited BtnConfirma: TBitBtn
          Left = 17
          Top = 266
          TabOrder = 9
          ExplicitLeft = 17
          ExplicitTop = 266
        end
        object LabEdtNome: TLabeledEdit
          Left = 16
          Top = 31
          Width = 522
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          TabOrder = 0
        end
        object LabEdtCnpjCpf: TLabeledEdit
          Left = 544
          Top = 31
          Width = 121
          Height = 21
          EditLabel.Width = 43
          EditLabel.Height = 13
          EditLabel.Caption = 'Inscri'#231#227'o'
          TabOrder = 1
          OnExit = LabEdtCnpjCpfExit
        end
        object rdgTipoPessoa: TRadioGroup
          Left = 17
          Top = 58
          Width = 137
          Height = 49
          Caption = 'Tipo de Pessoa'
          Columns = 2
          Items.Strings = (
            'CPF'
            'CNPJ')
          TabOrder = 2
        end
        object LabEdtCEP: TLabeledEdit
          Left = 17
          Top = 131
          Width = 87
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'CEP'
          TabOrder = 3
          OnExit = LabEdtCEPExit
        end
        object LabEdtEndereco: TLabeledEdit
          Left = 110
          Top = 131
          Width = 571
          Height = 21
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Endere'#231'o'
          TabOrder = 4
        end
        object rdgStatus: TRadioGroup
          Left = 16
          Top = 213
          Width = 185
          Height = 47
          Caption = 'Status'
          Columns = 2
          Items.Strings = (
            'Bloqueado'
            'Liberado')
          TabOrder = 7
        end
        object LabEdtLimite: TLabeledEdit
          Left = 211
          Top = 239
          Width = 134
          Height = 21
          EditLabel.Width = 80
          EditLabel.Height = 13
          EditLabel.Caption = 'Limite de Cr'#233'dito'
          TabOrder = 8
          OnChange = LabEdtLimiteChange
          OnExit = LabEdtLimiteExit
        end
        object LabEdtNumero: TLabeledEdit
          Left = 17
          Top = 179
          Width = 66
          Height = 21
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'Numero'
          TabOrder = 5
        end
        object LabEdtComplemento: TLabeledEdit
          Left = 89
          Top = 179
          Width = 257
          Height = 21
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = 'Complemento'
          TabOrder = 6
        end
      end
    end
  end
  object ACBrCEP: TACBrCEP
    ProxyPort = '8080'
    ParseText = True
    WebService = wsViaCep
    PesquisarIBGE = True
    Left = 728
    Top = 288
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 778
    Top = 288
  end
end
