unit Controller.Conta;

interface

uses
  Model.Conta, System.SysUtils, Data.DB, FireDAC.Comp.Client;

type
  TControllerConta = class
  private
    FModel: TModelConta;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function CarregarDados(AAgenciaId: Integer): TFDQuery;
    function Filtrar(AAgenciaId: Integer; ACampos: Array of String;
      AValorIni: Array of Variant; AValorFim: Array of Variant): TFDQuery;
    function ObterConta(AContaId: Integer; out ANumeroConta: String;
      out ADataUltimoMovimento: TDateTime; out ASaldo: Currency;
      out AObservacoes: String; out ADataCriacao, ADataAtualizacao
      : TDateTime): Boolean;
    function IncluirConta(AAgenciaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency;
      AObservacoes: String): Integer;
    procedure AlterarConta(AContaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency; AObservacoes: String);
    procedure ExcluirConta(AContaId: Integer);
  end;

implementation

{ TControllerConta }

constructor TControllerConta.Create(AConnection: TFDConnection);
begin
  FModel := TModelConta.Create(AConnection);
end;

destructor TControllerConta.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TControllerConta.CarregarDados(AAgenciaId: Integer): TFDQuery;
begin
  Result := FModel.ListarTodos(AAgenciaId);
end;

function TControllerConta.Filtrar(AAgenciaId: Integer; ACampos: Array of String;
  AValorIni: Array of Variant; AValorFim: Array of Variant): TFDQuery;
begin
  try
    Result := FModel.Filtrar(AAgenciaId, ACampos, AValorIni, AValorFim);
  except
    on E: Exception do
      raise Exception.Create('Erro ao filtrar: ' + E.Message);
  end;
end;

function TControllerConta.ObterConta(AContaId: Integer;
  out ANumeroConta: String; out ADataUltimoMovimento: TDateTime;
  out ASaldo: Currency; out AObservacoes: String;
  out ADataCriacao, ADataAtualizacao: TDateTime): Boolean;
begin
  Result := FModel.ListarPorID(AContaId, ANumeroConta, ADataUltimoMovimento,
    ASaldo, AObservacoes, ADataCriacao, ADataAtualizacao);
end;

function TControllerConta.IncluirConta(AAgenciaId: Integer;
  ANumeroConta: String; ADataUltimoMovimento: TDateTime; ASaldo: Currency;
  AObservacoes: String): Integer;
begin
  try
    Result := FModel.Incluir(AAgenciaId, ANumeroConta, ADataUltimoMovimento,
      ASaldo, AObservacoes);
  except
    on E: Exception do
      raise Exception.Create('Erro ao incluir: ' + E.Message);
  end;
end;

procedure TControllerConta.AlterarConta(AContaId: Integer; ANumeroConta: String;
  ADataUltimoMovimento: TDateTime; ASaldo: Currency; AObservacoes: String);
begin
  try
    FModel.Alterar(AContaId, ANumeroConta, ADataUltimoMovimento, ASaldo,
      AObservacoes);
  except
    on E: Exception do
      raise Exception.Create('Erro ao alterar: ' + E.Message);
  end;
end;

procedure TControllerConta.ExcluirConta(AContaId: Integer);
begin
  try
    FModel.Excluir(AContaId);
  except
    on E: Exception do
      raise Exception.Create('Erro ao excluir: ' + E.Message);
  end;
end;

end.
