-- Hash indexes nao ideais para juncoes_e_juncoes_de_juncoes (MySQL)
CREATE INDEX idx_users_displayname_hash_extra2 ON Users (DisplayName) USING HASH;
CREATE INDEX idx_posts_title_hash_extra2 ON Posts (Title) USING HASH;
CREATE INDEX idx_posts_body_hash_extra2 ON Posts (Body) USING HASH;
CREATE INDEX idx_votetypes_name_hash_extra2 ON VoteTypes (Name) USING HASH;
CREATE INDEX idx_linktypes_type_hash_extra2 ON LinkTypes (Type) USING HASH;
CREATE INDEX idx_badges_date_hash_extra2 ON Badges (Date) USING HASH;
