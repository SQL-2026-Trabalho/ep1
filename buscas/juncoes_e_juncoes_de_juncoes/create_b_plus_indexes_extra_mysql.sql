-- B+ tree indexes nao ideais para juncoes_e_juncoes_de_juncoes (MySQL)
CREATE INDEX idx_users_displayname_btree_extra2 ON Users (DisplayName);
CREATE INDEX idx_posts_title_btree_extra2 ON Posts (Title);
CREATE INDEX idx_posts_body_btree_extra2 ON Posts (Body);
CREATE INDEX idx_votetypes_name_btree_extra2 ON VoteTypes (Name);
CREATE INDEX idx_linktypes_type_btree_extra2 ON LinkTypes (Type);
CREATE INDEX idx_badges_date_btree_extra2 ON Badges (Date);
