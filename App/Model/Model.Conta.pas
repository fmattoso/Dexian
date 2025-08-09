unit Model.Conta;

{
  ContaId INT IDENTITY(1,1) PRIMARY KEY,
  AgenciaId INT NOT NULL,
  NumeroConta VARCHAR(40),
  DataUltimoMovimento DATETIME NULL,
  Saldo DECIMAL(19, 4) DEFAULT 0.00,
  Observacoes VARCHAR(800),
  DataCriacao DATETIME DEFAULT GETDATE(),
  DataAtualizacao DATETIME DEFAULT GETDATE(),

  NumeroConta, DataUltimoMovimento, Saldo,	Observacoes
  ANumeroConta: String; ADataUltimoMovimento: TDateTime; ASaldo: Currency;	AObservacoes: String

}
interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.DApt, Data.DB;

type
  TModelConta = class
  private
    FQuery: TFDQuery;

    procedure ConfigurarQueryBase;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function ListarTodos(AAgenciaId: Integer): TFDQuery;
    function Filtrar(AAgenciaId: Integer; ACampos: Array of String;
      AValorIni: Array of Variant; AValorFim: Array of Variant): TFDQuery;
    function ListarPorID(AContaId: Integer; out ANumeroConta: String;
      out ADataUltimoMovimento: TDateTime; out ASaldo: Currency;
      out AObservacoes: String; out ADataCriacao, ADataAtualizacao
      : TDateTime): Boolean;
    function Incluir(AAgenciaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency;
      AObservacoes: String): Integer;
    procedure Alterar(AContaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency; AObservacoes: String);
    procedure Excluir(AContaId: Integer);

  end;

implementation

{ TModelAgencia }

constructor TModelConta.Create(AConnection: TFDConnection);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := AConnection;
end;

destructor TModelConta.Destroy;
begin
  FQuery.Free;
  inherited;
end;

procedure TModelConta.ConfigurarQueryBase;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add
    ('SELECT AgenciaId, ContaId, NumeroConta, DataUltimoMovimento, Saldo,	Observacoes, DataCriacao, DataAtualizacao');
  FQuery.SQL.Add('FROM Conta');
end;

function TModelConta.ListarTodos(AAgenciaId: Integer): TFDQuery;
begin
  ConfigurarQueryBase;
  FQuery.SQL.Add('WHERE AgenciaId = :AgenciaId');
  FQuery.SQL.Add('ORDER BY NumeroConta');
  FQuery.ParamByName('AgenciaId').AsInteger := AAgenciaId;
  FQuery.Open;
  Result := FQuery;
end;

function TModelConta.Filtrar(AAgenciaId: Integer; ACampos: Array of String;
      AValorIni: Array of Variant; AValorFim: Array of Variant): TFDQuery;
var
  It: Integer;
  Campo, Condicao: String;
  ValorIni, ValorFim: Variant;
  SQL: String;
begin

  if (Length(ACampos) <> Length(AValorIni)) or
    (Length(ACampos) <> Length(AValorFim)) then
    raise Exception.Create('Vetores com tamanhos diferentes');

  for It := 0 to High(ACampos) do
  begin
    if VarIsNull(AValorIni[It]) or VarIsEmpty(AValorIni[It]) then
      Continue;

    Campo := ACampos[It];
    ValorIni := AValorIni[It];
    ValorFim := AValorFim[It];

    case VarType(ValorIni) of
      varString, varUString:
        begin
          if (not VarIsNull(ValorFim)) and (not VarIsEmpty(ValorFim)) then
            Condicao := Format('(%s BETWEEN ''%s'' AND ''%s'')',
              [Campo, ValorIni, ValorFim])
          else
            Condicao := Format('(%s LIKE ''%%%s%%'')', [Campo, ValorIni]);
        end;
      varDate:
        begin
          if (not VarIsNull(ValorFim)) and (not VarIsEmpty(ValorFim)) then
            Condicao := Format('(%s BETWEEN ''%s'' AND ''%s'')',
              [Campo, ValorIni, ValorFim])
          else
            Condicao := Format('(%s = ''%s'')', [Campo, ValorIni]);
        end;
      varInteger, varSmallint, varByte, varWord, varLongWord, varInt64:
        begin
          if (not VarIsNull(ValorFim)) and (not VarIsEmpty(ValorFim)) then
            Condicao := Format('(%s BETWEEN %d AND %d)',
              [Campo, ValorIni, ValorFim])
          else
            Condicao := Format('(%s = %d)', [Campo, ValorIni]);
        end;
      varSingle, varDouble, varCurrency:
        begin
          if (not VarIsNull(ValorFim)) and (not VarIsEmpty(ValorFim)) then
            Condicao := Format('(%s BETWEEN %f AND %f)',
              [Campo, ValorIni, ValorFim])
          else
            Condicao := Format('(%s = %f)', [Campo, ValorIni]);
        end;
    end;

    if SQL = '' then
      SQL := Format('WHERE AgenciaId = %d AND ', [AAgenciaId]) + Condicao
    else
      SQL := SQL + ' AND ' + Condicao;
  end;

  ConfigurarQueryBase;
  if Pos('WHERE', SQL) > 0 then
    FQuery.SQL.Add(SQL);
  FQuery.SQL.Add('ORDER BY NumeroConta');
  FQuery.Open;
  Result := FQuery;
