-- =====================================
-- Smart ERP Pro
-- Opening Stock Management
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE OpeningStocks
(
    OpeningStockId INT IDENTITY(1,1) PRIMARY KEY,

    ProductId INT NOT NULL,

    WarehouseId INT NOT NULL,

    RackId INT NULL,

    Quantity DECIMAL(18,2) DEFAULT 0,

    UnitCost DECIMAL(18,2) DEFAULT 0,

    TotalValue AS (Quantity * UnitCost),

    OpeningDate DATETIME DEFAULT GETDATE(),

    CreatedDate DATETIME DEFAULT GETDATE(),


    CONSTRAINT FK_OpeningStock_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_OpeningStock_Warehouse
    FOREIGN KEY (WarehouseId)
    REFERENCES Warehouses(WarehouseId),


    CONSTRAINT FK_OpeningStock_Rack
    FOREIGN KEY (RackId)
    REFERENCES RackLocations(RackId)
);

GO

PRINT 'Opening Stock Management Created Successfully';
