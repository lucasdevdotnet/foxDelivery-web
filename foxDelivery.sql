--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      zdxsdds
-- Project :      finaceira.DM1
-- Author :       lucasbsil_rs@hotmail.com
--
-- Date Created : Saturday, November 02, 2024 16:34:35
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: "AgendaPedido" 
--

CREATE TABLE "AgendaPedido"(
    "Id"                  int8         NOT NULL,
    "Data"                timestamp,
    "Situacao"            char(10),
    "idProduto"           int8         NOT NULL,
    "idCategoria"         int8         NOT NULL,
    "idCliente"           int8         NOT NULL,
    "idCategoriaProduto"  int8         NOT NULL
)
;



-- 
-- TABLE: "Carrinho" 
--

CREATE TABLE "Carrinho"(
    "Id"                  int8    NOT NULL,
    "idPedido"            int8,
    "idCliente"           int8    NOT NULL,
    "idCategoriaProduto"  int8    NOT NULL
)
;



-- 
-- TABLE: "Categoria" 
--

CREATE TABLE "Categoria"(
    "Id"    int8            NOT NULL,
    "Nome"  varchar(100)
)
;



-- 
-- TABLE: "CategoriaProduto" 
--

CREATE TABLE "CategoriaProduto"(
    "Id"           int8    NOT NULL,
    "idCategoria"  int8    NOT NULL,
    "idProduto"    int8    NOT NULL
)
;



-- 
-- TABLE: "Clientes" 
--

CREATE TABLE "Clientes"(
    "Id"               int8            NOT NULL,
    "tentativaPedido"  int4,
    bloqueio           boolean,
    situacao           boolean,
    "e-mail"           varchar(500),
    telefone           char(20),
    cpf                char(11),
    nome               varchar(500)    NOT NULL,
    "idUsuario"        int8            NOT NULL,
    idsituacao         int8            NOT NULL
)
;



-- 
-- TABLE: "ClientesEnderecos" 
--

CREATE TABLE "ClientesEnderecos"(
    "Id"          int8        NOT NULL,
    "idEndereco"  int8        NOT NULL,
    telefone      char(10),
    "idCliente"   int8        NOT NULL
)
;



-- 
-- TABLE: "EmpresaEnderecos" 
--

CREATE TABLE "EmpresaEnderecos"(
    "Id"          int8    NOT NULL,
    "idEndereco"  int8    NOT NULL,
    "idEmpresa"   int8    NOT NULL
)
;



-- 
-- TABLE: "EmpresaHorario" 
--

CREATE TABLE "EmpresaHorario"(
    "Id"             int8         NOT NULL,
    "horarioInicio"  timestamp    NOT NULL,
    "idEmpresa"      int8         NOT NULL,
    "horarioFim"     timestamp
)
;



-- 
-- TABLE: "Empresas" 
--

CREATE TABLE "Empresas"(
    "Id"                    int8            NOT NULL,
    "MotivoBloqueio"        varchar(50),
    "dataAtualizacao"       timestamp,
    ativo                   boolean,
    "CNPJ"                  char(14)        NOT NULL,
    "NomeFantasia"          varchar(50)     NOT NULL,
    "Nome"                  varchar(100)    NOT NULL,
    "dataCadastro"          timestamp       NOT NULL,
    "idPagamentoRecebedor"  int8            NOT NULL
)
;



-- 
-- TABLE: "Endereco" 
--

CREATE TABLE "Endereco"(
    "Id"           int8              NOT NULL,
    cep            char(50),
    logradouro     varchar(50),
    numero         varchar(10),
    complemento    varchar(50),
    telefone       decimal(10, 0),
    longitude      decimal(10, 0),
    "Bairro"       varchar(10)       NOT NULL,
    "Cidade"       varchar(10)       NOT NULL,
    estado         char(10),
    nome           char(10)
)
;



-- 
-- TABLE: "FechamentoPedido" 
--

