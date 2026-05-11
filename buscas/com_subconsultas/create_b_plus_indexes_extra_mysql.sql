-- B+ tree indexes nao ideais para com_subconsultas (MySQL)
CREATE INDEX idx_users_displayname_btree_extra2 ON Users (DisplayName);
CREATE INDEX idx_posts_id_btree_extra2 ON Posts (Id);
CREATE INDEX idx_posts_viewcount_btree_extra2 ON Posts (ViewCount);
CREATE INDEX idx_comments_score_btree_extra2 ON Comments (Score);
CREATE INDEX idx_badges_user_btree_extra2 ON Badges (UserId);
