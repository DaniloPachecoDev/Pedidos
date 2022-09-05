unit uFrmPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBCtrls;

type
  TFrmPadrao = class(TForm)
    PanelBotoes: TPanel;
    PanelPrincipal: TPanel;
    BtnNovo: TBitBtn;
    BtnEdita: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancela: TBitBtn;
    BtnSair: TBitBtn;
    dsPadrao: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BtnConfirma: TBitBtn;
    DBGridDados: TDBGrid;
    PnlCabecalho: TPanel;
    EditPesqNome: TEdit;
    lblPesquisa: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    procedure HabilitaComponentes(pStatus: Boolean);
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  try
    dsPadrao.DataSet.Open;
    Habilita;
    HabilitaComponentes(False);
  except
    on e: Exception do
    begin
      ShowMessage('Erro ao conectar base de dados' +#13+
                  'Erro : ' + E.Message +#13+
                  'Classe : ' + E.ClassName);
    end;
  end;
end;

procedure TFrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(27) then
    Close;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmPadrao.BtnCancelaClick(Sender: TObject);
begin
  with dsPadrao.Dataset do
  begin
    Cancel;
    Filtered := False;
  end;
  Habilita;
  HabilitaComponentes(False);
end;

procedure TFrmPadrao.BtnConfirmaClick(Sender: TObject);
begin
  //dsPadrao.dataset.Post;

  Habilita;
  HabilitaComponentes(False);
end;

procedure TFrmPadrao.BtnEditaClick(Sender: TObject);
begin
  dsPadrao.dataset.edit;

  Habilita;
  HabilitaComponentes(True);
end;

procedure TFrmPadrao.BtnExcluirClick(Sender: TObject);
var
  Resp: Integer;
begin
  Resp := MessageBoxEx(Handle,'Deseja Excluir o registro?', 'Confirmação', MB_YESNO,LANG_PORTUGUESE);
  case Resp of
    IDYES: dsPadrao.dataset.delete;
  end;

  Habilita;
  HabilitaComponentes(False);
end;

procedure TFrmPadrao.BtnNovoClick(Sender: TObject);
begin
  dsPadrao.dataset.insert;
  Habilita;
  HabilitaComponentes(True);
end;

procedure TFrmPadrao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadrao.Habilita;
begin
  BtnNovo.Enabled     := not(dsPadrao.DataSet.State in [dsInsert, dsEdit]);
  BtnConfirma.Enabled := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
  BtnEdita.Enabled    := (dsPadrao.DataSet.State in [dsBrowse]);
  BtnExcluir.Enabled  := (dsPadrao.DataSet.State in [dsBrowse, dsEdit]);
  BtnCancela.Enabled  := (dsPadrao.DataSet.State in [dsInsert, dsEdit]);
  //BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TFrmPadrao.HabilitaComponentes(pStatus: Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).Enabled := pStatus
    else if Components[I] is TDBLookupComboBox then
      TDBLookupComboBox(Components[I]).Enabled := pStatus
    else if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).Enabled := pStatus
    else if Components[I] is TDBMemo then
      TDBMemo(Components[I]).Enabled := pStatus;
  end;
end;

end.
