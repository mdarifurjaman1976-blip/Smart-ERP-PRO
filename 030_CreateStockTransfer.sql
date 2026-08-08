USE SmartERP;
GO

CREATE TABLE StockTransfers
(
    TransferId INT IDENTITY(1,1) PRIMARY KEY,
    TransferNumber NVARCHAR(50) UNIQUE NOT NULL,
    FromWarehouseId INT NOT NULL,
    ToWarehouseId INT NOT NULL,
    TransferDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pending',
    RequestedBy INT NOT NULL,
    ApprovedBy INT NULL,
    ApprovalDate DATETIME NULL,
    Remarks NVARCHAR(300),

    CONSTRAINT FK_Transfer_FromWarehouse
        FOREIGN KEY (FromWarehouseId)
        REFERENCES Warehouses(WarehouseId),

    CONSTRAINT FK_Transfer_ToWarehouse
        FOREIGN KEY (ToWarehouseId)
        REFERENCES Warehouses(WarehouseId),

    CONSTRAINT FK_Transfer_RequestUser
        FOREIGN KEY (RequestedBy)
        REFERENCES Users(UserId),

    CONSTRAINT FK_Transfer_ApproveUser
        FOREIGN KEY (ApprovedBy)
        REFERENCES Users(UserId)
);
GO

CREATE TABLE StockTransferDetails
(
    TransferDetailId INT IDENTITY(1,1) PRIMARY KEY,
    TransferId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity DECIMAL(18,2) NOT NULL,

    CONSTRAINT FK_TransferDetail_Header
        FOREIGN KEY (TransferId)
        REFERENCES StockTransfers(TransferId),

    CONSTRAINT FK_TransferDetail_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
);
GO
