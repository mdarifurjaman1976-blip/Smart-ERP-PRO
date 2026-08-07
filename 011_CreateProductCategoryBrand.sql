-- =====================================
-- Smart ERP Pro
-- Product Category & Brand
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE ProductCategories
(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,

    CategoryName NVARCHAR(150) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


CREATE TABLE Brands
(
    BrandId INT IDENTITY(1,1) PRIMARY KEY,

    BrandName NVARCHAR(100) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


-- Default Categories

INSERT INTO ProductCategories(CategoryName)
VALUES
('LED Light'),
('Switch & Socket'),
('MCB'),
('RCCB'),
('Piano'),
('Electrical Accessories');


-- Default Brand

INSERT INTO Brands(BrandName)
VALUES
('HEE');


GO

PRINT 'Product Category & Brand Created Successfully';
