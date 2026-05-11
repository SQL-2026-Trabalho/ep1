CREATE TABLE IF NOT EXISTS users_for_delete AS SELECT * FROM Users WHERE 1=0;
CREATE TABLE IF NOT EXISTS posts_for_delete AS SELECT * FROM Posts WHERE 1=0;
CREATE TABLE IF NOT EXISTS badges_for_delete AS SELECT * FROM Badges WHERE 1=0;
CREATE TABLE IF NOT EXISTS comments_for_delete AS SELECT * FROM Comments WHERE 1=0;
CREATE TABLE IF NOT EXISTS posttypes_for_delete AS SELECT * FROM PostTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS linktypes_for_delete AS SELECT * FROM LinkTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS postlinks_for_delete AS SELECT * FROM PostLinks WHERE 1=0;
CREATE TABLE IF NOT EXISTS votetypes_for_delete AS SELECT * FROM VoteTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS votes_for_delete AS SELECT * FROM Votes WHERE 1=0;

INSERT IGNORE INTO users_for_delete SELECT * FROM Users;
INSERT IGNORE INTO posts_for_delete SELECT * FROM Posts;
INSERT IGNORE INTO badges_for_delete SELECT * FROM Badges;
INSERT IGNORE INTO comments_for_delete SELECT * FROM Comments;
INSERT IGNORE INTO posttypes_for_delete SELECT * FROM PostTypes;
INSERT IGNORE INTO linktypes_for_delete SELECT * FROM LinkTypes;
INSERT IGNORE INTO postlinks_for_delete SELECT * FROM PostLinks;
INSERT IGNORE INTO votetypes_for_delete SELECT * FROM VoteTypes;
INSERT IGNORE INTO votes_for_delete SELECT * FROM Votes;