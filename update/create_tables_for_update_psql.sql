CREATE TABLE IF NOT EXISTS usuarios_for_update AS SELECT * FROM Users WHERE 1=0;
CREATE TABLE IF NOT EXISTS posts_for_update AS SELECT * FROM Posts WHERE 1=0;
CREATE TABLE IF NOT EXISTS badges_for_update AS SELECT * FROM Badges WHERE 1=0;
CREATE TABLE IF NOT EXISTS comments_for_update AS SELECT * FROM Comments WHERE 1=0;
CREATE TABLE IF NOT EXISTS posttypes_for_update AS SELECT * FROM PostTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS linktypes_for_update AS SELECT * FROM LinkTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS postlinks_for_update AS SELECT * FROM PostLinks WHERE 1=0;
CREATE TABLE IF NOT EXISTS votetypes_for_update AS SELECT * FROM VoteTypes WHERE 1=0;
CREATE TABLE IF NOT EXISTS votes_for_update AS SELECT * FROM Votes WHERE 1=0;

INSERT INTO usuarios_for_update SELECT * FROM Users ON CONFLICT DO NOTHING;
INSERT INTO posts_for_update SELECT * FROM Posts ON CONFLICT DO NOTHING;
INSERT INTO badges_for_update SELECT * FROM Badges ON CONFLICT DO NOTHING;
INSERT INTO comments_for_update SELECT * FROM Comments ON CONFLICT DO NOTHING;
INSERT INTO posttypes_for_update SELECT * FROM PostTypes ON CONFLICT DO NOTHING;
INSERT INTO linktypes_for_update SELECT * FROM LinkTypes ON CONFLICT DO NOTHING;
INSERT INTO postlinks_for_update SELECT * FROM PostLinks ON CONFLICT DO NOTHING;
INSERT INTO votetypes_for_update SELECT * FROM VoteTypes ON CONFLICT DO NOTHING;
INSERT INTO votes_for_update SELECT * FROM Votes ON CONFLICT DO NOTHING;

DELETE FROM votes_for_update WHERE Id = 10000000;
DELETE FROM posts_for_update WHERE Id = 10000000;
DELETE FROM votetypes_for_update WHERE Id = 99;

UPDATE usuarios_for_update u SET Reputation = o.Reputation, CreationDate = o.CreationDate, DisplayName = o.DisplayName, LastAccessDate = o.LastAccessDate, WebsiteUrl = o.WebsiteUrl, Location = o.Location, AboutMe = o.AboutMe, Views = o.Views, UpVotes = o.UpVotes, DownVotes = o.DownVotes, EmailHash = o.EmailHash, AccountId = o.AccountId, Age = o.Age FROM Users o WHERE u.Id = o.Id AND u.Id = 10000;
UPDATE posttypes_for_update p SET Type = o.Type FROM PostTypes o WHERE p.Id = o.Id AND p.Id = 9;
UPDATE badges_for_update b SET Name = o.Name, UserId = o.UserId, Date = o.Date FROM Badges o WHERE b.Id = o.Id AND b.Id = 100000;
UPDATE posts_for_update p SET AcceptedAnswerId = o.AcceptedAnswerId, AnswerCount = o.AnswerCount, Body = o.Body, ClosedDate = o.ClosedDate, CommentCount = o.CommentCount, CommunityOwnedDate = o.CommunityOwnedDate, CreationDate = o.CreationDate, FavoriteCount = o.FavoriteCount, LastActivityDate = o.LastActivityDate, LastEditDate = o.LastEditDate, LastEditorDisplayName = o.LastEditorDisplayName, LastEditorUserId = o.LastEditorUserId, OwnerUserId = o.OwnerUserId, ParentId = o.ParentId, PostTypeId = o.PostTypeId, Score = o.Score, Tags = o.Tags, Title = o.Title, ViewCount = o.ViewCount FROM Posts o WHERE p.Id = o.Id AND p.Id = 1000000;
UPDATE comments_for_update c SET PostId = o.PostId, Score = o.Score, Text = o.Text, CreationDate = o.CreationDate, UserId = o.UserId FROM Comments o WHERE c.Id = o.Id AND c.Id = 10000000;
UPDATE linktypes_for_update l SET Type = o.Type FROM LinkTypes o WHERE l.Id = o.Id AND l.Id = 100;
UPDATE postlinks_for_update p SET CreationDate = o.CreationDate, PostId = o.PostId, RelatedPostId = o.RelatedPostId, LinkTypeId = o.LinkTypeId FROM PostLinks o WHERE p.Id = o.Id AND p.Id = 100000;
UPDATE votetypes_for_update v SET Name = o.Name FROM VoteTypes o WHERE v.Id = o.Id AND v.Id = 100;
UPDATE votes_for_update v SET PostId = o.PostId, VoteTypeId = o.VoteTypeId, UserId = o.UserId, CreationDate = o.CreationDate, BountyAmount = o.BountyAmount FROM Votes o WHERE v.Id = o.Id AND v.Id = 10000000;