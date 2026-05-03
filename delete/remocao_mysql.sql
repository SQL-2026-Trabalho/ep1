-- Tabelas que dependem de Posts e Users (Filhas)
DELETE FROM Votes WHERE Id = 10000000;
DELETE FROM PostLinks WHERE Id = 100000;
DELETE FROM Comments WHERE Id = 10000000;
DELETE FROM Badges WHERE Id = 100000;

-- Tabela de Posts (Pai das anteriores, mas filha de Users e PostTypes)
DELETE FROM Posts WHERE Id = 1000000;

-- Tabelas Base (Pai)
DELETE FROM Users WHERE Id = 10000;
DELETE FROM PostTypes WHERE Id = 9;
DELETE FROM LinkTypes WHERE Id = 100;
DELETE FROM VoteTypes WHERE Id = 100;