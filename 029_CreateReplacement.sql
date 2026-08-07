-- =====================================
-- Smart ERP Pro
-- Replacement Management System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Replacements
(
    ReplacementId INT IDENTITY(1,1) PRIMARY KEY,

    ReplacementNumber NVARCHAR(50) UNIQUE NOT NULL,

    ClaimId INT NULL,

    CustomerId INT NOT NULL,

    OldProductId INT NOT NULL,

    NewProductId INT NOT NULL,

    OldQuantity DECIMAL(18,2) DEFAULT 0,

    NewQuantity DECIMAL(18,2) DEFAULT 0,

    ReplacementDate DATETIME DEFAULT GETDATE(),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ApprovedBy INT NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_Replacement_Claim
    FOREIGN KEY (ClaimId)
    REFERENCES WarrantyClaims(ClaimId),


    CONSTRAINT FK_Replacement_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_Replacement_OldProduct
    FOREIGN KEY (OldProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_Replacement_NewProduct
    FOREIGN KEY (NewProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_Replacement_Approver
    FOREIGN KEY (ApprovedBy)
    REFERENCES Users(UserId)

);

GO

PRINT 'Replacement Management System Created Successfully';
