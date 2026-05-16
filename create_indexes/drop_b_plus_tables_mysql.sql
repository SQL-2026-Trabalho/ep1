-- chave-primaria_faixa_chaves_primarias
DROP INDEX idx_users_id_btree_extra2 ON Users;
DROP INDEX idx_posttypes_id_btree_extra2 ON PostTypes;
DROP INDEX idx_badges_id_btree_extra2 ON Badges;
DROP INDEX idx_posts_id_btree_extra2 ON Posts;
DROP INDEX idx_comments_id_btree_extra2 ON Comments;
DROP INDEX idx_linktypes_id_btree_extra2 ON LinkTypes;
DROP INDEX idx_postlinks_id_btree_extra2 ON PostLinks;
DROP INDEX idx_votetypes_id_btree_extra2 ON VoteTypes;
DROP INDEX idx_votes_id_btree_extra2 ON Votes;

-- com_like
DROP INDEX idx_users_displayname_btree ON Users;
DROP INDEX idx_votetypes_name_btree ON VoteTypes;
DROP INDEX idx_postlinks_creationdate_btree ON PostLinks;

DROP INDEX idx_posts_body_btree_extra ON Posts;
DROP INDEX idx_badges_name_btree_extra ON Badges;
DROP INDEX idx_comments_text_btree_extra ON Comments;
DROP INDEX idx_posttypes_type_btree_extra ON PostTypes;
DROP INDEX idx_linktypes_type_btree_extra ON LinkTypes;
DROP INDEX idx_postlinks_creationdate_btree_extra ON PostLinks;
DROP INDEX idx_votes_creationdate_btree_extra ON Votes;

-- com_subconsultas
DROP INDEX idx_badges_name_user_btree ON Badges;
DROP INDEX idx_users_reputation_btree ON Users;
DROP INDEX idx_posts_owner_btree ON Posts;
DROP INDEX idx_comments_post_score_btree ON Comments;
DROP INDEX idx_posts_posttype_btree ON Posts;

DROP INDEX idx_users_displayname_btree_extra2 ON Users;
DROP INDEX idx_posts_viewcount_btree_extra2 ON Posts;
DROP INDEX idx_comments_score_btree_extra2 ON Comments;
DROP INDEX idx_badges_user_btree_extra2 ON Badges;

-- juncoes_e_juncoes_de_juncoes
DROP INDEX idx_posts_owner_btree ON Posts;
DROP INDEX idx_posts_posttype_btree ON Posts;
DROP INDEX idx_posts_parent_btree ON Posts;
DROP INDEX idx_votes_votetype_btree ON Votes;
DROP INDEX idx_votes_post_btree ON Votes;
DROP INDEX idx_comments_user_btree ON Comments;
DROP INDEX idx_comments_score_btree ON Comments;
DROP INDEX idx_badges_user_btree ON Badges;
DROP INDEX idx_badges_name_btree ON Badges;
DROP INDEX idx_postlinks_post_btree ON PostLinks;
DROP INDEX idx_postlinks_linktype_btree ON PostLinks;

DROP INDEX idx_users_displayname_btree_extra2 ON Users;
DROP INDEX idx_posts_title_btree_extra2 ON Posts;
DROP INDEX idx_posts_body_btree_extra2 ON Posts;
DROP INDEX idx_votetypes_name_btree_extra2 ON VoteTypes;
DROP INDEX idx_linktypes_type_btree_extra2 ON LinkTypes;
DROP INDEX idx_badges_date_btree_extra2 ON Badges;

-- nao_chave-primarias_com_selecoes_compostas
DROP INDEX idx_users_location_rep_btree ON Users;
DROP INDEX idx_users_lastaccess_views_btree ON Users;
DROP INDEX idx_posts_score_answer_btree ON Posts;
DROP INDEX idx_posts_creationdate_btree ON Posts;
DROP INDEX idx_badges_name_date_btree ON Badges;
DROP INDEX idx_comments_user_score_btree ON Comments;
DROP INDEX idx_votes_type_bounty_btree ON Votes;
DROP INDEX idx_postlinks_type_date_btree ON PostLinks;
DROP INDEX idx_posttypes_type_btree ON PostTypes;
DROP INDEX idx_votetypes_name_btree ON VoteTypes;
DROP INDEX idx_linktypes_type_btree ON LinkTypes;

DROP INDEX idx_users_aboutme_btree_extra2 ON Users;
DROP INDEX idx_comments_text_btree_extra2 ON Comments;
DROP INDEX idx_badges_id_btree_extra2 ON Badges;

-- operacoes_de_agrupamento_e_agregacoes
DROP INDEX idx_posts_owner_btree ON Posts;
DROP INDEX idx_posts_posttype_btree ON Posts;
DROP INDEX idx_comments_post_btree ON Comments;
DROP INDEX idx_badges_name_btree ON Badges;

DROP INDEX idx_posts_title_btree_extra2 ON Posts;
DROP INDEX idx_posts_body_btree_extra2 ON Posts;
DROP INDEX idx_comments_text_btree_extra2 ON Comments;
DROP INDEX idx_badges_id_btree_extra2 ON Badges;