# GamesHopper - E-Commerce Mini Project

An E-Commerce web application developed using **ASP.NET Web Forms (.NET Framework 4.7.2)**, **WCF (Windows Communication Foundation)** for payment processing, and **Microsoft SQL Server**.

---

## 🛠️ Tech Stack & Architecture

- **Frontend & Web Tier**: ASP.NET Web Forms, HTML5, CSS3, Bootstrap 4, JavaScript / jQuery
- **Service Tier**: WCF Service (`ShoppingSiteWCFService`) for bank account verification and transaction processing
- **Database**: Microsoft SQL Server (`SHOPPING` database)
- **Email Service**: System.Net.Mail (SMTP) for sending feedback responses

---

## 📂 Project Structure

```
├── Database_Setup.sql           # Database schema & seed data restoration script
├── ShoppingSite_mini/           # ASP.NET Web Application (Client & Storefront)
│   ├── Cat_Images/              # Category banner & card assets
│   ├── Pro_Images/              # Product image uploads
│   ├── Connected Services/      # WCF Service reference proxy
│   ├── Site1.Master             # Main site master page & navigation
│   ├── Main_Login.aspx          # Role-based authentication (Admin / User)
│   ├── UserRegister.aspx        # Customer registration
│   ├── AdminRegister.aspx       # Admin registration
│   ├── UserHome.aspx            # Category browsing storefront
│   ├── Cat_products.aspx        # Products by category listing
│   ├── Product_page.aspx        # Product details & Add-to-Cart
│   ├── User_Cart.aspx           # Shopping cart & checkout initiation
│   ├── View_bill.aspx           # Order invoice receipt
│   ├── PaymentPage.aspx         # Bank account linking & WCF payment execution
│   ├── Feedback.aspx            # Customer product review submission
│   ├── AdminHome.aspx           # Admin dashboard
│   ├── AddCategory.aspx         # Add new product categories
│   ├── EditCategory.aspx        # Manage categories
│   ├── AddProduct.aspx          # Add new products
│   ├── EditProduct.aspx         # Manage products & inventory
│   ├── UserManagement.aspx      # Ban / Unban user accounts
│   ├── ViewFeedbacks.aspx       # Admin feedback inspection
│   └── Reply.aspx               # Admin email response portal
└── ShoppingSiteWCFService/      # WCF Payment Service
    ├── App_Code/
    │   ├── IService.cs          # Service contract definition
    │   ├── Service.cs           # Account validation & payment debit implementation
    │   └── connectionclass.cs   # ADO.NET connection helper
    └── Service.svc              # Service endpoint
```

---

## 🚀 Setup & Running Instructions

### 1. Database Setup
1. Open **Microsoft SQL Server Management Studio (SSMS)**.
2. Connect to your local SQL Server instance (`HOMEPC\SQLEXPRESS` or `localhost\SQLEXPRESS`).
3. Open and run [`Database_Setup.sql`](Database_Setup.sql).
4. Verify that the database `SHOPPING` and all 10 tables are created.

### 2. Configure Connection Strings
If your SQL Server instance name differs from `HOMEPC\SQLEXPRESS`, update the connection string in:
- `ShoppingSite_mini/Connectionclass.cs`
- `ShoppingSiteWCFService/App_Code/connectionclass.cs`

### 3. Running the Projects (Multiple Startup Projects)
Because this application depends on the **WCF Payment Service**, both the WCF Service and the ASP.NET Web App must run simultaneously:
1. Open the solution in **Visual Studio**.
2. Right-click the Solution in Solution Explorer > **Properties**.
3. Under **Common Properties** > **Startup Project**, choose **Multiple startup projects**:
   - Set `ShoppingSiteWCFService` to **Start**.
   - Set `ShoppingSite_mini` to **Start**.
4. Press `F5` or `Ctrl + F5` to run both.

---

## 🔐 Default Test Credentials

| Role | Username | Password | Notes |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin123` | Full administrative access |
| **User** | `user` | `user123` | Pre-linked bank balance of ₹1,00,000 |
