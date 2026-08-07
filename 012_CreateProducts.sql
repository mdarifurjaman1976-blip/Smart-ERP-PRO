-- =====================================
-- Smart ERP Pro
-- Product Master Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Products
(
    ProductId INT IDENTITY(1,1) PRIMARY KEY,

    ProductCode NVARCHAR(50) UNIQUE NOT NULL,

    ProductName NVARCHAR(200) NOT NULL,

    CategoryId INT NOT NULL,

    BrandId INT NOT NULL,

    Model NVARCHAR(100),

    Watt NVARCHAR(50),

    Voltage NVARCHAR(50),

    Unit NVARCHAR(50) DEFAULT 'PCS',

    WarrantyMonth INT DEFAULT 0,

    Barcode NVARCHAR(100),

    QRCode NVARCHAR(200),

    MinimumStock INT DEFAULT 0,

    PurchasePrice DECIMAL(18,2) DEFAULT 0,

    SalesPrice DECIMAL(18,2) DEFAULT 0,

    ProductImage NVARCHAR(300),

    Description NVARCHAR(500),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE(),


    CONSTRAINT FK_Product_Category
    FOREIGN KEY (CategoryId)
    REFERENCES ProductCategories(CategoryId),


    CONSTRAINT FK_Product_Brand
    FOREIGN KEY (BrandId)
    REFERENCES Brands(BrandId)
);

GO

PRINT 'Product Master Created Successfully';
