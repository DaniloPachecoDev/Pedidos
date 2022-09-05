unit uFornecedorModel;

interface

uses
  System.SysUtils;

type TFornecedor = class
  private
    FID: Integer;
    FRazao: String;
    FInscricao: String;
    procedure SetRazao(const Value: String);

  public
    property ID: Integer read FID write FID;
    property Razao: String read FRazao write SetRazao;
    property Inscricao: String read FInscricao write FInscricao;

end;

implementation

{ TFornecedor }

procedure TFornecedor.SetRazao(const Value: String);
begin
  {if Value = EmptyStr then
    raise Exception.Create('Razão Social está vazio');}

  FRazao := Value;
end;

end.

