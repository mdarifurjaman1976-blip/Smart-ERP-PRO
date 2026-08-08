USE SmartERP;
GO

CREATE VIEW WarrantyClaimReport
AS
SELECT
    WC.ClaimId,
    WC.ClaimNumber,
    C.CustomerCode,
    C.CustomerName,
    P.ProductCode,
    P.ProductName,
    WC.SerialNumber,
    WC.ClaimDate,
    WC.Status,
    WC.ProblemDescription
FROM WarrantyClaims WC
INNER JOIN Customers C
    ON WC.CustomerId = C.CustomerId
INNER JOIN Products P
    ON WC.ProductId = P.ProductId;
GO


CREATE VIEW ServiceJobReport
AS
SELECT
    SJ.JobCardId,
    SJ.JobCardNumber,
    C.CustomerName,
    P.ProductCode,
    P.ProductName,
    SJ.ReceiveDate,
    SJ.ServiceStatus,
    SJ.QCStatus,
    SJ.DeliveryDate
FROM ServiceJobCards SJ
INNER JOIN Customers C
    ON SJ.CustomerId = C.CustomerId
INNER JOIN Products P
    ON SJ.ProductId = P.ProductId;
GO


CREATE VIEW ReplacementReport
AS
SELECT
    R.ReplacementId,
    R.ReplacementNumber,
    C.CustomerName,

    OP.ProductCode AS OldProductCode,
    OP.ProductName AS OldProductName,

    NP.ProductCode AS NewProductCode,
    NP.ProductName AS NewProductName,

    R.OldQuantity,
    R.NewQuantity,
    R.ReplacementDate,
    R.Status

FROM Replacements R

INNER JOIN Customers C
    ON R.CustomerId = C.CustomerId

INNER JOIN Products OP
    ON R.OldProductId = OP.ProductId

INNER JOIN Products NP
    ON R.NewProductId = NP.ProductId;
GO

PRINT 'Service, Warranty & Replacement Reports Created Successfully';
