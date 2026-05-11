-- Hash indexes for chave-primaria_faixa_chaves_primarias (PostgreSQL)
CREATE INDEX idx_users_id_hash ON "Users" USING HASH ("Id");
CREATE INDEX idx_posttypes_id_hash ON "PostTypes" USING HASH ("Id");
CREATE INDEX idx_badges_id_hash ON "Badges" USING HASH ("Id");
CREATE INDEX idx_posts_id_hash ON "Posts" USING HASH ("Id");
CREATE INDEX idx_comments_id_hash ON "Comments" USING HASH ("Id");
CREATE INDEX idx_linktypes_id_hash ON "LinkTypes" USING HASH ("Id");
CREATE INDEX idx_postlinks_id_hash ON "PostLinks" USING HASH ("Id");
CREATE INDEX idx_votetypes_id_hash ON "VoteTypes" USING HASH ("Id");
CREATE INDEX idx_votes_id_hash ON "Votes" USING HASH ("Id");
