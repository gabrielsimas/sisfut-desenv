--CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE SisFut
GO

--USO DO BANCO DE DADOS
USE sisFut
GO

--TABELA CONFEDERACAO
CREATE TABLE Confederacao(
	id INT IDENTITY,
	idConfederacaoPai INT,
	nomecompleto VARCHAR(100),
	apelido VARCHAR(100),
	datafundacao DATETIME,
	distintivo VARCHAR(300),
	tipofederacao INT,
	pais VARCHAR(100)
)

ALTER TABLE Confederacao ADD CONSTRAINT CHK_tipoFederacao CHECK
	(
		tipoFederacao IN(
			1, --MUNDIAL
			2, --CONTINENTAL
			3, --NACIONAL
			4 --REGIONAL
		)
	)
ALTER TABLE Confederacao ADD CONSTRAINT PK_Confederacao PRIMARY KEY(id)
ALTER TABLE Confederacao ADD CONSTRAINT FK_id_idConfederacaPai FOREIGN KEY(idConfederacaoPai) REFERENCES Confederacao(id)
GO

-- FIM TABELA CONFEDERAÇÃO
-- TABELA ESTÁDIO
DROP TABLE Estadio
GO

CREATE TABLE Estadio(
	id INT IDENTITY,
	nomeDono VARCHAR(100),
	nomecompleto VARCHAR(200),
	apelido	VARCHAR(100),
	datainauguracao DATETIME,
	gramadoCumprimento FLOAT,
	gramadoLargura FLOAT,
	capacidade INT,
	Cidade VARCHAR(100),
	Estado VARCHAR(2)
)

ALTER TABLE Estadio ADD CONSTRAINT PK_Estadio PRIMARY KEY(id)
GO

--FIM TABELA ESTADIO
-- TABELA Clube
CREATE TABLE Clube(
	id INT IDENTITY,
	idEstadio INT,	
	idConfederacao INT,
	nomeCompleto VARCHAR(200),
	apelido VARCHAR(200),
	fundacao DATETIME,
	distintivo VARCHAR(300),
	mascote VARCHAR(200),
	cidade VARCHAR(200),
	estado VARCHAR(2),
	pais VARCHAR(200)
)

ALTER TABLE Clube ADD CONSTRAINT PK_Clube PRIMARY KEY(id)
ALTER TABLE Clube ADD CONSTRAINT FK_Clube_Estadio_id FOREIGN KEY (idEstadio) REFERENCES Estadio(id)
ALTER TABLE Clube ADD CONSTRAINT FK_Clube_Confederacao_id FOREIGN KEY (idConfederacao) REFERENCES Confederacao(id)
GO

-- FIM TABELA Clube
-- TABELA CAMPEONATO
CREATE TABLE Campeonato(
	id INT IDENTITY,
	idConfederacao INT,
	nomecompleto VARCHAR(300),
	apelido VARCHAR(300),
	datainicio DATETIME,
	datafim DATETIME,
	inscritos INT
)

ALTER TABLE Campeonato ADD CONSTRAINT PK_Campeonato PRIMARY KEY(id)
ALTER TABLE Campeonato ADD CONSTRAINT FK_Confederacao FOREIGN KEY(idConfederacao) REFERENCES Confederacao(id)
GO

-- FIM TABELA CAMPEONATO
-- TABELA CAMPEONATO FASE
CREATE TABLE FaseCampeonato(
	id INT IDENTITY,
	idcampeonato INT,
	idProximaFase INT,
	nroFase INT,
	nome VARCHAR(200)
)

ALTER TABLE FaseCampeonato ADD CONSTRAINT PK_FASECAMPEONATO PRIMARY KEY(id)
ALTER TABLE FaseCampeonato ADD CONSTRAINT FK_FASECAMPEONATO_ID FOREIGN KEY(idcampeonato) REFERENCES Campeonato(id)
ALTER TABLE FaseCampeonato ADD CONSTRAINT FK_FASECAMPEONATO_ID_AUTOREL FOREIGN KEY(idProximaFase) REFERENCES FaseCampeonato(id)
GO
--FIM TABELA CAMPEONATOFASE 
--TABELA CAMPEONATORODADA
CREATE TABLE CampeonatoRodada(
	id int IDENTITY,
	idFase INT,
	nroRodada VARCHAR(100),
	nomeRodada VARCHAR(100),
	dataRodada DATETIME,
	nroJogos INT
)

