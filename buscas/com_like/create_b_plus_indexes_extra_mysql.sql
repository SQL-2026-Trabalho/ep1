-- B+ tree indexes nao ideais para com_like (MySQL)
CREATE INDEX idx_posts_body_btree_extra ON Posts (Body(255));
CREATE INDEX idx_badges_name_btree_extra ON Badges (Name(255));
CREATE INDEX idx_comments_text_btree_extra ON Comments (Text(255));
CREATE INDEX idx_posttypes_type_btree_extra ON PostTypes (Type(255));
CREATE INDEX idx_linktypes_type_btree_extra ON LinkTypes (Type(255));
CREATE INDEX idx_postlinks_creationdate_btree_extra ON PostLinks (CreationDate);
CREATE INDEX idx_votes_creationdate_btree_extra ON Votes (CreationDate);
