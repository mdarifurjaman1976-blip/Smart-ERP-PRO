-- =====================================
-- Smart ERP Pro
-- Purchase Requisition System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE PurchaseRequisitions
(
    RequisitionId INT IDENTITY(1,1) PRIMARY KEY,

    RequisitionNo NVARCHAR(50) UNIQUE NOT NULL,

    RequestedBy INT NOT NULL,

    Department NVARCHAR(100),

    RequestDate DATETIME DEFAULT GETDATE(),

    Status NVARCHAR(50) DEFAULT 'Pending',

    ApprovedBy INT NULL,

    ApprovalDate DATETIME NULL,

    Remarks NVARCHAR(300),


    CONSTRAINT FK_PR_RequestUser
    FOREIGN KEY (RequestedBy)
    REFERENCES Users(UserId),


    CONSTRAINT FK_PR_ApproveUser
    FOREIGN KEY (ApprovedBy)
    REFERENCES Users(UserId)

);

GO


CREATE TABLE PurchaseRequisitionDetails
(
    DetailId INT IDENTITY(1,1) PRIMARY KEY,

    RequisitionId INT NOT NULL,

    ProductId INT NOT NULL,

    Quantity DECIMAL(18,2),

    Remarks NVARCHAR(200),


    CONSTRAINT FK_PR_Detail_Header
    FOREIGN KEY (RequisitionId)
    REFERENCES PurchaseRequisitions(RequisitionId),


    CONSTRAINT FK_PR_Detail_Product
    FOREIGN KEY (ProductId)
    REFERENCES Products(ProductId)

);

GO


PRINT 'Purchase Requisition System Created Successfully';
