-- Hash indexes nao ideais para com_subconsultas (PostgreSQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON "Users" USING HASH ("DisplayName");
CREATE INDEX idx_posts_id_hash_extra2 ON "Posts" USING HASH ("Id");
CREATE INDEX idx_posts_viewcount_hash_extra2 ON "Posts" USING HASH ("ViewCount");
CREATE INDEX idx_comments_score_hash_extra2 ON "Comments" USING HASH ("Score");
CREATE INDEX idx_badges_user_hash_extra2 ON "Badges" USING HASH ("UserId");
