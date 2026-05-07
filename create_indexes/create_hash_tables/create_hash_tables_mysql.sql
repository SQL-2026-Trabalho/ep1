CREATE TABLE usuarios_hash AS
SELECT *
FROM Users;

ALTER TABLE usuarios_hash ENGINE = MEMORY;

CREATE TABLE posts_hash AS
SELECT *
FROM Posts;

ALTER TABLE posts_hash ENGINE = MEMORY;

CREATE TABLE badges_hash AS
SELECT *
FROM Badges;

ALTER TABLE badges_hash ENGINE = MEMORY;

CREATE TABLE comments_hash AS
SELECT *
FROM Comments;

ALTER TABLE comments_hash ENGINE = MEMORY;

CREATE TABLE posttypes_hash AS
SELECT *
FROM PostTypes;

ALTER TABLE posttypes_hash ENGINE = MEMORY;

CREATE TABLE linktypes_hash AS
SELECT *
FROM LinkTypes;

ALTER TABLE linktypes_hash ENGINE = MEMORY;

CREATE TABLE postlinks_hash AS
SELECT *
FROM PostLinks;

ALTER TABLE postlinks_hash ENGINE = MEMORY;

CREATE TABLE votetypes_hash AS
SELECT *
FROM VoteTypes;

ALTER TABLE votetypes_hash ENGINE = MEMORY;

CREATE TABLE votes_hash AS
SELECT *
FROM Votes;

ALTER TABLE votes_hash ENGINE = MEMORY;
