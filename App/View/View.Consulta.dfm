object FrmConsulta: TFrmConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Consulta'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 15
  object PnlMenu: TPanel
    Left = 480
    Top = 0
    Width = 144
    Height = 441
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object BttnFiltrar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Filtrar'
      TabOrder = 0
    end
    object BttnTodos: TButton
      AlignWithMargins = True
      Left = 4
      Top = 52
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Todos'
      TabOrder = 1
    end
    object BttnIncluir: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Incluir'
      TabOrder = 2
    end
    object BttnAlterar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 148
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Alterar'
      TabOrder = 3
    end
    object BttnExcluir: TButton
      AlignWithMargins = True
      Left = 4
      Top = 196
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = BttnExcluirClick
    end
    object BttnConsultar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 244
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Caption = '&Consultar'
      TabOrder = 5
    end
    object BttnSair: TButton
      AlignWithMargins = True
      Left = 4
      Top = 393
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Caption = '&Sair'
      TabOrder = 6
      OnClick = BttnSairClick
    end
  end
  object PnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Caption = '<Sem dados para apresentar>'
    TabOrder = 1
    object DBGrdConsulta: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 474
      Height = 435
      Align = alClient
      DataSource = DtSrcConsulta
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
    end
  end
  object DtSrcConsulta: TDataSource
    OnDataChange = DtSrcConsultaDataChange
    Left = 496
    Top = 304
  end
end
