--CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE SisFut
GO


--USO DO BANCO DE DADOS
USE sisFut
GO

DROP TABLE Confederacao
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

BEGIN TRANSACTION
	INSERT INTO Confederacao
	VALUES 
	(NULL,'Fédération Internationale de Football Association','FIFA','1904-05-21',NULL,1,'França')
IF @@ERROR = 0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

BEGIN TRANSACTION
	INSERT INTO Confederacao
	VALUES
	
	(1,'Asian Football Confederation','AFC','1954-05-08',NULL,2,'Malásia'),
	(1,'Confédération Africaine de Football','CAF','1957-02-08',NULL,2,'Egito'),
	(1,'Confederation of North, Central American and Caribbean Association Football','CONCACAF','1961-09-08',NULL,2,'Estados Unidos'),
	(1,'Confederación Sudamericana de Fútbol','CONMEBOL','1916-07-09',NULL,2,'Paraguai'),
	(1,'Oceania Football Confederation','OFC','1966-11-15',NULL,2,'Nova Zelândia'),
	(1,'Union des Associations Européennes de Football','UEFA','1954-06-15',NULL,2,'Suiça'),
	(5,'Confederação Brasileira de Futebol','CBF','1904-06-08',NULL,3,'Brasil')
	
	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION
GO

SELECT * FROM Confederacao
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

BEGIN TRANSACTION
	
	INSERT INTO Estadio
	VALUES
	--('Governo do Estado do Rio de Janeiro','Estádio Jornalista Mário Filho','Maracanã','1950-06-16',105.00,68.00,73531,'Rio de Janeiro','RJ'),
	--('Clube de Regatas Vasco da Gama','Estádio São Januário','São Jánuário','1927-04-21',110.00,75.00,35000,'Rio de Janeiro','RJ')
	--('Fluminense Football Club','Estádio Manoel Schwartz','Laranjeiras','1919-05-11',105.00,70.00,8000,'Rio de Janeiro','RJ')
	--('Clube de Regatas do Flamengo','Estádio José Bastos Padilha','Gávea','1938-09-04',110.00,75.00,8000,'Rio de Janeiro','RJ')
	--('Campo Grande Atlético Clube','Estádio Ítalo del Cima','Campo Grande','1960-04-29',105.00,68.00,18000,'Rio de Janeiro','RJ')
	--('São Cristóvão de Futebol e Regatas','Estádio Figueira de Melo','São Cristóvão','1916-04-23',0.00,0.00,8000,'Rio de Janeiro','RJ')
	--('Botafogo de Futebol e Regatas','Estádio General Severiano','General Severiano','1913-01-01',0.00,0.00,20000,'Rio de Janeiro','RJ'),
	--('Botafogo de Futebole Regatas','Estádio Mané Garrincha','Marechal Hermes','1978-01-01',0.00,0.00,12000,'Rio de Janeiro','RJ'),
	--('Madureira Esporte Clube','Estádio Aniceto Moscoso','Rua Conselheiro Galvão','1941-06-15',101.00,68.00,10000,'Rio de Janeiro','RJ')
	--('Olaria Atlético Clube','Estádio Mourão Vieira Filho','Rua Bariri','1947-04-06',105.00,70.00,11000,'Rio de Janeiro','RJ'),
	--('Bonsucesso Futebol Clube','Estádio Leônidas da Silva','Bonsucesso','1936-01-01',0.00,0.00,9000,'Rio de Janeiro','RJ'),
	--('América Futebol Clube','Estádio Wolney Braune','Andaraí','1967-01-01',0.00,0.00,5000,'Rio de Janeiro','RJ'),
	--('Associação Atlética Portuguesa','Estádio Luso-Brasileiro','Arena Petrobrás','1965-10-01',0.00,0.00,30000,'Rio de Janeiro','RJ')
	--('Bangu Atlético Clube','Estádio Proletário Guilherme da Silveira Filho','Moça Bonita','1947-11-17',0.00,0.00,15000,'Rio de Janeiro','RJ')
	--('Bangu Atlético Clube','Estádio da Rua Ferrer','Rua Ferrer','1906-05-13',0.00,0.00,0,'Rio de Janeiro','RJ')
	--('América Futebol Clube','Estádio de Campos Salles','Campos Salles',NULL,0.00,0.00,0,'Rio de Janeiro','RJ')
	('Prefeitura Municipal do Rio de Janeiro','Estádio Olímpico João Havelange','Engenhão','2007-06-30',105,68,46391,'Rio de Janeiro','RJ')

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION		
GO