CREATE TABLE "FechamentoPedido"(
    "Id"             int8           NOT NULL,
    "idPedido"       int8           NOT NULL,
    "numeroPedido"   int8           NOT NULL,
    "tipoPagamento"  int4,
    "idEmpresa"      int8           NOT NULL,
    telefone         varchar(15),
    cpf              char(11)       NOT NULL,
    nome             varchar(50)    NOT NULL
)
;



-- 
-- TABLE: "FilaPedido" 
--

CREATE TABLE "FilaPedido"(
    "idFechamentoPedido"  int8         NOT NULL,
    "numeroPedido"        char(10),
    "Id"                  int8         NOT NULL,
    "idSituacaoPedido"    int8,
    "HorarioEntrega"      timestamp,
    "tipoPagamento"       int8         NOT NULL,
    "idEmpresa"           int8         NOT NULL
)
;



-- 
-- TABLE: "PagamentosRecebedor" 
--

CREATE TABLE "PagamentosRecebedor"(
    "Id"               int8        NOT NULL,
    "idTipoPagamento"  int8        NOT NULL,
    "CNPJ"             char(10),
    "dataCadastro"     char(10)
)
;



-- 
-- TABLE: "Pedido" 
--

CREATE TABLE "Pedido"(
    "idCategoriaProduto"  int8         NOT NULL,
    "idCliente"           int8         NOT NULL,
    "Id"                  int8         NOT NULL,
    "idSituacaoPedido"    int4         NOT NULL,
    "numeroPedido"        int8         NOT NULL,
    quantidade            int4         NOT NULL,
    "dataPedido"          timestamp    NOT NULL,
    "idEndereco"          int8         NOT NULL
)
;



-- 
-- TABLE: "Produto" 
--

CREATE TABLE "Produto"(
    "Id"               int8              NOT NULL,
    "dataAtualizacao"  timestamp,
    situacao           boolean,
    "dataCadastro"     timestamp,
    descricao          varchar(50),
    quantidade         int4,
    valor              decimal(10, 0),
    "Nome"             varchar(100)
)
;



-- 
-- TABLE: "PromocaoProduto" 
--

CREATE TABLE "PromocaoProduto"(
    "Id"                  int8               NOT NULL,
    "idProduto"           int8               NOT NULL,
    porcentagem           int4,
    "ehPromocional"       boolean,
    "Nome"                decimal(100, 0),
    "valorProcomocional"  decimal(10, 0)
)
;



-- 
-- TABLE: "SituacaoFilaPedido" 
--

CREATE TABLE "SituacaoFilaPedido"(
    "Id"        int8        NOT NULL,
    "idPedido"  char(10)
)
;



-- 
-- TABLE: "SituacaoPedido" 
--

CREATE TABLE "SituacaoPedido"(
    "Id"        int8        NOT NULL,
    "idPedido"  char(10)
)
;



-- 
-- TABLE: "TipoPagamento" 
--

CREATE TABLE "TipoPagamento"(
    "Id"            int8           NOT NULL,
    descricao       varchar(20),
    "dataCadastro"  timestamp
)
;



-- 
-- TABLE: "TipoPagamentoPix" 
--

CREATE TABLE "TipoPagamentoPix"(
    "Id"               int8             NOT NULL,
    "CNPJ"             varchar(4000),
    "dataCadastro"     timestamp,
    "idTipoPagamento"  int8             NOT NULL
)
;



-- 
-- TABLE: "Usuario" 
--

CREATE TABLE "Usuario"(
    "Id"          int8            NOT NULL,
    idsituacao    int8            NOT NULL,
    situacao      int4,
    "e-mail"      varchar(500),
    login         char(20),
    senha         char(11)
)
;



-- 
-- TABLE: "UsuarioSituacao" 
--

CREATE TABLE "UsuarioSituacao"(
    "Id"         int8        NOT NULL,
    descricao    char(10)
)
;



-- 
-- INDEX: "Ref59285" 
--

CREATE INDEX "Ref59285" ON "AgendaPedido"("Id", "idCliente", "idCategoriaProduto")
;
-- 
-- INDEX: "Ref59271" 
--

