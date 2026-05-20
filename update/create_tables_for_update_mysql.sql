CREATE TABLE IF NOT EXISTS users_for_update AS SELECT * FROM Users WHERE 1=0;
CREATE TABLE IF NOT EXISTS posts_for_update AS SELECT * FROM Posts WHERE 1=0;
CREATE TABLE IF NOT EXISTS badges_for_update AS SELECT * FROM Badges WHERE 1=0;
CREATE TABLE IF NOT EXISTS comments_for_update AS SELECT * FROM Comments WHERE 1=0;
CREATE TABLE IF NOT EXISTS posttypes_for_update AS SELECT * FROM PostTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS linktypes_for_update AS SELECT * FROM LinkTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS postlinks_for_update AS SELECT * FROM PostLinks WHERE 1=0;
CREATE TABLE IF NOT EXISTS votetypes_for_update AS SELECT * FROM VoteTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS votes_for_update AS SELECT * FROM Votes WHERE 1=0;

-- Garante limpeza total em cada nova rodada de medição
TRUNCATE TABLE users_for_update;
TRUNCATE TABLE posts_for_update;
TRUNCATE TABLE badges_for_update;
TRUNCATE TABLE comments_for_update;
TRUNCATE TABLE posttypes_for_update;
TRUNCATE TABLE linktypes_for_update;
TRUNCATE TABLE postlinks_for_update;
TRUNCATE TABLE votetypes_for_update;
TRUNCATE TABLE votes_for_update;

INSERT IGNORE INTO users_for_update SELECT * FROM Users;
INSERT IGNORE INTO posts_for_update SELECT * FROM Posts;
INSERT IGNORE INTO badges_for_update SELECT * FROM Badges;
INSERT IGNORE INTO comments_for_update SELECT * FROM Comments;
INSERT IGNORE INTO posttypes_for_update SELECT * FROM PostTypes;
INSERT IGNORE INTO linktypes_for_update SELECT * FROM LinkTypes;
INSERT IGNORE INTO postlinks_for_update SELECT * FROM PostLinks;
INSERT IGNORE INTO votetypes_for_update SELECT * FROM VoteTypes;
INSERT IGNORE INTO votes_for_update SELECT * FROM Votes;

DELETE FROM votes_for_update WHERE Id = 10000000;
DELETE FROM posts_for_update WHERE Id = 10000000;
DELETE FROM votetypes_for_update WHERE Id = 99;

UPDATE users_for_update u JOIN Users o ON u.Id = o.Id SET u.Reputation = o.Reputation, u.CreationDate = o.CreationDate, u.DisplayName = o.DisplayName, u.LastAccessDate = o.LastAccessDate, u.WebsiteUrl = o.WebsiteUrl, u.Location = o.Location, u.AboutMe = o.AboutMe, u.Views = o.Views, u.UpVotes = o.UpVotes, u.DownVotes = o.DownVotes, u.EmailHash = o.EmailHash, u.AccountId = o.AccountId, u.Age = o.Age WHERE u.Id = 10000;
UPDATE posttypes_for_update p JOIN PostTypes o ON p.Id = o.Id SET p.Type = o.Type WHERE p.Id = 9;
UPDATE badges_for_update b JOIN Badges o ON b.Id = o.Id SET b.Name = o.Name, b.UserId = o.UserId, b.Date = o.Date WHERE b.Id = 100000;
UPDATE posts_for_update p JOIN Posts o ON p.Id = o.Id SET p.AcceptedAnswerId = o.AcceptedAnswerId, p.AnswerCount = o.AnswerCount, p.Body = o.Body, p.ClosedDate = o.ClosedDate, p.CommentCount = o.CommentCount, p.CommunityOwnedDate = o.CommunityOwnedDate, p.CreationDate = o.CreationDate, p.FavoriteCount = o.FavoriteCount, p.LastActivityDate = o.LastActivityDate, p.LastEditDate = o.LastEditDate, p.LastEditorDisplayName = o.LastEditorDisplayName, p.LastEditorUserId = o.LastEditorUserId, p.OwnerUserId = o.OwnerUserId, p.ParentId = o.ParentId, p.PostTypeId = o.PostTypeId, p.Score = o.Score, p.Tags = o.Tags, p.Title = o.Title, p.ViewCount = o.ViewCount WHERE p.Id = 1000000;
UPDATE comments_for_update c JOIN Comments o ON c.Id = o.Id SET c.PostId = o.PostId, c.Score = o.Score, c.Text = o.Text, c.CreationDate = o.CreationDate, c.UserId = o.UserId WHERE c.Id = 10000000;
UPDATE linktypes_for_update l JOIN LinkTypes o ON l.Id = o.Id SET l.Type = o.Type WHERE l.Id = 100;
UPDATE postlinks_for_update p JOIN PostLinks o ON p.Id = o.Id SET p.CreationDate = o.CreationDate, p.PostId = o.PostId, p.RelatedPostId = o.RelatedPostId, p.LinkTypeId = o.LinkTypeId WHERE p.Id = 100000;
UPDATE votetypes_for_update v JOIN VoteTypes o ON v.Id = o.Id SET v.Name = o.Name WHERE v.Id = 100;
UPDATE votes_for_update v JOIN Votes o ON v.Id = o.Id SET v.PostId = o.PostId, v.VoteTypeId = o.VoteTypeId, v.UserId = o.UserId, v.CreationDate = o.CreationDate, v.BountyAmount = o.BountyAmount WHERE v.Id = 10000000;
