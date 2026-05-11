-- B+ tree indexes for operacoes_de_agrupamento_e_agregacoes (MySQL)
CREATE INDEX idx_posts_owner_btree ON Posts (OwnerUserId);
CREATE INDEX idx_posts_posttype_btree ON Posts (PostTypeId);
CREATE INDEX idx_comments_post_btree ON Comments (PostId);
CREATE INDEX idx_badges_name_btree ON Badges (Name);
