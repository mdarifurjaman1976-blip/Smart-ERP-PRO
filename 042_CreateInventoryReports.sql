USE SmartERP;
GO

-- 1. Warehouse-wise Current Stock
CREATE VIEW WarehouseStockReport
AS
SELECT
    ProductId,
    ProductCode,
    ProductName,
    WarehouseName,
    CurrentQuantity
FROM CurrentStock;
GO


-- 2. Low Stock Report
CREATE VIEW InventoryLowStockReport
AS
SELECT
    ProductId,
    ProductCode,
    ProductName,
    WarehouseName,
    CurrentQuantity,
    MinimumStock
FROM LowStockAlert;
GO


PRINT 'Inventory Reports Created Successfully';
