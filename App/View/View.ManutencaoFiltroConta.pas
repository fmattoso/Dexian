unit View.ManutencaoFiltroConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Manutencao, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.NumberBox, Controller.Conta, Data.DB;

type
  TFrmManutencaoFiltroConta = class(TFrmManutencao)
    EdtNumeroConta: TEdit;
    DtTmPckrDtUltimoMovimentoI: TDateTimePicker;
    DtTmPckrDtUltimoMovimentoF: TDateTimePicker;
    LblAte1: TLabel;
    NmbrBxSaldoI: TNumberBox;
    NmbrBxSaldoF: TNumberBox;
    LblAte2: TLabel;
    MmObservacoes: TMemo;
    ChckBxNumeroConta: TCheckBox;
    ChckBxDtUltimoMovimento: TCheckBox;
    ChckBxSaldo: TCheckBox;
    ChckBxObservacoes: TCheckBox;
    ChckBxDataCriacao: TCheckBox;
    LblInt1: TLabel;
    Label4: TLabel;
    DtTmDtCriacaoI: TDateTimePicker;
    DtTmDtAtualizaI: TDateTimePicker;
    DtTmDtCriacaoF: TDateTimePicker;
    DtTmDtAtualizaF: TDateTimePicker;
    ChckBxDataAtualizacao: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BttnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FIdAgencia: Integer;
    FController: TControllerConta;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADataSource: TDataSource; AIdAgencia: Integer; AModo: Char = 'I'; AId: Integer = -1); overload;
    destructor Destroy; override;
  end;

var
  FrmManutencaoFiltroConta: TFrmManutencaoFiltroConta;

implementation

{$R *.dfm}

uses DAO.Conexao;

procedure TFrmManutencaoFiltroConta.BttnSalvarClick(Sender: TObject);
var
  Campos: Array of String;
  ValIni, ValFim: Array of Variant;
begin
  inherited;

  SetLength(Campos, 6);
  SetLength(ValIni, 6);
  SetLength(ValFim, 6);

  Campos[0] := 'NumeroConta';
  Campos[1] := 'DataUltimoMovimento';
  Campos[2] := 'Saldo';
  Campos[3] := 'Observacoes';
  Campos[4] := 'DataCriacao';
  Campos[5] := 'DataAtualizacao';

  if ChckBxNumeroConta.Checked then
    ValIni[0] := Trim(EdtNumeroConta.Text)
  else
    ValIni[0] := Null;
  ValFim[0] := Null;

  if ChckBxDtUltimoMovimento.Checked then
  begin
    ValIni[1] := DtTmPckrDtUltimoMovimentoI.DateTime;
    ValFim[1] := DtTmPckrDtUltimoMovimentoF.DateTime;
  end
  else
  begin
    ValIni[1] := Null;
    ValFim[1] := Null;
  end;

  if ChckBxSaldo.Checked then
  begin
    ValIni[2] := NmbrBxSaldoI.Value;
    ValFim[2] := NmbrBxSaldoF.Value;
  end
  else
  begin
    ValIni[2] := Null;
    ValFim[2] := Null;
  end;

  if ChckBxObservacoes.Checked then
    ValIni[3] := Trim(MmObservacoes.Text)
  else
    ValIni[3] := Null;
  ValFim[3] := Null;

  if ChckBxDataCriacao.Checked then
  begin
    ValIni[4] := DtTmDtCriacaoI.DateTime;
    ValFim[4] := DtTmDtCriacaoF.DateTime;
  end
  else
  begin
    ValIni[4] := Null;
    ValFim[4] := Null;
  end;

  if ChckBxDataAtualizacao.Checked then
  begin
    ValIni[5] := DtTmDtAtualizaI.DateTime;
    ValFim[5] := DtTmDtAtualizaF.DateTime;
  end
  else
  begin
    ValIni[5] := Null;
    ValFim[5] := Null;
  end;

  ConsultaDataSource.DataSet := FController.Filtrar(FIdAgencia, Campos, ValIni, ValFim);
end;

constructor TFrmManutencaoFiltroConta.Create(AOwner: TComponent; ADataSource: TDataSource; AIdAgencia: Integer; AModo: Char = 'I'; AId: Integer = -1);
begin
  inherited Create(AOwner, ADataSource, AModo, AId);
  FIdAgencia := AIdAgencia;
  FController := TControllerConta.Create(DM.Cnn);
end;

destructor TFrmManutencaoFiltroConta.Destroy;
begin
  FController.Free;
  inherited;
end;

procedure TFrmManutencaoFiltroConta.FormShow(Sender: TObject);
begin
  inherited;
  EdtNumeroConta.Clear;
  DtTmPckrDtUltimoMovimentoI.DateTime := Now;
  DtTmPckrDtUltimoMovimentoF.DateTime := Now;
  NmbrBxSaldoI.Value := 0;
  NmbrBxSaldoF.Value := 0;
  MmObservacoes.Lines.Clear;
  DtTmDtAtualizaI.DateTime := Now;
  DtTmDtAtualizaF.DateTime := Now;
end;

end.
