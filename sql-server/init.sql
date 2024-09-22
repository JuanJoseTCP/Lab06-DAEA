CREATE DATABASE MovieLens;
GO

USE MovieLens;
GO

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title NVARCHAR(255),
    Genres NVARCHAR(255)
);

CREATE TABLE Ratings (
    UserID INT,
    MovieID INT,
    Rating FLOAT,
    Timestamp BIGINT
);

CREATE TABLE Tags (
    UserID INT,
    MovieID INT,
    Tag NVARCHAR(255),
    Timestamp BIGINT
);

CREATE TABLE Links (
    MovieID INT PRIMARY KEY,
    IMDbID INT,
    TMDbID INT
);

BULK INSERT Movies
FROM '/var/opt/mssql/app/data/movies.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT Ratings
FROM '/var/opt/mssql/app/data/ratings.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT Tags
FROM '/var/opt/mssql/app/data/tags.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT Links
FROM '/var/opt/mssql/app/data/links.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);
GO