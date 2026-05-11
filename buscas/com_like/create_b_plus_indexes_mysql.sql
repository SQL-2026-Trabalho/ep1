-- B+ tree indexes for com_like (MySQL)
CREATE INDEX idx_users_displayname_btree ON Users (DisplayName);
CREATE INDEX idx_votetypes_name_btree ON VoteTypes (Name);
CREATE INDEX idx_postlinks_creationdate_btree ON PostLinks (CreationDate);
