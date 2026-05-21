-- B+ tree indexes nao ideais para juncoes_e_juncoes_de_juncoes (MySQL)
CREATE INDEX idx_users_displayname_btree_extra2 ON Users (DisplayName(255));
CREATE INDEX idx_posts_title_btree_extra2 ON Posts (Title(255));
CREATE INDEX idx_posts_body_btree_extra2 ON Posts (Body(255));
CREATE INDEX idx_votetypes_name_btree_extra2 ON VoteTypes (Name(255));
CREATE INDEX idx_linktypes_type_btree_extra2 ON LinkTypes (Type(255));
CREATE INDEX idx_badges_date_btree_extra2 ON Badges (Date);
