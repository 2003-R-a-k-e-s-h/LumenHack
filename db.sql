CREATE DATABASE TelecomInventory2;
USE TelecomInventory2;
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('Admin', 'Manager', 'Staff') NOT NULL
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    StockLevel INT DEFAULT 0,
    ReorderPoint INT NOT NULL
);

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255),
    OrderHistory TEXT
);

CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    TransactionType ENUM('Stock In', 'Stock Out') NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Users (UserName, PasswordHash, Role) VALUES 
('admin', '1234', 'Admin'),
('manager1', 'abcd', 'Manager'),
('staff1', '@123', 'Staff');
INSERT INTO Products (ProductName, Category, StockLevel, ReorderPoint) VALUES 
('Router', 'Networking', 50, 10),
('Modem', 'Networking', 30, 5);

INSERT INTO Suppliers (SupplierName, ContactInfo) VALUES 
('ABC Supplies', 'abc@example.com'),
('XYZ Distributors', 'xyz@example.com');

