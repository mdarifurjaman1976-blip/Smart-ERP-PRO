-- =====================================
-- Smart ERP Pro
-- Supplier Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Suppliers
(
    SupplierId INT IDENTITY(1,1) PRIMARY KEY,

    SupplierCode NVARCHAR(50) UNIQUE NOT NULL,

    SupplierName NVARCHAR(200) NOT NULL,

    ContactPerson NVARCHAR(150),

    Mobile NVARCHAR(30),

    Email NVARCHAR(100),

    Address NVARCHAR(500),

    PaymentTerms NVARCHAR(200),

    TaxNumber NVARCHAR(100),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO

PRINT 'Supplier Management Created Successfully';
