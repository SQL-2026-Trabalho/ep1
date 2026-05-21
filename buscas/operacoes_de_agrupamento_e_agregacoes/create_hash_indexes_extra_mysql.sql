-- Hash indexes nao ideais para operacoes_de_agrupamento_e_agregacoes (MySQL)
CREATE INDEX idx_posts_title_hash_extra2 ON Posts (Title(255)) USING HASH;
CREATE INDEX idx_posts_body_hash_extra2 ON Posts (Body(255)) USING HASH;
CREATE INDEX idx_comments_text_hash_extra2 ON Comments (Text(255)) USING HASH;
CREATE INDEX idx_badges_id_hash_extra2 ON Badges (Id) USING HASH;
