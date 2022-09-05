/******************************************************************************/
/*                           Banco de Dados                                   */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

CREATE DATABASE '\\127.0.0.1@gds_db\C:\Projetos_Delphi\Pedidos\Base\base.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;


SET SQL DIALECT 3;

/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/

CREATE TABLE CLIENTE (
    ID           INTEGER NOT NULL,
    NOME         VARCHAR(100) NOT NULL,
    TIPO         INTEGER NOT NULL,
    INSCRICAO    VARCHAR(14) NOT NULL,
    ENDERECO     VARCHAR(200),
    NUMERO       VARCHAR(50),
    COMPLEMENTO  VARCHAR(30),
    STATUS       INTEGER NOT NULL,
    LIMITE       FLOAT,
    CEP          INTEGER
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (ID);


CREATE TABLE FORNECEDOR (
    ID         INTEGER NOT NULL,
    RAZAO      VARCHAR(255) NOT NULL,
    INSCRICAO  VARCHAR(14) NOT NULL
);

ALTER TABLE FORNECEDOR ADD CONSTRAINT PK_FORNECEDOR PRIMARY KEY (ID);

CREATE TABLE PRODUTO (
    ID         INTEGER NOT NULL,
    DESCRICAO  VARCHAR(255) NOT NULL,
    VALOR      DECIMAL(15,2),
    CODFORN    INTEGER NOT NULL,
    CODIGO     INTEGER NOT NULL
);

ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (ID);
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_1 FOREIGN KEY (CODFORN) REFERENCES FORNECEDOR (ID);

CREATE TABLE PEDIDO (
    ID            INTEGER NOT NULL,
    NUM_PEDIDO    INTEGER NOT NULL,
    DATA_EMISSAO  DATE,
    COD_CLIENTE   INTEGER NOT NULL,
    TOT_PEDIDO    DECIMAL(15,2) NOT NULL
);

ALTER TABLE PEDIDO ADD CONSTRAINT PK_PEDIDO PRIMARY KEY (ID);
ALTER TABLE PEDIDO ADD CONSTRAINT FK_PED_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (ID);

CREATE TABLE ITEMPED (
    ID           INTEGER NOT NULL,
    ID_PEDIDO    INTEGER NOT NULL,
    COD_PRODUTO  INTEGER NOT NULL,
    QTD          INTEGER NOT NULL,
    VR_UNIT      DECIMAL(15,2) NOT NULL,
    TOT_ITEM     DECIMAL(15,2) NOT NULL
);

ALTER TABLE ITEMPED ADD CONSTRAINT PK_ITEMPED PRIMARY KEY (ID);
ALTER TABLE ITEMPED ADD CONSTRAINT FK_PED_ITEM FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ITEMPED ADD CONSTRAINT FK_PRO_ITEM FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO (ID);

CREATE TABLE PARPED (
    ID              INTEGER NOT NULL,
    ID_PEDIDO       INTEGER NOT NULL,
    FORMA_PAG       INTEGER,
    DAT_VENCIMENTO  DATE,
    VAL_PARCELA     DECIMAL(15,2) NOT NULL
);

ALTER TABLE PARPED ADD CONSTRAINT PK_PARPED PRIMARY KEY (ID);
ALTER TABLE PARPED ADD CONSTRAINT FK_PED_PARC FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO (ID) ON DELETE CASCADE ON UPDATE CASCADE;


/******************************************************************************/
/*                               Procedures                                   */
/******************************************************************************/

SET TERM ^ ;

create or alter procedure saldo_cliente (
    codcliente integer not null,
    valor decimal(15,2) not null)
as
begin
  UPDATE CLIENTE SET LIMITE = LIMITE - :Valor WHERE ID = :CODCLIENTE;
  suspend;
end^

SET TERM ; ^

GRANT SELECT,UPDATE ON CLIENTE TO PROCEDURE SALDO_CLIENTE;
GRANT EXECUTE ON PROCEDURE SALDO_CLIENTE TO SYSDBA;