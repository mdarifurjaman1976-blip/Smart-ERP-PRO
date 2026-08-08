USE SmartERP;
GO

CREATE TABLE Payments
(
    PaymentId INT IDENTITY(1,1) PRIMARY KEY,

    PaymentNumber NVARCHAR(50) UNIQUE NOT NULL,

    PaymentType NVARCHAR(50) NOT NULL,
    -- RECEIVED / PAID

    CustomerId INT NULL,

    SupplierId INT NULL,

    InvoiceId INT NULL,

    PaymentDate DATETIME DEFAULT GETDATE(),

    Amount DECIMAL(18,2) NOT NULL,

    PaymentMethod NVARCHAR(50),
    -- CASH / BANK / MOBILE BANKING

    ReferenceNo NVARCHAR(100),

    Remarks NVARCHAR(300),

    ReceivedPaidBy INT NULL,

    CONSTRAINT FK_Payment_Customer
        FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId),

    CONSTRAINT FK_Payment_Supplier
        FOREIGN KEY (SupplierId)
        REFERENCES Suppliers(SupplierId),

    CONSTRAINT FK_Payment_Invoice
        FOREIGN KEY (InvoiceId)
        REFERENCES SalesInvoices(InvoiceId),

    CONSTRAINT FK_Payment_User
        FOREIGN KEY (ReceivedPaidBy)
        REFERENCES Users(UserId)
);

GO

PRINT 'Payment & Accounts Module Created Successfully';
