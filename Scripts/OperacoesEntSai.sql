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

BEGIN TRAN

DELETE FROM Clube
where id = 16

DBCC CHECKIDENT('Clube',RESEED,14)

IF @@ERROR =0
	COMMIT TRAN
ELSE
	ROLLBACK TRAN
GO

BEGIN TRANSACTION
INSERT INTO Clube
	VALUES
	--(NULL,5,'Sport Club Corinthians Paulista','Corinthians-SP','1910-09-01',NULL,'Mosqueteiro','São Paulo','SP','Brasil')

	--(NULL,5,'Cruzeiro Esporte Clube','Cruzeiro-MG','1921-01-02',NULL,'Raposa','Belo Horizonte','MG','Brasil')
	--(NULL,5,'Sport Club Internacional','Internacional-RS','1909-04-04',NULL,'Saci','Porto Alegre','RS','Brasil')
	--(NULL,5,'Coritiba Foot Ball Club','Coritiba-PR','1909-10-12',NULL,'Vovô Coxa','Curitiba','PR','Brasil')
	--(NULL,5,'Sociedade Esportiva Palmeiras','Palmeiras-SP','1914-08-26',NULL,'Periquito','São Paulo','SP','Brasl'),
	--(3,5,'Club de Regatas Vasco da Gama','Vasco-RJ','1898-08-21',NULL,'Almirante','Rio de Janeiro','RJ','Brasil'),
	--(NULL,5,'Santa Cruz Futebol Clube','Santa Cruz-PE','1914-02-03',NULL,'Cobra Coral','Recife','PE','Brasil')
	--(4,5,'Fluminense Football Club','Fluminense-RJ','1902-07-21',NULL,'Cartola','Rio de Janeiro','RJ','Brasil')
	--(NULL,5,'Associação Portuguesa de Desportos','Portuguesa','1920-08-14',NULL,'Leão','São Paulo','SP','Brasil')
	--(NULL,5,'Ceará Sporting Club','Ceará-CE','1914-06-02',NULL,'Vovô','Forteleza','CE','Brasil')
	--(NULL,5,'Grêmio Foot-Ball Porto Alegrense','Grêmio-RS','1903-09-15',NULL,'Mosqueteiro','Porto Alegre','RS','Brasil')
	--(NULL,5,'Clube Atlético Mineiro','Atlético-MG','1908-03-25',NULL,'Galo','Belo Horizonte','MG','Brasil')
	--(NULL,5,'America Football Club','América-RJ','1904-09-18',NULL,'Brasinha','Rio de Janeiro','RJ','Brasl')
	--(NULL,5,'Santos Futebol Clube','Santos-SP','1912-04-14',NULL,'Baleia','Santos','SP','Brasil')
	--(17,5,'Botafogo de Futebol e Regatas','Botafogo-RJ','1904-08-12',NULL,'Manequinho','Rio de Janeiro','RJ','Brasil')
	--(NULL,5,'São Paulo Futebol Clube','São Paulo-SP','1930-01-25',NULL,'São Paulo de Tarso','São Paulo','SP','Brasil')
	(NULL,5,'Esporte Clube Bahia','Bahia-BA','1931-01-01',NULL,'Superman','Salvador','BA','Brasil'),
	(5,5,'Clube de Regatas do Flamengo','Flamengo-RJ','1895-11-17',NULL,'Urubu','Rio de Janeiro','RJ','Brasil'),
	(NULL,5,'América Futebol Clube','América-MG','1912-04-30',NULL,'Coelho','Belo Horizonte','MG','Brasil'),
	(NULL,5,'Sport Club do Recife','Sport-PE','1905-05-13',NULL,'Leão','Recife','PE','Brasil')
	
IF @@ERROR=0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

