program Dexian.MVC;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {FrmPrincipal},
  View.Consulta in 'View\View.Consulta.pas' {FrmConsulta},
  View.Manutencao in 'View\View.Manutencao.pas' {FrmManutencao},
  DAO.Conexao in 'DAO\DAO.Conexao.pas' {DM: TDataModule},
  Model.Agencia in 'Model\Model.Agencia.pas',
  Controller.Agencia in 'Controller\Controller.Agencia.pas',
  View.ConsultaAgencia in 'View\View.ConsultaAgencia.pas' {FrmConsultaAgencia},
  View.ManutencaoAgencia in 'View\View.ManutencaoAgencia.pas' {FrmManutencaoAgencia},
  View.ManutencaoFiltroAgencia in 'View\View.ManutencaoFiltroAgencia.pas' {FrmManutencaoFiltroAgencia},
  Model.Conta in 'Model\Model.Conta.pas',
  Controller.Conta in 'Controller\Controller.Conta.pas',
  View.ConsultaConta in 'View\View.ConsultaConta.pas' {FrmConsultaConta},
  View.ManutencaoConta in 'View\View.ManutencaoConta.pas' {FrmManutencaoConta},
  View.ManutencaoFiltroConta in 'View\View.ManutencaoFiltroConta.pas' {FrmManutencaoFiltroConta},
  DAO.Relatorio in 'DAO\DAO.Relatorio.pas' {DMRelatorio: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmManutencaoFiltroConta, FrmManutencaoFiltroConta);
  Application.CreateForm(TDMRelatorio, DMRelatorio);
  Application.Run;
end.
