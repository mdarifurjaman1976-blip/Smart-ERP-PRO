USE SmartERP;
GO

CREATE VIEW PurchaseOrderReport
AS
SELECT
    PO.POId,
    PO.PONumber,
    S.SupplierCode,
    S.SupplierName,
    PO.PODate,
    PO.Status,
    PO.TotalAmount,
    COUNT(POD.PODetailId) AS TotalItems
FROM PurchaseOrders PO
INNER JOIN Suppliers S
    ON PO.SupplierId = S.SupplierId
LEFT JOIN PurchaseOrderDetails POD
    ON PO.POId = POD.POId
GROUP BY
    PO.POId,
    PO.PONumber,
    S.SupplierCode,
    S.SupplierName,
    PO.PODate,
    PO.Status,
    PO.TotalAmount;
GO


CREATE VIEW GRNReport
AS
SELECT
    G.GRNId,
    G.GRNNumber,
    G.SupplierInvoiceNo,
    S.SupplierName,
    W.WarehouseName,
    G.ReceiveDate,
    G.Status,
    COUNT(GD.GRNDetailId) AS TotalItems,
    SUM(GD.ReceivedQty) AS TotalReceivedQty,
    SUM(GD.DamageQty) AS TotalDamageQty
FROM GRNHeaders G
INNER JOIN Suppliers S
    ON G.SupplierId = S.SupplierId
INNER JOIN Warehouses W
    ON G.WarehouseId = W.WarehouseId
LEFT JOIN GRNDetails GD
    ON G.GRNId = GD.GRNId
GROUP BY
    G.GRNId,
    G.GRNNumber,
    G.SupplierInvoiceNo,
    S.SupplierName,
    W.WarehouseName,
    G.ReceiveDate,
    G.Status;
GO

PRINT 'Purchase & GRN Reports Created Successfully';
