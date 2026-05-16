-- chave-primaria_faixa_chaves_primarias
DROP INDEX idx_users_id_hash ON Users;
DROP INDEX idx_posttypes_id_hash ON PostTypes;
DROP INDEX idx_badges_id_hash ON Badges;
DROP INDEX idx_posts_id_hash ON Posts;
DROP INDEX idx_comments_id_hash ON Comments;
DROP INDEX idx_linktypes_id_hash ON LinkTypes;
DROP INDEX idx_postlinks_id_hash ON PostLinks;
DROP INDEX idx_votetypes_id_hash ON VoteTypes;
DROP INDEX idx_votes_id_hash ON Votes;

DROP INDEX idx_users_id_hash_extra2 ON Users;
DROP INDEX idx_posttypes_id_hash_extra2 ON PostTypes;
DROP INDEX idx_badges_id_hash_extra2 ON Badges;
DROP INDEX idx_posts_id_hash_extra2 ON Posts;
DROP INDEX idx_comments_id_hash_extra2 ON Comments;
DROP INDEX idx_linktypes_id_hash_extra2 ON LinkTypes;
DROP INDEX idx_postlinks_id_hash_extra2 ON PostLinks;
DROP INDEX idx_votetypes_id_hash_extra2 ON VoteTypes;
DROP INDEX idx_votes_id_hash_extra2 ON Votes;

-- com_like
DROP INDEX idx_users_displayname_hash ON Users;
DROP INDEX idx_posts_body_hash ON Posts;
DROP INDEX idx_badges_name_hash ON Badges;
DROP INDEX idx_comments_text_hash ON Comments;
DROP INDEX idx_posttypes_type_hash ON PostTypes;
DROP INDEX idx_linktypes_type_hash ON LinkTypes;
DROP INDEX idx_postlinks_creationdate_hash ON PostLinks;
DROP INDEX idx_votetypes_name_hash ON VoteTypes;
DROP INDEX idx_votes_creationdate_hash ON Votes;

DROP INDEX idx_users_id_hash_extra ON Users;
DROP INDEX idx_posts_id_hash_extra ON Posts;
DROP INDEX idx_badges_id_hash_extra ON Badges;
DROP INDEX idx_comments_id_hash_extra ON Comments;
DROP INDEX idx_posttypes_id_hash_extra ON PostTypes;
DROP INDEX idx_linktypes_id_hash_extra ON LinkTypes;
DROP INDEX idx_postlinks_id_hash_extra ON PostLinks;
DROP INDEX idx_votetypes_id_hash_extra ON VoteTypes;
DROP INDEX idx_votes_id_hash_extra ON Votes;

-- com_subconsultas
DROP INDEX idx_badges_name_hash ON Badges;
DROP INDEX idx_posts_owner_hash ON Posts;
DROP INDEX idx_comments_post_hash ON Comments;
DROP INDEX idx_posts_posttype_hash ON Posts;

DROP INDEX idx_users_displayname_hash_extra2 ON Users;
DROP INDEX idx_posts_id_hash_extra2 ON Posts;
DROP INDEX idx_posts_viewcount_hash_extra2 ON Posts;
DROP INDEX idx_comments_score_hash_extra2 ON Comments;
DROP INDEX idx_badges_user_hash_extra2 ON Badges;

-- juncoes_e_juncoes_de_juncoes
DROP INDEX idx_posts_owner_hash ON Posts;
DROP INDEX idx_posts_posttype_hash ON Posts;
DROP INDEX idx_posts_parent_hash ON Posts;
DROP INDEX idx_votes_votetype_hash ON Votes;
DROP INDEX idx_votes_post_hash ON Votes;
DROP INDEX idx_comments_user_hash ON Comments;
DROP INDEX idx_badges_user_hash ON Badges;
DROP INDEX idx_badges_name_hash ON Badges;
DROP INDEX idx_postlinks_post_hash ON PostLinks;
DROP INDEX idx_postlinks_linktype_hash ON PostLinks;

DROP INDEX idx_users_displayname_hash_extra2 ON Users;
DROP INDEX idx_posts_title_hash_extra2 ON Posts;
DROP INDEX idx_posts_body_hash_extra2 ON Posts;
DROP INDEX idx_votetypes_name_hash_extra2 ON VoteTypes;
DROP INDEX idx_linktypes_type_hash_extra2 ON LinkTypes;
DROP INDEX idx_badges_date_hash_extra2 ON Badges;

-- nao_chave-primarias_com_selecoes_compostas
DROP INDEX idx_users_location_hash ON Users;
DROP INDEX idx_comments_user_hash ON Comments;
DROP INDEX idx_votes_type_hash ON Votes;
DROP INDEX idx_postlinks_type_hash ON PostLinks;
DROP INDEX idx_posttypes_type_hash ON PostTypes;
DROP INDEX idx_votetypes_name_hash ON VoteTypes;
DROP INDEX idx_linktypes_type_hash ON LinkTypes;

DROP INDEX idx_users_aboutme_hash_extra2 ON Users;
DROP INDEX idx_badges_id_hash_extra2 ON Badges;

-- operacoes_de_agrupamento_e_agregacoes
DROP INDEX idx_comments_post_hash ON Comments;

DROP INDEX idx_posts_title_hash_extra2 ON Posts;
DROP INDEX idx_posts_body_hash_extra2 ON Posts;
DROP INDEX idx_comments_text_hash_extra2 ON Comments;
DROP INDEX idx_badges_id_hash_extra2 ON Badges;