-- =====================================
-- Smart ERP Pro
-- Sales Order System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE SalesOrders
(
    SalesOrderId INT IDENTITY(1,1) PRIMARY KEY,

    OrderNumber NVARCHAR(50) UNIQUE NOT NULL,

    CustomerId INT NOT NULL,

    OrderDate DATETIME DEFAULT GETDATE(),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ApprovedBy INT NULL,

    ApprovalDate DATETIME NULL,

    TotalAmount DECIMAL(18,2) DEFAULT 0,

    Discount DECIMAL(18,2) DEFAULT 0,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_SalesOrder_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_SalesOrder_Approver
    FOREIGN KEY (ApprovedBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE SalesOrderDetails
(
    SalesOrderDetailId INT IDENTITY(1,1) PRIMARY KEY,

    SalesOrderId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2),

    UnitPrice DECIMAL(18,2),

    TotalPrice AS (Quantity * UnitPrice),


    CONSTRAINT FK_SalesDetail_Order
    FOREIGN KEY (SalesOrderId)
    REFERENCES SalesOrders(SalesOrderId),


    CONSTRAINT FK_SalesDetail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'Sales Order System Created Successfully';
