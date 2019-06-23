CREATE DATABASE CMSC495_Team3;
use CMSC495_Team3;

CREATE TABLE IF NOT EXISTS userLogin(
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(50)  NOT NULL,
    UserEmail VARCHAR(255) NOT NULL,
    UserId int PRIMARY KEY,
    FirstName VARCHAR(100) NULL,
    LastName VARCHAR(100) NULL,
    Location VARCHAR(255) NULL    
);

CREATE TABLE IF NOT EXISTS socialMedia(
    Vendor VARCHAR(25) PRIMARY KEY,
    BaseUrl VARCHAR(100) NOT NULL,
    AccountUrl VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS socialMediaAccount(
    User_FK INT NOT NULL,
    Vender_FK VARCHAR(25) NOT NULL,
    AccountId VARCHAR(100) NOT NULL,
    FOREIGN KEY (User_FK) REFERENCES userLogin(UserId),
    FOREIGN KEY (Vender_FK) REFERENCES socialMedia(Vendor)
);

CREATE TABLE IF NOT EXISTS brewery(
    BreweryName VARCHAR(255) NOT NULL,
    Address VARCHAR(1024) NULL,
    Phone VARCHAR(20) NULL,
    BreweryId INT PRIMARY KEY,
    UntappedId INT NULL,
    BreweryDbId INT NULL,
    LabelUrl VARCHAR(1024) NULL,
    OrgType VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS Beer(
    Brewery_FK INT NOT NULL,
    BeerId INT PRIMARY KEY,
    UntappdId INT NULL,
    BreweryDbId INT NULL,
    BeerName VARCHAR(255) NOT NULL,
    ABV FLOAT NULL,
    Description VARCHAR(2000) NULL,
    IBU INT NULL,
    Style VARCHAR(255) NULL,
    ShortStyle VARCHAR(255) NULL,
    LabelUrl VARCHAR(1024) NULL,
    FOREIGN KEY (Brewery_FK) REFERENCES brewery(BreweryId)
);

CREATE TABLE IF NOT EXISTS beerRankings(
    User_FK INT NOT NULL,
    Beer_FK INT NOT NULL,
    Score FLOAT NULL,
    UserRankPosition INT NULL,
    HaveTried BOOLEAN NOT NULL,
    UntappdReviewId INT NULL,
    BreweryDbId INT NULL,
    Description VARCHAR(2048) NULL,
    UserReview VARCHAR (2048) NULL,    
    FOREIGN KEY (User_FK) REFERENCES userLogin(UserId),
    FOREIGN KEY (Beer_FK) REFERENCES beer(BeerId)
);