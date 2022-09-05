unit uProdutoModel;

interface

uses
  System.SysUtils;

type TProduto = class
  private
    FID: Integer;
    FDescricao: String;
    FValor: Double;
    FCodForn: Integer;
    FCodigo: Integer;
    procedure SetDescricao(const Value: String);

  public
    property ID: Integer read FID write FID;
    property Descricao: String read FDescricao write SetDescricao;
    property Valor: Double read FValor write FValor;
    property CodForn: Integer read FCodForn write FCodForn;
    property Codigo: Integer read FCodigo write FCodigo;

end;

implementation

{ TProduto }

procedure TProduto.SetDescricao(const Value: String);
begin
  {if Value = EmptyStr then
    raise Exception.Create('Razão Social está vazio');}

  FDescricao := Value;
end;

end.
