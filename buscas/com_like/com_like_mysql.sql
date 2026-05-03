-- usuarios com sobrenome Silva ou nomes que comecam com Enzo
SELECT * FROM Users WHERE DisplayName LIKE 'Enzo%' OR DisplayName LIKE '%Silva';

-- posts que mencionam database ou banco de dados no corpo
SELECT * FROM Posts WHERE Body LIKE '%database%' OR Body LIKE '%banco de dados%';

-- badges que possuem Teacher ou Student no nome
SELECT * FROM Badges WHERE Name LIKE '%Teacher%' OR Name LIKE '%Student%';

-- comentarios que contem a palavra obrigado ou thanks
SELECT * FROM Comments WHERE Text LIKE '%obrigado%' OR Text LIKE '%thanks%';

-- tipos de post que contenham Question ou Answer
SELECT * FROM PostTypes WHERE Type LIKE '%Question%' OR Type LIKE '%Answer%';

-- tipos de link que terminam com ed 
SELECT * FROM LinkTypes WHERE Type LIKE '%ed';

-- links de posts com data de criacao em 2010-05 (convertida para char)
SELECT * FROM PostLinks WHERE CAST(CreationDate AS CHAR) LIKE '2010-05%';

-- tipos de voto que comecam com Up ou Down
SELECT * FROM VoteTypes WHERE Name LIKE 'Up%' OR Name LIKE 'Down%';

-- votos por data computados as 14 horas (convertida para char)
SELECT * FROM Votes WHERE CAST(CreationDate AS CHAR) LIKE '% 00:%:%';