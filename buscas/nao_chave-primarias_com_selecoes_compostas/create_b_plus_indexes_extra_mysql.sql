-- B+ tree indexes nao ideais para nao_chave-primarias_com_selecoes_compostas (MySQL)
CREATE INDEX idx_users_displayname_btree_extra2 ON Users (DisplayName);
CREATE INDEX idx_users_aboutme_btree_extra2 ON Users (AboutMe);
CREATE INDEX idx_posts_title_btree_extra2 ON Posts (Title);
CREATE INDEX idx_posts_body_btree_extra2 ON Posts (Body);
CREATE INDEX idx_comments_text_btree_extra2 ON Comments (Text);
CREATE INDEX idx_badges_id_btree_extra2 ON Badges (Id);
