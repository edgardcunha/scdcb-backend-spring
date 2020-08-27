--DROP TABLE IF EXISTS administradores;

CREATE TABLE "administradores" (
  "permissoes" int NOT NULL,
  "cd_usuario" int NOT NULL,
  PRIMARY KEY ("cd_usuario"),
  --CONSTRAINT "FKnq1oihn3991k0k4egwsg10hqx" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios" ("cd_usuario")
);

DROP TABLE IF EXISTS bairros;

CREATE TABLE bairros (
  "id" int NOT NULL ,
  "nome" varchar(50) DEFAULT NULL,
  "cidade_id" int NOT NULL,
  PRIMARY KEY ("id"),
  --CONSTRAINT "FK3s14bep9kl8hgm37jyvrf77ni" FOREIGN KEY ("cidade_id") REFERENCES "cidades" ("id")
);

DROP TABLE IF EXISTS "beneficiados";

CREATE TABLE "beneficiados" (
  "npf" int DEFAULT NULL,
  "num_casa" int DEFAULT NULL,
  "rua" varchar(50) DEFAULT NULL,
  "cd_usuario" int NOT NULL,
  "cd_bairro" int NOT NULL,
  PRIMARY KEY ("cd_usuario"),
  --CONSTRAINT "FKmuscep6cww8ewl7tbomkj9kp7" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios" ("cd_usuario"),
  --CONSTRAINT "FKtgihf48o08umkoh68qhgrt0aj" FOREIGN KEY ("cd_bairro") REFERENCES "bairros" ("id")
);

DROP TABLE IF EXISTS "cidades";

CREATE TABLE "cidades" (
  "id" SERIAL,
  "nome" varchar(50) DEFAULT NULL,
  "uf_id" int NOT NULL,
  PRIMARY KEY ("id"),
  --CONSTRAINT "FK2l4ctxe8bqvgw2qg93np3pjyu" FOREIGN KEY ("uf_id") REFERENCES "ufs" ("id")
);

DROP TABLE IF EXISTS "doadores";

CREATE TABLE "doadores" (
  "cpf" varchar(50) DEFAULT NULL,
  "dt_nascimento" datetime(6) NOT NULL,
  "num_casa" int DEFAULT NULL,
  "rua" varchar(50) DEFAULT NULL,
  "cd_usuario" int NOT NULL,
  "cd_bairro" int NOT NULL,
  PRIMARY KEY ("cd_usuario"),
  --CONSTRAINT "FK8qqf7xwpdgjhkc1kx2m7twk6q" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios" ("cd_usuario"),
  --CONSTRAINT "FKpyb7p6y0ovrtg1so3nny3adfh" FOREIGN KEY ("cd_bairro") REFERENCES "bairros" ("id")
);

DROP TABLE IF EXISTS "entregas";

CREATE TABLE "entregas" (
  "cd_entrega" SERIAL,
  "documento" varchar(150) NOT NULL,
  "dt_entrega" datetime(6) NOT NULL,
  "qtd_cestas" int DEFAULT NULL,
  "cd_solicitacao" int NOT NULL,
  PRIMARY KEY ("cd_entrega"),
  --CONSTRAINT "FKm572qlbh3exe4v41kb1estlal" FOREIGN KEY ("cd_solicitacao") REFERENCES "solicitacoes" ("cd_solicitacao")
);

DROP TABLE IF EXISTS "instituicoes";

CREATE TABLE "instituicoes" (
  "cnpj" varchar(50) DEFAULT NULL,
  "limite_doacoes" int NOT NULL,
  "num_imovel" int DEFAULT NULL,
  "rua" varchar(50) DEFAULT NULL,
  "cd_usuario" int NOT NULL,
  "cd_bairro" int NOT NULL,
  PRIMARY KEY ("cd_usuario"),
  --CONSTRAINT "FKi2wloymhmdhkj23wjebav9vxf" FOREIGN KEY ("cd_bairro") REFERENCES "bairros" ("id"),
  --CONSTRAINT "FKm5jn4kbwf1be99ku8pskawutm" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios" ("cd_usuario")
);

DROP TABLE IF EXISTS "intencoes";

