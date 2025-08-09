inherited FrmManutencaoAgencia: TFrmManutencaoAgencia
  Caption = 'Manuten'#231#227'o Ag'#234'ncia'
  ClientHeight = 208
  ClientWidth = 500
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 516
  ExplicitHeight = 247
  TextHeight = 15
  object LblNomeBanco: TLabel [0]
    Left = 8
    Top = 24
    Width = 94
    Height = 15
    Caption = '*Nome do &Banco:'
    FocusControl = CmbBxNomeBanco
  end
  object LblAgencia: TLabel [1]
    Left = 8
    Top = 74
    Width = 51
    Height = 15
    Caption = '*&Ag'#234'ncia:'
    FocusControl = EdtAgencia
  end
  object LblDataCriacao: TLabel [2]
    Left = 8
    Top = 129
    Width = 70
    Height = 15
    Margins.Top = 8
    Caption = 'Data Cria'#231#227'o:'
    FocusControl = EdtDataCriacao
  end
  object LblDataAtualizacao: TLabel [3]
    Left = 151
    Top = 129
    Width = 91
    Height = 15
    Margins.Top = 8
    Caption = 'Data Atualiza'#231#227'o:'
    FocusControl = EdtDataAtualizacao
  end
  inherited PnlMenu: TPanel
    Left = 356
    Height = 208
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 356
    ExplicitHeight = 208
    inherited BttnRestaurar: TButton
      OnClick = BttnRestaurarClick
    end
    inherited BttnSalvar: TButton
      Top = 112
      OnClick = BttnSalvarClick
      ExplicitTop = 112
    end
    inherited BttnSair: TButton
      Top = 160
      ExplicitTop = 160
    end
    inherited DBNvManutencao: TDBNavigator
      Hints.Strings = ()
      OnClick = DBNvManutencaoClick
    end
  end
  object CmbBxNomeBanco: TComboBox
    Left = 8
    Top = 45
    Width = 281
    Height = 23
    MaxLength = 100
    Sorted = True
    TabOrder = 1
    Text = 'CmbBxNomeBanco'
  end
  object EdtAgencia: TEdit
    Left = 8
    Top = 95
    Width = 281
    Height = 23
    MaxLength = 100
    TabOrder = 2
    Text = 'EdtAgencia'
  end
  object EdtDataCriacao: TEdit
    Left = 8
    Top = 150
    Width = 137
    Height = 23
    Enabled = False
    TabOrder = 3
    Text = 'EdtDataCriacao'
  end
  object EdtDataAtualizacao: TEdit
    Left = 151
    Top = 150
    Width = 138
    Height = 23
    Enabled = False
    TabOrder = 4
    Text = 'EdtDataAtualizacao'
  end
end
