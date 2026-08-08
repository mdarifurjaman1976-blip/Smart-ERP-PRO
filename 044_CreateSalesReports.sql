USE SmartERP;
GO

CREATE VIEW SalesOrderReport
AS
SELECT
    SO.SalesOrderId,
    SO.OrderNumber,
    C.CustomerCode,
    C.CustomerName,
    SO.OrderDate,
    SO.Status,
    SO.TotalAmount,
    SO.Discount,
    COUNT(SOD.SalesOrderDetailId) AS TotalItems
FROM SalesOrders SO
INNER JOIN Customers C
    ON SO.CustomerId = C.CustomerId
LEFT JOIN SalesOrderDetails SOD
    ON SO.SalesOrderId = SOD.SalesOrderId
GROUP BY
    SO.SalesOrderId,
    SO.OrderNumber,
    C.CustomerCode,
    C.CustomerName,
    SO.OrderDate,
    SO.Status,
    SO.TotalAmount,
    SO.Discount;
GO


CREATE VIEW DeliveryReport
AS
SELECT
    D.DeliveryId,
    D.DeliveryNumber,
    C.CustomerName,
    W.WarehouseName,
    D.DeliveryDate,
    D.Status,
    COUNT(DD.DeliveryDetailId) AS TotalItems,
    SUM(DD.Quantity) AS TotalQuantity
FROM Deliveries D
INNER JOIN Customers C
    ON D.CustomerId = C.CustomerId
INNER JOIN Warehouses W
    ON D.WarehouseId = W.WarehouseId
LEFT JOIN DeliveryDetails DD
    ON D.DeliveryId = DD.DeliveryId
GROUP BY
    D.DeliveryId,
    D.DeliveryNumber,
    C.CustomerName,
    W.WarehouseName,
    D.DeliveryDate,
    D.Status;
GO


CREATE VIEW SalesInvoiceReport
AS
SELECT
    SI.InvoiceId,
    SI.InvoiceNumber,
    C.CustomerName,
    SI.InvoiceDate,
    SI.SubTotal,
    SI.Discount,
    SI.VATAmount,
    SI.NetAmount,
    SI.PaymentStatus
FROM SalesInvoices SI
INNER JOIN Customers C
    ON SI.CustomerId = C.CustomerId;
GO

PRINT 'Sales & Delivery Reports Created Successfully';
