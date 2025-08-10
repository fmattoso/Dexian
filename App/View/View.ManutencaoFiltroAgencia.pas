unit View.ManutencaoFiltroAgencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Manutencao, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Controller.Agencia;

type
  TFrmManutencaoFiltroAgencia = class(TFrmManutencao)
    EdtNomeBanco: TEdit;
    EdtAgencia: TEdit;
    DtTmDtCriacaoI: TDateTimePicker;
    DtTmDtAtualizaI: TDateTimePicker;
    DtTmDtCriacaoF: TDateTimePicker;
    DtTmDtAtualizaF: TDateTimePicker;
    LblInt1: TLabel;
    Label4: TLabel;
    ChckBxlNomeBanco: TCheckBox;
    ChckBxAgencia: TCheckBox;
    ChckBxDataCriacao: TCheckBox;
    ChckBxDataAtualizacao: TCheckBox;
    procedure BttnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerAgencia;

  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  FrmManutencaoFiltroAgencia: TFrmManutencaoFiltroAgencia;

implementation

{$R *.dfm}

uses DAO.Conexao, System.DateUtils;

procedure TFrmManutencaoFiltroAgencia.BttnSalvarClick(Sender: TObject);
var
  Campos: Array of String;
  ValIni, ValFim: Array of Variant;
begin
  inherited;

  SetLength(Campos, 4);
  SetLength(ValIni, 4);
  SetLength(ValFim, 4);

  Campos[0] := 'NomeBanco';
  Campos[1] := 'Agencia';
  Campos[2] := 'DataCriacao';
  Campos[3] := 'DataAtualizacao';

  if ChckBxlNomeBanco.Checked then
    ValIni[0] := Trim(EdtNomeBanco.Text)
  else
    ValIni[0] := Null;
  ValFim[0] := Null;

  if ChckBxAgencia.Checked then
    ValIni[1] := Trim(EdtAgencia.Text)
  else
    ValIni[1] := Null;
  ValFim[1] := Null;

  if ChckBxDataCriacao.Checked then
  begin
    ValIni[2] := DtTmDtCriacaoI.DateTime;
    ValFim[2] := DtTmDtCriacaoF.DateTime;
  end
  else
  begin
    ValIni[2] := Null;
    ValFim[2] := Null;
  end;

  if ChckBxDataAtualizacao.Checked then
  begin
    ValIni[3] := DtTmDtAtualizaI.DateTime;
    ValFim[3] := DtTmDtAtualizaF.DateTime;
  end
  else
  begin
    ValIni[3] := Null;
    ValFim[3] := Null;
  end;

  ConsultaDataSource.DataSet := FController.Filtrar(Campos, ValIni, ValFim);
  ConsultaDataSource.DataSet.FieldByName('AgenciaId').Visible := False;
  ConsultaDataSource.DataSet.FieldByName('NomeBanco').DisplayLabel := 'Nome do Banco';
  ConsultaDataSource.DataSet.FieldByName('NomeBanco').DisplayWidth := 40;
  ConsultaDataSource.DataSet.FieldByName('Agencia').DisplayLabel := 'Agência';
  ConsultaDataSource.DataSet.FieldByName('Agencia').DisplayWidth := 35;

end;

procedure TFrmManutencaoFiltroAgencia.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerAgencia.Create(DM.Cnn);
end;

procedure TFrmManutencaoFiltroAgencia.FormShow(Sender: TObject);
var
  Ano, Mes, Dia: Word;
begin
  inherited;
  DecodeDate(Now, Ano, Mes, Dia);
  EdtNomeBanco.Clear;
  EdtAgencia.Clear;
  DtTmDtCriacaoI.DateTime := EncodeDateTime(Ano, Mes, Dia, 0, 0, 0, 0);
  DtTmDtCriacaoF.DateTime := EncodeDateTime(Ano, Mes, Dia, 23, 59, 59, 999);
  DtTmDtAtualizaI.DateTime := EncodeDateTime(Ano, Mes, Dia, 0, 0, 0, 0);
  DtTmDtAtualizaF.DateTime := EncodeDateTime(Ano, Mes, Dia, 23, 59, 59, 999);
end;

destructor TFrmManutencaoFiltroAgencia.Destroy;
begin
  FController.Free;
  inherited;
end;
end.
