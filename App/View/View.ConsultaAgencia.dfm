inherited FrmConsultaAgencia: TFrmConsultaAgencia
  Caption = 'Cadastro Ag'#234'ncia - Consulta'
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
      ExplicitLeft = 7
    end
  end
  inherited PnlConsulta: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
end
