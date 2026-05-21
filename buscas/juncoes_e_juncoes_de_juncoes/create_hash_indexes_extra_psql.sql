-- Hash indexes nao ideais para juncoes_e_juncoes_de_juncoes (PostgreSQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON "Users" USING HASH ("DisplayName");
CREATE INDEX idx_posts_title_hash_extra2 ON "Posts" USING HASH ("Title");
CREATE INDEX idx_posts_body_hash_extra2 ON "Posts" USING HASH ("Body");
CREATE INDEX idx_votetypes_name_hash_extra2 ON "VoteTypes" USING HASH ("Name");
CREATE INDEX idx_linktypes_type_hash_extra2 ON "LinkTypes" USING HASH ("Type");
CREATE INDEX idx_badges_date_hash_extra2 ON "Badges" USING HASH ("Date");