CREATE INDEX "Ref59271" ON "Carrinho"("Id", "idCliente", "idCategoriaProduto")
;
-- 
-- INDEX: "Ref48277" 
--

CREATE INDEX "Ref48277" ON "CategoriaProduto"("idProduto")
;
-- 
-- INDEX: "Ref58253" 
--

CREATE INDEX "Ref58253" ON "CategoriaProduto"("idCategoria")
;
-- 
-- INDEX: "Ref76291" 
--

CREATE INDEX "Ref76291" ON "Clientes"("idUsuario", idsituacao)
;
-- 
-- INDEX: "Ref61257" 
--

CREATE INDEX "Ref61257" ON "ClientesEnderecos"("idEndereco")
;
-- 
-- INDEX: "Ref60258" 
--

CREATE INDEX "Ref60258" ON "ClientesEnderecos"("idCliente")
;
-- 
-- INDEX: "Ref61278" 
--

CREATE INDEX "Ref61278" ON "EmpresaEnderecos"("idEndereco")
;
-- 
-- INDEX: "Ref56279" 
--

CREATE INDEX "Ref56279" ON "EmpresaEnderecos"("idEmpresa")
;
-- 
-- INDEX: "Ref56280" 
--

CREATE INDEX "Ref56280" ON "EmpresaHorario"("idEmpresa")
;
-- 
-- INDEX: "Ref65275" 
--

CREATE INDEX "Ref65275" ON "Empresas"("idPagamentoRecebedor")
;
-- 
-- INDEX: "Ref75289" 
--

CREATE INDEX "Ref75289" ON "FechamentoPedido"("Id")
;
-- 
-- INDEX: "Ref71295" 
--

CREATE INDEX "Ref71295" ON "FilaPedido"("idFechamentoPedido")
;
-- 
-- INDEX: "Ref80296" 
--

CREATE INDEX "Ref80296" ON "FilaPedido"("idSituacaoPedido")
;
-- 
-- INDEX: "Ref66273" 
--

CREATE INDEX "Ref66273" ON "PagamentosRecebedor"("idTipoPagamento")
;
-- 
-- INDEX: "Ref62267" 
--

CREATE INDEX "Ref62267" ON "Pedido"("Id", "idEndereco", "idCliente")
;
-- 
-- INDEX: "Ref71290" 
--

CREATE INDEX "Ref71290" ON "Pedido"("Id")
;
-- 
-- INDEX: "Ref57256" 
--

CREATE INDEX "Ref57256" ON "Pedido"("idCategoriaProduto")
;
-- 
-- INDEX: "Ref60259" 
--

CREATE INDEX "Ref60259" ON "Pedido"("idCliente")
;
-- 
-- INDEX: "Ref48276" 
--

CREATE INDEX "Ref48276" ON "PromocaoProduto"("idProduto")
;
-- 
-- INDEX: "Ref66272" 
--

CREATE INDEX "Ref66272" ON "TipoPagamentoPix"("idTipoPagamento")
;
-- 
-- INDEX: "Ref77292" 
--

CREATE INDEX "Ref77292" ON "Usuario"(idsituacao)
;
-- 
-- TABLE: "Categoria" 
--

ALTER TABLE "Categoria" ADD 
    CONSTRAINT "PK1_1_1_2_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "CategoriaProduto" 
--

ALTER TABLE "CategoriaProduto" ADD 
    CONSTRAINT "PK1_1_1_2" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "Clientes" 
--

ALTER TABLE "Clientes" ADD 
    CONSTRAINT "PK1_1_1_3_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "ClientesEnderecos" 
--

ALTER TABLE "ClientesEnderecos" ADD 
    CONSTRAINT "PK1_1_1_3_1_2" PRIMARY KEY ("Id", "idEndereco", "idCliente")
;

-- 
-- TABLE: "EmpresaEnderecos" 
--

