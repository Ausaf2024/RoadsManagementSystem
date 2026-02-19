CREATE TABLE zonemaster
(
    ZoneID INT PRIMARY KEY IDENTITY(1,1),
    ZoneName VARCHAR(100) NOT NULL
);

CREATE TABLE circlemaster
(
    CircleID INT PRIMARY KEY IDENTITY(1,1),
    CircleName VARCHAR(100) NOT NULL,
    ZoneID INT,
    FOREIGN KEY (ZoneID) REFERENCES zonemaster(ZoneID)
);

CREATE TABLE divisionmaster
(
    DivisionID INT PRIMARY KEY IDENTITY(1,1),
    DivisionName VARCHAR(100) NOT NULL,
    CircleID INT,
    FOREIGN KEY (CircleID) REFERENCES circlemaster(CircleID)
);


INSERT INTO zonemaster (ZoneName) VALUES ('North Zone'), ('South Zone');

INSERT INTO circlemaster (CircleName, ZoneID) 
VALUES ('Circle A', 1), ('Circle B', 2)

INSERT INTO divisionmaster (DivisionName, CircleID) 
VALUES ('Division 1', 1), ('Division 2', 2)

select * from zonemaster
select * from circlemaster
select * from divisionmaster
select * from usermaster
select * from road_details

cretate   TABLE usermaster
(
    UserID INT PRIMARY KEY IDENTITY(1,1),

    Username VARCHAR(50) NOT NULL UNIQUE,

    Password VARCHAR(255) NOT NULL,

    ZoneID varchar NULL,
    CircleID varchar NULL,
    DivisionID varchar NULL,

    IsActive BIT NOT NULL DEFAULT 1,
	
    CreatedDate DATETIME DEFAULT GETDATE()
)

INSERT INTO usermaster
(Username, Password, ZoneID, CircleID, DivisionID, IsActive, usertype)
VALUES
('divisionadmin', '19d450f27cf8399f4f8f96416efc1e8b7de013b6001f9756693af4f20494ebe09977a5553a23f5a50158214c2cff5ab4fc2dd7ebc0d114d4b2a8370d1701fbd7', Null, Null, 3, 1,'division');

CREATE TABLE road_details
(
    roadid INT PRIMARY KEY,

    zone VARCHAR(25),
    circle VARCHAR(25),
    division VARCHAR(25),

    name_of_road VARCHAR(100),

    start_gps DECIMAL(10,6),
    end_gps DECIMAL(10,6),

    row_mtrs DECIMAL(10,2),
    carriageway_mtrs DECIMAL(10,2),
    length_km DECIMAL(10,2),

    lanes INT,

    footpath BIT,
    road_sign BIT,
    drain BIT,

    usertype VARCHAR(25)
);


