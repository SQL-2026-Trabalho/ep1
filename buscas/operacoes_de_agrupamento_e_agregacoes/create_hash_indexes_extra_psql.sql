-- Hash indexes nao ideais para operacoes_de_agrupamento_e_agregacoes (PostgreSQL)
CREATE INDEX idx_posts_title_hash_extra2 ON "Posts" USING HASH ("Title");
CREATE INDEX idx_posts_body_hash_extra2 ON "Posts" USING HASH ("Body");
CREATE INDEX idx_comments_text_hash_extra2 ON "Comments" USING HASH ("Text");
CREATE INDEX idx_badges_id_hash_extra2 ON "Badges" USING HASH ("Id");
