USE SmartERP;
GO

CREATE TABLE QCInspections
(
    QCId INT IDENTITY(1,1) PRIMARY KEY,

    QCNumber NVARCHAR(50) UNIQUE NOT NULL,

    GRNId INT NULL,

    ProductId INT NOT NULL,

    WarehouseId INT NOT NULL,

    InspectionDate DATETIME DEFAULT GETDATE(),

    ReceivedQty DECIMAL(18,2) DEFAULT 0,

    CheckedQty DECIMAL(18,2) DEFAULT 0,

    PassedQty DECIMAL(18,2) DEFAULT 0,

    FailedQty DECIMAL(18,2) DEFAULT 0,

    DamageQty DECIMAL(18,2) DEFAULT 0,

    QCStatus NVARCHAR(50) DEFAULT 'Pending',

    InspectedBy INT NULL,

    Remarks NVARCHAR(500),

    CONSTRAINT FK_QC_GRN
        FOREIGN KEY (GRNId)
        REFERENCES GRNHeaders(GRNId),

    CONSTRAINT FK_QC_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId),

    CONSTRAINT FK_QC_Warehouse
        FOREIGN KEY (WarehouseId)
        REFERENCES Warehouses(WarehouseId),

    CONSTRAINT FK_QC_User
        FOREIGN KEY (InspectedBy)
        REFERENCES Users(UserId)
);

GO

PRINT 'QC System Created Successfully';
