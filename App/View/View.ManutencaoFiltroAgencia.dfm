inherited FrmManutencaoFiltroAgencia: TFrmManutencaoFiltroAgencia
  Caption = 'Filtrar Agenda'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LblInt1: TLabel [0]
    Left = 300
    Top = 83
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  object Label4: TLabel [1]
    Left = 300
    Top = 111
    Width = 16
    Height = 15
    Caption = 'at'#233
  end
  inherited PnlMenu: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited BttnSalvar: TButton
      OnClick = BttnSalvarClick
    end
    inherited DBNvManutencao: TDBNavigator
      Hints.Strings = ()
    end
  end
  object EdtNomeBanco: TEdit
    Left = 184
    Top = 21
    Width = 248
    Height = 23
    Margins.Top = 16
    TabOrder = 1
    Text = 'EdtNomeBanco'
  end
  object EdtAgencia: TEdit
    Left = 184
    Top = 50
    Width = 248
    Height = 23
    TabOrder = 2
    Text = 'EdtAgencia'
  end
  object DtTmDtCriacaoI: TDateTimePicker
    Left = 184
    Top = 79
    Width = 110
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749289502316969400
    TabOrder = 3
  end
  object DtTmDtAtualizaI: TDateTimePicker
    Left = 184
    Top = 108
    Width = 110
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749500370373425500
    TabOrder = 4
  end
  object DtTmDtCriacaoF: TDateTimePicker
    Left = 322
    Top = 79
    Width = 110
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749905277778452700
    TabOrder = 5
  end
  object DtTmDtAtualizaF: TDateTimePicker
    Left = 322
    Top = 108
    Width = 110
    Height = 23
    Date = 45877.000000000000000000
    Time = 0.749916851855232400
    TabOrder = 6
  end
  object ChckBxlNomeBanco: TCheckBox
    Left = 8
    Top = 24
    Width = 170
    Height = 17
    Caption = 'Nome do Banco: (cont'#233'm)'
    TabOrder = 7
  end
  object ChckBxAgencia: TCheckBox
    Left = 8
    Top = 53
    Width = 170
    Height = 17
    Caption = 'Ag'#234'ncia: (cont'#233'm)'
    TabOrder = 8
  end
  object ChckBxDataCriacao: TCheckBox
    Left = 8
    Top = 83
    Width = 170
    Height = 17
    Caption = 'Data Cria'#231#227'o: Entre'
    TabOrder = 9
  end
  object ChckBxDataAtualizacao: TCheckBox
    Left = 8
    Top = 109
    Width = 170
    Height = 17
    Caption = 'Data Atualiza'#231#227'o: Entre'
    TabOrder = 10
  end
end
