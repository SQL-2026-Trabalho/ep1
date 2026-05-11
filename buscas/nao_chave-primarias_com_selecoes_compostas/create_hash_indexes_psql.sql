-- Hash indexes for nao_chave-primarias_com_selecoes_compostas (PostgreSQL)
CREATE INDEX idx_users_location_hash ON "Users" USING HASH ("Location");
CREATE INDEX idx_badges_name_hash ON "Badges" USING HASH ("Name");
CREATE INDEX idx_comments_user_hash ON "Comments" USING HASH ("UserId");
CREATE INDEX idx_votes_type_hash ON "Votes" USING HASH ("VoteTypeId");
CREATE INDEX idx_postlinks_type_hash ON "PostLinks" USING HASH ("LinkTypeId");
CREATE INDEX idx_posttypes_type_hash ON "PostTypes" USING HASH ("Type");
CREATE INDEX idx_votetypes_name_hash ON "VoteTypes" USING HASH ("Name");
CREATE INDEX idx_linktypes_type_hash ON "LinkTypes" USING HASH ("Type");
