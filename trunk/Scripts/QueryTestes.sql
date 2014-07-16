USE sisFut
GO

SELECT c.id idCampeonato,c.apelido Campeonato,fc.id idFase,fc.nrofASE Fase,fc.nome NomeFase
FROM Campeonato c 
	INNER JOIN FaseCampeonato fc
	ON c.id = fc.IdCampeonato
ORDER BY fc.nroFase
GO

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

--Calculo do numero de jogos
SELECT COUNT(idClubeMandante)
FROM CampeonatoConfronto cc


SELECT * FROM CampeonatoInscrito

SELECT * FROM Clube 
