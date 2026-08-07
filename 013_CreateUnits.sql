-- =====================================
-- Smart ERP Pro
-- Unit Management Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Units
(
    UnitId INT IDENTITY(1,1) PRIMARY KEY,

    UnitName NVARCHAR(50) NOT NULL,

    ShortName NVARCHAR(20),

    Description NVARCHAR(200),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


-- Default Units

INSERT INTO Units(UnitName, ShortName)
VALUES
('Piece','PCS'),
('Box','BOX'),
('Carton','CTN'),
('Set','SET'),
('Meter','MTR');


GO

PRINT 'Unit Management Created Successfully';