BEGIN TRANSACTION
	
	INSERT INTO Estadio
	VALUES
	('Governo do Estado do Rio de Janeiro','Estádio Jornalista Mário Filho','Maracanã','1950-06-16',105.00,68.00,73531,'Rio de Janeiro','RJ'),
	('Clube de Regatas Vasco da Gama','Estádio São Januário','São Jánuário','1927-04-21',110.00,75.00,35000,'Rio de Janeiro','RJ'),
	('Fluminense Football Club','Estádio Manoel Schwartz','Laranjeiras','1919-05-11',105.00,70.00,8000,'Rio de Janeiro','RJ'),
	('Clube de Regatas do Flamengo','Estádio José Bastos Padilha','Gávea','1938-09-04',110.00,75.00,8000,'Rio de Janeiro','RJ'),
	('Campo Grande Atlético Clube','Estádio Ítalo del Cima','Campo Grande','1960-04-29',105.00,68.00,18000,'Rio de Janeiro','RJ'),
	('São Cristóvão de Futebol e Regatas','Estádio Figueira de Melo','São Cristóvão','1916-04-23',0.00,0.00,8000,'Rio de Janeiro','RJ'),
	('Botafogo de Futebol e Regatas','Estádio General Severiano','General Severiano','1913-01-01',0.00,0.00,20000,'Rio de Janeiro','RJ'),
	('Botafogo de Futebole Regatas','Estádio Mané Garrincha','Marechal Hermes','1978-01-01',0.00,0.00,12000,'Rio de Janeiro','RJ'),
	('Madureira Esporte Clube','Estádio Aniceto Moscoso','Rua Conselheiro Galvão','1941-06-15',101.00,68.00,10000,'Rio de Janeiro','RJ'),
	('Olaria Atlético Clube','Estádio Mourão Vieira Filho','Rua Bariri','1947-04-06',105.00,70.00,11000,'Rio de Janeiro','RJ'),
	('Bonsucesso Futebol Clube','Estádio Leônidas da Silva','Bonsucesso','1936-01-01',0.00,0.00,9000,'Rio de Janeiro','RJ'),
	('América Futebol Clube','Estádio Wolney Braune','Andaraí','1967-01-01',0.00,0.00,5000,'Rio de Janeiro','RJ'),
	('Associação Atlética Portuguesa','Estádio Luso-Brasileiro','Arena Petrobrás','1965-10-01',0.00,0.00,30000,'Rio de Janeiro','RJ'),
	('Bangu Atlético Clube','Estádio Proletário Guilherme da Silveira Filho','Moça Bonita','1947-11-17',0.00,0.00,15000,'Rio de Janeiro','RJ'),
	('Bangu Atlético Clube','Estádio da Rua Ferrer','Rua Ferrer','1906-05-13',0.00,0.00,0,'Rio de Janeiro','RJ'),
	('América Futebol Clube','Estádio de Campos Salles','Campos Salles',NULL,0.00,0.00,0,'Rio de Janeiro','RJ'),
	('Prefeitura Municipal do Rio de Janeiro','Estádio Olímpico João Havelange','Engenhão','2007-06-30',105,68,46391,'Rio de Janeiro','RJ')

	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION		
GO

BEGIN TRANSACTION

	INSERT INTO Campeonato
	VALUES
	(8,'Campeonato Brasileiro Série A','Brasileirão Série A','1971-08-07','1971-12-19',20)

IF @@ERROR = 0
	COMMIT TRANSACTION
ELSE 
	ROLLBACK TRANSACTION
GO

BEGIN TRAN
	INSERT INTO FaSECAMPEONATO
	VALUES
	(1,2,1,'Primeira Fase'),
	(1,3,2,'Segunda Fase'),
	(1,NULL,3,'Triangular Final')
IF @@ERROR = 0 
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

SELECT * FROM FaseCampeonato
GO

BEGIN TRAN
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
IF @@ERROR = 0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO

SELECT * FROM CampeonatoRodada
GO

SELECT * FROM CampeonatoConfronto

BEGIN TRAN
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

IF @@ERROR = 0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
GO


