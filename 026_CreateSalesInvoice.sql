-- =====================================
-- Smart ERP Pro
-- Sales Invoice System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE SalesInvoices
(
    InvoiceId INT IDENTITY(1,1) PRIMARY KEY,

    InvoiceNumber NVARCHAR(50) UNIQUE NOT NULL,

    DeliveryId INT NOT NULL,

    CustomerId INT NOT NULL,

    InvoiceDate DATETIME DEFAULT GETDATE(),

    SubTotal DECIMAL(18,2) DEFAULT 0,

    Discount DECIMAL(18,2) DEFAULT 0,

    VATAmount DECIMAL(18,2) DEFAULT 0,

    NetAmount DECIMAL(18,2) DEFAULT 0,

    PaymentStatus NVARCHAR(50) DEFAULT 'Unpaid',

    CreatedBy INT NULL,


    CONSTRAINT FK_Invoice_Delivery
    FOREIGN KEY (DeliveryId)
    REFERENCES Deliveries(DeliveryId),


    CONSTRAINT FK_Invoice_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customers(CustomerId),


    CONSTRAINT FK_Invoice_User
    FOREIGN KEY (CreatedBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE SalesInvoiceDetails
(
    InvoiceDetailId INT IDENTITY(1,1) PRIMARY KEY,

    InvoiceId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2),

    UnitPrice DECIMAL(18,2),

    TotalAmount AS (Quantity * UnitPrice),


    CONSTRAINT FK_InvoiceDetail_Header
    FOREIGN KEY (InvoiceId)
    REFERENCES SalesInvoices(InvoiceId),


    CONSTRAINT FK_InvoiceDetail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'Sales Invoice System Created Successfully';
