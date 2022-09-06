object FrmRelPedidos: TFrmRelPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Pedidos'
  ClientHeight = 322
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridPedidos: TDBGrid
    Left = 8
    Top = 9
    Width = 737
    Height = 273
    DataSource = dsPedidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnImprimir: TBitBtn
    Left = 565
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF707070000000000000000000000000000000000000707070FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFFFF
      FFFFFFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFF8080800000000000
      00000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF808080808080FFFFFFFF
      FFFFFFFFFFFFFFFF808080808080FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
      000000FFFFFF707070000000000000000000000000000000000000707070FFFF
      FF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
      000000A8A8A8868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFFFFFFFF0000007373738585857777776F6F6F6F
      6F6F6F6F6F6F6F6F777777797979666666000000FFFFFFFFFFFFFFFFFFFFFFFF
      F2F2F27373732727272828287777776F6F6F6F6F6F7777772828282727277373
      73F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878787878FFFFFFFF
      FFFFFFFFFFFFFFFF787878787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF707070808080FFFFFFFFFFFFFFFFFFFFFFFF808080707070FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70707000000000000000
      0000000000000000000000707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnImprimeTodos: TBitBtn
    Left = 646
    Top = 288
    Width = 99
    Height = 25
    Caption = 'Imprime Todos'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0AAAAAAA9A9A9A4A4A49E9E
      9E939393ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5AD
      ADAD787878D5D5D5E8E8E8E1E1E1D3D3D3989898828282CECECEFFFFFFFFFFFF
      FFFFFFFFFFFFE8E8E8C2C2C2B3B3B3A7A7A78F8F8F7676767777777777777777
      77747474B0B0B0A8A8A8FFFFFFFFFFFFFFFFFFD8D8D8B3B3B3B2B2B2B4B4B4BD
      BDBDE5E5E5E8E8E8E9E9E9E9E9E9E9E9E9E7E7E7E4E4E4B3B3B3FFFFFFFFFFFF
      E3E3E3B3B3B3B3B3B3CDCDCDF3F3F3CDCFCDCBE9CBFCFCFCFCFCFCFCFCFCFCFC
      FCFCFCFCF7F7F7DADADAFFFFFFFDFDFDBBBBBBB2B2B2D1D1D1FFFFFFFFFFFFFE
      FEFEE3E3E3D8D8D8D4D4D4CACACABFBFBFB4B4B4E9E9E9FFFFFFFFFFFFECECEC
      B3B3B3B6B6B6F9F9F9FFFFFFFFFFFFFFFFFFFEFEFED2D2D2F1F1F1E2E2E2D3D3
      D3989898FDFDFDFFFFFFFFFFFFCFCFCF8A8A8A909090A7A7A7A7A7A7A5A5A5F8
      F8F8FFFFFFD0D0D0FDFDFDF1F1F1E2E2E2939393FAFAFAFFFFFFD5D5D5929292
      F5F5F5FBFBFBF0F0F0E1E1E1B5B5B5919191E9E9E9D1D1D1E5E5E5D2D2D2AFAF
      AF9D9D9DFAFAFAFFFFFFAAAAAA6161616565657272727171716E6E6E4D4D4D99
      9999AEAEAEFFFFFFFFFFFFE6E6E6B3B3B3BCBCBCFEFEFEFFFFFFBBBBBBDADADA
      DDDDDDDEDEDEDEDEDEDDDDDDDCDCDCD9D9D9ADADADFFFFFFF9F9F9BCBCBCB2B2
      B2D4D4D4FFFFFFFFFFFFD7DAD7CCE8CCF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F8
      F8F8BCBCBCECECECBFBFBFB2B2B2B9B9B9F8F8F8FFFFFFFFFFFFF2F3F2DFE2DF
      FFFFFFFDFDFDF6F6F6EDEDEDD9D9D99D9D9DB4B4B4B3B3B3B2B2B2B8B8B8EDED
      EDFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC3C3C3D1D1D1C5C5C5B7B7B78A8A8AB3
      B3B3B3B3B3B6B6B6CBCBCBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      D2D2D2FAFAFAECECECDDDDDDBBBBBBEAEAEAECECECF8F8F8FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECEF0F0F0EBEBEBDEDEDED0D0D0FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 2
    OnClick = btnImprimeTodosClick
  end
  object btnFechar: TBitBtn
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      656565BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBF
      BF656565FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF161616BFBFBFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFBFBFBF151515BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBD
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFF
      FFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDC3C3C3161616BDBDBDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF16
      1616161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFBFBFBF161616161616BFBFBFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BD
      BDBDC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFC3C3C3161616BDBDBDFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3171717BDBDBDFFFFFFFF
      FFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C0C0C0161616C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF1616
      16BFBFBFFFFFFFFFFFFFFFFFFFFFFFFF656565C0C0C0FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF656565FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM PEDIDO'
    Params = <>
    ProviderName = 'dspPedidos'
    AfterScroll = cdsPedidosAfterScroll
    Left = 216
    Top = 176
    object cdsPedidosID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object cdsPedidosNUM_Pedido: TIntegerField
      DisplayLabel = 'Num. Pedido'
      FieldName = 'NUM_Pedido'
    end
    object cdsPedidosData_Emissao: TDateTimeField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'Data_Emissao'
      Visible = False
    end
    object cdsPedidosCod_Cliente: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'Cod_Cliente'
    end
    object cdsPedidosNOME: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME'
      Size = 30
    end
    object cdsPedidosTOT_Pedido: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'TOT_Pedido'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedidos
    Left = 216
    Top = 224
  end
  object dspPedidos: TDataSetProvider
    DataSet = DAOFDConn.FDQuery
    Options = [poAllowMultiRecordUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 192
  end
  object cdsPedSelecionado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidos'
    AfterScroll = cdsPedSelecionadoAfterScroll
    Left = 48
    Top = 168
    object cdsPedSelecionadoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPedSelecionadoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedSelecionadoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object cdsPedSelecionadoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsPedSelecionadoNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsPedSelecionadoTOT_PEDIDO: TFMTBCDField
      FieldName = 'TOT_PEDIDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsPedSel: TDataSource
    DataSet = cdsPedSelecionado
    Left = 48
    Top = 216
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.DropBoxSettings.DirectorySupport = True
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.GoogleDriveSettings.DirectorySupport = False
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.OneDriveSettings.DirectorySupport = True
    Left = 404
    Top = 125
    Version = '21.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Border.mmPadding = 0
        Caption = 'Empresa: MODELO S/A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1849
        mmTop = 1851
        mmWidth = 45244
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        Border.mmPadding = 0
        Caption = 'Relat'#243'rio de Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1849
        mmTop = 7408
        mmWidth = 39158
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        Border.mmPadding = 0
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 166942
        mmTop = 7408
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 192887
        mmTop = 7406
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data de Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 16139
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Border.mmPadding = 0
        Caption = 'Pedido N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 39678
        mmTop = 16140
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cod. Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 60590
        mmTop = 16140
        mmWidth = 20902
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Total (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 167026
        mmTop = 16140
        mmWidth = 28310
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 84138
        mmTop = 16140
        mmWidth = 23019
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer1
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 11906
        mmLeft = 0
        mmTop = 7404
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipeline2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Version = '21.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline2'
          object ppTitleBand1: TppTitleBand
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppLabel1: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label1'
              AutoSize = False
              Border.mmPadding = 0
              Caption = 'Cod. Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 4763
              mmLeft = 3440
              mmTop = 2646
              mmWidth = 22225
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel5: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label5'
              AutoSize = False
              Border.mmPadding = 0
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 4763
              mmLeft = 27247
              mmTop = 2646
              mmWidth = 20902
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel2: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label2'
              AutoSize = False
              Border.mmPadding = 0
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 4763
              mmLeft = 97896
              mmTop = 2646
              mmWidth = 20108
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel3: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label3'
              AutoSize = False
              Border.mmPadding = 0
              Caption = 'Valor Unit'#225'rio (R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4763
              mmLeft = 127277
              mmTop = 2646
              mmWidth = 32279
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel4: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label4'
              AutoSize = False
              Border.mmPadding = 0
              Caption = 'Valor Total (R$)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4763
              mmLeft = 162476
              mmTop = 2646
              mmWidth = 32830
              BandType = 1
              LayerName = Foreground1
            end
          end
          object ppDetailBand2: TppDetailBand
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText1'
              Border.mmPadding = 0
              DataField = 'COD_PRODUTO'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4763
              mmLeft = 3440
              mmTop = 1588
              mmWidth = 22218
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText2: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText2'
              Border.mmPadding = 0
              DataField = 'QTD'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4763
              mmLeft = 97896
              mmTop = 1588
              mmWidth = 20108
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText3: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText3'
              Border.mmPadding = 0
              DataField = 'VR_UNIT'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4763
              mmLeft = 127277
              mmTop = 1588
              mmWidth = 32292
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText4: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText4'
              Border.mmPadding = 0
              DataField = 'TOT_ITEM'
              DataPipeline = ppDBPipeline2
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4763
              mmLeft = 162477
              mmTop = 1588
              mmWidth = 32808
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText10: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText10'
              Border.mmPadding = 0
              DataField = 'DESCRICAO'
              DataPipeline = ppDBPipeline2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPipeline2'
              mmHeight = 4763
              mmLeft = 27247
              mmTop = 1588
              mmWidth = 69061
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppSummaryBand1: TppSummaryBand
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 529
            mmPrintPosition = 0
          end
          object ppDesignLayers2: TppDesignLayers
            object ppDesignLayer2: TppDesignLayer
              UserName = 'Foreground1'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'DATA_EMISSAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'COD_CLIENTE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 60590
        mmTop = 1588
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        Border.mmPadding = 0
        DataField = 'TOT_PEDIDO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 166952
        mmTop = 1588
        mmWidth = 28310
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'NUM_PEDIDO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 39678
        mmTop = 1588
        mmWidth = 16669
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1853
        mmLeft = 0
        mmTop = 0
        mmWidth = 196321
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        Border.mmPadding = 0
        DataField = 'NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 84615
        mmTop = 1588
        mmWidth = 80698
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'TOT_PEDIDO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4498
        mmLeft = 178859
        mmTop = 794
        mmWidth = 17198
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Border.mmPadding = 0
        Caption = 'Valor total dos pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5027
        mmLeft = 129907
        mmTop = 794
        mmWidth = 46566
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsImpItens
    AutoCreateFields = False
    UserName = 'DBPipeline2'
    Left = 412
    Top = 229
    MasterDataPipelineName = 'ppDBPipeline1'
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 10
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'ID_PEDIDO'
      FieldName = 'ID_PEDIDO'
      FieldLength = 10
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'COD_PRODUTO'
      FieldName = 'COD_PRODUTO'
      FieldLength = 10
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'QTD'
      FieldName = 'QTD'
      FieldLength = 10
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'VR_UNIT'
      FieldName = 'VR_UNIT'
      FieldLength = 10
      DataType = dtExtended
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'TOT_ITEM'
      FieldName = 'TOT_ITEM'
      FieldLength = 10
      DataType = dtExtended
      DisplayWidth = 10
      Position = 6
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsPedSel
    AutoCreateFields = False
    UserName = 'DBPipeline1'
    Left = 408
    Top = 173
    object ID: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object NUM_PEDIDO: TppField
      FieldAlias = 'NUM_PEDIDO'
      FieldName = 'NUM_PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object DATA_EMISSAO: TppField
      FieldAlias = 'DATA_EMISSAO'
      FieldName = 'DATA_EMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object COD_CLIENTE: TppField
      FieldAlias = 'COD_CLIENTE'
      FieldName = 'COD_CLIENTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object NOME: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object TOT_PEDIDO: TppField
      FieldAlias = 'TOT_PEDIDO'
      FieldName = 'TOT_PEDIDO'
      FieldLength = 10
      DataType = dtExtended
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsImpItens: TDataSource
    DataSet = cdsImpItens
    Left = 296
    Top = 229
  end
  object cdsImpItens: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM ITEMPED'
    Params = <>
    ProviderName = 'dspPedidos'
    Left = 296
    Top = 181
    object cdsImpItensID: TIntegerField
      FieldName = 'ID'
    end
    object cdsImpItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsImpItensCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object cdsImpItensDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsImpItensQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsImpItensVR_UNIT: TFMTBCDField
      FieldName = 'VR_UNIT'
    end
    object cdsImpItensTOT_ITEM: TFMTBCDField
      FieldName = 'TOT_ITEM'
    end
  end
end
