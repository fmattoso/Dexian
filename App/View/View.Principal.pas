unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ActnCtrls, DAO.Relatorio, System.ImageList, Vcl.ImgList;

type
  TFrmPrincipal = class(TForm)
    TlBrPrincipal: TToolBar;
    TlBttnCadastroAgencias: TToolButton;
    ActnLst: TActionList;
    ActnAgencia: TAction;
    TlBttnCadastroContas: TToolButton;
    ActnConta: TAction;
    TlBttnRelatorio: TToolButton;
    ActnRelatorio: TAction;
    ImgLstPrincipal: TImageList;
    procedure ActnAgenciaExecute(Sender: TObject);
    procedure ActnContaExecute(Sender: TObject);
    procedure ActnAgenciasExecute(Sender: TObject);
    procedure ActnRelatorioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses View.ConsultaAgencia, View.ConsultaConta;

procedure TFrmPrincipal.ActnAgenciaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaAgencia, FrmConsultaAgencia);
  FrmConsultaAgencia.ShowModal;
end;

procedure TFrmPrincipal.ActnAgenciasExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaAgencia, FrmConsultaAgencia);
  FrmConsultaAgencia.ShowModal;
end;

procedure TFrmPrincipal.ActnContaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaConta, FrmConsultaConta);
  FrmConsultaConta.ShowModal;
end;

procedure TFrmPrincipal.ActnRelatorioExecute(Sender: TObject);
begin
  DMRelatorio.Report.ShowReport();
end;

end.
