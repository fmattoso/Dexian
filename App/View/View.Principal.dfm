object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Dexian - Principal'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object TlBrPrincipal: TToolBar
    Left = 0
    Top = 0
    Width = 624
    Height = 23
    AutoSize = True
    ButtonHeight = 23
    ButtonWidth = 121
    Caption = 'TlBrPrincipal'
    ShowCaptions = True
    TabOrder = 0
    object TlBttnCadastroAgencias: TToolButton
      Left = 0
      Top = 0
      Action = ActnAgencia
    end
    object TlBttnCadastroContas: TToolButton
      Left = 121
      Top = 0
      Action = ActnConta
    end
    object TlBttnRelatorio: TToolButton
      Left = 242
      Top = 0
      Action = ActnRelatorio
    end
  end
  object ActnLst: TActionList
    Left = 560
    Top = 56
    object ActnAgencia: TAction
      Category = 'Arquivo'
      Caption = 'Cadastro de Ag'#234'ncias'
      OnExecute = ActnAgenciaExecute
    end
    object ActnConta: TAction
      Category = 'Arquivo'
      Caption = 'Cadastro de Contas'
      OnExecute = ActnContaExecute
    end
    object ActnRelatorio: TAction
      Category = 'Arquivo'
      Caption = 'Relat'#243'rio'
      OnExecute = ActnRelatorioExecute
    end
  end
end
