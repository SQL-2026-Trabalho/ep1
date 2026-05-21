-- B+ tree indexes nao ideais para chave-primaria_faixa_chaves_primarias (MySQL)
CREATE INDEX idx_users_id_btree_extra2 ON Users (DisplayName(255));
CREATE INDEX idx_posttypes_id_btree_extra2 ON PostTypes (Type(255));
CREATE INDEX idx_badges_id_btree_extra2 ON Badges (Name(255));
CREATE INDEX idx_posts_id_btree_extra2 ON Posts (Title(255));
CREATE INDEX idx_comments_id_btree_extra2 ON Comments (Text(255));
CREATE INDEX idx_linktypes_id_btree_extra2 ON LinkTypes (Type(255));
CREATE INDEX idx_postlinks_id_btree_extra2 ON PostLinks (CreationDate);
CREATE INDEX idx_votetypes_id_btree_extra2 ON VoteTypes (Name(255));
CREATE INDEX idx_votes_id_btree_extra2 ON Votes (CreationDate);
