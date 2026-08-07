-- =====================================
-- Smart ERP Pro
-- Permission Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Permissions
(
    PermissionId INT IDENTITY(1,1) PRIMARY KEY,

    RoleId INT NOT NULL,

    ModuleName NVARCHAR(100) NOT NULL,

    CanView BIT DEFAULT 0,

    CanAdd BIT DEFAULT 0,

    CanEdit BIT DEFAULT 0,

    CanDelete BIT DEFAULT 0,

    CanApprove BIT DEFAULT 0,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Permissions_Roles
    FOREIGN KEY (RoleId)
    REFERENCES Roles(RoleId)
);

GO


-- Default Permission Example

INSERT INTO Permissions
(RoleId, ModuleName, CanView, CanAdd, CanEdit, CanDelete, CanApprove)

VALUES

(1,'All Modules',1,1,1,1,1),

(4,'Inventory',1,1,1,0,0),

(5,'Purchase',1,1,1,0,1),

(6,'Service & Warranty',1,1,1,0,1),

(7,'Accounts',1,1,1,0,1),

(8,'Approval',1,0,0,0,1);


GO

PRINT 'Permission System Created Successfully';
