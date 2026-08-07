-- =====================================
-- Smart ERP Pro
-- Current Stock View
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE VIEW CurrentStock
AS

SELECT

    P.ProductId,

    P.ProductCode,

    P.ProductName,

    W.WarehouseName,

    SUM(
        CASE 
            WHEN I.TransactionType IN ('IN','TRANSFER IN')
            THEN I.Quantity

            WHEN I.TransactionType IN ('OUT','TRANSFER OUT')
            THEN -I.Quantity

            ELSE 0

        END
    ) AS CurrentQuantity


FROM InventoryTransactions I

INNER JOIN Products P
ON I.ProductId = P.ProductId

INNER JOIN Warehouses W
ON I.WarehouseId = W.WarehouseId


GROUP BY

    P.ProductId,
    P.ProductCode,
    P.ProductName,
    W.WarehouseName;

GO


PRINT 'Current Stock View Created Successfully';
