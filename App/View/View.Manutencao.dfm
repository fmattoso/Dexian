object FrmManutencao: TFrmManutencao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o'
  ClientHeight = 232
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object PnlMenu: TPanel
    Left = 480
    Top = 0
    Width = 144
    Height = 232
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object BttnRestaurar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      Cancel = True
      Caption = '&Restaurar'
      TabOrder = 0
    end
    object BttnSalvar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 136
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alBottom
      Caption = '&OK'
      Default = True
      TabOrder = 1
    end
    object BttnSair: TButton
      AlignWithMargins = True
      Left = 4
      Top = 184
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BttnSairClick
    end
    object DBNvManutencao: TDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 138
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      TabOrder = 3
    end
  end
end
