-- =====================================
-- Smart ERP Pro
-- Role Master Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Roles
(
    RoleId INT IDENTITY(1,1) PRIMARY KEY,

    RoleName NVARCHAR(100) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO

-- Default Roles Insert

INSERT INTO Roles
(RoleName, Description)
VALUES
('Super Admin','Full System Access'),
('Admin','Company Administration'),
('Manager','Management Access'),
('Store User','Inventory & GRN Access'),
('Purchase User','Purchase Module Access'),
('Service User','Service & Warranty Access'),
('Accounts User','Accounts Module Access'),
('Approver','Approval Permission');

GO

PRINT 'Roles Table Created Successfully';
