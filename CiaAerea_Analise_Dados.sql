-- Quantidade de voos por aeroporto (tanto origem quanto destino) [Voo, Aeroporto, EscalaVoo]

SELECT 
    "Aeroporto",
    SUM("TotalVoos") AS "TotalVoos"
FROM (
    SELECT "cAeroportoOrigem" AS "Aeroporto", COUNT(*) AS "TotalVoos"
    FROM "Voo"
    GROUP BY "cAeroportoOrigem"

    UNION ALL

    SELECT "cAeroportoDestino" AS "Aeroporto", COUNT(*) AS "TotalVoos"
    FROM "Voo"
    GROUP BY "cAeroportoDestino"

    UNION ALL

    SELECT 
        substring("cNomeAeroporto" FROM '\(([^)]+)\)') AS "Aeroporto",
        COUNT(*) AS "TotalVoos"
    FROM "EscalaVoo"
    GROUP BY substring("cNomeAeroporto" FROM '\(([^)]+)\)')
) AS subconsulta
GROUP BY "Aeroporto"
ORDER BY "TotalVoos" DESC;

-- Distribuição de status de voo [Voo, StatusVoo]

SELECT 
	"cStatusVoo" AS "StatusVoo", COUNT(*) AS "TotalVoos", SUM("dPrecoTotal") AS "ValorTotal (R$)" FROM "Voo"
GROUP BY "cStatusVoo"
ORDER BY "TotalVoos" DESC;

-- Distribuição da faixa etária dos passageiros [Passageiro]

SELECT 
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 10 AND 20 THEN 1 ELSE NULL END) AS "10 a 20 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 21 AND 30 THEN 1 ELSE NULL END) AS "21 a 30 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 31 AND 40 THEN 1 ELSE NULL END) AS "31 a 40 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 41 AND 50 THEN 1 ELSE NULL END) AS "41 a 50 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 51 AND 60 THEN 1 ELSE NULL END) AS "51 a 60 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 61 AND 70 THEN 1 ELSE NULL END) AS "61 a 70 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 71 AND 80 THEN 1 ELSE NULL END) AS "71 a 80 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 81 AND 90 THEN 1 ELSE NULL END) AS "81 a 90 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("tDataNascimento")) BETWEEN 91 AND 100 THEN 1 ELSE NULL END) AS "91 a 100 anos"
FROM "Passageiro";

-- Quantidade de reservas feitas por mês [Reserva]

SELECT 
	TO_CHAR("tDataReserva", 'YYYY-MM') AS "Mês-Ano", COUNT(*) AS "Qtd Reservas" FROM "Reserva"
GROUP BY "Mês-Ano"
ORDER BY "Qtd Reservas" DESC;

-- Quantidade de voos cancelados e concluídos por faixa etária [Passageiro, Voo]

SELECT 
	"Reserva"."cStatusReserva" AS "Status", 
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 10 AND 20 THEN 1 ELSE NULL END) AS "10 a 20 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 21 AND 30 THEN 1 ELSE NULL END) AS "21 a 30 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 31 AND 40 THEN 1 ELSE NULL END) AS "31 a 40 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 41 AND 50 THEN 1 ELSE NULL END) AS "41 a 50 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 51 AND 60 THEN 1 ELSE NULL END) AS "51 a 60 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 61 AND 70 THEN 1 ELSE NULL END) AS "61 a 70 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 71 AND 80 THEN 1 ELSE NULL END) AS "71 a 80 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 81 AND 90 THEN 1 ELSE NULL END) AS "81 a 90 anos",
	COUNT(CASE WHEN EXTRACT(YEAR FROM AGE("Passageiro"."tDataNascimento")) BETWEEN 91 AND 100 THEN 1 ELSE NULL END) AS "91 a 100 anos"
FROM "Reserva" 
LEFT JOIN "Passageiro" ON "Passageiro"."nCdPassageiro" = "Reserva"."nCdPassageiro"
	WHERE "Reserva"."cStatusReserva" = 'Cancelado' OR "Reserva"."cStatusReserva" = 'Concluído'
GROUP BY "Status";

-- Quantidade de passageiros sem programa fidelidade [ProgramaFidelidade, Passageiro]

SELECT 
	COUNT(CASE WHEN "ProgramaFidelidade"."nCdPrograma" IS NULL THEN 1 ELSE NULL END) AS "Qtd_Clientes_Sem_ProgramFidel",
	COUNT(CASE WHEN "ProgramaFidelidade"."nCdPrograma" IS NOT NULL THEN 1 ELSE NULL END) AS "Qtd_Clientes_Sem_ProgramFidel"
FROM "Passageiro"
LEFT JOIN "ProgramaFidelidade" ON "ProgramaFidelidade"."nCdPassageiro" = "Passageiro"."nCdPassageiro"

-- Categorias do programa fidelidade mais adquiridas [Reserva, ProgramaFidelidade]

SELECT 
	"cCategoria" AS "Categoria_ProgramaFidelidade", COUNT(*) AS "Total_Passageiros" FROM "ProgramaFidelidade"
GROUP BY "cCategoria" 
ORDER BY "Total_Passageiros" DESC;

-- Três tripulantes com menos vôos atribuíduos [Voo, Tripulacao]

SELECT 
	"Tripulacao"."cNome", "Tripulacao"."cCargo", COUNT(*) AS "Total_Voos" FROM "Tripulacao"
LEFT JOIN "Voo" ON "Voo"."nCdTripulante" = "Tripulacao"."nCdTripulante"
GROUP BY "Tripulacao"."cNome", "Tripulacao"."cCargo"
ORDER BY "Total_Voos"
LIMIT 3;

-- Quantidade de tripulantes antigos e novos na companhia [Tripulacao]

SELECT 
	EXTRACT(YEAR FROM "tDataAdmissao") AS "AnoDeAdmissao", COUNT(*) AS "TotalTripulantes" FROM "Tripulacao"
GROUP BY "AnoDeAdmissao"
ORDER BY "TotalTripulantes" DESC;

-- Quantidade de voos concluídos e receita por aeronave [Voo, Aeronave]

SELECT 
	"Aeronave"."cAeronave" AS "Aeronave", COUNT(*) AS "QtdVoos", SUM("Voo"."dPrecoTotal") AS "Receita R$" FROM "Aeronave"
LEFT JOIN "Voo" ON "Voo"."nCdAeronave" = "Aeronave"."nCdAeronave"
WHERE "Voo"."cStatusVoo" = 'Concluído'
GROUP BY "Aeronave"
ORDER BY "QtdVoos" DESC;


