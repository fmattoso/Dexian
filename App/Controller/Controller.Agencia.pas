unit Controller.Agencia;

interface

uses
  Model.Agencia, System.SysUtils, Data.DB, FireDAC.Comp.Client;

type
  TControllerAgencia = class
  private
    FModel: TModelAgencia;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function CarregarDados: TFDQuery;
    function CarregarBancos: String;
    function Filtrar(ACampos: Array of String; AValorIni: Array of Variant;
      AValorFim: Array of Variant): TFDQuery;
    function ObterAgencia(AAgenciaId: Integer; out ANomeBanco, AAgencia: String;
      out ADataCriacao, ADataAtualizacao: TDateTime): Boolean;
    function IncluirAgencia(ANomeBanco, AAgencia: String): Integer;
    procedure AlterarAgencia(AAgenciaId: Integer; ANomeBanco, AAgencia: String);
    procedure ExcluirAgencia(AAgenciaId: Integer);
  end;

implementation

uses System.Classes;

{ TControllerAgencia }

constructor TControllerAgencia.Create(AConnection: TFDConnection);
begin
  FModel := TModelAgencia.Create(AConnection);
end;

destructor TControllerAgencia.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TControllerAgencia.CarregarDados: TFDQuery;
begin
  Result := FModel.ListarTodos;
end;

function TControllerAgencia.CarregarBancos: String;
var
  QueryBancos: TFDQuery;
  LstBancos: TStringList;
begin
  QueryBancos := FModel.Bancos;
  LstBancos := TStringList.Create;
  try
    QueryBancos.First;
    while not QueryBancos.Eof do
    begin
      LstBancos.Add(QueryBancos.FieldByName('NomeBanco').AsString);
      QueryBancos.Next;
    end;
    Result := LstBancos.DelimitedText;
  finally
    LstBancos.Free;
  end;
end;

function TControllerAgencia.Filtrar(ACampos: Array of String;
  AValorIni: Array of Variant; AValorFim: Array of Variant): TFDQuery;
begin
  try
    Result := FModel.Filtrar(ACampos, AValorIni, AValorFim);
  except
    on E: Exception do
      raise Exception.Create('Erro ao filtrar: ' + E.Message);
  end;
end;

function TControllerAgencia.ObterAgencia(AAgenciaId: Integer;
  out ANomeBanco: string; out AAgencia: string; out ADataCriacao: TDateTime;
  out ADataAtualizacao: TDateTime): Boolean;
begin
  Result := FModel.ListarPorID(AAgenciaId, ANomeBanco, AAgencia, ADataCriacao,
    ADataAtualizacao);
end;

function TControllerAgencia.IncluirAgencia(ANomeBanco: string;
  AAgencia: string): Integer;
begin
  try
    Result := FModel.Incluir(ANomeBanco, AAgencia);
  except
    on E: Exception do
      raise Exception.Create('Erro ao incluir: ' + E.Message);
  end;
end;

procedure TControllerAgencia.AlterarAgencia(AAgenciaId: Integer;
  ANomeBanco, AAgencia: String);
begin
  try
    FModel.Alterar(AAgenciaId, ANomeBanco, AAgencia);
  except
    on E: Exception do
      raise Exception.Create('Erro ao alterar: ' + E.Message);
  end;
end;

procedure TControllerAgencia.ExcluirAgencia(AAgenciaId: Integer);
begin
  try
    FModel.Excluir(AAgenciaId);
  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir: ' + E.Message);
  end;
end;

end.
