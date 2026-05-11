-- Hash indexes for juncoes_e_juncoes_de_juncoes (PostgreSQL)
CREATE INDEX idx_posts_owner_hash ON "Posts" USING HASH ("OwnerUserId");
CREATE INDEX idx_posts_posttype_hash ON "Posts" USING HASH ("PostTypeId");
CREATE INDEX idx_posts_parent_hash ON "Posts" USING HASH ("ParentId");
CREATE INDEX idx_votes_votetype_hash ON "Votes" USING HASH ("VoteTypeId");
CREATE INDEX idx_votes_post_hash ON "Votes" USING HASH ("PostId");
CREATE INDEX idx_comments_user_hash ON "Comments" USING HASH ("UserId");
CREATE INDEX idx_badges_user_hash ON "Badges" USING HASH ("UserId");
CREATE INDEX idx_badges_name_hash ON "Badges" USING HASH ("Name");
CREATE INDEX idx_postlinks_post_hash ON "PostLinks" USING HASH ("PostId");
CREATE INDEX idx_postlinks_linktype_hash ON "PostLinks" USING HASH ("LinkTypeId");
