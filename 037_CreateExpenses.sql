USE SmartERP;
GO

CREATE TABLE ExpenseCategories
(
    ExpenseCategoryId INT IDENTITY(1,1) PRIMARY KEY,

    CategoryName NVARCHAR(150) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


CREATE TABLE Expenses
(
    ExpenseId INT IDENTITY(1,1) PRIMARY KEY,

    ExpenseNumber NVARCHAR(50) UNIQUE NOT NULL,

    ExpenseCategoryId INT NOT NULL,

    WarehouseId INT NULL,

    ExpenseDate DATETIME DEFAULT GETDATE(),

    Amount DECIMAL(18,2) NOT NULL,

    PaymentMethod NVARCHAR(50),

    ReferenceNo NVARCHAR(100),

    Description NVARCHAR(500),

    ApprovedBy INT NULL,

    CreatedBy INT NULL,

    Status NVARCHAR(50) DEFAULT 'Pending',

    CONSTRAINT FK_Expense_Category
        FOREIGN KEY (ExpenseCategoryId)
        REFERENCES ExpenseCategories(ExpenseCategoryId),

    CONSTRAINT FK_Expense_Warehouse
        FOREIGN KEY (WarehouseId)
        REFERENCES Warehouses(WarehouseId),

    CONSTRAINT FK_Expense_Approver
        FOREIGN KEY (ApprovedBy)
        REFERENCES Users(UserId),

    CONSTRAINT FK_Expense_Creator
        FOREIGN KEY (CreatedBy)
        REFERENCES Users(UserId)
);

GO


INSERT INTO ExpenseCategories(CategoryName)
VALUES
('Transport'),
('Electricity'),
('Office Expense'),
('Service Expense'),
('Maintenance'),
('Salary'),
('Other');

GO

PRINT 'Expense Management Created Successfully';
