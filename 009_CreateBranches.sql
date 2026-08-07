-- =====================================
-- Smart ERP Pro
-- Branch Management Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Branches
(
    BranchId INT IDENTITY(1,1) PRIMARY KEY,

    CompanyId INT NOT NULL,

    BranchCode NVARCHAR(50) UNIQUE NOT NULL,

    BranchName NVARCHAR(150) NOT NULL,

    BranchType NVARCHAR(100),

    Address NVARCHAR(500),

    Phone NVARCHAR(30),

    Email NVARCHAR(100),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Branches_Companies
    FOREIGN KEY (CompanyId)
    REFERENCES Companies(CompanyId)
);

GO


-- Default Branch Example

INSERT INTO Branches
(CompanyId, BranchCode, BranchName, BranchType)

VALUES

(1,'HO-001','Head Office','Head Office'),

(1,'FAC-001','Factory','Factory'),

(1,'GD-001','Main Godown','Warehouse'),

(1,'SC-001','Service Center','Service');


GO

PRINT 'Branch Management Created Successfully';
