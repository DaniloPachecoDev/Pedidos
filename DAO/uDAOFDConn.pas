unit uDAOFDConn;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  System.IniFiles, Vcl.Forms, FireDAC.Comp.DataSet, Vcl.Dialogs,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDAOFDConn = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    FConexao: TFDConnection;
  public
    pConfiguracao: Boolean;
    function GetConexao: TFDConnection;
  end;

var
  DAOFDConn: TDAOFDConn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDAOFDConn.DataModuleCreate(Sender: TObject);
var
  Arquivo, Server, Path, Driver, User, Password: String;
  Config: TIniFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + 'base.ini';
  pConfiguracao     := False;
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Não existe arquivo "BASE.INI" com as informações.');
    exit;
  end;

  config := TIniFile.Create(Arquivo);
  try
    Path     := Config.ReadString('Parametro', 'DataBase', Path);
    Driver   := Config.ReadString('Parametro', 'Driver', Driver);
    User     := Config.ReadString('Parametro', 'User', User);
    Password := Config.ReadString('Parametro', 'Password', Password);
  finally
    Config.Free;
  end;

  try
   FDConnection.Params.DriverID := Driver;
   FDConnection.Params.Database := Path;
   FDConnection.Params.UserName := User;
   FDConnection.Params.Password := Password;
   FDConnection.LoginPrompt := False;
   FDConnection.Connected := True;
   FConexao := FDConnection;
   pConfiguracao     := True;
   except on E: Exception do
     ShowMessage('Erro ao conectar com o banco de dados.'+#13+E.Message);
   end;
end;

function TDAOFDConn.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;




end.