end;

function TModelConta.ListarPorID(AContaId: Integer; out ANumeroConta: String;
      out ADataUltimoMovimento: TDateTime; out ASaldo: Currency;
      out AObservacoes: String; out ADataCriacao, ADataAtualizacao
      : TDateTime): Boolean;
begin
  ConfigurarQueryBase;
  FQuery.SQL.Add('WHERE ContaId = :ContaId');
  FQuery.ParamByName('ContaId').AsInteger := AContaId;
  FQuery.Open;

  Result := not FQuery.IsEmpty;
  if Result then
  begin
    ANumeroConta := FQuery.FieldByName('NumeroConta').AsString;
    ADataUltimoMovimento := FQuery.FieldByName('DataUltimoMovimento').AsDateTime;
    ASaldo := FQuery.FieldByName('Saldo').AsCurrency;
    AObservacoes := FQuery.FieldByName('Observacoes').AsString;
    ADataCriacao := FQuery.FieldByName('DataCriacao').AsDateTime;
    ADataAtualizacao := FQuery.FieldByName('DataAtualizacao').AsDateTime;
  end;
end;

function TModelConta.Incluir(AAgenciaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency;
      AObservacoes: String): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('INSERT INTO Conta (AgenciaId, NumeroConta, DataUltimoMovimento, Saldo, Observacoes)');
      Query.SQL.Add('VALUES (:AgenciaId, :NumeroConta, :DataUltimoMovimento, :Saldo, :Observacoes);');
      Query.SQL.Add('SELECT SCOPE_IDENTITY() AS NewId;');
      Query.ParamByName('AgenciaId').AsInteger := AAgenciaId;
      Query.ParamByName('NumeroConta').AsString := ANumeroConta;
      Query.ParamByName('DataUltimoMovimento').AsDateTime := ADataUltimoMovimento;
      Query.ParamByName('Saldo').AsCurrency := ASaldo;
      Query.ParamByName('Observacoes').AsString := AObservacoes;
      Query.Open;
      Result := Query.FieldByName('NewId').AsInteger;
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

procedure TModelConta.Alterar(AContaId: Integer; ANumeroConta: String;
      ADataUltimoMovimento: TDateTime; ASaldo: Currency; AObservacoes: String);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('UPDATE Conta');
      Query.SQL.Add('SET NumeroConta = :NumeroConta, DataUltimoMovimento = :DataUltimoMovimento, Saldo = :Saldo, Observacoes = :Observacoes');
      Query.SQL.Add('WHERE ContaId = :ContaId');
      Query.ParamByName('ContaId').AsInteger := AContaId;
      Query.ParamByName('NumeroConta').AsString := ANumeroConta;
      Query.ParamByName('DataUltimoMovimento').AsDateTime := ADataUltimoMovimento;
      Query.ParamByName('Saldo').AsCurrency := ASaldo;
      Query.ParamByName('Observacoes').AsString := AObservacoes;
      Query.ExecSQL;
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

procedure TModelConta.Excluir(AContaId: Integer);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('DELETE FROM Conta WHERE ContaId = :ContaId');
      Query.Params.ParamByName('ContaId').AsInteger := AContaId;
      Query.ExecSQL();
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

end.