SELECT * FROM Estadio
ORDER BY Capacidade DESC
GO
--FIM TABELA ESTADIO
-- TABELA Clube
DROP TABLE Clube
GO

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

ALTER TABLE Clube DROP CONSTRAINT FK_Clube_Confederacao_id
GO

SELECT * FROM Clube
GO

BEGIN TRANSACTION
INSERT INTO Clube
VALUES
(NULL,5,'Sport Club Corinthians Paulista','Corinthians-SP','1910-09-01',NULL,'Mosqueteiro','São Paulo','SP','Brasil'),
(NULL,5,'Cruzeiro Esporte Clube','Cruzeiro-MG','1921-01-02',NULL,'Raposa','Belo Horizonte','MG','Brasil'),
(NULL,5,'Sport Club Internacional','Internacional-RS','1909-04-04',NULL,'Saci','Porto Alegre','RS','Brasil'),
(NULL,5,'Coritiba Foot Ball Club','Coritiba-PR','1909-10-12',NULL,'Vovô Coxa','Curitiba','PR','Brasil'),
(NULL,5,'Sociedade Esportiva Palmeiras','Palmeiras-SP','1914-08-26',NULL,'Periquito','São Paulo','SP','Brasl'),
(3,5,'Club de Regatas Vasco da Gama','Vasco-RJ','1898-08-21',NULL,'Almirante','Rio de Janeiro','RJ','Brasil'),
(NULL,5,'Santa Cruz Futebol Clube','Santa Cruz-PE','1914-02-03',NULL,'Cobra Coral','Recife','PE','Brasil'),
(4,5,'Fluminense Football Club','Fluminense-RJ','1902-07-21',NULL,'Cartola','Rio de Janeiro','RJ','Brasil'),
(NULL,5,'Associação Portuguesa de Desportos','Portuguesa','1920-08-14',NULL,'Leão','São Paulo','SP','Brasil'),
(NULL,5,'Ceará Sporting Club','Ceará-CE','1914-06-02',NULL,'Vovô','Forteleza','CE','Brasil'),
(NULL,5,'Grêmio Foot-Ball Porto Alegrense','Grêmio-RS','1903-09-15',NULL,'Mosqueteiro','Porto Alegre','RS','Brasil'),
(NULL,5,'Clube Atlético Mineiro','Atlético-MG','1908-03-25',NULL,'Galo','Belo Horizonte','MG','Brasil'),
(NULL,5,'America Football Club','América-RJ','1904-09-18',NULL,'Brasinha','Rio de Janeiro','RJ','Brasl'),
(NULL,5,'Santos Futebol Clube','Santos-SP','1912-04-14',NULL,'Baleia','Santos','SP','Brasil'),
(22,5,'Botafogo de Futebol e Regatas','Botafogo-RJ','1904-08-12',NULL,'Manequinho','Rio de Janeiro','RJ','Brasil'),
(NULL,5,'São Paulo Futebol Clube','São Paulo-SP','1930-01-25',NULL,'São Paulo de Tarso','São Paulo','SP','Brasil'),
(NULL,5,'Esporte Clube Bahia','Bahia-BA','1931-01-01',NULL,'Superman','Salvador','BA','Brasil'),
(5,5,'Clube de Regatas do Flamengo','Flamengo-RJ','1895-11-17',NULL,'Urubu','Rio de Janeiro','RJ','Brasil'),
(NULL,5,'América Futebol Clube','América-MG','1912-04-30',NULL,'Coelho','Belo Horizonte','MG','Brasil'),
(NULL,5,'Sport Club do Recife','Sport-PE','1905-05-13',NULL,'Leão','Recife','PE','Brasil')

UPDATE Clube
SET idConfederacao = 9
WHERE Pais = 'Brasil'
GO

if @@ERROR=0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

SELECT * FROM Clube
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
--ALTER TABLE Campeonato ADD CONSTRAINT FK_Confederacao FOREIGN KEY(idConfederacao) REFERENCES Confederacao(id)
GO

ALTER TABLE Campeonato DROP CONSTRAINT FK_Confederacao
GO

INSERT INTO Campeonato
VALUES
(5,'Campeonato Brasileiro Série A','Brasileirão Série A','1971-08-07','1971-12-19',20)
GO

UPDATE Campeonato
SET IdConfederacao = 9
GO

SELECT * FROM Campeonato
GO
-- FIM TABELA CAMPEONATO
-- TABELA CAMPEONATO FASE
ALTER TABLE FaseCampeonato DROP CONSTRAINT FK_FASECAMPEONATO_ID
GO

