CREATE TABLE report(
	rID INT,
	rTitle VARCHAR(50),
	userID VARCHAR(20),
	rDate DATETIME,
	rContent VARCHAR(2048),
	rAvailable INT,
	PRIMARY KEY (rID)
);