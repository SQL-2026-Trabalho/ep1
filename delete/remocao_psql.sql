-- Tabelas que dependem de Posts e Users (Filhas)
DELETE FROM "votes_for_delete" WHERE "Id" = 10000000;
DELETE FROM "post_links_for_delete" WHERE "Id" = 100000;
DELETE FROM "comments_for_delete" WHERE "Id" = 10000000;
DELETE FROM "badges_for_delete" WHERE "Id" = 100000;

-- Tabela de Posts (Pai das anteriores, mas filha de Users e PostTypes)
DELETE FROM "posts_for_delete" WHERE "Id" = 1000000;

-- Tabelas Base (Pai)
DELETE FROM "users_for_delete" WHERE "Id" = 10000;
DELETE FROM "post_types_for_delete" WHERE "Id" = 9;
DELETE FROM "link_types_for_delete" WHERE "Id" = 100;
DELETE FROM "vote_types_for_delete" WHERE "Id" = 100;