-- agrupa os posts por usuario ativo para saber quantos cada um fez e qual a sua pontuacao media
SELECT OwnerUserId, 
       COUNT(*) AS TotalPosts, 
       AVG(Score) AS MediaScore
FROM Posts
WHERE OwnerUserId IS NOT NULL
GROUP BY OwnerUserId
HAVING COUNT(*) > 10 
ORDER BY TotalPosts DESC
LIMIT 50;

-- soma o total de visualizacoes e encontra a maior pontuacao para cada tipo de postagem
SELECT postypes.Type, 
       SUM(posts.ViewCount) AS TotalViews, 
       MAX(posts.Score) AS PontuacaoMaxima
FROM Posts posts
JOIN PostTypes postypes ON posts.PostTypeId = postypes.Id
GROUP BY postypes.Type;

-- encontra o intervalo de tempo das postagens no banco de dados
SELECT MIN(CreationDate) AS PrimeiroPost, 
       MAX(CreationDate) AS UltimoPost,
       COUNT(Id) AS VolumeTotal
FROM Posts;

-- conta quantos comentarios cada post recebeu, mas apenas para aqueles que possuem comentarios com score positivo
SELECT PostId, 
       COUNT(Id) AS QtdComentarios, 
       SUM(Score) AS SomaPontosComentarios
FROM Comments
GROUP BY PostId
HAVING SUM(Score) > 0
ORDER BY SomaPontosComentarios DESC
LIMIT 20;

-- qual a medalha mais comum e quantos usuarios unicos a possuem
SELECT Name AS Medalha, 
       COUNT(*) AS VezesDistribuida, 
       COUNT(DISTINCT UserId) AS UsuariosPremiados
FROM Badges
GROUP BY Name
ORDER BY VezesDistribuida DESC;





