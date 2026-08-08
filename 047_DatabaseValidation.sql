USE SmartERP;
GO

SELECT
    COUNT(*) AS TotalTables
FROM sys.tables;
GO

SELECT
    COUNT(*) AS TotalViews
FROM sys.views;
GO

SELECT
    name AS TableName
FROM sys.tables
ORDER BY name;
GO

SELECT
    name AS ViewName
FROM sys.views
ORDER BY name;
GO

PRINT 'Database Validation Completed Successfully';
