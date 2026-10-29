-- ==============================================================================
-- DATABASE RESTORATION SCRIPT FOR GAMESHOPPER (ASP.NET & WCF MINI PROJECT)
-- Reconstructed from reverse-engineering ShoppingSite_mini & ShoppingSiteWCFService
-- Database Name: SHOPPING (as configured in Connectionclass.cs)
-- ==============================================================================

-- 1. Create the SHOPPING Database if it doesn't already exist
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'SHOPPING')
BEGIN
    CREATE DATABASE SHOPPING;
    PRINT 'Database [SHOPPING] created successfully.';
END
ELSE
BEGIN
    PRINT 'Database [SHOPPING] already exists.';
END
GO

USE SHOPPING;
GO

-- 2. Drop existing tables if recreating (optional cleanup in reverse dependency order)
IF OBJECT_ID('dbo.Account_table', 'U') IS NOT NULL DROP TABLE dbo.Account_table;
IF OBJECT_ID('dbo.Feedback_table', 'U') IS NOT NULL DROP TABLE dbo.Feedback_table;
IF OBJECT_ID('dbo.Payment_table', 'U') IS NOT NULL DROP TABLE dbo.Payment_table;
IF OBJECT_ID('dbo.Order_table', 'U') IS NOT NULL DROP TABLE dbo.Order_table;
IF OBJECT_ID('dbo.Cart_table', 'U') IS NOT NULL DROP TABLE dbo.Cart_table;
IF OBJECT_ID('dbo.Product_table', 'U') IS NOT NULL DROP TABLE dbo.Product_table;
IF OBJECT_ID('dbo.Category_table', 'U') IS NOT NULL DROP TABLE dbo.Category_table;
IF OBJECT_ID('dbo.User_table', 'U') IS NOT NULL DROP TABLE dbo.User_table;
IF OBJECT_ID('dbo.Admin_table', 'U') IS NOT NULL DROP TABLE dbo.Admin_table;
IF OBJECT_ID('dbo.Login_table', 'U') IS NOT NULL DROP TABLE dbo.Login_table;
GO

-- ==============================================================================
-- 3. Table Definitions
-- ==============================================================================

-- 3.1 Login_table
-- Handled by: AdminRegister.aspx.cs, UserRegister.aspx.cs, Main_Login.aspx.cs
-- Queries insert (reg_id, username, password, type) without column list.
-- Must have log_id INT IDENTITY(1,1) PRIMARY KEY as checked in count(log_id).
CREATE TABLE dbo.Login_table (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    reg_id INT NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    log_type VARCHAR(50) NOT NULL
);
GO

-- 3.2 Admin_table
-- Handled by: AdminRegister.aspx.cs
-- Insert: (reg_id, name, email)
CREATE TABLE dbo.Admin_table (
    admin_id INT PRIMARY KEY,
    admin_name VARCHAR(100) NOT NULL,
    admin_email VARCHAR(100) NOT NULL
);
GO

-- 3.3 User_table
-- Handled by: UserRegister.aspx.cs, Main_Login.aspx.cs, UserManagement.aspx.cs, View_bill.aspx.cs, Reply.aspx.cs
-- Insert: (regid, name, age, phone, address, email, pincode, state, 'active')
CREATE TABLE dbo.User_table (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NULL,
    phone VARCHAR(20) NULL,
    address VARCHAR(MAX) NULL,
    email VARCHAR(100) NULL,
    pincode VARCHAR(20) NULL,
    state VARCHAR(50) NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active'
);
GO

-- 3.4 Category_table
-- Handled by: AddCategory.aspx.cs, EditCategory.aspx.cs, UserHome.aspx.cs, AddProduct.aspx.cs
-- Uses manual max(cat_id)+1, NOT IDENTITY.
-- Insert: (catid, cat_name, cat_img, 'active', cat_desc)
CREATE TABLE dbo.Category_table (
    cat_id INT PRIMARY KEY,
    cat_name VARCHAR(100) NOT NULL,
    cat_img VARCHAR(500) NULL,
    cat_status VARCHAR(50) NOT NULL DEFAULT 'active',
    cat_desc VARCHAR(MAX) NULL
);
GO

-- 3.5 Product_table
-- Handled by: AddProduct.aspx.cs, EditProduct.aspx.cs, Cat_products.aspx.cs, Product_page.aspx.cs, User_Cart.aspx.cs, PaymentPage.aspx.cs
-- Insert does not specify pro_id; therefore pro_id is an IDENTITY column.
-- Insert: (cat_id, pro_name, pro_price, pro_img, pro_desc, pro_stock, 'active')
CREATE TABLE dbo.Product_table (
    pro_id INT IDENTITY(1,1) PRIMARY KEY,
    cat_id INT NOT NULL,
    pro_name VARCHAR(150) NOT NULL,
    pro_price INT NOT NULL,
    pro_img VARCHAR(500) NULL,
    pro_desc VARCHAR(MAX) NULL,
    pro_stock INT NOT NULL,
    pro_status VARCHAR(50) NOT NULL DEFAULT 'active'
);
GO

