USE SmartERP;
GO

CREATE TABLE DamageReturns
(
    ReturnId INT IDENTITY(1,1) PRIMARY KEY,

    ReturnNumber NVARCHAR(50) UNIQUE NOT NULL,

    ProductId INT NOT NULL,

    WarehouseId INT NOT NULL,

    ReturnType NVARCHAR(50) NOT NULL,
    -- DAMAGE / CUSTOMER RETURN / SUPPLIER RETURN

    Quantity DECIMAL(18,2) NOT NULL,

    ReturnDate DATETIME DEFAULT GETDATE(),

    Reason NVARCHAR(500),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ReceivedBy INT NULL,

    ApprovedBy INT NULL,

    Remarks NVARCHAR(300),

    CONSTRAINT FK_Return_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId),

    CONSTRAINT FK_Return_Warehouse
        FOREIGN KEY (WarehouseId)
        REFERENCES Warehouses(WarehouseId),

    CONSTRAINT FK_Return_ReceivedBy
        FOREIGN KEY (ReceivedBy)
        REFERENCES Users(UserId),

    CONSTRAINT FK_Return_ApprovedBy
        FOREIGN KEY (ApprovedBy)
        REFERENCES Users(UserId)
);

GO

PRINT 'Damage & Return Management Created Successfully';
