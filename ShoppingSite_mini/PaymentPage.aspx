<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="ShoppingSite_mini.PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .payment-card-panel {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 30px;
            margin: 30px auto;
            max-width: 520px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .payment-header {
            text-align: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 12px;
            margin-bottom: 20px;
        }

        .payment-title {
            font-size: 22px;
            font-weight: 700;
            color: #222222;
        }

        .total-banner {
            background-color: #fff8f5;
            border: 1px solid #ffd8c7;
            border-left: 4px solid #f26522;
            padding: 12px 16px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            font-weight: 600;
            color: #333333;
        }

        .total-amount-val {
            color: #f26522;
            font-size: 20px;
            font-weight: 700;
        }

        .form-group {
            margin-bottom: 14px;
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 5px;
        }

        .form-input-control {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.2s ease-in-out;
        }

        .form-input-control:focus {
            border-color: #f26522;
            outline: none;
        }

        .btn-pay-now {
            width: 100%;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            margin-top: 10px;
        }

        .btn-pay-now:hover {
            background-color: #218838;
        }

        .btn-add-acc {
            width: 100%;
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 11px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            margin-top: 10px;
        }

        .btn-add-acc:hover {
            background-color: #d9531e;
        }

        .success-box {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 15px;
            border: 1px solid #c8e6c9;
        }

        .status-alert {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: 600;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="payment-card-panel">
        
        <!-- Header -->
        <div class="payment-header">
            <asp:Label ID="Label1" runat="server" Text="Checkout & Payment" CssClass="payment-title"></asp:Label>
        </div>

        <!-- Total Payable Banner -->
        <div class="total-banner">
            <span>Amount Payable:</span>
            <span class="total-amount-val">₹<asp:Label ID="GrandTotal" runat="server" Text="0"></asp:Label></span>
        </div>

        <!-- Panel 1: Add Bank Account (When Account Does Not Exist) -->
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <h4 style="margin: 0 0 15px 0; font-size: 16px; color: #333;">Link Bank Account</h4>

            <div class="form-group">
                <label class="form-label">Account Holder Name</label>
                <asp:TextBox ID="accname" runat="server" CssClass="form-input-control" placeholder="Enter account holder name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Account Number</label>
                <asp:TextBox ID="accno" runat="server" CssClass="form-input-control" placeholder="Enter bank account number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Initial Balance (₹)</label>
                <asp:TextBox ID="accbal" runat="server" CssClass="form-input-control" placeholder="e.g. 50000" TextMode="Number"></asp:TextBox>
            </div>

            <asp:Button ID="AddAccount" runat="server" OnClick="AddAccount_Click" Text="Link Account & Proceed" CssClass="btn-add-acc" />
        </asp:Panel>

        <!-- Panel 2: Account Ready to Pay -->
        <asp:Panel ID="Panel2" runat="server">
            <div class="success-box">
                ✔ Bank Account Linked & Ready
            </div>
            <asp:Button ID="payment" runat="server" OnClick="payment_Click" Text="Pay Now & Place Order" CssClass="btn-pay-now" />
        </asp:Panel>

        <!-- Dynamic Status Message -->
        <asp:Label ID="status" runat="server" CssClass="status-alert"></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="status-alert" PostBackUrl="~/Feedback.aspx">Feedback</asp:LinkButton>

    </div>
</asp:Content>