ALTER TABLE "EmpresaEnderecos" ADD 
    CONSTRAINT "PK1_1_1_3_1_2_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "EmpresaHorario" 
--

ALTER TABLE "EmpresaHorario" ADD 
    CONSTRAINT "PK1_1_1_3_1_2_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "Empresas" 
--

ALTER TABLE "Empresas" ADD 
    CONSTRAINT "PK1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "Endereco" 
--

ALTER TABLE "Endereco" ADD 
    CONSTRAINT "PK1_1_1_3_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "FechamentoPedido" 
--

ALTER TABLE "FechamentoPedido" ADD 
    CONSTRAINT "PK1_1_1_3_1_3_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "FilaPedido" 
--

ALTER TABLE "FilaPedido" ADD 
    CONSTRAINT "PK1_1_1_3_1_3_1_1_1_1_1" PRIMARY KEY ("idFechamentoPedido", "Id")
;

-- 
-- TABLE: "PagamentosRecebedor" 
--

ALTER TABLE "PagamentosRecebedor" ADD 
    CONSTRAINT "PK1_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "Pedido" 
--

ALTER TABLE "Pedido" ADD 
    CONSTRAINT "PK1_1_1_3" PRIMARY KEY ("idCategoriaProduto", "idCliente", "Id")
;

-- 
-- TABLE: "Produto" 
--

ALTER TABLE "Produto" ADD 
    CONSTRAINT "PK1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "PromocaoProduto" 
--

ALTER TABLE "PromocaoProduto" ADD 
    CONSTRAINT "PK1_1_1_2_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "SituacaoFilaPedido" 
--

ALTER TABLE "SituacaoFilaPedido" ADD 
    CONSTRAINT "PK1_1_1_3_1_3_1_1_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "SituacaoPedido" 
--

ALTER TABLE "SituacaoPedido" ADD 
    CONSTRAINT "PK1_1_1_3_1_3_1_1_1_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "TipoPagamento" 
--

ALTER TABLE "TipoPagamento" ADD 
    CONSTRAINT "PK1_1_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "TipoPagamentoPix" 
--

ALTER TABLE "TipoPagamentoPix" ADD 
    CONSTRAINT "PK1_1_1_1_1_1_1" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "Usuario" 
--

ALTER TABLE "Usuario" ADD 
    CONSTRAINT "PK1_1_1_3_1_3" PRIMARY KEY ("Id", idsituacao)
;

-- 
-- TABLE: "UsuarioSituacao" 
--

ALTER TABLE "UsuarioSituacao" ADD 
    CONSTRAINT "PK1_1_1_3_1_1_2" PRIMARY KEY ("Id")
;

-- 
-- TABLE: "AgendaPedido" 
--

ALTER TABLE "AgendaPedido" ADD CONSTRAINT "RefPedido285" 
    FOREIGN KEY ("idCategoriaProduto", "idCliente", "Id")
    REFERENCES "Pedido"("idCategoriaProduto", "idCliente", "Id")
;


-- 
-- TABLE: "Carrinho" 
--

ALTER TABLE "Carrinho" ADD CONSTRAINT "RefPedido271" 
    FOREIGN KEY ("idCategoriaProduto", "idCliente", "Id")
    REFERENCES "Pedido"("idCategoriaProduto", "idCliente", "Id")
;


-- 
-- TABLE: "CategoriaProduto" 
--

ALTER TABLE "CategoriaProduto" ADD CONSTRAINT "RefProduto277" 
    FOREIGN KEY ("idProduto")
    REFERENCES "Produto"("Id")
;

ALTER TABLE "CategoriaProduto" ADD CONSTRAINT "RefCategoria253" 
    FOREIGN KEY ("idCategoria")
    REFERENCES "Categoria"("Id")
;


-- 
-- TABLE: "Clientes" 
--

ALTER TABLE "Clientes" ADD CONSTRAINT "RefUsuario291" 
    FOREIGN KEY ("idUsuario", idsituacao)
    REFERENCES "Usuario"("Id", idsituacao)
;


