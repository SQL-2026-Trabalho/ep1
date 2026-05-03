-- usuarios com alta reputacao em uma localizacao especifica
SELECT * FROM Users WHERE Reputation > 50 AND Location = 'Sao Paulo';

-- usuarios ativos recentemente com muitas visualizacoes
SELECT * FROM Users WHERE Views > 100000 AND LastAccessDate > '2010-06-01 00:00:00';

-- posts com boa pontuacao que possuem muitas respostas
SELECT * FROM Posts WHERE Score > 5000 AND AnswerCount >= 10;

-- posts criados em data especifica com tags de banco de dados
SELECT * FROM Posts WHERE CreationDate >= '2010-01-01' AND Tags LIKE '%<sql>%';

-- badges especificas dadas em um periodo
SELECT * FROM Badges WHERE Name = 'Teacher' AND Date > '2010-05-01 00:00:00';

-- comentarios com score alto de um usuario especifico
SELECT * FROM Comments WHERE Score > 10 AND UserId = 10001;

-- votos de um tipo especifico com bounty
SELECT * FROM Votes WHERE VoteTypeId = 9 AND BountyAmount > 10;

-- links criados recentemente de um tipo especifico
SELECT * FROM PostLinks WHERE LinkTypeId = 1 AND CreationDate > '2010-01-01 00:00:00';

-- busca pelo tipo ou nome
SELECT * FROM PostTypes WHERE Type != 'Teste de Performance';
SELECT * FROM VoteTypes WHERE Name = 'UpMod' OR Name = 'DownMod';
SELECT * FROM LinkTypes WHERE Type = 'Linked';
