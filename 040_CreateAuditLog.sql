USE SmartERP;
GO

CREATE TABLE AuditLogs
(
    AuditId BIGINT IDENTITY(1,1) PRIMARY KEY,

    UserId INT NULL,

    ModuleName NVARCHAR(100),

    ActionType NVARCHAR(50),
    -- CREATE / UPDATE / DELETE / APPROVE / LOGIN

    ReferenceId INT NULL,

    ReferenceNumber NVARCHAR(100),

    ActionDate DATETIME DEFAULT GETDATE(),

    OldValue NVARCHAR(MAX),

    NewValue NVARCHAR(MAX),

    IPAddress NVARCHAR(50),

    Remarks NVARCHAR(500),

    CONSTRAINT FK_Audit_User
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
);

GO

PRINT 'Audit Log System Created Successfully';
