unit View.ManutencaoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Manutencao, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Controller.Conta, Data.DB,
  Vcl.ComCtrls, Vcl.NumberBox;

type
  TFrmManutencaoConta = class(TFrmManutencao)
    EdtNumeroConta: TEdit;
    LblNumeroConta: TLabel;
    DtTmPckrDtUltimoMovimento: TDateTimePicker;
    LblDtUltimoMovimento: TLabel;
    NmbrBxSaldo: TNumberBox;
    LblSaldo: TLabel;
    MmObservacoes: TMemo;
    LblObservacoes: TLabel;
    LblDataCriacao: TLabel;
    LblDataAtualizacao: TLabel;
    EdtDataCriacao: TEdit;
    EdtDataAtualizacao: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BttnSalvarClick(Sender: TObject);
    procedure DBNvManutencaoClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    FIdAgencia: Integer;
    FController: TControllerConta;
    procedure CarregaCampos;
    procedure ValidarCampos;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADataSource: TDataSource; AIdAgencia: Integer; AModo: Char = 'I'; AId: Integer = -1); overload;
    destructor Destroy; override;
  end;

var
  FrmManutencaoConta: TFrmManutencaoConta;

implementation

{$R *.dfm}

uses DAO.Conexao;

constructor TFrmManutencaoConta.Create(AOwner: TComponent; ADataSource: TDataSource; AIdAgencia: Integer; AModo: Char = 'I'; AId: Integer = -1);
begin
  inherited Create(AOwner, ADataSource, AModo, AId);
  FIdAgencia := AIdAgencia;
  FController := TControllerConta.Create(DM.Cnn);
end;

procedure TFrmManutencaoConta.DBNvManutencaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Id := DBNvManutencao.DataSource.DataSet.FieldByName('ContaId').AsInteger;
  CarregaCampos;
end;

destructor TFrmManutencaoConta.Destroy;
begin
  FController.Free;
  inherited;
end;

procedure TFrmManutencaoConta.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCampos;
end;

procedure TFrmManutencaoConta.BttnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    ValidarCampos;

    if (Id <= 0) or (Modo = 'I') then {Inserir}
      Id := FController.IncluirConta(FIdAgencia, EdtNumeroConta.Text, DtTmPckrDtUltimoMovimento.DateTime, NmbrBxSaldo.Value, MmObservacoes.Text)
    else if (Modo = 'A') then
      FController.AlterarConta(Id, EdtNumeroConta.Text, DtTmPckrDtUltimoMovimento.DateTime, NmbrBxSaldo.Value, MmObservacoes.Text);

    Close;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

end;

procedure TFrmManutencaoConta.CarregaCampos;
var
  NumeroConta, Observacoes: String;
  DataUltimoMovimento: TDateTime;
  Saldo: Currency;
  DataCriacao, DataAtualizacao: TDateTime;
begin
  NumeroConta := '';
  Observacoes := '';
  DataUltimoMovimento := Now;
  Saldo := 0;
  DataCriacao := Now;
  DataAtualizacao := Now;

  if Id > 0 then { Alterar }
  begin
    try
      FController.ObterConta(Id, NumeroConta, DataUltimoMovimento, Saldo, Observacoes, DataCriacao, DataAtualizacao);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;

  EdtNumeroConta.Text := NumeroConta;
  DtTmPckrDtUltimoMovimento.DateTime := DataUltimoMovimento;
  NmbrBxSaldo.Value := Saldo;
  MmObservacoes.Text := Observacoes;
  EdtDataCriacao.Text := FormatDateTime('dd/mm/yyyy', DataCriacao);
  EdtDataAtualizacao.Text := FormatDateTime('dd/mm/yyyy', DataAtualizacao);

  if EdtNumeroConta.CanFocus then
    EdtNumeroConta.SetFocus;
end;

procedure TFrmManutencaoConta.ValidarCampos;
var
  NumeroConta: String;
begin
  if (Modo <> 'I') and (Modo <> 'E') then
    Exit;

  NumeroConta := Trim(EdtNumeroConta.Text);

  if Length(NumeroConta) < 2 then
    raise Exception.Create('O campo "Número da Conta" precisa ter mais que 1 caracter e até 40.');

  EdtNumeroConta.Text := NumeroConta;
end;

end.
