-- Hash indexes nao ideais para com_subconsultas (MySQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON Users (DisplayName(255)) USING HASH;
CREATE INDEX idx_posts_id_hash_extra2 ON Posts (Id) USING HASH;
CREATE INDEX idx_posts_viewcount_hash_extra2 ON Posts (ViewCount) USING HASH;
CREATE INDEX idx_comments_score_hash_extra2 ON Comments (Score) USING HASH;
CREATE INDEX idx_badges_user_hash_extra2 ON Badges (UserId) USING HASH;
