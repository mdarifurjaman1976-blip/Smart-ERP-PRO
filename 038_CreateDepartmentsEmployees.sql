USE SmartERP;
GO

CREATE TABLE Departments
(
    DepartmentId INT IDENTITY(1,1) PRIMARY KEY,

    DepartmentCode NVARCHAR(50) UNIQUE NOT NULL,

    DepartmentName NVARCHAR(150) NOT NULL,

    Description NVARCHAR(300),

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE()
);

GO


CREATE TABLE Employees
(
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,

    EmployeeCode NVARCHAR(50) UNIQUE NOT NULL,

    EmployeeName NVARCHAR(150) NOT NULL,

    DepartmentId INT NOT NULL,

    Designation NVARCHAR(150),

    Mobile NVARCHAR(30),

    Email NVARCHAR(100),

    JoiningDate DATE,

    IsActive BIT DEFAULT 1,

    CreatedDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Employee_Department
        FOREIGN KEY (DepartmentId)
        REFERENCES Departments(DepartmentId)
);

GO


PRINT 'Department & Employee Management Created Successfully';
