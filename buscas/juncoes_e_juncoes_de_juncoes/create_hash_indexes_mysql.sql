-- Hash indexes for juncoes_e_juncoes_de_juncoes (MySQL)
CREATE INDEX idx_posts_owner_hash ON Posts (OwnerUserId) USING HASH;
CREATE INDEX idx_posts_posttype_hash ON Posts (PostTypeId) USING HASH;
CREATE INDEX idx_posts_parent_hash ON Posts (ParentId) USING HASH;
CREATE INDEX idx_votes_votetype_hash ON Votes (VoteTypeId) USING HASH;
CREATE INDEX idx_votes_post_hash ON Votes (PostId) USING HASH;
CREATE INDEX idx_comments_user_hash ON Comments (UserId) USING HASH;
CREATE INDEX idx_badges_user_hash ON Badges (UserId) USING HASH;
CREATE INDEX idx_badges_name_hash ON Badges (Name) USING HASH;
CREATE INDEX idx_postlinks_post_hash ON PostLinks (PostId) USING HASH;
CREATE INDEX idx_postlinks_linktype_hash ON PostLinks (LinkTypeId) USING HASH;
