-- B+ tree indexes for juncoes_e_juncoes_de_juncoes (PostgreSQL)
CREATE INDEX idx_posts_owner_btree ON "Posts" ("OwnerUserId");
CREATE INDEX idx_posts_posttype_btree ON "Posts" ("PostTypeId");
CREATE INDEX idx_posts_parent_btree ON "Posts" ("ParentId");
CREATE INDEX idx_votes_votetype_btree ON "Votes" ("VoteTypeId");
CREATE INDEX idx_votes_post_btree ON "Votes" ("PostId");
CREATE INDEX idx_comments_user_btree ON "Comments" ("UserId");
CREATE INDEX idx_comments_score_btree ON "Comments" ("Score");
CREATE INDEX idx_badges_user_btree ON "Badges" ("UserId");
CREATE INDEX idx_badges_name_btree ON "Badges" ("Name");
CREATE INDEX idx_postlinks_post_btree ON "PostLinks" ("PostId");
CREATE INDEX idx_postlinks_linktype_btree ON "PostLinks" ("LinkTypeId");