DROP TABLE FaseCampeonato
GO

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

SELECT * FROM FaseCampeonato

INSERT INTO FaSECAMPEONATO
VALUES
(1,NULL,1,'Primeira Fase'),
(1,NULL,2,'Segunda Fase')
GO

INSERT INTO FASECAMPEONATO
VALUES
(1,NULL,3,'Triangular Final')

UPDATE FaseCampeonato
SET idProximaFase = 3
WHERE Id = 2

SELECT c.id idCampeonato,c.apelido Campeonato,fc.id idFase,fc.nrofASE Fase,fc.nome NomeFase
FROM Campeonato c 
	INNER JOIN FaseCampeonato fc
	ON c.id = fc.IdCampeonato
ORDER BY fc.nroFase
GO

--FIM TABELA CAMPEONATOFASE 
--TABELA CAMPEONATORODADA
ALTER TABLE CampeonatoRodada DROP CONSTRAINT FK_CampeonatoRodadaFase_id
GO

drop table CampeonatoRodada
GO
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

INSERT INTO CampeonatoRodada
VALUES 
(1,1,'Rodada','1971-08-07',5),
(1,1,'Rodada','1971-08-08',1),
(1,1,'Rodada','1971-08-11',1),
(1,2,'Rodada','1971-08-11',4),
(1,2,'Rodada','1971-08-12',1),
(1,2,'Rodada','1971-08-18',1),
(1,2,'Rodada','1971-08-21',1),
(1,3,'Rodada','1971-08-14',3),
(1,3,'Rodada','1971-08-15',7),
(1,4,'Rodada','1971-08-18',4),
(1,4,'Rodada','1971-08-21',2),
(1,4,'Rodada','1971-08-22',4),
(1,5,'Rodada','1971-08-22',3),
(1,5,'Rodada','1971-08-25',3),
(1,5,'Rodada','1971-08-26',1),
(1,6,'Rodada','1971-08-25',3),
(1,6,'Rodada','1971-08-26',1),
(1,6,'Rodada','1971-08-29',5),
(1,7,'Rodada','1971-08-28',1),
(1,7,'Rodada','1971-08-29',2),
(1,7,'Rodada','1971-09-01',4),
(1,8,'Rodada','1971-09-01',3),
(1,8,'Rodada','1971-09-02',2),
(1,8,'Rodada','1971-09-05',2),
(1,9,'Rodada','1971-09-05',5),
(1,9,'Rodada','1971-09-07',1),
(1,9,'Rodada','1971-09-08',3),
(1,9,'Rodada','1971-09-08',3),
(1,10,'Rodada','1971-09-05',1),
(1,10,'Rodada','1971-09-08',1),
(1,10,'Rodada','1971-09-09',2),
(1,10,'Rodada','1971-09-10',5),
(1,10,'Rodada','1971-09-10',5),
(1,11,'Rodada','1971-09-12',5),
(1,12,'Rodada','1971-09-18',3),
(1,12,'Rodada','1971-09-18',3),
(1,12,'Rodada','1971-09-19',7),
(1,13,'Rodada','1971-09-19',4),
(1,13,'Rodada','1971-09-25',4),
(1,13,'Rodada','1971-09-26',6),
(1,14,'Rodada','1971-10-02',6),
(1,14,'Rodada','1971-10-03',8),
(1,15,'Rodada','1971-09-22',1),
(1,15,'Rodada','1971-09-29',1),
(1,15,'Rodada','1971-10-06',3),
(1,16,'Rodada','1971-10-09',2),
(1,16,'Rodada','1971-10-10',8),
(1,17,'Rodada','1971-10-13',2),
(1,18,'Rodada','1971-10-16',2),
(1,18,'Rodada','1971-10-17',7),
(1,19,'Rodada','1971-10-20',2),
(1,20,'Rodada','1971-10-23',3),
(1,20,'Rodada','1971-10-24',6),
(1,21,'Rodada','1971-10-27',3),
(1,21,'Rodada','1971-11-10',1),
(1,22,'Rodada','1971-10-30',4),
(1,22,'Rodada','1971-10-31',5),
(1,23,'Rodada','1971-10-06',3),
(1,23,'Rodada','1971-11-07',3),
(1,24,'Rodada','1971-11-13',2),
(1,24,'Rodada','1971-11-14',8),
(2,1,'Rodada','1971-11-20',2),
(2,1,'Rodada','1971-11-21',4),
(2,2,'Rodada','1971-11-24',4),
(2,2,'Rodada','1971-11-25',2),
(2,3,'Rodada','1971-11-27',1),
(2,3,'Rodada','1971-11-28',5),
(2,4,'Rodada','1971-12-01',4),
(2,4,'Rodada','1971-12-02',2),
(2,5,'Rodada','1971-12-04',2),
(2,5,'Rodada','1971-12-05',4),
(2,6,'Rodada','1971-12-07',1),
(2,6,'Rodada','1971-12-07',1),
(2,6,'Rodada','1971-12-08',1),
(2,6,'Rodada','1971-12-09',4),
(3,1,'Rodada Semifinal 1','1971-12-12',1),
(3,2,'Rodada Semifinal 2','1971-12-15',1),
(3,2,'Final','1971-12-19',1)
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

