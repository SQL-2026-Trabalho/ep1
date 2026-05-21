-- Hash indexes nao ideais para nao_chave-primarias_com_selecoes_compostas (PostgreSQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON "Users" USING HASH ("DisplayName");
CREATE INDEX idx_users_aboutme_hash_extra2 ON "Users" USING HASH ("AboutMe");
CREATE INDEX idx_posts_title_hash_extra2 ON "Posts" USING HASH ("Title");
CREATE INDEX idx_posts_body_hash_extra2 ON "Posts" USING HASH ("Body");
CREATE INDEX idx_comments_text_hash_extra2 ON "Comments" USING HASH ("Text");
CREATE INDEX idx_badges_id_hash_extra2 ON "Badges" USING HASH ("Id");
