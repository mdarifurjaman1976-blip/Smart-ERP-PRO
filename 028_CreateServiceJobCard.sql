-- =====================================
-- Smart ERP Pro
-- Service Job Card System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE ServiceJobCards
(
    JobCardId INT IDENTITY(1,1) PRIMARY KEY,

    JobCardNumber NVARCHAR(50) UNIQUE NOT NULL,

    ClaimId INT NULL,

    CustomerId INT NOT NULL,

    ProductId INT NOT NULL,

    TechnicianId INT NULL,

    ReceiveDate DATETIME DEFAULT GETDATE(),

    ProblemDetails NVARCHAR(500),

    ServiceStatus NVARCHAR(50) DEFAULT 'Received',

    QCStatus NVARCHAR(50) DEFAULT 'Pending',

    DeliveryDate DATETIME NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_Service_Claim
    FOREIGN KEY (ClaimId)
    REFERENCES WarrantyClaims(ClaimId),


    CONSTRAINT FK_Service_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_Service_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_Service_Technician
    FOREIGN KEY (TechnicianId)
    REFERENCES Users(UserId)

);

GO


PRINT 'Service Job Card System Created Successfully';
