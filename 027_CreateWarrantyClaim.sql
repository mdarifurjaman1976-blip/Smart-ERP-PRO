-- =====================================
-- Smart ERP Pro
-- Warranty Claim System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE WarrantyClaims
(
    ClaimId INT IDENTITY(1,1) PRIMARY KEY,

    ClaimNumber NVARCHAR(50) UNIQUE NOT NULL,

    CustomerId INT NOT NULL,

    ProductId INT NOT NULL,

    InvoiceId INT NULL,

    SerialNumber NVARCHAR(100),

    ClaimDate DATETIME DEFAULT GETDATE(),

    ProblemDescription NVARCHAR(500),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ApprovedBy INT NULL,

    ApprovalDate DATETIME NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_Warranty_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_Warranty_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_Warranty_Invoice
    FOREIGN KEY (InvoiceId)
    REFERENCES SalesInvoices(InvoiceId),


    CONSTRAINT FK_Warranty_Approver
    FOREIGN KEY (ApprovedBy)
    REFERENCES Users(UserId)

);

GO

PRINT 'Warranty Claim System Created Successfully';
