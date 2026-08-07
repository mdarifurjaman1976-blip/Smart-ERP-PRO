-- =====================================
-- Smart ERP Pro
-- Goods Receive Note (GRN)
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE GRNHeaders
(
    GRNId INT IDENTITY(1,1) PRIMARY KEY,

    GRNNumber NVARCHAR(50) UNIQUE NOT NULL,

    POId INT NULL,

    SupplierId INT NOT NULL,

    SupplierInvoiceNo NVARCHAR(100),

    ReceiveDate DATETIME DEFAULT GETDATE(),

    WarehouseId INT NOT NULL,

    Status NVARCHAR(50) DEFAULT 'Received',

    ReceivedBy INT NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_GRN_PO
    FOREIGN KEY (POId)
    REFERENCES PurchaseOrders(POId),


    CONSTRAINT FK_GRN_Supplier
    FOREIGN KEY (SupplierId)
    REFERENCES Suppliers(SupplierId),


    CONSTRAINT FK_GRN_Warehouse
    FOREIGN KEY (WarehouseId)
    REFERENCES Warehouses(WarehouseId),


    CONSTRAINT FK_GRN_User
    FOREIGN KEY (ReceivedBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE GRNDetails
(
    GRNDetailId INT IDENTITY(1,1) PRIMARY KEY,

    GRNId INT NOT NULL,

    ProductId INT NOT NULL,

    OrderedQty DECIMAL(18,2),

    ReceivedQty DECIMAL(18,2),

    DamageQty DECIMAL(18,2) DEFAULT 0,


    CONSTRAINT FK_GRN_Detail_Header
    FOREIGN KEY (GRNId)
    REFERENCES GRNHeaders(GRNId),


    CONSTRAINT FK_GRN_Detail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'GRN System Created Successfully';