ALTER TABLE CampeonatoRodada ADD CONSTRAINT PK_CampeonatoRodada PRIMARY KEY(id)
ALTER TABLE CampeonatoRodada ADD CONSTRAINT FK_CampeonatoRodadaFase_id FOREIGN KEY(idFase) REFERENCES FaseCampeonato(id)
GO



--FIM TABELA CAMPEONATORODADA
--TABELA CampeonatoInscrito
CREATE TABLE CampeonatoInscrito(
	id INT IDENTITY,
	idClube INT,
	idCampeonato INT
)

ALTER TABLE CampeonatoInscrito ADD CONSTRAINT PK_CampeonatoInscrito PRIMARY KEY(id)
ALTER TABLE CampeonatoInscrito ADD CONSTRAINT FK_CampeonatoInscrito_Clube_id FOREIGN KEY(idClube) REFERENCES Clube(id)
ALTER TABLE CampeonatoInscrito ADD CONSTRAINT FK_CampeonatoInscrito_Campeonato_id FOREIGN KEY(idCampeonato) REFERENCES Campeonato(id)
GO

SELECT conf.nomecompleto,camp.apelido,clb.apelido,YEAR(camp.dataInicio) Temporada FROM CampeonatoInscrito ci
	INNER JOIN Campeonato camp ON camp.id = ci.idCampeonato
	INNER JOIN Clube clb ON clb.id = ci.idClube
	INNER JOIN Confederacao conf ON clb.idConfederacao = conf.id
ORDER BY clb.apelido
GO
--FIM Tabela CampeonatoInscrito
--TABELA CampeonatoConfronto
SELECT * FROM CampeonatoRodada

CREATE TABLE CampeonatoConfronto(
	id INT IDENTITY,
	idRodada INT,
	idEstadio INT,
	idClubeMandante INT,
	golMandante INT,
	idClubeVisitante INT,
	golVsitante INT,
	estado INT
)

ALTER TABLE CampeonatoConfronto ADD CONSTRAINT PK_CampeonatoConfronto PRIMARY KEY(id)
ALTER TABLE CampeonatoConfronto ADD CONSTRAINT FK_CampeonatoConfronto_CampeonatoRodada_id FOREIGN KEY(idRodada) REFERENCES CampeonatoRodada(id)
ALTER TABLE CampeonatoConfronto ADD CONSTRAINT FK_CampeonatoConfronto_Estadio_id FOREIGN KEY(idEstadio) REFERENCES Estadio(id)

ALTER TABLE CampeonatoConfronto ADD CONSTRAINT FK_CampeonatoConfronto_CampeonatoInscritoMandante_id FOREIGN KEY(idClubeMandante) REFERENCES CampeonatoInscrito(id)

ALTER TABLE CampeonatoConfronto ADD CONSTRAINT FK_CampeonatoConfronto_CampeonatoInscritoVisitante_id FOREIGN KEY(idClubeVisitante) REFERENCES CampeonatoInscrito(id)

ALTER TABLE CampeonatoConfronto ADD CONSTRAINT CK_Estado
	CHECK (Estado IN('0','1','2'))
	--0 = Não Iniciado
	--1 = Em Andamento
	--2 = Encerrado
GO





--Confronto:
--Bahia - C - 0
--Santos - F - 0
SELECT * FROM CampeonatoConfronto
--FIM Tabela CampeonatoConfronto
-- Tabela Jogo
CREATE TABLE Jogo(
	id INT IDENTITY,
	idEstadio INT,
	idRodada INT,
	nroJogo INT,
	publico INT,
	estado INT		
)

ALTER TABLE Jogo ADD CONSTRAINT PK_Jogo PRIMARY KEY(id)
ALTER TABLE Jogo ADD CONSTRAINT FK_Jogo_Estadio_id FOREIGN KEY(idEstadio) REFERENCES Estadio(id)
ALTER TABLE CampeonatoRodada ADD CONSTRAINT FK_Jogo_Rodada_id FOREIGN KEY(idRodada) REFERENCES CampeonatoRodada(id)
ALTER TABLE Jogo ADD CONSTRAINT CK_Jogo_Estado
	CHECK (Estado IN('0','1','2'))
	--0 = Não Iniciado
	--1 = Em Andamento
	--2 = Encerrado
GO

