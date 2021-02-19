--Allow more religions to be founded
UPDATE Worlds SET MaxActiveReligions = 100 WHERE MaxActiveReligions < 100;

INSERT INTO Beliefs
		(Type,			Description, Founder, Pantheon, Follower, Enhancer, Reformation)
SELECT  Type || '_1',	Description, Founder, Pantheon, Follower, Enhancer, Reformation
FROM Beliefs WHERE Type IS NOT NULL;

INSERT INTO Beliefs
		(Type,			Description, Founder, Pantheon, Follower, Enhancer, Reformation)
SELECT  Type || '_2',	Description, Founder, Pantheon, Follower, Enhancer, Reformation
FROM Beliefs WHERE Type IS NOT NULL;

INSERT INTO Beliefs
		(Type,			Description, Founder, Pantheon, Follower, Enhancer, Reformation)
SELECT  Type || '_3',	Description, Founder, Pantheon, Follower, Enhancer, Reformation
FROM Beliefs WHERE Type IS NOT NULL;

INSERT INTO Beliefs
		(Type,			Description, Founder, Pantheon, Follower, Enhancer, Reformation)
SELECT  Type || '_4',	Description, Founder, Pantheon, Follower, Enhancer, Reformation
FROM Beliefs WHERE Type IS NOT NULL;

INSERT INTO Beliefs
		(Type,			Description, Founder, Pantheon, Follower, Enhancer, Reformation)
SELECT  Type || '_5',	Description, Founder, Pantheon, Follower, Enhancer, Reformation
FROM Beliefs WHERE Type IS NOT NULL;