create table Region(
	Name VARCHAR Primary key NOT NULL UNIQUE
);

CREATE TABLE Team(
	Name VARCHAR Primary key NOT NULL UNIQUE,
	City VARCHAR,
	Owner VARCHAR,
	Create_Date Date,
	Region_Name VARCHAR,
	Picture VARCHAR,
	FOREIGN KEY (Region_Name) REFERENCES Region(Name)
);

CREATE TABLE Player(
	ID VARCHAR NOT NULL UNIQUE Primary key,
	Name VARCHAR,
	Birth_Date Date,
	Role VARCHAR,
	Team_Name VARCHAR,
	Join_Date VARCHAR,
	Picture VARCHAR,
	FOREIGN KEY (Team_Name) REFERENCES Team(Name)
);

create table Game(
	Start_time timestamp Primary key NOT NULL UNIQUE,
	End_time timestamp,
	Fraction_of_final VARCHAR,
	No Integer,
	Winner VARCHAR,
	Team_Red VARCHAR,
	Team_Blue VARCHAR,
	MVP VARCHAR,
	FOREIGN KEY (Team_Red) REFERENCES Team(Name),
	FOREIGN KEY (Team_Blue) REFERENCES Team(Name),
	FOREIGN KEY (MVP) REFERENCES Player(ID)
);

create table App_User(
	Username VARCHAR Primary key NOT NULL UNIQUE,
	Password VARCHAR,
	Role VARCHAR
);

create table Vote(
	Game_start_time timestamp NOT NULL,
	Username VARCHAR NOT NULL,
	Winner VARCHAR NOT NULL,
	CONSTRAINT pk_Vote_Id PRIMARY KEY (Game_start_time, Username,Winner),
	FOREIGN KEY (Game_start_time) REFERENCES Game(Start_time),
	FOREIGN KEY (Username) REFERENCES App_User(Username)
);

