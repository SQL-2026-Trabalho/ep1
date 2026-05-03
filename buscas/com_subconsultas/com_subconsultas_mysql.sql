-- nome dos usuarios que ganharam uma medalha especifica
SELECT DisplayName, Reputation
FROM Users
WHERE Id IN (
    SELECT UserId 
    FROM Badges 
    WHERE Name = 'Teacher'
);

-- projeta o nome do usuario e, para cada um, executa uma subconsulta que conta quantos posts ele fez
SELECT DisplayName, 
    (SELECT COUNT(*) FROM Posts WHERE OwnerUserId = Users.Id) as TotalPosts
FROM Users
WHERE Reputation > 10000
LIMIT 50;

-- titulos de posts que possuem pelo menos um comentario com pontuacao alta
SELECT Title
FROM Posts posts
WHERE EXISTS (
    SELECT 1 
    FROM Comments coments 
    WHERE coments.PostId = posts.Id AND coments.Score > 10
);

-- subconsulta como se fosse uma tabela temporaria para calcular a media de visualizacoes de um subgrupo
SELECT AVG(sub.ViewCount) as MediaViewsPerguntas
FROM (
    SELECT ViewCount 
    FROM Posts 
    WHERE PostTypeId = 1 
) as sub;

--  usuarios que nunca fizeram um post (o ID deles nao aparece na tabela Posts)
SELECT DisplayName
FROM Users
WHERE Id NOT IN (
    SELECT DISTINCT OwnerUserId 
    FROM Posts 
    WHERE OwnerUserId IS NOT NULL
)
LIMIT 100;






