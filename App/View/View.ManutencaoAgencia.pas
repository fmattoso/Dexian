unit View.ManutencaoAgencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Manutencao, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Controller.Agencia;

type
  TFrmManutencaoAgencia = class(TFrmManutencao)
    LblNomeBanco: TLabel;
    CmbBxNomeBanco: TComboBox;
    LblAgencia: TLabel;
    EdtAgencia: TEdit;
    LblDataCriacao: TLabel;
    LblDataAtualizacao: TLabel;
    EdtDataCriacao: TEdit;
    EdtDataAtualizacao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BttnSalvarClick(Sender: TObject);
    procedure DBNvManutencaoClick(Sender: TObject; Button: TNavigateBtn);
    procedure BttnRestaurarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerAgencia;

    procedure CarregaCampos;
    procedure ValidarCampos;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  FrmManutencaoAgencia: TFrmManutencaoAgencia;

implementation

{$R *.dfm}

uses DAO.Conexao;

procedure TFrmManutencaoAgencia.DBNvManutencaoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  Id := DBNvManutencao.DataSource.DataSet.FieldByName('AgenciaId').AsInteger;
  CarregaCampos;
end;

destructor TFrmManutencaoAgencia.Destroy;
begin
  FController.Free;
  inherited;
end;

procedure TFrmManutencaoAgencia.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerAgencia.Create(DM.Cnn);
end;

procedure TFrmManutencaoAgencia.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCampos;
end;

procedure TFrmManutencaoAgencia.BttnRestaurarClick(Sender: TObject);
begin
  inherited;
  CarregaCampos;
end;

procedure TFrmManutencaoAgencia.BttnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    ValidarCampos;

    if (Id <= 0) or (Modo = 'I') then {Inserir}
      Id := FController.IncluirAgencia(CmbBxNomeBanco.Text, EdtAgencia.Text)
    else if (Modo = 'A') then
      FController.AlterarAgencia(Id, CmbBxNomeBanco.Text, EdtAgencia.Text);

    Close;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFrmManutencaoAgencia.CarregaCampos;
var
  NomeBanco, Agencia: String;
  DataCriacao, DataAtualizacao: TDateTime;
begin
  NomeBanco := '';
  Agencia := '';
  DataCriacao := 0;
  DataAtualizacao := 0;

  if Id > 0 then { Alterar }
  begin
    try
      FController.ObterAgencia(Id, NomeBanco, Agencia, DataCriacao, DataAtualizacao);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;

  if (Modo = 'I') or (Modo = 'A') then
  begin
    try
      CmbBxNomeBanco.Items.DelimitedText := FController.CarregarBancos;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  end;

  CmbBxNomeBanco.Text := NomeBanco;
  EdtAgencia.Text := Agencia;
  EdtDataCriacao.Text := FormatDateTime('dd/mm/yyyy', DataCriacao);
  EdtDataAtualizacao.Text := FormatDateTime('dd/mm/yyyy', DataAtualizacao);

  if CmbBxNomeBanco.CanFocus then
    CmbBxNomeBanco.SetFocus;
end;

procedure TFrmManutencaoAgencia.ValidarCampos;
var
  NomeBanco,
  Agencia : String;
begin
  NomeBanco := Trim(CmbBxNomeBanco.Text);
  Agencia := Trim(EdtAgencia.Text);

  if Length(NomeBanco) < 2 then
    raise Exception.Create('O campo "Nome do Banco" precisa ter mais que 1 caracter.');

  if Length(Agencia) < 2 then
    raise Exception.Create('O campo "Agência" precisa ter mais que 1 caracter.');

  CmbBxNomeBanco.Text := NomeBanco;
  EdtAgencia.Text := Agencia;
end;

end.


