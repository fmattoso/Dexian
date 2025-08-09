unit DAO.Relatorio;

interface

uses
  System.SysUtils, System.Classes, DAO.Conexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frCoreClasses;

type
  TDMRelatorio = class(TDataModule)
    Report: TfrxReport;
    DtstAgencia: TfrxDBDataset;
    QryAgencia: TFDQuery;
    DtSrcAgencia: TDataSource;
    QryConta: TFDQuery;
    DtstConta: TfrxDBDataset;
    QryAgenciaAgenciaId: TFDAutoIncField;
    QryAgenciaNomeBanco: TStringField;
    QryAgenciaAgencia: TStringField;
    QryAgenciaDataCriacao: TSQLTimeStampField;
    QryAgenciaDataAtualizacao: TSQLTimeStampField;
    QryContaContaId: TFDAutoIncField;
    QryContaAgenciaId: TIntegerField;
    QryContaNumeroConta: TStringField;
    QryContaDataUltimoMovimento: TSQLTimeStampField;
    QryContaSaldo: TCurrencyField;
    QryContaObservacoes: TStringField;
    QryContaDataCriacao: TSQLTimeStampField;
    QryContaDataAtualizacao: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorio: TDMRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
