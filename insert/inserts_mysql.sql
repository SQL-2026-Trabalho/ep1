INSERT INTO Users (Id, Reputation, CreationDate, DisplayName, LastAccessDate, WebsiteUrl, Location, AboutMe, Views, UpVotes, DownVotes, EmailHash, AccountId) VALUES (10000, 1500, '2010-05-01 14:00:00', 'Enzo', '2010-06-01 10:00:00', 'https://meusite.com', 'São Paulo', 'Estudante de Computação', 150, 20, 2, 'hash123', 999);
INSERT INTO PostTypes (Id, Type) VALUES (9, 'Test');
INSERT INTO Badges (Id, UserId, Name, Date) VALUES (100000, 10000, 'Aluno de BD', CURRENT_TIMESTAMP);
INSERT INTO Posts (Id, AcceptedAnswerId, AnswerCount, Body, ClosedDate, CommentCount, CommunityOwnedDate, CreationDate, FavoriteCount, LastActivityDate, LastEditDate, LastEditorDisplayName, LastEditorUserId, OwnerUserId, ParentId, PostTypeId, Score, Tags, Title, ViewCount) VALUES (1000000, 100000, 0, 'Corpo da postagem de teste', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Enzo', 10000, 10000, 100000, 9, 10, '<sql><db>', 'Titulo de Teste', 50);
INSERT INTO Comments (Id, PostId, Score, Text, CreationDate, UserId) VALUES (10000000, 1000000, 5, 'Comentario de teste para medir performance.', CURRENT_TIMESTAMP, 10000);
INSERT INTO LinkTypes (Id, Type) VALUES (100, 'LinkTeste');
INSERT INTO PostLinks (Id, CreationDate, PostId, RelatedPostId, LinkTypeId) VALUES (100000, CURRENT_TIMESTAMP, 1000000, 1000000, 100);
INSERT INTO VoteTypes (Id, Name) VALUES (100, 'TipoVotoTeste');
INSERT INTO Votes (Id, PostId, VoteTypeId, UserId, CreationDate, BountyAmount) VALUES (10000000, 1000000, 100, 10000, CURRENT_TIMESTAMP, 0);




