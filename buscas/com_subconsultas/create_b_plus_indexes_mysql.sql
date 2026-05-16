-- B+ tree indexes for com_subconsultas (MySQL)
CREATE INDEX idx_badges_name_user_btree ON Badges (Name(255), UserId);
CREATE INDEX idx_users_reputation_btree ON Users (Reputation);
CREATE INDEX idx_posts_owner_btree ON Posts (OwnerUserId);
CREATE INDEX idx_comments_post_score_btree ON Comments (PostId, Score);
CREATE INDEX idx_posts_posttype_btree ON Posts (PostTypeId);
