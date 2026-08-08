USE SmartERP;
GO

CREATE VIEW PaymentReport
AS
SELECT
    P.PaymentId,
    P.PaymentNumber,
    P.PaymentType,
    C.CustomerName,
    S.SupplierName,
    P.PaymentDate,
    P.Amount,
    P.PaymentMethod,
    P.ReferenceNo
FROM Payments P
LEFT JOIN Customers C
    ON P.CustomerId = C.CustomerId
LEFT JOIN Suppliers S
    ON P.SupplierId = S.SupplierId;
GO


CREATE VIEW ExpenseReport
AS
SELECT
    E.ExpenseId,
    E.ExpenseNumber,
    EC.CategoryName,
    W.WarehouseName,
    E.ExpenseDate,
    E.Amount,
    E.PaymentMethod,
    E.Status,
    E.Description
FROM Expenses E
INNER JOIN ExpenseCategories EC
    ON E.ExpenseCategoryId = EC.ExpenseCategoryId
LEFT JOIN Warehouses W
    ON E.WarehouseId = W.WarehouseId;
GO


PRINT 'Accounts & Expense Reports Created Successfully';
