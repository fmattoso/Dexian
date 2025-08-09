inherited FrmConsultaConta: TFrmConsultaConta
  Caption = 'Cadastro de Conta - Consulta'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited PnlMenu: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited BttnFiltrar: TButton
      OnClick = BttnFiltrarClick
    end
    inherited BttnTodos: TButton
      OnClick = BttnTodosClick
    end
    inherited BttnIncluir: TButton
      OnClick = BttnIncluirClick
    end
    inherited BttnAlterar: TButton
      OnClick = BttnAlterarClick
    end
    inherited BttnConsultar: TButton
      OnClick = BttnConsultarClick
    end
  end
  inherited PnlConsulta: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object SplttrConsulta: TSplitter [0]
      Left = 0
      Top = 126
      Width = 480
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 120
      ExplicitWidth = 321
    end
    inherited DBGrdConsulta: TDBGrid
      Top = 132
      Height = 306
    end
    object DBGrdAgencia: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 474
      Height = 120
      Align = alTop
      DataSource = DtSrcAgencia
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object DtSrcAgencia: TDataSource
    OnDataChange = DtSrcAgenciaDataChange
    Left = 416
    Top = 64
  end
end
