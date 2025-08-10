unit View.Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TFrmConsulta = class(TForm)
    PnlMenu: TPanel;
    BttnFiltrar: TButton;
    BttnTodos: TButton;
    BttnIncluir: TButton;
    BttnAlterar: TButton;
    BttnExcluir: TButton;
    BttnConsultar: TButton;
    BttnSair: TButton;
    PnlConsulta: TPanel;
    DBGrdConsulta: TDBGrid;
    DtSrcConsulta: TDataSource;
    ImgLstConsulta: TImageList;
    procedure DtSrcConsultaDataChange(Sender: TObject; Field: TField);
    procedure BttnExcluirClick(Sender: TObject);
    procedure BttnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoExcluir; virtual;
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

procedure TFrmConsulta.BttnExcluirClick(Sender: TObject);
var
  DlgResult: Integer;
begin
  DlgResult := MessageDlg('Deseja excluir esse registro?', mtConfirmation,
    [mbYes, mbNo], 0, mbNo);
  if DlgResult = mrYes then
    DoExcluir;
end;

procedure TFrmConsulta.DtSrcConsultaDataChange(Sender: TObject; Field: TField);
begin
  with (Sender as TDataSource) do
  begin
    BttnFiltrar.Enabled := (DataSet <> nil) and (DataSet.RecordCount > 0);
    BttnIncluir.Enabled := (DataSet <> nil);
    BttnAlterar.Enabled := BttnFiltrar.Enabled;
    BttnExcluir.Enabled := BttnFiltrar.Enabled;
    BttnConsultar.Enabled := BttnFiltrar.Enabled;
    DBGrdConsulta.Visible := BttnFiltrar.Enabled;
  end;
end;

procedure TFrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := nil;
end;

procedure TFrmConsulta.BttnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmConsulta.DoExcluir;
begin;
end;

end.
