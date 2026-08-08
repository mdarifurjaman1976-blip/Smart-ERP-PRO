USE SmartERP;
GO

CREATE TABLE ApprovalWorkflows
(
    ApprovalId INT IDENTITY(1,1) PRIMARY KEY,

    ModuleName NVARCHAR(100) NOT NULL,

    ReferenceId INT NOT NULL,

    ReferenceNumber NVARCHAR(100),

    RequestedBy INT NOT NULL,

    ApprovedBy INT NULL,

    Status NVARCHAR(50) DEFAULT 'Pending',

    RequestDate DATETIME DEFAULT GETDATE(),

    ApprovalDate DATETIME NULL,

    Remarks NVARCHAR(500),

    CONSTRAINT FK_Approval_RequestUser
        FOREIGN KEY (RequestedBy)
        REFERENCES Users(UserId),

    CONSTRAINT FK_Approval_ApproveUser
        FOREIGN KEY (ApprovedBy)
        REFERENCES Users(UserId)
);

GO

PRINT 'Approval Workflow System Created Successfully';
