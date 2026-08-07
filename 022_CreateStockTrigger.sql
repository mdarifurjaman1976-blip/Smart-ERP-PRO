-- =====================================
-- Smart ERP Pro
-- Stock Update Automation
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TRIGGER trg_GRN_Stock_Update

ON GRNDetails

AFTER INSERT

AS

BEGIN

    INSERT INTO InventoryTransactions
    (
        ProductId,
        WarehouseId,
        TransactionType,
        ReferenceNo,
        Quantity,
        Remarks
    )

    SELECT

        I.ProductId,

        H.WarehouseId,

        'IN',

        H.GRNNumber,

        I.ReceivedQty,

        'Stock Received Through GRN'


    FROM inserted I

    INNER JOIN GRNHeaders H

    ON I.GRNId = H.GRNId;


END;

GO


PRINT 'Stock Update Trigger Created Successfully';
