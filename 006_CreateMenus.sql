-- =====================================
-- Smart ERP Pro
-- Menu Management Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE Menus
(
    MenuId INT IDENTITY(1,1) PRIMARY KEY,

    ParentMenuId INT NULL,

    MenuName NVARCHAR(100) NOT NULL,

    MenuUrl NVARCHAR(200),

    Icon NVARCHAR(100),

    DisplayOrder INT DEFAULT 0,

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


-- Default ERP Menus

INSERT INTO Menus
(MenuName, MenuUrl, Icon, DisplayOrder)

VALUES

('Dashboard','/dashboard','dashboard',1),

('Product','/product','box',2),

('Inventory','/inventory','warehouse',3),

('Purchase','/purchase','shopping-cart',4),

('GRN','/grn','receive',5),

('Sales','/sales','sales',6),

('Service','/service','tool',7),

('Warranty','/warranty','refresh',8),

('Accounts','/accounts','money',9),

('Reports','/reports','chart',10),

('Settings','/settings','setting',11);


GO

PRINT 'Menu Management Created Successfully';
