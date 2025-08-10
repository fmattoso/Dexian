unit View.ConsultaConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Consulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Controller.Agencia, Controller.Conta;

type
  TFrmConsultaConta = class(TFrmConsulta)
    DBGrdAgencia: TDBGrid;
    SplttrConsulta: TSplitter;
    DtSrcAgencia: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DtSrcAgenciaDataChange(Sender: TObject; Field: TField);
    procedure BttnIncluirClick(Sender: TObject);
    procedure BttnAlterarClick(Sender: TObject);
    procedure BttnConsultarClick(Sender: TObject);
    procedure BttnTodosClick(Sender: TObject);
    procedure BttnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FIdAgencia: Integer;
    FControllerAgencia: TControllerAgencia;
    FControllerConta: TControllerConta;
    procedure AtualizarGridAgencia;
    procedure AtualizarGridConta;
  public
    { Public declarations }
    procedure DoExcluir; override;
  end;

var
  FrmConsultaConta: TFrmConsultaConta;

implementation

{$R *.dfm}

uses DAO.Conexao, View.ManutencaoConta, View.ManutencaoFiltroConta;

procedure TFrmConsultaConta.FormCreate(Sender: TObject);
begin
  inherited;
  FIdAgencia := -1;
  FControllerAgencia := TControllerAgencia.Create(DM.Cnn);
  FControllerConta := TControllerConta.Create(DM.Cnn);
  AtualizarGridAgencia;
end;

procedure TFrmConsultaConta.FormDestroy(Sender: TObject);
begin
  FControllerAgencia.Free;
  FControllerConta.Free;
  inherited;
end;

procedure TFrmConsultaConta.AtualizarGridAgencia;
begin
  DtSrcAgencia.DataSet := FControllerAgencia.CarregarDados;
  { Configurar a exibição na Grid }
  DtSrcAgencia.DataSet.FieldByName('AgenciaId').Visible := False;
  DtSrcAgencia.DataSet.FieldByName('NomeBanco').DisplayLabel := 'Nome do Banco';
  DtSrcAgencia.DataSet.FieldByName('NomeBanco').DisplayWidth := 40;
  DtSrcAgencia.DataSet.FieldByName('Agencia').DisplayLabel := 'Agência';
  DtSrcAgencia.DataSet.FieldByName('Agencia').DisplayWidth := 35;
end;

procedure TFrmConsultaConta.AtualizarGridConta;
begin
  DtSrcConsulta.DataSet := FControllerConta.CarregarDados(FIdAgencia);
  { Configurar a exibição na Grid }
  DtSrcConsulta.DataSet.FieldByName('ContaId').Visible := False;
  DtSrcConsulta.DataSet.FieldByName('AgenciaId').Visible := False;
  DtSrcConsulta.DataSet.FieldByName('NumeroConta').DisplayLabel :=
    'Número da Conta';
  DtSrcConsulta.DataSet.FieldByName('NumeroConta').DisplayWidth := 40;
  DtSrcConsulta.DataSet.FieldByName('DataUltimoMovimento').DisplayLabel :=
    'Último Movimento';
  DtSrcConsulta.DataSet.FieldByName('DataUltimoMovimento').DisplayWidth := 35;
  DtSrcConsulta.DataSet.FieldByName('Saldo').DisplayLabel := 'Saldo';
  DtSrcConsulta.DataSet.FieldByName('Observacoes').DisplayLabel :=
    'Observações';
  DtSrcConsulta.DataSet.FieldByName('Observacoes').DisplayWidth := 100;
end;

procedure TFrmConsultaConta.BttnAlterarClick(Sender: TObject);
var
  FManutencao: TFrmManutencaoConta;
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('ContaId').AsInteger;
  FManutencao := TFrmManutencaoConta.Create(Self, DtSrcConsulta,
    FIdAgencia, 'A', Id);
  FManutencao.ShowModal;
  AtualizarGridConta;
end;

procedure TFrmConsultaConta.BttnConsultarClick(Sender: TObject);
var
  FManutencao: TFrmManutencaoConta;
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('ContaId').AsInteger;
  FManutencao := TFrmManutencaoConta.Create(Self, DtSrcConsulta,
    FIdAgencia, 'C', Id);
  FManutencao.ShowModal;
end;

procedure TFrmConsultaConta.BttnFiltrarClick(Sender: TObject);
var
  FManutencao: TFrmManutencaoFiltroConta;
begin
  inherited;
  FManutencao := TFrmManutencaoFiltroConta.Create(Self, DtSrcConsulta,
    FIdAgencia);
  FManutencao.ShowModal;
end;

procedure TFrmConsultaConta.BttnIncluirClick(Sender: TObject);
var
  FManutencao: TFrmManutencaoConta;
begin
  inherited;
  FManutencao := TFrmManutencaoConta.Create(Self, DtSrcConsulta, FIdAgencia);
  FManutencao.ShowModal;
  AtualizarGridConta;
end;

procedure TFrmConsultaConta.BttnTodosClick(Sender: TObject);
begin
  inherited;
  AtualizarGridConta;
end;

procedure TFrmConsultaConta.DtSrcAgenciaDataChange(Sender: TObject;
  Field: TField);
var
  IdAgencia: Integer;
begin
  inherited;

  { Evitar vários carregamentos de Conta ao carregar a Agencia }
  IdAgencia := DtSrcAgencia.DataSet.FieldByName('AgenciaId').AsInteger;

  if (DtSrcAgencia.State in [dsBrowse]) and (FIdAgencia <> IdAgencia) then
  begin
    FIdAgencia := IdAgencia;
    AtualizarGridConta;
  end;
end;

procedure TFrmConsultaConta.DoExcluir;
var
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('ContaId').AsInteger;
  try
    FControllerConta.ExcluirConta(Id);
    AtualizarGridConta;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.
