-- B+ tree indexes nao ideais para operacoes_de_agrupamento_e_agregacoes (MySQL)
CREATE INDEX idx_posts_title_btree_extra2 ON Posts (Title);
CREATE INDEX idx_posts_body_btree_extra2 ON Posts (Body);
CREATE INDEX idx_comments_text_btree_extra2 ON Comments (Text);
CREATE INDEX idx_badges_id_btree_extra2 ON Badges (Id);
