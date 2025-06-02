CREATE TABLE "Aeronave" (
  "nCdAeronave" bigint PRIMARY KEY NOT NULL,
  "cAeronave" varchar(50) NOT NULL,
  "cFabricante" varchar(50),
  "nCapacPassag" integer,
  "nAnoFabricacao" integer,
  "cStatusOperac" varchar(30),
  "nDistanciaMaxKm" integer
);

CREATE TABLE "StatusOperacional" (
  "cStatusNome" varchar(30) PRIMARY KEY NOT NULL
);

CREATE TABLE "Aeroporto" (
  "nCdAeroporto" bigint PRIMARY KEY NOT NULL,
  "cNome" varchar(100) NOT NULL,
  "cEstado" varchar(2),
  "cPais" varchar(50),
  "cCdIata" varchar(3) UNIQUE,
  "cCdIcao" varchar(4) UNIQUE,
  "cFusoHorario" varchar(50)
);

CREATE TABLE "EscalaVoo" (
  "nCdEscala" bigint PRIMARY KEY NOT NULL,
  "nCdVoo" bigint NOT NULL,
  "nOrdemEscala" smallint,
  "cNomeAeroporto" varchar(100),
  "tDataPartida" timestamp,
  "tDataChegada" timestamp,
  "nCdTripulante" bigint NOT NULL
);

CREATE TABLE "Voo" (
  "nCdVoo" bigint PRIMARY KEY NOT NULL,
  "cNumeroVoo" varchar(10) NOT NULL,
  "cAeroportoOrigem" varchar(10),
  "cAeroportoDestino" varchar(10),
  "tDataPartida" timestamp,
  "tDataChegada" timestamp,
  "dPrecoTotal" decimal(10,2),
  "nDuracaoTotalMinutos" integer,
  "nCdAeronave" bigint NOT NULL,
  "nCdTripulante" bigint,
  "cStatusVoo" varchar(50)
);

CREATE TABLE "StatusVoo" (
  "cStatusNome" varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE "Passageiro" (
  "nCdPassageiro" bigint PRIMARY KEY NOT NULL,
  "cNome" varchar(100) NOT NULL,
  "cCpf" varchar(14) UNIQUE,
  "cEMail" varchar(100),
  "cTelefone" varchar(20),
  "tDataNascimento" date,
  "cNacionalidade" varchar(50)
);

CREATE TABLE "ProgramaFidelidade" (
  "nCdPrograma" bigint PRIMARY KEY NOT NULL,
  "nCdPassageiro" bigint UNIQUE NOT NULL,
  "nPontos" integer,
  "cCategoria" varchar(20),
  "tDataAdesao" date
);

CREATE TABLE "CategoriaProgrFidelidade" (
  "cCategoria" varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE "Checkin" (
  "nCdCheckin" bigint PRIMARY KEY NOT NULL,
  "nCdReserva" bigint NOT NULL,
  "tDataHoraCheckin" timestamp,
  "cAssento" varchar(5),
  "nBagagemVolume" numeric(5,2),
  "nQtdBagagem" integer,
  "cStatusCheckin" varchar(30)
);

CREATE TABLE "StatusCheckin" (
  "cStatusNome" varchar(30) PRIMARY KEY NOT NULL
);

CREATE TABLE "Reserva" (
  "nCdReserva" bigint PRIMARY KEY NOT NULL,
  "nCdVoo" bigint NOT NULL,
  "nCdPassageiro" bigint NOT NULL,
  "tDataReserva" date,
  "cStatusReserva" varchar(20),
  "cAssento" varchar(5),
  "nCdFidelidade" integer
);

CREATE TABLE "StatusReserva" (
  "cStatusReserva" varchar(20) PRIMARY KEY NOT NULL
);

CREATE TABLE "Tripulacao" (
  "nCdTripulante" bigint PRIMARY KEY NOT NULL,
  "cNome" varchar(100) NOT NULL,
  "cCpf" varchar(14) UNIQUE,
  "cCargo" varchar(50),
  "cLicenca" varchar(20),
  "tDataAdmissao" date
);

ALTER TABLE "Aeronave" ADD FOREIGN KEY ("cStatusOperac") REFERENCES "StatusOperacional" ("cStatusNome");

ALTER TABLE "EscalaVoo" ADD FOREIGN KEY ("nCdVoo") REFERENCES "Voo" ("nCdVoo");

ALTER TABLE "EscalaVoo" ADD FOREIGN KEY ("nCdTripulante") REFERENCES "Tripulacao" ("nCdTripulante");

ALTER TABLE "Voo" ADD FOREIGN KEY ("cAeroportoOrigem") REFERENCES "Aeroporto" ("cCdIata");

ALTER TABLE "Voo" ADD FOREIGN KEY ("cAeroportoDestino") REFERENCES "Aeroporto" ("cCdIata");

ALTER TABLE "Voo" ADD FOREIGN KEY ("nCdAeronave") REFERENCES "Aeronave" ("nCdAeronave");

ALTER TABLE "Voo" ADD FOREIGN KEY ("nCdTripulante") REFERENCES "Tripulacao" ("nCdTripulante");

ALTER TABLE "Voo" ADD FOREIGN KEY ("cStatusVoo") REFERENCES "StatusVoo" ("cStatusNome");

ALTER TABLE "ProgramaFidelidade" ADD FOREIGN KEY ("nCdPassageiro") REFERENCES "Passageiro" ("nCdPassageiro");

ALTER TABLE "ProgramaFidelidade" ADD FOREIGN KEY ("cCategoria") REFERENCES "CategoriaProgrFidelidade" ("cCategoria");

ALTER TABLE "Checkin" ADD FOREIGN KEY ("nCdReserva") REFERENCES "Reserva" ("nCdReserva");

ALTER TABLE "Checkin" ADD FOREIGN KEY ("cStatusCheckin") REFERENCES "StatusCheckin" ("cStatusNome");

ALTER TABLE "Reserva" ADD FOREIGN KEY ("nCdVoo") REFERENCES "Voo" ("nCdVoo");

ALTER TABLE "Reserva" ADD FOREIGN KEY ("nCdPassageiro") REFERENCES "Passageiro" ("nCdPassageiro");

ALTER TABLE "Reserva" ADD FOREIGN KEY ("cStatusReserva") REFERENCES "StatusReserva" ("cStatusReserva");

ALTER TABLE "Reserva" ADD FOREIGN KEY ("nCdFidelidade") REFERENCES "ProgramaFidelidade" ("nCdPrograma");