CREATE TABLE "intencoes" (
  "cd_intencao" SERIAL,
  "codigo" varchar(8) DEFAULT NULL,
  "dt_intencao" date NOT NULL,
  "qtd_cestas" int NOT NULL,
  "status" int NOT NULL,
  "cd_doador" int NOT NULL,
  "cd_instituicao" int NOT NULL,
  "tp_cesta" int NOT NULL,
  PRIMARY KEY ("cd_intencao"),
  --CONSTRAINT "FKgnsw0c6sgg99qm0shypgy4h0" FOREIGN KEY ("cd_doador") REFERENCES "doadores" ("cd_usuario"),
  --CONSTRAINT "FKhwhpu2pcmk1itd67u7lclg2es" FOREIGN KEY ("cd_instituicao") REFERENCES "instituicoes" ("cd_usuario"),
  --CONSTRAINT "FKjn75uhbdgdtd80o307xb1dhei" FOREIGN KEY ("tp_cesta") REFERENCES "tipos_cesta" ("id")
);

DROP TABLE IF EXISTS "recebimentos";

CREATE TABLE "recebimentos" (
  "cd_recebimento" SERIAL,
  "dt_recebimento" datetime(6) NOT NULL,
  "nf_cesta" varchar(150) DEFAULT NULL,
  "qtd_cestas" int NOT NULL,
  "cd_intencao" int NOT NULL,
  PRIMARY KEY ("cd_recebimento"),
  --CONSTRAINT "FKg3bxyoanuwlvafb9f811hytfo" FOREIGN KEY ("cd_intencao") REFERENCES "intencoes" ("cd_intencao")
);

DROP TABLE IF EXISTS "solicitacoes";

CREATE TABLE "solicitacoes" (
  "cd_solicitacao" SERIAL,
  "codigo" varchar(8) DEFAULT NULL,
  "dt_solicitacao" date NOT NULL,
  "qtd_cestas" int NOT NULL,
  "status" int NOT NULL,
  "cd_beneficiado" int NOT NULL,
  "cd_instituicao" int NOT NULL,
  "cd_tp_cesta" int NOT NULL,
  PRIMARY KEY ("cd_solicitacao"),
  --CONSTRAINT "FK4h5xb8cvq8j1x0pc32jrxnie4" FOREIGN KEY ("cd_instituicao") REFERENCES "instituicoes" ("cd_usuario"),
  --CONSTRAINT "FKogb94caycej51icb7l0ra2o80" FOREIGN KEY ("cd_tp_cesta") REFERENCES "tipos_cesta" ("id"),
  --CONSTRAINT "FKt1wmx0bbvp496jm6dpj6fpor3" FOREIGN KEY ("cd_beneficiado") REFERENCES "beneficiados" ("cd_usuario")
);

DROP TABLE IF EXISTS "telefones";

CREATE TABLE "telefones" (
  "numero" varchar(50) NOT NULL,
  "cd_usuario" int DEFAULT NULL,
  PRIMARY KEY ("numero"),
  --CONSTRAINT "FKeyjt2ue3o4907j97kqx459eaj" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios" ("cd_usuario")
);

DROP TABLE IF EXISTS "tipos_cesta";

CREATE TABLE "tipos_cesta" (
  "id" SERIAL,
  "descricao" varchar(150) NOT NULL,
  "nome" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "ufs";

CREATE TABLE "ufs" (
  "id" SERIAL,
  "nome" varchar(50) DEFAULT NULL,
  "sigla" varchar(2) DEFAULT NULL,
  CONSTRAINT pk_ufs
    PRIMARY KEY ("id")
);

--DROP TABLE IF EXISTS "usuarios";

CREATE TABLE "usuarios" (
  "cd_usuario" SERIAL,
  "login" varchar(50) DEFAULT NULL,
  "nome" varchar(50) DEFAULT NULL,
  "senha" varchar(20) DEFAULT NULL,
  PRIMARY KEY ("cd_usuario")
);

DROP TABLE IF EXISTS "usuarios_telefones";

CREATE TABLE "usuarios_telefones" (
  "usuario_cd_usuario" int NOT NULL,
  "telefones_numero" varchar(50) NOT NULL,
  PRIMARY KEY ("usuario_cd_usuario","telefones_numero"),
  --CONSTRAINT "FK7udt6w3r2rg703m0ox4nc45d7" FOREIGN KEY ("telefones_numero") REFERENCES "telefones" ("numero"),
  --CONSTRAINT "FKpa3mcbbfhm1pt5m24qho9euxa" FOREIGN KEY ("usuario_cd_usuario") REFERENCES "usuarios" ("cd_usuario")
);

