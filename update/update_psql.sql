-- insert pra update de novos itens
INSERT INTO "Users" ("Id", "Reputation", "CreationDate", "DisplayName", "LastAccessDate", "WebsiteUrl", "Location", "AboutMe", "Views", "UpVotes", "DownVotes", "EmailHash", "AccountId", "Age") VALUES (10001, 1500, '2010-05-01 14:00:00', 'Enzo', '2010-06-01 10:00:00', 'https://meusite.com', 'São Paulo', 'Estudante de Computação', 150, 20, 2, 'hash123', 999, 20);
INSERT INTO "Posts" ("Id", "AcceptedAnswerId", "AnswerCount", "Body", "ClosedDate", "CommentCount", "CommunityOwnedDate", "CreationDate", "FavoriteCount", "LastActivityDate", "LastEditDate", "LastEditorDisplayName", "LastEditorUserId", "OwnerUserId", "ParentId", "PostTypeId", "Score", "Tags", "Title", "ViewCount") VALUES (10000000, 100001, 0, 'Corpo da postagem de teste', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Enzo Spinella', 10001, 10001, 100001, 9, 10, '<sql><db>', 'Titulo de Teste', 50);
INSERT INTO "VoteTypes" ("Id", "Name") VALUES (99, 'Tipo Novo 99');


UPDATE "Users" SET "Reputation" = 2000, "CreationDate" = '2010-05-02 09:00:00', "DisplayName" = 'Isis', "LastAccessDate" = CURRENT_TIMESTAMP, "WebsiteUrl" = 'https://novo-site.com', "Location" = 'Ubatuba', "AboutMe" = 'Engenheira de Software', "Views" = 30, "UpVotes" = 10, "DownVotes" = 15, "EmailHash" = 'hash456', "AccountId" = 1000, "Age" = 22 WHERE "Id" = 10000;
UPDATE "PostTypes" SET "Type" = 'Teste de Performance' WHERE "Id" = 9;
UPDATE "Badges" SET "Name" = 'Estudante do BCC', "UserId" = 10001, "Date" = CURRENT_TIMESTAMP WHERE "Id" = 100000;
UPDATE "Posts" SET "AcceptedAnswerId" = 1000000, "AnswerCount" = 5, "Body" = 'Corpo da postagem atualizado', "ClosedDate" = CURRENT_TIMESTAMP, "CommentCount" = 10, "CommunityOwnedDate" = CURRENT_TIMESTAMP, "CreationDate" = CURRENT_TIMESTAMP, "FavoriteCount" = 20, "LastActivityDate" = CURRENT_TIMESTAMP, "LastEditDate" = CURRENT_TIMESTAMP, "LastEditorDisplayName" = 'Enzo Spinella', "LastEditorUserId" = 10001, "OwnerUserId" = 10001, "ParentId" = 1000000, "PostTypeId" = 1, "Score" = 100, "Tags" = '<sql><postgres><mysql>', "Title" = 'Titulo Atualizado', "ViewCount" = 500 WHERE "Id" = 1000000;
UPDATE "Comments" SET "PostId" = 10000000, "Score" = 15, "Text" = 'Texto do comentário atualizado', "CreationDate" = CURRENT_TIMESTAMP, "UserId" = 10001 WHERE "Id" = 10000000;
UPDATE "LinkTypes" SET "Type" = 'Tipo de Link Atualizado' WHERE "Id" = 100;
UPDATE "PostLinks" SET "CreationDate" = CURRENT_TIMESTAMP, "PostId" = 10000000, "RelatedPostId" = 10000000, "LinkTypeId" = 3 WHERE "Id" = 100000;
UPDATE "VoteTypes" SET "Name" = 'Tipo Voto Atualizado' WHERE "Id" = 100;
UPDATE "Votes" SET "PostId" = 10000000, "VoteTypeId" = 99, "UserId" = 10001, "CreationDate" = CURRENT_TIMESTAMP, "BountyAmount" = 50 WHERE "Id" = 10000000;