-- 3.6 Cart_table
-- Handled by: Product_page.aspx.cs, User_Cart.aspx.cs
-- Uses cart_id as DataKey.
-- Insert does not pass cart_id: (uid, prid, qty, subtot, date, 1)
CREATE TABLE dbo.Cart_table (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    pro_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal INT NOT NULL,
    date VARCHAR(50) NOT NULL,
    cart_status INT NOT NULL DEFAULT 1
);
GO

-- 3.7 Order_table
-- Handled by: User_Cart.aspx.cs, PaymentPage.aspx.cs, View_bill.aspx.cs, Feedback.aspx.cs
-- Insert: (userid, pro_id, quantity, subtotal, date, 'order')
CREATE TABLE dbo.Order_table (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    pro_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal INT NOT NULL,
    date VARCHAR(50) NOT NULL,
    order_status VARCHAR(50) NOT NULL DEFAULT 'order'
);
GO

-- 3.8 Payment_table
-- Handled by: User_Cart.aspx.cs, View_bill.aspx.cs
-- Queries use payment_id in SELECT and MAX(payment_id).
-- Insert does not pass payment_id: (userid, total, date)
CREATE TABLE dbo.Payment_table (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    grandtotal INT NOT NULL,
    date VARCHAR(50) NOT NULL
);
GO

-- 3.9 Feedback_table
-- Handled by: Feedback.aspx.cs, ViewFeedbacks.aspx.cs, Reply.aspx.cs
-- Queries reference: user_id, product_id, fdbk_msg, rep_msg, fdbk_status
-- Insert: (userid, proid, fdbkmsg, 'null', 1)
CREATE TABLE dbo.Feedback_table (
    fdbk_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    fdbk_msg VARCHAR(MAX) NULL,
    rep_msg VARCHAR(MAX) NULL,
    fdbk_status INT NOT NULL DEFAULT 1
);
GO

-- 3.10 Account_table (Used by WCF Payment Service)
-- Handled by: ShoppingSiteWCFService (Service.cs)
-- Queries: CheckAccountExists, InsertAccount, Makepayment
-- Insert: (accname, userid, balance, accno)
CREATE TABLE dbo.Account_table (
    acc_id INT IDENTITY(1,1) PRIMARY KEY,
    acc_name VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    balance INT NOT NULL,
    acc_no VARCHAR(50) NOT NULL
);
GO

-- ==============================================================================
-- 4. Initial Seed Data (Optional but recommended for immediate testing)
-- ==============================================================================

-- 4.1 Admin User (Login: admin / admin123)
INSERT INTO dbo.Admin_table (admin_id, admin_name, admin_email)
VALUES (1, 'Admin', 'admin@gameshopper.com');

INSERT INTO dbo.Login_table (reg_id, username, password, log_type)
VALUES (1, 'admin', 'admin123', 'admin');

-- 4.2 Standard User (Login: user / user123)
INSERT INTO dbo.User_table (user_id, name, age, phone, address, email, pincode, state, status)
VALUES (2, 'John Doe', 24, '9876543210', '123 Baker Street', 'john@example.com', '682001', 'Kerala', 'active');

INSERT INTO dbo.Login_table (reg_id, username, password, log_type)
VALUES (2, 'user', 'user123', 'user');

-- 4.3 Bank Account for User 2 (for WCF Payment Service with 1,00,000 balance)
INSERT INTO dbo.Account_table (acc_name, user_id, balance, acc_no)
VALUES ('John Doe', 2, 100000, 'AC1234567890');

-- 4.4 Sample Categories (pointing to files in ~/Cat_Images/)
INSERT INTO dbo.Category_table (cat_id, cat_name, cat_img, cat_status, cat_desc)
VALUES 
(1, 'PlayStation Consoles', '~/Cat_Images/Mirage_2.jpg', 'active', 'Next-Gen PlayStation hardware and bundles.'),
(2, 'Gaming Accessories', '~/Cat_Images/6KxgKKEp8myoQfw586ZF9V.jpg', 'active', 'High performance controllers, headsets and more.');

-- 4.5 Sample Products (pointing to files in ~/Pro_Images/)
INSERT INTO dbo.Product_table (cat_id, pro_name, pro_price, pro_img, pro_desc, pro_stock, pro_status)
VALUES 
(1, 'PlayStation 5 Slim Console', 49990, '~/Pro_Images/PS5_CFI2100_PR_01_RGB_WithNotice-_1.jpg', 'Experience lightning fast loading with an ultra-high speed SSD.', 15, 'active'),
(1, 'Assassin''s Creed Mirage PS5', 3499, '~/Pro_Images/Mirage_2.jpg', 'Experience the story of Basim in 9th century Baghdad.', 25, 'active'),
(2, 'Sony DualSense Wireless Controller', 5990, '~/Pro_Images/7189hUEhgsL.jpg', 'Haptic feedback and dynamic adaptive triggers.', 30, 'active');
GO

PRINT '=======================================================';
PRINT 'All tables and initial data created successfully!';
PRINT 'Default Admin: username = admin  | password = admin123';
PRINT 'Default User : username = user   | password = user123';
PRINT '=======================================================';
GO
