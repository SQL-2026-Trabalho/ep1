-- une o conteudo do post, o autor e o tipo do post.
SELECT posts.Title, users.DisplayName, postype.Type
FROM Posts posts
JOIN Users users ON posts.OwnerUserId = users.Id
JOIN PostTypes postype ON posts.PostTypeId = postype.Id
LIMIT 100;

-- relaciona os votos recebidos por um post e quem foi o autor original desse post.
SELECT votes.Id as VoteId, votetypes.Name as VoteType, posts.Title
FROM Votes votes
JOIN VoteTypes votetypes ON votes.VoteTypeId = votetypes.Id
JOIN Posts posts ON votes.PostId = posts.Id
LIMIT 100;

-- lista os comentarios e o nome de quem os escreveu.
SELECT coments.Text, users.DisplayName, coments.Score
FROM Comments coments
JOIN Users users ON coments.UserId = users.Id
WHERE coments.Score > 5;

-- relaciona quais usuarios ganharam medalhas especificas.
SELECT users.DisplayName, badges.Name, badges.Date
FROM Badges badges
JOIN Users users ON badges.UserId = users.Id
WHERE badges.Name = 'Teacher';

-- mostra posts relacionados e o motivo do link.
SELECT posts.Title as OriginalPost, postlinks.RelatedPostId, linktypes.Type as RelationType
FROM PostLinks postlinks
JOIN Posts posts ON postlinks.PostId = posts.Id
JOIN LinkTypes linktypes ON postlinks.LinkTypeId = linktypes.Id;

-- auto-relacionamento em posts
SELECT pergunta.Title as Pergunta, resposta.Body as Resposta
FROM Posts pergunta
JOIN Posts resposta ON resposta.ParentId = pergunta.Id
WHERE pergunta.PostTypeId = 1; 




