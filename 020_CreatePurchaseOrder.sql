-- =====================================
-- Smart ERP Pro
-- Purchase Order System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE PurchaseOrders
(
    POId INT IDENTITY(1,1) PRIMARY KEY,

    PONumber NVARCHAR(50) UNIQUE NOT NULL,

    SupplierId INT NOT NULL,

    PODate DATETIME DEFAULT GETDATE(),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ApprovedBy INT NULL,

    ApprovalDate DATETIME NULL,

    TotalAmount DECIMAL(18,2) DEFAULT 0,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_PO_Supplier
    FOREIGN KEY (SupplierId)
    REFERENCES Suppliers(SupplierId),


    CONSTRAINT FK_PO_Approver
    FOREIGN KEY (ApprovedBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE PurchaseOrderDetails
(
    PODetailId INT IDENTITY(1,1) PRIMARY KEY,

    POId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2),

    UnitPrice DECIMAL(18,2),

    TotalPrice AS (Quantity * UnitPrice),


    CONSTRAINT FK_PO_Detail_Header
    FOREIGN KEY (POId)
    REFERENCES PurchaseOrders(POId),


    CONSTRAINT FK_PO_Detail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'Purchase Order System Created Successfully';
