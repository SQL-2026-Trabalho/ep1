-- B+ tree indexes for com_like (PostgreSQL)
CREATE INDEX idx_users_displayname_btree ON "Users" ("DisplayName");
CREATE INDEX idx_votetypes_name_btree ON "VoteTypes" ("Name");
CREATE INDEX idx_postlinks_creationdate_text_btree
  ON "PostLinks" ((CAST("CreationDate" AS TEXT)) text_pattern_ops);
