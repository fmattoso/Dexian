unit Model.Agencia;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.DApt, Data.DB;

type
  TModelAgencia = class
  private
    FQuery: TFDQuery;

    procedure ConfigurarQueryBase;
  public
    constructor Create(AConnection: TFDConnection);
    destructor Destroy; override;

    function ListarTodos: TFDQuery;
    function Bancos: TFDQuery;
    function Filtrar(ACampos: Array of String; AValorIni: Array of Variant;
      AValorFim: Array of Variant): TFDQuery;
    function ListarPorID(AAgenciaId: Integer; out ANomeBanco, AAgencia: String;
      out ADataCriacao, ADataAtualizacao: TDateTime): Boolean;
    function Incluir(ANomeBanco, AAgencia: String): Integer;
    procedure Alterar(AAgenciaId: Integer; ANomeBanco, AAgencia: String);
    procedure Excluir(AAgenciaId: Integer);

  end;

implementation

{ TModelAgencia }
constructor TModelAgencia.Create(AConnection: TFDConnection);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := AConnection;
end;

destructor TModelAgencia.Destroy;
begin
  FQuery.Free;
  inherited;
end;

procedure TModelAgencia.ConfigurarQueryBase;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add
    ('SELECT AgenciaId, NomeBanco, Agencia, DataCriacao, DataAtualizacao');
  FQuery.SQL.Add('FROM Agencia');
end;

function TModelAgencia.ListarTodos: TFDQuery;
begin
  ConfigurarQueryBase;
  FQuery.SQL.Add('ORDER BY NomeBanco, Agencia');
  FQuery.Open;
  Result := FQuery;
end;

function TModelAgencia.Bancos: TFDQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add
    ('SELECT DISTINCT NomeBanco');
  FQuery.SQL.Add('FROM Agencia');
  FQuery.SQL.Add('ORDER BY NomeBanco');
  FQuery.Open;
  Result := FQuery;
end;

function TModelAgencia.Filtrar(ACampos: Array of String;
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
      SQL := 'WHERE ' + Condicao
    else
      SQL := SQL + ' AND ' + Condicao;
  end;

  ConfigurarQueryBase;
  if Pos('WHERE', SQL) > 0 then
    FQuery.SQL.Add(SQL);
  FQuery.SQL.Add('ORDER BY NomeBanco, Agencia');
  FQuery.Open;
  Result := FQuery;
end;

function TModelAgencia.ListarPorID(AAgenciaId: Integer; out ANomeBanco: string;
  out AAgencia: string; out ADataCriacao, ADataAtualizacao: TDateTime): Boolean;
begin
  ConfigurarQueryBase;
  FQuery.SQL.Add('WHERE AgenciaId = :AgenciaId');
  FQuery.ParamByName('AgenciaId').AsInteger := AAgenciaId;
  FQuery.Open;

  Result := not FQuery.IsEmpty;
  if Result then
  begin
    ANomeBanco := FQuery.FieldByName('NomeBanco').AsString;
    AAgencia := FQuery.FieldByName('Agencia').AsString;
    ADataCriacao := FQuery.FieldByName('DataCriacao').AsDateTime;
    ADataAtualizacao := FQuery.FieldByName('DataAtualizacao').AsDateTime;
  end;
end;

function TModelAgencia.Incluir(ANomeBanco: string; AAgencia: string): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('INSERT INTO Agencia (NomeBanco, Agencia)');
      Query.SQL.Add('VALUES (:NomeBanco, :Agencia);');
      Query.SQL.Add('SELECT SCOPE_IDENTITY() AS NewId;');
      Query.ParamByName('NomeBanco').AsString := ANomeBanco;
      Query.ParamByName('Agencia').AsString := AAgencia;
      Query.Open;
      Result := Query.FieldByName('NewId').AsInteger;
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

procedure TModelAgencia.Alterar(AAgenciaId: Integer;
  ANomeBanco, AAgencia: String);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('UPDATE Agencia');
      Query.SQL.Add('SET NomeBanco = :NomeBanco, Agencia = :Agencia');
      Query.SQL.Add('WHERE AgenciaId = :AgenciaId');
      Query.ParamByName('AgenciaId').AsInteger := AAgenciaId;
      Query.ParamByName('NomeBanco').AsString := ANomeBanco;
      Query.ParamByName('Agencia').AsString := AAgencia;
      Query.ExecSQL;
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

procedure TModelAgencia.Excluir(AAgenciaId: Integer);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FQuery.Connection;
  try
    try
      Query.SQL.Clear;
      Query.SQL.Add('DELETE FROM Agencia WHERE AgenciaId = :AgenciaId');
      Query.Params.ParamByName('AgenciaId').AsInteger := AAgenciaId;
      Query.ExecSQL();
    except
      raise;
    end;
  finally
    Query.Free;
  end;
end;

end.
