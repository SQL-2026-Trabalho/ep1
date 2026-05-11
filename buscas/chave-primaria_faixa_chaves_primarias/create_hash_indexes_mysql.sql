-- Hash indexes for chave-primaria_faixa_chaves_primarias (MySQL)
CREATE INDEX idx_users_id_hash ON Users (Id) USING HASH;
CREATE INDEX idx_posttypes_id_hash ON PostTypes (Id) USING HASH;
CREATE INDEX idx_badges_id_hash ON Badges (Id) USING HASH;
CREATE INDEX idx_posts_id_hash ON Posts (Id) USING HASH;
CREATE INDEX idx_comments_id_hash ON Comments (Id) USING HASH;
CREATE INDEX idx_linktypes_id_hash ON LinkTypes (Id) USING HASH;
CREATE INDEX idx_postlinks_id_hash ON PostLinks (Id) USING HASH;
CREATE INDEX idx_votetypes_id_hash ON VoteTypes (Id) USING HASH;
CREATE INDEX idx_votes_id_hash ON Votes (Id) USING HASH;