INSERT INTO Jogo
VALUES
(NULL,1,1,0,2)
GO

-- Fim Tabela Jogo
--Tabela Resultado

DROP TABLE Resultado
GO

CREATE TABLE Resultado(
	id INT IDENTITY,
	idJogo INT,
	idClube INT,
	escore INT,
	resultadoFinal INT
)

ALTER TABLE Resultado ADD CONSTRAINT PK_Resultado PRIMARY KEY(id)
ALTER TABLE Resultado ADD CONSTRAINT FK_Resultado_Jogo FOREIGN KEY(idJogo) REFERENCES Jogo(id)
ALTER TABLE Resultado ADD CONSTRAINT FK_Resultado_CampeonatoInscrito FOREIGN KEY(idClube) REFERENCES CampeonatoInscrito(id)

ALTER TABLE Resultado ADD resultadoFinal INT
ALTER TABLE Resultado ADD mandoCampo INT

ALTER TABLE Resultado ADD CONSTRAINT CK_ResultadoJogo
	CHECK (resultadoFinal IN('0','1','2'))
	--0 = Derrota
	--1 = Vitoria
	--2 = Empate

ALTER TABLE Resultado ADD CONSTRAINT CK_ResultadoMandoCampo
	CHECK (mandoCampo IN('0','1'))
	--0 = Mandante
	--1 = Visitante
GO

SELECT * FROM Jogo
SELECT * FROM Resultado

BEGIN TRANSACTION
	INSERT INTO Resultado
	VALUES
	(1,15,0,2,0),
	(1,12,0,2,1)
IF @@ERROR = 0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

DELETE FROM Resultado
DELETE FROM Jogo
SELECT * FROM Jogo
SELECT * FROM CampeonatoConfronto

DBCC CHECKIDENT('Jogo',RESEED,0)
GO

DBCC CHECKIDENT('Jogo',RESEED)

INSERT INTO Jogo
SELECT idEstadio,
ROW_NUMBER()OVER (Order by id) nroJogo,
idRodada,
0,
2
FROM CampeonatoConfronto

--antigo
SELECT camp.nomecompleto,camp.apelido,camp.datainicio,camp.datafim,cr.nroRodada,cr.dataRodada,clb1.id,clb1.apelido,cc.GolMandante Gol,'x'x,cc.GolVsitante Gol,clb2.apelido FROM CampeonatoConfronto cc
	INNER JOIN CampeonatoInscrito cm ON cc.idClubeMandante = cm.id
	INNER JOIN CampeonatoInscrito cv ON cc.idClubeVisitante = cv.id
	INNER JOIN Campeonato camp ON (cm.idCampeonato = camp.id AND cv.idCampeonato = camp.id)
	INNER JOIN Clube clb1 ON clb1.id = cm.idClube
	INNER JOIN Clube clb2 ON clb2.id = cv.idClube
	INNER JOIN CampeonatoRodada cr ON cc.idRodada = cr.id

--Novo (Substitui CampeonatoInscrito)
SELECT camp.nomecompleto,camp.apelido,camp.datainicio,camp.datafim,cr.nroRodada,cr.dataRodada,clb1.id,clb1.apelido,cc.GolMandante Gol,'x'x,cc.GolVsitante Gol,clb2.apelido FROM CampeonatoConfronto cc
	INNER JOIN CampeonatoInscrito cm ON cc.idClubeMandante = cm.id
	INNER JOIN CampeonatoInscrito cv ON cc.idClubeVisitante = cv.id
	INNER JOIN Campeonato camp ON (cm.idCampeonato = camp.id AND cv.idCampeonato = camp.id)
	INNER JOIN Clube clb1 ON clb1.id = cm.idClube
	INNER JOIN Clube clb2 ON clb2.id = cv.idClube
	INNER JOIN CampeonatoRodada cr ON cc.idRodada = cr.id

SELECT * FROM Resultado
GO

SELECT clb.apelido,rs.escore FROM Jogo jg
	INNER JOIN Resultado rs ON rs.idJogo = jg.id
	INNER JOIN CampeonatoRodada cr ON jg.idRodada = cr.id
	INNER JOIN Clube clb ON rs.idClube = clb.id
GROUP BY jg.id,clb.apelido,rs.escore

SELECT SUM(escore)
FROM Resultado
WHERE idClube = 15

SELECT * FROM JOGO
	
--Fim Tabela Resultado





