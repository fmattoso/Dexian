object DMRelatorio: TDMRelatorio
  Height = 480
  Width = 640
  object Report: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45878.612624039300000000
    ReportOptions.LastChange = 45878.687067303200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 24
    Datasets = <
      item
        DataSet = DtstAgencia
        DataSetName = 'DBAgencia'
      end
      item
        DataSet = DtstConta
        DataSetName = 'DBConta'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456709770000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756029640000000000
          Width = 332.598640730000000000
          Height = 22.677179770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Ag'#234'ncias e Contas')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 192.756033590000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date] [Time]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 241.889920730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 0.094619750000000000
          Top = 21.118118200000000000
          Width = 718.110692900000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897654070000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000003300000000000
          Top = 0.000002400000000000
          Width = 128.504013100000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#250'mero Conta')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 132.283557420000000000
          Top = 0.000002400000000000
          Width = 124.724490730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #218'ltimo Movimento')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787578150000000000
          Top = 0.000002400000000000
          Width = 98.267780730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = DtstAgencia
        DataSetName = 'DBAgencia'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 0.000010350000000000
          Top = 0.999997220000000000
          Width = 718.110670210000000000
          Height = 18.897659300000000000
          Fill.BackColor = clGainsboro
          Fill.ForeColor = clGainsboro
          Frame.Typ = []
          Frame.BottomLine.Color = clNone
        end
        object DBAgenciaNomeBanco: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NomeBanco'
          DataSet = DtstAgencia
          DataSetName = 'DBAgencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DBAgencia."NomeBanco"]')
          ParentFont = False
        end
        object DBAgenciaAgencia: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 2.000000000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = DtstAgencia
          DataSetName = 'DBAgencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag'#234'ncia: [DBAgencia."Agencia"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = DtstConta
        DataSetName = 'DBConta'
        RowCount = 0
        object DBContaNumeroConta: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NumeroConta'
          DataSet = DtstConta
          DataSetName = 'DBConta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DBConta."NumeroConta"]')
          ParentFont = False
        end
        object DBContaDataUltimoMovimento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'DataUltimoMovimento'
          DataSet = DtstConta
          DataSetName = 'DBConta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DBConta."DataUltimoMovimento"]')
          ParentFont = False
        end
        object DBContaSaldo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Saldo'
          DataSet = DtstConta
          DataSetName = 'DBConta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBConta."Saldo"]')
          ParentFont = False
        end
        object DBContaObservacoes: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 362.834880000000000000
          Width = 355.275820000000000000
          Height = 15.118120000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'Observacoes'
          DataSet = DtstConta
          DataSetName = 'DBConta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DBConta."Observacoes"]')
          ParentFont = False
        end
      end
    end
  end
  object DtstAgencia: TfrxDBDataset
    UserName = 'DBAgencia'
    CloseDataSource = False
    DataSet = QryAgencia
    BCDToCurrency = False
    DataSetOptions = []
    Left = 224
    Top = 24
  end
  object QryAgencia: TFDQuery
    Connection = DM.Cnn
    SQL.Strings = (
      'SELECT AgenciaId,'
      '    NomeBanco,'
      '    Agencia,'
      '    DataCriacao,'
      '    DataAtualizacao'
      '  FROM Agencia'
      'ORDER BY NomeBanco, Agencia')
    Left = 32
    Top = 24
    object QryAgenciaAgenciaId: TFDAutoIncField
      FieldName = 'AgenciaId'
      Origin = 'AgenciaId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryAgenciaNomeBanco: TStringField
      FieldName = 'NomeBanco'
      Origin = 'NomeBanco'
      Required = True
      Size = 100
    end
    object QryAgenciaAgencia: TStringField
      FieldName = 'Agencia'
      Origin = 'Agencia'
      Required = True
      Size = 100
    end
    object QryAgenciaDataCriacao: TSQLTimeStampField
      FieldName = 'DataCriacao'
      Origin = 'DataCriacao'
    end
    object QryAgenciaDataAtualizacao: TSQLTimeStampField
      FieldName = 'DataAtualizacao'
      Origin = 'DataAtualizacao'
    end
  end
  object DtSrcAgencia: TDataSource
    DataSet = QryAgencia
    Left = 136
    Top = 24
  end
  object QryConta: TFDQuery
    MasterSource = DtSrcAgencia
    MasterFields = 'AgenciaId'
    DetailFields = 'AgenciaId'
    Connection = DM.Cnn
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT ContaId,'
      'AgenciaId,'
      'NumeroConta,'
      'DataUltimoMovimento,'
      'Saldo,'
      'Observacoes,'
      'DataCriacao,'
      'DataAtualizacao'
      'FROM Conta'
      'WHERE AgenciaId = :AgenciaId'
      'ORDER BY NumeroConta')
    Left = 32
    Top = 96
    ParamData = <
      item
        Name = 'AGENCIAID'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 8
      end>
    object QryContaContaId: TFDAutoIncField
      FieldName = 'ContaId'
      Origin = 'ContaId'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryContaAgenciaId: TIntegerField
      FieldName = 'AgenciaId'
      Origin = 'AgenciaId'
      Required = True
    end
    object QryContaNumeroConta: TStringField
      FieldName = 'NumeroConta'
      Origin = 'NumeroConta'
      Size = 40
    end
    object QryContaDataUltimoMovimento: TSQLTimeStampField
      FieldName = 'DataUltimoMovimento'
      Origin = 'DataUltimoMovimento'
    end
    object QryContaSaldo: TCurrencyField
      FieldName = 'Saldo'
      Origin = 'Saldo'
    end
    object QryContaObservacoes: TStringField
      FieldName = 'Observacoes'
      Origin = 'Observacoes'
      Size = 800
    end
    object QryContaDataCriacao: TSQLTimeStampField
      FieldName = 'DataCriacao'
      Origin = 'DataCriacao'
    end
    object QryContaDataAtualizacao: TSQLTimeStampField
      FieldName = 'DataAtualizacao'
      Origin = 'DataAtualizacao'
    end
  end
  object DtstConta: TfrxDBDataset
    UserName = 'DBConta'
    CloseDataSource = False
    DataSet = QryConta
    BCDToCurrency = True
    DataSetOptions = []
    Left = 232
    Top = 104
  end
end
