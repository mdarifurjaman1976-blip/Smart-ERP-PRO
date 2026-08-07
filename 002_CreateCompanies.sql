-- =====================================
-- Smart ERP Pro
-- Company Master Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Companies
(
    CompanyId INT IDENTITY(1,1) PRIMARY KEY,

    CompanyName NVARCHAR(200) NOT NULL,

    ShortName NVARCHAR(50),

    Address NVARCHAR(500),

    Phone NVARCHAR(30),

    Email NVARCHAR(100),

    Logo NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO

PRINT 'Companies Table Created Successfully';
