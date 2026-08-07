-- =====================================
-- Smart ERP Pro
-- Inventory Transaction Engine
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE InventoryTransactions
(
    TransactionId INT IDENTITY(1,1) PRIMARY KEY,

    ProductId INT NOT NULL,

    WarehouseId INT NOT NULL,

    TransactionType NVARCHAR(50) NOT NULL,

    ReferenceNo NVARCHAR(100),

    Quantity DECIMAL(18,2) NOT NULL,

    TransactionDate DATETIME DEFAULT GETDATE(),

    Remarks NVARCHAR(300),

    CreatedBy INT NULL,


    CONSTRAINT FK_Inventory_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId),


    CONSTRAINT FK_Inventory_Warehouse
    FOREIGN KEY (WarehouseId)
    REFERENCES Warehouses(WarehouseId),


    CONSTRAINT FK_Inventory_User
    FOREIGN KEY (CreatedBy)
    REFERENCES Users(UserId)

);

GO


PRINT 'Inventory Transaction Engine Created Successfully';
