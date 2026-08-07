-- =====================================
-- Smart ERP Pro
-- Low Stock Alert System
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE VIEW LowStockAlert
AS

SELECT

    CS.ProductId,

    CS.ProductCode,

    CS.ProductName,

    CS.WarehouseName,

    CS.CurrentQuantity,

    P.MinimumStock

FROM CurrentStock CS

INNER JOIN Products P

ON CS.ProductId = P.ProductId

WHERE CS.CurrentQuantity <= P.MinimumStock;

GO


PRINT 'Low Stock Alert System Created Successfully';
