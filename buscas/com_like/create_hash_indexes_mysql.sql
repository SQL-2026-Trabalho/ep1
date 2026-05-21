-- Hash indexes for com_like (MySQL)
CREATE INDEX idx_users_displayname_hash ON Users (DisplayName(255)) USING HASH;
CREATE INDEX idx_posts_body_hash ON Posts (Body(255)) USING HASH;
CREATE INDEX idx_badges_name_hash ON Badges (Name(255)) USING HASH;
CREATE INDEX idx_comments_text_hash ON Comments (Text(255)) USING HASH;
CREATE INDEX idx_posttypes_type_hash ON PostTypes (Type(255)) USING HASH;
CREATE INDEX idx_linktypes_type_hash ON LinkTypes (Type(255)) USING HASH;
CREATE INDEX idx_postlinks_creationdate_hash ON PostLinks (CreationDate) USING HASH;
CREATE INDEX idx_votetypes_name_hash ON VoteTypes (Name(255)) USING HASH;
CREATE INDEX idx_votes_creationdate_hash ON Votes (CreationDate) USING HASH;
