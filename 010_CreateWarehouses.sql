-- =====================================
-- Smart ERP Pro
-- Warehouse Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Warehouses
(
    WarehouseId INT IDENTITY(1,1) PRIMARY KEY,

    BranchId INT NOT NULL,

    WarehouseCode NVARCHAR(50) UNIQUE NOT NULL,

    WarehouseName NVARCHAR(150) NOT NULL,

    Address NVARCHAR(500),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Warehouses_Branches
    FOREIGN KEY (BranchId)
    REFERENCES Branches(BranchId)
);

GO


CREATE TABLE RackLocations
(
    RackId INT IDENTITY(1,1) PRIMARY KEY,

    WarehouseId INT NOT NULL,

    RackName NVARCHAR(50),

    ShelfName NVARCHAR(50),

    BinName NVARCHAR(50),

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Rack_Warehouse
    FOREIGN KEY (WarehouseId)
    REFERENCES Warehouses(WarehouseId)
);

GO


PRINT 'Warehouse Management Created Successfully';
