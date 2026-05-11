-- Hash indexes nao ideais para nao_chave-primarias_com_selecoes_compostas (MySQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON Users (DisplayName) USING HASH;
CREATE INDEX idx_users_aboutme_hash_extra2 ON Users (AboutMe) USING HASH;
CREATE INDEX idx_posts_title_hash_extra2 ON Posts (Title) USING HASH;
CREATE INDEX idx_posts_body_hash_extra2 ON Posts (Body) USING HASH;
CREATE INDEX idx_comments_text_hash_extra2 ON Comments (Text) USING HASH;
CREATE INDEX idx_badges_id_hash_extra2 ON Badges (Id) USING HASH;
