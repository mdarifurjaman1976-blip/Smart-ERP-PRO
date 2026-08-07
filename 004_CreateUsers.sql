-- =====================================
-- Smart ERP Pro
-- User Management Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Users
(
    UserId INT IDENTITY(1,1) PRIMARY KEY,

    CompanyId INT NOT NULL,

    RoleId INT NOT NULL,

    EmployeeId NVARCHAR(50),

    FullName NVARCHAR(150) NOT NULL,

    UserName NVARCHAR(100) UNIQUE NOT NULL,

    PasswordHash NVARCHAR(500) NOT NULL,

    Mobile NVARCHAR(30),

    Email NVARCHAR(100),

    Department NVARCHAR(100),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Users_Companies
    FOREIGN KEY (CompanyId)
    REFERENCES Companies(CompanyId),

    CONSTRAINT FK_Users_Roles
    FOREIGN KEY (RoleId)
    REFERENCES Roles(RoleId)
);

GO

PRINT 'Users Table Created Successfully';