-- 
-- TABLE: "ClientesEnderecos" 
--

ALTER TABLE "ClientesEnderecos" ADD CONSTRAINT "RefEndereco257" 
    FOREIGN KEY ("idEndereco")
    REFERENCES "Endereco"("Id")
;

ALTER TABLE "ClientesEnderecos" ADD CONSTRAINT "RefClientes258" 
    FOREIGN KEY ("idCliente")
    REFERENCES "Clientes"("Id")
;


-- 
-- TABLE: "EmpresaEnderecos" 
--

ALTER TABLE "EmpresaEnderecos" ADD CONSTRAINT "RefEndereco278" 
    FOREIGN KEY ("idEndereco")
    REFERENCES "Endereco"("Id")
;

ALTER TABLE "EmpresaEnderecos" ADD CONSTRAINT "RefEmpresas279" 
    FOREIGN KEY ("idEmpresa")
    REFERENCES "Empresas"("Id")
;


-- 
-- TABLE: "EmpresaHorario" 
--

ALTER TABLE "EmpresaHorario" ADD CONSTRAINT "RefEmpresas280" 
    FOREIGN KEY ("idEmpresa")
    REFERENCES "Empresas"("Id")
;


-- 
-- TABLE: "Empresas" 
--

ALTER TABLE "Empresas" ADD CONSTRAINT "RefPagamentosRecebedor275" 
    FOREIGN KEY ("idPagamentoRecebedor")
    REFERENCES "PagamentosRecebedor"("Id")
;


-- 
-- TABLE: "FilaPedido" 
--

ALTER TABLE "FilaPedido" ADD CONSTRAINT "RefFechamentoPedido295" 
    FOREIGN KEY ("idFechamentoPedido")
    REFERENCES "FechamentoPedido"("Id")
;

ALTER TABLE "FilaPedido" ADD CONSTRAINT "RefSituacaoFilaPedido296" 
    FOREIGN KEY ("idSituacaoPedido")
    REFERENCES "SituacaoFilaPedido"("Id")
;


-- 
-- TABLE: "PagamentosRecebedor" 
--

ALTER TABLE "PagamentosRecebedor" ADD CONSTRAINT "RefTipoPagamento273" 
    FOREIGN KEY ("idTipoPagamento")
    REFERENCES "TipoPagamento"("Id")
;


-- 
-- TABLE: "Pedido" 
--

ALTER TABLE "Pedido" ADD CONSTRAINT "RefClientesEnderecos267" 
    FOREIGN KEY ("Id", "idEndereco", "idCliente")
    REFERENCES "ClientesEnderecos"("Id", "idEndereco", "idCliente")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "RefFechamentoPedido290" 
    FOREIGN KEY ("Id")
    REFERENCES "FechamentoPedido"("Id")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "RefSituacaoPedido302" 
    FOREIGN KEY ("Id")
    REFERENCES "SituacaoPedido"("Id")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "RefCategoriaProduto256" 
    FOREIGN KEY ("idCategoriaProduto")
    REFERENCES "CategoriaProduto"("Id")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "RefClientes259" 
    FOREIGN KEY ("idCliente")
    REFERENCES "Clientes"("Id")
;


-- 
-- TABLE: "PromocaoProduto" 
--

ALTER TABLE "PromocaoProduto" ADD CONSTRAINT "RefProduto276" 
    FOREIGN KEY ("idProduto")
    REFERENCES "Produto"("Id")
;


-- 
-- TABLE: "TipoPagamentoPix" 
--

ALTER TABLE "TipoPagamentoPix" ADD CONSTRAINT "RefTipoPagamento272" 
    FOREIGN KEY ("idTipoPagamento")
    REFERENCES "TipoPagamento"("Id")
;


-- 
-- TABLE: "Usuario" 
--

ALTER TABLE "Usuario" ADD CONSTRAINT "RefUsuarioSituacao292" 
    FOREIGN KEY (idsituacao)
    REFERENCES "UsuarioSituacao"("Id")
;