SELECT * FROM CampeonatoConfronto
GO

select * from campeonatoconfronto

INSERT INTO CampeonatoConfronto
VALUES
(1,NULL,15,0,12,0,2),
(1,NULL,11,1,17,1,2),
(1,NULL,9,0,5,0,2),
(1,NULL,4,0,2,2,2),
(1,NULL,13,0,20,0,2),
(1,NULL,6,1,1,4,2),
(1,NULL,14,0,10,3,2),
(1,NULL,19,1,8,0,2),
(1,NULL,18,1,16,0,2),
(2,NULL,3,0,7,0,2),
(4,NULL,9,0,1,1,2),
(4,NULL,20,0,10,2,2),
(4,NULL,2,2,8,1,2),
(4,NULL,15,1,16,1,2),
(3,NULL,18,0,12,2,2),
(5,NULL,6,1,5,0,2),
(8,NULL,17,1,20,1,2),
(8,NULL,14,1,12,3,2),
(8,NULL,16,1,13,1,2),
(9,NULL,10,1,11,1,2),
(9,NULL,2,2,3,0,2),
(9,NULL,1,0,19,0,2),
(9,NULL,5,1,7,0,2),
(9,null,4,2,8,1,2),
(9,NULL,9,0,6,0,2),
(9,NULL,15,3,18,0,2),
(6,NULL,7,2,4,1,2),
(10,NULL,15,0,14,1,2),
(10,NULL,17,0,10,0,2),
(10,NULL,12,0,13,0,2),
(7,NULL,3,2,19,1,2),
(11,NULL,1,0,2,0,2),
(11,NULL,16,0,11,1,2),
(12,NULL,9,1,7,0,2)

SELECT * FROM CampeonatoConfronto
SELECT * FROM CampeonatoInscrito

SELECT cr.nroRodada,cr.dataRodada,clb1.id,clb1.apelido,cc.GolMandante Gol,'x'x,cc.GolVsitante Gol,clb2.apelido FROM CampeonatoConfronto cc
	INNER JOIN CampeonatoInscrito cm ON cc.idClubeMandante = cm.id
	INNER JOIN CampeonatoInscrito cv ON cc.idClubeVisitante = cv.id
	INNER JOIN Clube clb1 ON clb1.id = cm.idClube
	INNER JOIN Clube clb2 ON clb2.id = cv.idClube
	INNER JOIN CampeonatoRodada cr ON cc.idRodada = cr.id

SELECT idClubeMandante,COUNT(id) FROM CampeonatoConfronto
Group by idClubeMandante
having idClubeMandante = 1

--Consulta das vitórias do Flamengo e Casa
SELECT COUNT(id) FROM CampeonatoConfronto
WHERE IdClubeMandante = 15
GO

SELECT * FROM CampeonatoConfronto
WHERE IdClubeMandante = 15
GO

--TABELA
--JOGOS
SELECT count(a.jogomandante)  FROM 
(
	SELECT clb.apelido,idClubeMandante,COUNT(idClubeMandante) jogoMandante
	FROM CampeonatoConfronto cc 
	INNER JOIN Clube clb ON cc.idClubeMandante = clb.id
	GROUP BY idClubeMandante,clb.apelido	
) A, -- Nro Jogos do Clube Mandante
(
	SELECT clb.apelido,COUNT(idClubeVisitante) jogoVisitante
	FROM CampeonatoConfronto cc 
	INNER JOIN Clube clb ON cc.idClubeVisitante = clb.id
	GROUP BY idClubeVisitante,clb.apelido	
)B
GROUP BY A.idClubeMandante

SELECT COUNT(idClubeMandante), COUNT(idClubeVisitante)
FROM CampeonatoConfronto 
group by idClubeMandante,idClubeVisitante

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





