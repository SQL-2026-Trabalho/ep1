-- Hash indexes for nao_chave-primarias_com_selecoes_compostas (MySQL)
CREATE INDEX idx_users_location_hash ON Users (Location(255)) USING HASH;
CREATE INDEX idx_badges_name_hash ON Badges (Name(255)) USING HASH;
CREATE INDEX idx_comments_user_hash ON Comments (UserId) USING HASH;
CREATE INDEX idx_votes_type_hash ON Votes (VoteTypeId) USING HASH;
CREATE INDEX idx_postlinks_type_hash ON PostLinks (LinkTypeId) USING HASH;
CREATE INDEX idx_posttypes_type_hash ON PostTypes (Type(255)) USING HASH;
CREATE INDEX idx_votetypes_name_hash ON VoteTypes (Name(255)) USING HASH;
CREATE INDEX idx_linktypes_type_hash ON LinkTypes (Type(255)) USING HASH;
