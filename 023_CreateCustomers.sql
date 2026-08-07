-- =====================================
-- Smart ERP Pro
-- Customer Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Customers
(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,

    CustomerCode NVARCHAR(50) UNIQUE NOT NULL,

    CustomerName NVARCHAR(200) NOT NULL,

    CompanyName NVARCHAR(200),

    CustomerType NVARCHAR(100),

    ContactPerson NVARCHAR(150),

    Mobile NVARCHAR(30),

    Email NVARCHAR(100),

    Address NVARCHAR(500),

    CreditLimit DECIMAL(18,2) DEFAULT 0,

    PaymentTerms NVARCHAR(100),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO

PRINT 'Customer Management Created Successfully';
