inherited FrmManutencaoConta: TFrmManutencaoConta
  Caption = 'Manuten'#231#227'o de Conta'
  ClientHeight = 269
  ClientWidth = 485
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 501
  ExplicitHeight = 308
  TextHeight = 15
  object LblNumeroConta: TLabel [0]
    Left = 8
    Top = 13
    Width = 87
    Height = 15
    Caption = '*N'#250'mero &Conta:'
    FocusControl = EdtNumeroConta
  end
  object LblDtUltimoMovimento: TLabel [1]
    Left = 8
    Top = 63
    Width = 104
    Height = 15
    Caption = #218'ltimo &Movimento:'
    FocusControl = DtTmPckrDtUltimoMovimento
  end
  object LblSaldo: TLabel [2]
    Left = 200
    Top = 63
    Width = 32
    Height = 15
    Caption = '&Saldo:'
    FocusControl = NmbrBxSaldo
  end
  object LblObservacoes: TLabel [3]
    Left = 8
    Top = 113
    Width = 70
    Height = 15
    Caption = '&Observa'#231#245'es:'
    FocusControl = MmObservacoes
  end
  object LblDataCriacao: TLabel [4]
    Left = 8
    Top = 213
    Width = 70
    Height = 15
    Margins.Top = 8
    Caption = 'Data Cria'#231#227'o:'
    FocusControl = EdtDataCriacao
  end
  object LblDataAtualizacao: TLabel [5]
    Left = 167
    Top = 213
    Width = 91
    Height = 15
    Margins.Top = 8
    Caption = 'Data Atualiza'#231#227'o:'
    FocusControl = EdtDataAtualizacao
  end
  inherited PnlMenu: TPanel
    Left = 341
    Height = 269
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 341
    ExplicitHeight = 269
    inherited BttnRestaurar: TButton
      OnClick = BttnRestaurarClick
    end
    inherited BttnSalvar: TButton
      Top = 173
      OnClick = BttnSalvarClick
      ExplicitTop = 173
    end
    inherited BttnSair: TButton
      Top = 221
      ExplicitTop = 221
    end
    inherited DBNvManutencao: TDBNavigator
      Hints.Strings = ()
      OnClick = DBNvManutencaoClick
    end
  end
  object EdtNumeroConta: TEdit
    Left = 8
    Top = 34
    Width = 209
    Height = 23
    MaxLength = 40
    TabOrder = 1
    Text = 'EdtNumeroConta'
  end
  object DtTmPckrDtUltimoMovimento: TDateTimePicker
    Left = 8
    Top = 84
    Width = 186
    Height = 23
    Date = 45878.000000000000000000
    Time = 0.443155462962749900
    Kind = dtkDateTime
    TabOrder = 2
  end
  object NmbrBxSaldo: TNumberBox
    Left = 200
    Top = 84
    Width = 120
    Height = 23
    Mode = nbmCurrency
    TabOrder = 3
  end
  object MmObservacoes: TMemo
    Left = 8
    Top = 134
    Width = 312
    Height = 68
    Lines.Strings = (
      'MmObservacoes')
    MaxLength = 800
    TabOrder = 4
  end
  object EdtDataCriacao: TEdit
    Left = 8
    Top = 234
    Width = 153
    Height = 23
    Enabled = False
    TabOrder = 5
    Text = 'EdtDataCriacao'
  end
  object EdtDataAtualizacao: TEdit
    Left = 167
    Top = 234
    Width = 153
    Height = 23
    Enabled = False
    TabOrder = 6
    Text = 'EdtDataAtualizacao'
  end
end
