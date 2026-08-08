USE SmartERP;
GO

CREATE VIEW ERPDashboardSummary
AS

SELECT
    (SELECT COUNT(*) FROM Products) AS TotalProducts,

    (SELECT COUNT(*) FROM Suppliers
     WHERE IsActive = 1) AS ActiveSuppliers,

    (SELECT COUNT(*) FROM Customers
     WHERE IsActive = 1) AS ActiveCustomers,

    (SELECT COUNT(*) FROM PurchaseOrders
     WHERE Status = 'Pending') AS PendingPurchaseOrders,

    (SELECT COUNT(*) FROM SalesOrders
     WHERE Status = 'Pending') AS PendingSalesOrders,

    (SELECT COUNT(*) FROM WarrantyClaims
     WHERE Status = 'Pending') AS PendingWarrantyClaims,

    (SELECT COUNT(*) FROM ServiceJobCards
     WHERE ServiceStatus NOT IN ('Completed','Delivered')) AS ActiveServiceJobs,

    (SELECT COUNT(*) FROM Replacements
     WHERE Status = 'Pending') AS PendingReplacements,

    (SELECT COUNT(*) FROM ApprovalWorkflows
     WHERE Status = 'Pending') AS PendingApprovals,

    (SELECT COUNT(*) FROM Expenses
     WHERE Status = 'Pending') AS PendingExpenses;

GO

PRINT 'ERP Dashboard Summary Created Successfully';
