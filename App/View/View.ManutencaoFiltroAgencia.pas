unit View.ManutencaoFiltroAgencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Manutencao, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Controller.Agencia;

type
  TFrmManutencaoFiltroAgencia = class(TFrmManutencao)
    LblNomeBanco: TLabel;
    EdtNomeBanco: TEdit;
    EdtAgencia: TEdit;
    LblAgencia: TLabel;
    DtTmDtCriacaoI: TDateTimePicker;
    DtTmDtAtualizaI: TDateTimePicker;
    DtTmDtCriacaoF: TDateTimePicker;
    DtTmDtAtualizaF: TDateTimePicker;
    LblDataCriacao: TLabel;
    LblDataAtualizacao: TLabel;
    LblInt1: TLabel;
    Label4: TLabel;
    procedure BttnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerAgencia;

    function ObterDateTime(Value: TDateTime; Tipo: Char): TDateTime;
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
  if Trim(EdtNomeBanco.Text) = '' then
    ValIni[0] := Null
  else
    ValIni[0] := Trim(EdtNomeBanco.Text);
  ValFim[0] := Null;

  Campos[1] := 'Agencia';
  if Trim(EdtAgencia.Text) = '' then
    ValIni[1] := Null
  else
    ValIni[1] := Trim(EdtAgencia.Text);
  ValFim[1] := Null;

  Campos[2] := 'DataCriacao';
  ValIni[2] := ObterDateTime(DtTmDtCriacaoI.DateTime, 'I');
  ValFim[2] := ObterDateTime(DtTmDtCriacaoF.DateTime, 'F');

  Campos[3] := 'DataAtualizacao';
  ValIni[3] := ObterDateTime(DtTmDtAtualizaI.DateTime, 'I');
  ValFim[3] := ObterDateTime(DtTmDtAtualizaF.DateTime, 'F');

  ConsultaDataSource.DataSet := FController.Filtrar(Campos, ValIni, ValFim);

end;

function TFrmManutencaoFiltroAgencia.ObterDateTime(Value: TDateTime; Tipo: Char): TDateTime;
var
  Dia, Mes, Ano: Word;
begin
  DecodeDate(Value, Ano, Mes, Dia);
  if Tipo = 'I' then
    Result := EncodeDateTime(Ano, Mes, Dia, 0, 0, 0, 0)
  else
    Result := EncodeDateTime(Ano, Mes, Dia, 23, 59, 59, 999);
end;

procedure TFrmManutencaoFiltroAgencia.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerAgencia.Create(DM.Cnn);
end;

procedure TFrmManutencaoFiltroAgencia.FormShow(Sender: TObject);
begin
  inherited;
  EdtNomeBanco.Clear;
  EdtAgencia.Clear;
  DtTmDtCriacaoI.DateTime := Now;
  DtTmDtCriacaoF.DateTime := Now;
  DtTmDtAtualizaI.DateTime := Now;
  DtTmDtAtualizaF.DateTime := Now;
end;

destructor TFrmManutencaoFiltroAgencia.Destroy;
begin
  FController.Free;
  inherited;
end;
end.
