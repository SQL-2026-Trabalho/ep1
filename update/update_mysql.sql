-- insert pra update de novos itens
INSERT INTO Users (Id, Reputation, CreationDate, DisplayName, LastAccessDate, WebsiteUrl, Location, AboutMe, Views, UpVotes, DownVotes, EmailHash, AccountId, Age) VALUES (10001, 1500, '2010-05-01 14:00:00', 'Enzo', '2010-06-01 10:00:00', 'https://meusite.com', 'São Paulo', 'Estudante de Computação', 150, 20, 2, 'hash123', 999, 20);
INSERT INTO Posts (Id, AcceptedAnswerId, AnswerCount, Body, ClosedDate, CommentCount, CommunityOwnedDate, CreationDate, FavoriteCount, LastActivityDate, LastEditDate, LastEditorDisplayName, LastEditorUserId, OwnerUserId, ParentId, PostTypeId, Score, Tags, Title, ViewCount) VALUES (10000000, 100001, 0, 'Corpo da postagem de teste', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Enzo Spinella', 10001, 10001, 100001, 9, 10, '<sql><db>', 'Titulo de Teste', 50);
INSERT INTO VoteTypes (Id, Name) VALUES (99, 'Tipo Novo 99');

-- updates completos
UPDATE Users SET Reputation = 2000, CreationDate = '2010-05-02 09:00:00', DisplayName = 'Isis', LastAccessDate = CURRENT_TIMESTAMP, WebsiteUrl = 'https://novo-site.com', Location = 'Ubatuba', AboutMe = 'Engenheira de Software', Views = 30, UpVotes = 10, DownVotes = 15, EmailHash = 'hash456', AccountId = 1000, Age = 22 WHERE Id = 10000;
UPDATE PostTypes SET Type = 'Teste de Performance' WHERE Id = 9;
UPDATE Badges SET Name = 'Estudante do BCC', UserId = 10001, Date = CURRENT_TIMESTAMP WHERE Id = 100000;
UPDATE Posts SET AcceptedAnswerId = 1000000, AnswerCount = 5, Body = 'Corpo da postagem atualizado', ClosedDate = CURRENT_TIMESTAMP, CommentCount = 10, CommunityOwnedDate = CURRENT_TIMESTAMP, CreationDate = CURRENT_TIMESTAMP, FavoriteCount = 20, LastActivityDate = CURRENT_TIMESTAMP, LastEditDate = CURRENT_TIMESTAMP, LastEditorDisplayName = 'Enzo Spinella', LastEditorUserId = 10001, OwnerUserId = 10001, ParentId = 1000000, PostTypeId = 1, Score = 100, Tags = '<sql><postgres><mysql>', Title = 'Titulo Atualizado', ViewCount = 500 WHERE Id = 1000000;
UPDATE Comments SET PostId = 10000000, Score = 15, Text = 'Texto do comentário atualizado', CreationDate = CURRENT_TIMESTAMP, UserId = 10001 WHERE Id = 10000000;
UPDATE LinkTypes SET Type = 'Tipo de Link Atualizado' WHERE Id = 100;
UPDATE PostLinks SET CreationDate = CURRENT_TIMESTAMP, PostId = 10000000, RelatedPostId = 10000000, LinkTypeId = 3 WHERE Id = 100000;
UPDATE VoteTypes SET Name = 'Tipo Voto Atualizado' WHERE Id = 100;
UPDATE Votes SET PostId = 10000000, VoteTypeId = 99, UserId = 10001, CreationDate = CURRENT_TIMESTAMP, BountyAmount = 50 WHERE Id = 10000000;

-- atualizacao perfil
UPDATE Users SET AboutMe = 'Estudante de Ciência da Computação focado em SGBDs.', DisplayName = 'Isis Logullo', Location = 'São Paulo, SP', WebsiteUrl = 'https://github.com', Age = 23 WHERE Id = 10000;
-- avaliacao
UPDATE Users SET DownVotes = DownVotes + 1, UpVotes = UpVotes + 5, Views = Views + 1, Reputation = Reputation + 10 WHERE Id = 10000;
-- atualizacao sessao
UPDATE Users SET LastAccessDate = CURRENT_TIMESTAMP WHERE Id = 10000;
--  correcao de dados ou troca de e-mail
UPDATE Users SET CreationDate = CURRENT_TIMESTAMP, EmailHash = '79054025255fb1a26e4bc422aef54eb4', AccountId = 1001 WHERE Id = 10000;

-- edicao conteudo
UPDATE Posts SET Title = 'Como otimizar consultas SQL no PostgreSQL e MySQL?', Body = 'Realizando um experimento de projeto', Tags = '<sql><postgres><mysql><performance>', LastEditDate = CURRENT_TIMESTAMP, LastEditorDisplayName = 'Isis Logullo', LastEditorUserId = 10000, LastActivityDate = CURRENT_TIMESTAMP WHERE Id = 1000000;
-- engajamento
UPDATE Posts SET Score = Score + 1, ViewCount = ViewCount + 10, AnswerCount = AnswerCount + 1, CommentCount = CommentCount + 2, FavoriteCount = FavoriteCount + 1, LastActivityDate = CURRENT_TIMESTAMP WHERE Id = 1000000;
-- moderacao
UPDATE Posts SET ClosedDate = CURRENT_TIMESTAMP, CommunityOwnedDate = CURRENT_TIMESTAMP, AcceptedAnswerId = 1000001, PostTypeId = 1, LastActivityDate = CURRENT_TIMESTAMP WHERE Id = 1000000;
-- manutencao
UPDATE Posts SET CreationDate = CURRENT_TIMESTAMP, OwnerUserId = 10000, ParentId = 1000050  WHERE Id = 1000000;

