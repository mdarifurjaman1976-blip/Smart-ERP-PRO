USE SmartERP;
GO

CREATE TABLE ServiceQC
(
    ServiceQCId INT IDENTITY(1,1) PRIMARY KEY,

    JobCardId INT NOT NULL,

    QCDate DATETIME DEFAULT GETDATE(),

    TestResult NVARCHAR(50) DEFAULT 'Pending',

    TestedBy INT NULL,

    FaultFound NVARCHAR(500),

    ActionTaken NVARCHAR(500),

    QCRemarks NVARCHAR(500),

    CONSTRAINT FK_ServiceQC_JobCard
        FOREIGN KEY (JobCardId)
        REFERENCES ServiceJobCards(JobCardId),

    CONSTRAINT FK_ServiceQC_User
        FOREIGN KEY (TestedBy)
        REFERENCES Users(UserId)
);

GO


CREATE TABLE ServiceCompletions
(
    CompletionId INT IDENTITY(1,1) PRIMARY KEY,

    JobCardId INT NOT NULL,

    CompletionDate DATETIME DEFAULT GETDATE(),

    CompletionStatus NVARCHAR(50) DEFAULT 'Completed',

    CustomerReceivedBy NVARCHAR(150),

    CustomerMobile NVARCHAR(30),

    DeliveryDate DATETIME NULL,

    Remarks NVARCHAR(500),

    CONSTRAINT FK_ServiceCompletion_JobCard
        FOREIGN KEY (JobCardId)
        REFERENCES ServiceJobCards(JobCardId)
);

GO

PRINT 'Service QC & Job Completion Created Successfully';
