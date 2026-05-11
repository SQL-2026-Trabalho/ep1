-- Hash indexes for com_subconsultas (PostgreSQL)
CREATE INDEX idx_badges_name_hash ON "Badges" USING HASH ("Name");
CREATE INDEX idx_posts_owner_hash ON "Posts" USING HASH ("OwnerUserId");
CREATE INDEX idx_comments_post_hash ON "Comments" USING HASH ("PostId");
CREATE INDEX idx_posts_posttype_hash ON "Posts" USING HASH ("PostTypeId");
