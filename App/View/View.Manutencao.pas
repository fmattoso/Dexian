unit View.Manutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, System.ImageList, Vcl.ImgList;

type
  TFrmManutencao = class(TForm)
    PnlMenu: TPanel;
    BttnRestaurar: TButton;
    BttnSalvar: TButton;
    BttnSair: TButton;
    DBNvManutencao: TDBNavigator;
    ImgLstManutencao: TImageList;
    procedure BttnSairClick(Sender: TObject);
  private
    { Private declarations }
    Fid: Integer;
    FModo: Char;
    FDataSource: TDataSource;

    procedure SetId(Value: Integer);
    procedure SetDataSource(Value: TDataSource);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADataSource: TDataSource;
      AModo: Char = 'I'; AId: Integer = -1); overload;
    destructor Destroy; override;

    property Id: Integer read Fid write SetId;
    property Modo: Char read FModo;
    property ConsultaDataSource: TDataSource read FDataSource
      write SetDataSource;
  end;

var
  FrmManutencao: TFrmManutencao;

implementation

{$R *.dfm}

procedure TFrmManutencao.BttnSairClick(Sender: TObject);
begin
  Close;
end;

constructor TFrmManutencao.Create(AOwner: TComponent; ADataSource: TDataSource;
  AModo: Char = 'I'; AId: Integer = -1);
begin
  inherited Create(AOwner);

  Fid := AId;
  FModo := AModo;
  FDataSource := ADataSource;
  DBNvManutencao.DataSource := ADataSource;
  BttnRestaurar.Enabled := (FModo = 'A');
  DBNvManutencao.Enabled := (FModo = 'C');
end;

destructor TFrmManutencao.Destroy;
begin
  DBNvManutencao.DataSource := nil;
  inherited;
end;

procedure TFrmManutencao.SetId(Value: Integer);
begin
  Fid := Value;
end;

procedure TFrmManutencao.SetDataSource(Value: TDataSource);
begin
  FDataSource := Value;
end;

end.
