USE SmartERP;
GO

CREATE TABLE ServiceParts
(
    ServicePartId INT IDENTITY(1,1) PRIMARY KEY,

    JobCardId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2) NOT NULL,

    UnitCost DECIMAL(18,2) DEFAULT 0,

    TotalCost AS (Quantity * UnitCost),

    UsedDate DATETIME DEFAULT GETDATE(),

    UsedBy INT NULL,

    Remarks NVARCHAR(300),

    CONSTRAINT FK_ServicePart_JobCard
        FOREIGN KEY (JobCardId)
        REFERENCES ServiceJobCards(JobCardId),

    CONSTRAINT FK_ServicePart_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId),

    CONSTRAINT FK_ServicePart_User
        FOREIGN KEY (UsedBy)
        REFERENCES Users(UserId)
);

GO

PRINT 'Service Parts & Repair Cost Created Successfully';
