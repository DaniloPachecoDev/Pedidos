unit uClienteModel;

interface

uses
  System.SysUtils;

type TCliente = class
  private
    FID: Integer;
    FNome: String;
    FTipo: String;
    FInscricao: String;
    FNumero: String;
    FStatus: Integer;
    FComplemento: String;
    FLimite: Double;
    FEndereco: String;
    FCEP: Integer;

    procedure SetNome(const Value: String);
    procedure SetLimite(const Value: Double);
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property Tipo: String read FTipo write FTipo;
    property Inscricao: String read FInscricao write FInscricao;
    property Endereco: String read FEndereco write FEndereco;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Status: Integer read FStatus write FStatus;
    property Limite: Double read FLimite write SetLimite;
    property CEP: Integer read FCEP write FCEP;

end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  {if Value = EmptyStr then
    raise Exception.Create('Nome está vazio');}

  FNome := Value;
end;

procedure TCliente.SetLimite(const Value: Double);
begin
  {if Value <= 0 then
    raise Exception.Create('Limite do cliente 0 ou inferior.');}

  FLimite := Value;
end;

end.
