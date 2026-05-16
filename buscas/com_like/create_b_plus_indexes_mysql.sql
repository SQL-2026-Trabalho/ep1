-- B+ tree indexes for com_like (MySQL)
CREATE INDEX idx_users_displayname_btree ON Users (DisplayName(255));
CREATE INDEX idx_votetypes_name_btree ON VoteTypes (Name(255));
CREATE INDEX idx_postlinks_creationdate_btree ON PostLinks (CreationDate);
