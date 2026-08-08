USE SmartERP;
GO

CREATE TABLE ServiceTeams
(
    TeamId INT IDENTITY(1,1) PRIMARY KEY,

    TeamCode NVARCHAR(50) UNIQUE NOT NULL,

    TeamName NVARCHAR(150) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE ServiceTechnicians
(
    TechnicianId INT IDENTITY(1,1) PRIMARY KEY,

    EmployeeCode NVARCHAR(50) UNIQUE NOT NULL,

    TechnicianName NVARCHAR(150) NOT NULL,

    TeamId INT NOT NULL,

    Mobile NVARCHAR(30),

    Skill NVARCHAR(200),

    IsActive BIT DEFAULT 1,

    JoinedDate DATE,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Technician_Team
        FOREIGN KEY (TeamId)
        REFERENCES ServiceTeams(TeamId)
);
GO


PRINT 'Service Team & Technician Management Created Successfully';
