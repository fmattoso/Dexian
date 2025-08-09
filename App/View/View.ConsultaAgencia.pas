unit View.ConsultaAgencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Consulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Controller.Agencia;

type
  TFrmConsultaAgencia = class(TFrmConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BttnTodosClick(Sender: TObject);
    procedure BttnIncluirClick(Sender: TObject);
    procedure BttnAlterarClick(Sender: TObject);
    procedure BttnConsultarClick(Sender: TObject);
    procedure BttnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerAgencia;
    procedure AtualizarGrid;
  public
    { Public declarations }
    procedure DoExcluir; override;
  end;

var
  FrmConsultaAgencia: TFrmConsultaAgencia;

implementation

{$R *.dfm}

uses DAO.Conexao, View.ManutencaoAgencia, View.ManutencaoFiltroAgencia;

procedure TFrmConsultaAgencia.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerAgencia.Create(DM.Cnn);
  AtualizarGrid;
end;

procedure TFrmConsultaAgencia.FormDestroy(Sender: TObject);
begin
  FController.Free;
  inherited;
end;

procedure TFrmConsultaAgencia.AtualizarGrid;
begin
  DtSrcConsulta.DataSet := FController.CarregarDados;
  { Configurar a exibição na Grid }
  DtSrcConsulta.DataSet.FieldByName('AgenciaId').Visible := False;
  DtSrcConsulta.DataSet.FieldByName('NomeBanco').DisplayLabel := 'Nome do Banco';
  DtSrcConsulta.DataSet.FieldByName('NomeBanco').DisplayWidth := 40;
  DtSrcConsulta.DataSet.FieldByName('Agencia').DisplayLabel := 'Agência';
  DtSrcConsulta.DataSet.FieldByName('Agencia').DisplayWidth := 35;
end;

procedure TFrmConsultaAgencia.BttnAlterarClick(Sender: TObject);
var
  FManutencao : TFrmManutencaoAgencia;
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('AgenciaId').AsInteger;
  FManutencao := TFrmManutencaoAgencia.Create(Self, DtSrcConsulta, 'A', Id);
  FManutencao.ShowModal;
  AtualizarGrid;
end;

procedure TFrmConsultaAgencia.BttnConsultarClick(Sender: TObject);
var
  FManutencao : TFrmManutencaoAgencia;
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('AgenciaId').AsInteger;
  FManutencao := TFrmManutencaoAgencia.Create(Self, DtSrcConsulta, 'C', Id);
  FManutencao.ShowModal;
end;

procedure TFrmConsultaAgencia.BttnFiltrarClick(Sender: TObject);
var
  FManutencao: TFrmManutencaoFiltroAgencia;
begin
  inherited;
  FManutencao := TFrmManutencaoFiltroAgencia.Create(Self, DtSrcConsulta);
  FManutencao.ShowModal;
end;

procedure TFrmConsultaAgencia.BttnIncluirClick(Sender: TObject);
var
  FManutencao : TFrmManutencaoAgencia;
begin
  inherited;
  FManutencao := TFrmManutencaoAgencia.Create(Self, DtSrcConsulta);
  FManutencao.ShowModal;
  AtualizarGrid;
end;

procedure TFrmConsultaAgencia.BttnTodosClick(Sender: TObject);
begin
  inherited;
  AtualizarGrid;
end;

procedure TFrmConsultaAgencia.DoExcluir;
var
  Id: Integer;
begin
  inherited;
  Id := DtSrcConsulta.DataSet.FieldByName('AgenciaId').AsInteger;
  try
    FController.ExcluirAgencia(Id);
    AtualizarGrid;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.
