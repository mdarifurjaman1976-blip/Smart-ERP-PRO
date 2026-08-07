-- =====================================
-- Smart ERP Pro
-- Login History Table
-- Microsoft SQL Server
-- =====================================

USE SmartERP;

GO

CREATE TABLE LoginHistory
(
    LoginId INT IDENTITY(1,1) PRIMARY KEY,

    UserId INT NOT NULL,

    LoginTime DATETIME DEFAULT GETDATE(),

    LogoutTime DATETIME NULL,

    IPAddress NVARCHAR(50),

    DeviceInfo NVARCHAR(200),

    IsSuccess BIT DEFAULT 1,

    CONSTRAINT FK_LoginHistory_Users
    FOREIGN KEY (UserId)
    REFERENCES Users(UserId)
);

GO

PRINT 'Login History Table Created Successfully';
