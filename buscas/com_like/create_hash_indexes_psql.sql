-- Hash indexes for com_like (PostgreSQL)
CREATE INDEX idx_users_displayname_hash ON "Users" USING HASH ("DisplayName");
CREATE INDEX idx_posts_body_hash ON "Posts" USING HASH ("Body");
CREATE INDEX idx_badges_name_hash ON "Badges" USING HASH ("Name");
CREATE INDEX idx_comments_text_hash ON "Comments" USING HASH ("Text");
CREATE INDEX idx_posttypes_type_hash ON "PostTypes" USING HASH ("Type");
CREATE INDEX idx_linktypes_type_hash ON "LinkTypes" USING HASH ("Type");
CREATE INDEX idx_postlinks_creationdate_hash ON "PostLinks" USING HASH ("CreationDate");
CREATE INDEX idx_votetypes_name_hash ON "VoteTypes" USING HASH ("Name");
CREATE INDEX idx_votes_creationdate_hash ON "Votes" USING HASH ("CreationDate");
