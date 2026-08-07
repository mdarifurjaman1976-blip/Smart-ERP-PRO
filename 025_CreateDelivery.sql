-- =====================================
-- Smart ERP Pro
-- Delivery & Stock Out System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Deliveries
(
    DeliveryId INT IDENTITY(1,1) PRIMARY KEY,

    DeliveryNumber NVARCHAR(50) UNIQUE NOT NULL,

    SalesOrderId INT NOT NULL,

    CustomerId INT NOT NULL,

    WarehouseId INT NOT NULL,

    DeliveryDate DATETIME DEFAULT GETDATE(),

    Status NVARCHAR(50) DEFAULT 'Delivered',

    DeliveredBy INT NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_Delivery_Order
    FOREIGN KEY (SalesOrderId)
    REFERENCES SalesOrders(SalesOrderId),


    CONSTRAINT FK_Delivery_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_Delivery_Warehouse
    FOREIGN KEY (WarehouseId)
    REFERENCES Warehouses(WarehouseId),


    CONSTRAINT FK_Delivery_User
    FOREIGN KEY (DeliveredBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE DeliveryDetails
(
    DeliveryDetailId INT IDENTITY(1,1) PRIMARY KEY,

    DeliveryId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2),


    CONSTRAINT FK_DeliveryDetail_Header
    FOREIGN KEY (DeliveryId)
    REFERENCES Deliveries(DeliveryId),


    CONSTRAINT FK_DeliveryDetail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'Delivery System Created Successfully';
