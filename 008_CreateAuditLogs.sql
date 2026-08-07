-- =====================================
-- Smart ERP Pro
-- Audit Log Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE AuditLogs
(
    AuditId INT IDENTITY(1,1) PRIMARY KEY,

    UserId INT NULL,

    ModuleName NVARCHAR(100) NOT NULL,

    ActionName NVARCHAR(100) NOT NULL,

    RecordId INT NULL,

    OldValue NVARCHAR(MAX),

    NewValue NVARCHAR(MAX),

    IPAddress NVARCHAR(50),

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_AuditLogs_Users
    FOREIGN KEY (UserId)
    REFERENCES Users(UserId)
);

GO

PRINT 'Audit Log System Created Successfully';
