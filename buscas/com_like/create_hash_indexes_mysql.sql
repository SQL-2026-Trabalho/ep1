-- Hash indexes for com_like (MySQL)
CREATE INDEX idx_users_displayname_hash ON Users (DisplayName) USING HASH;
CREATE INDEX idx_posts_body_hash ON Posts (Body) USING HASH;
CREATE INDEX idx_badges_name_hash ON Badges (Name) USING HASH;
CREATE INDEX idx_comments_text_hash ON Comments (Text) USING HASH;
CREATE INDEX idx_posttypes_type_hash ON PostTypes (Type) USING HASH;
CREATE INDEX idx_linktypes_type_hash ON LinkTypes (Type) USING HASH;
CREATE INDEX idx_postlinks_creationdate_hash ON PostLinks (CreationDate) USING HASH;
CREATE INDEX idx_votetypes_name_hash ON VoteTypes (Name) USING HASH;
CREATE INDEX idx_votes_creationdate_hash ON Votes (CreationDate) USING HASH;
