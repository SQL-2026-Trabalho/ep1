-- B+ tree indexes for nao_chave-primarias_com_selecoes_compostas (PostgreSQL)
CREATE INDEX idx_users_location_rep_btree ON "Users" ("Location", "Reputation");
CREATE INDEX idx_users_lastaccess_views_btree ON "Users" ("LastAccessDate", "Views");
CREATE INDEX idx_posts_score_answer_btree ON "Posts" ("Score", "AnswerCount");
CREATE INDEX idx_posts_creationdate_btree ON "Posts" ("CreationDate");
CREATE INDEX idx_badges_name_date_btree ON "Badges" ("Name", "Date");
CREATE INDEX idx_comments_user_score_btree ON "Comments" ("UserId", "Score");
CREATE INDEX idx_votes_type_bounty_btree ON "Votes" ("VoteTypeId", "BountyAmount");
CREATE INDEX idx_postlinks_type_date_btree ON "PostLinks" ("LinkTypeId", "CreationDate");
CREATE INDEX idx_posttypes_type_btree ON "PostTypes" ("Type");
CREATE INDEX idx_votetypes_name_btree ON "VoteTypes" ("Name");
CREATE INDEX idx_linktypes_type_btree ON "LinkTypes" ("Type");
