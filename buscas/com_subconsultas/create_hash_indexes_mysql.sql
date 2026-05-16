-- Hash indexes for com_subconsultas (MySQL)
CREATE INDEX idx_badges_name_hash ON Badges (Name(255)) USING HASH;
CREATE INDEX idx_posts_owner_hash ON Posts (OwnerUserId) USING HASH;
CREATE INDEX idx_comments_post_hash ON Comments (PostId) USING HASH;
CREATE INDEX idx_posts_posttype_hash ON Posts (PostTypeId) USING HASH;
