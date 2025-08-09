inherited FrmManutencaoFiltroConta: TFrmManutencaoFiltroConta
  Caption = 'Filtrar Conta'
  ClientHeight = 234
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitHeight = 273
  TextHeight = 15
  object LblAte1: TLabel [0]
    Left = 311
    Top = 53
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  object LblAte2: TLabel [1]
    Left = 311
    Top = 82
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  object LblInt1: TLabel [2]
    Left = 311
    Top = 171
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  object Label4: TLabel [3]
    Left = 311
    Top = 199
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  inherited PnlMenu: TPanel
    Height = 234
    StyleElements = [seFont, seClient, seBorder]
    inherited BttnSalvar: TButton
      Top = 138
      OnClick = BttnSalvarClick
    end
    inherited BttnSair: TButton
      Top = 186
    end
    inherited DBNvManutencao: TDBNavigator
      Hints.Strings = ()
    end
  end
  object EdtNumeroConta: TEdit
    Left = 184
    Top = 21
    Width = 270
    Height = 23
    Margins.Top = 16
    TabOrder = 1
    Text = 'EdtNumeroConta'
  end
  object DtTmPckrDtUltimoMovimentoI: TDateTimePicker
    Left = 184
    Top = 50
    Width = 121
    Height = 23
    Date = 45878.000000000000000000
    Time = 0.443155462962749900
    Kind = dtkDateTime
    TabOrder = 2
  end
  object DtTmPckrDtUltimoMovimentoF: TDateTimePicker
    Left = 333
    Top = 50
    Width = 121
    Height = 23
    Date = 45878.000000000000000000
    Time = 0.443155462962749900
    Kind = dtkDateTime
    TabOrder = 3
  end
  object NmbrBxSaldoI: TNumberBox
    Left = 185
    Top = 79
    Width = 120
    Height = 23
    Mode = nbmCurrency
    TabOrder = 4
  end
  object NmbrBxSaldoF: TNumberBox
    Left = 333
    Top = 79
    Width = 120
    Height = 23
    Mode = nbmCurrency
    TabOrder = 5
  end
  object MmObservacoes: TMemo
    Left = 184
    Top = 108
    Width = 270
    Height = 53
    Lines.Strings = (
      'MmObservacoes')
    TabOrder = 6
  end
  object ChckBxNumeroConta: TCheckBox
    Left = 8
    Top = 24
    Width = 170
    Height = 17
    Caption = 'N'#250'mero da &Conta: (cont'#233'm)'
    TabOrder = 7
  end
  object ChckBxDtUltimoMovimento: TCheckBox
    Left = 8
    Top = 53
    Width = 170
    Height = 17
    Caption = #218'ltimo &Movimento: Entre'
    TabOrder = 8
  end
  object ChckBxSaldo: TCheckBox
    Left = 8
    Top = 82
    Width = 170
    Height = 17
    Caption = '&Saldo: Entre'
    TabOrder = 9
  end
  object ChckBxObservacoes: TCheckBox
    Left = 8
    Top = 111
    Width = 170
    Height = 17
    Caption = '&Observa'#231#245'es: (cont'#233'm)'
    TabOrder = 10
  end
  object ChckBxDataCriacao: TCheckBox
    Left = 8
    Top = 171
    Width = 170
    Height = 17
    Caption = 'Data Cria'#231#227'o: Entre'
    TabOrder = 11
  end
  object DtTmDtCriacaoI: TDateTimePicker
    Left = 184
    Top = 167
    Width = 121
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749289502316969400
    TabOrder = 12
  end
  object DtTmDtAtualizaI: TDateTimePicker
    Left = 184
    Top = 196
    Width = 121
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749500370373425500
    TabOrder = 13
  end
  object DtTmDtCriacaoF: TDateTimePicker
    Left = 333
    Top = 167
    Width = 120
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749905277778452700
    TabOrder = 14
  end
  object DtTmDtAtualizaF: TDateTimePicker
    Left = 333
    Top = 196
    Width = 120
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749916851855232400
    TabOrder = 15
  end
  object ChckBxDataAtualizacao: TCheckBox
    Left = 8
    Top = 199
    Width = 170
    Height = 17
    Caption = 'Data Atualiza'#231#227'o: Entre'
    TabOrder = 16
  end
end
