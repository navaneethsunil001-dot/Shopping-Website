<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="ShoppingSite_mini.AdminRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .admin-reg-wrapper {
            max-width: 500px;
            margin: 35px auto;
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .admin-reg-header {
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
        }

        .form-group {
            margin-bottom: 18px;
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .form-input-custom {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.2s ease-in-out;
        }

        .form-input-custom:focus {
            border-color: #f26522;
            outline: none;
        }

        .val-error {
            color: #dc3545;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }

        .val-avail {
            color: #28a745;
            font-size: 12px;
            font-weight: 600;
            margin-top: 4px;
        }

        .btn-register-admin {
            width: 100%;
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 12px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            margin-top: 10px;
        }

        .btn-register-admin:hover {
            background-color: #d9531e;
        }

        .status-message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: 600;
            font-size: 14px;
            color: #28a745;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-reg-wrapper">
        
        <div class="admin-reg-header">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Admin Registration"></asp:Label>
        </div>

        <!-- Full Name -->
        <div class="form-group">
            <label class="form-label">Full Name</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input-custom" placeholder="Enter admin name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is required" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label class="form-label">Email Address</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Email" CssClass="form-input-custom" placeholder="admin@example.com"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="val-error" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <!-- Username -->
        <div class="form-group">
            <label class="form-label">Username</label>
            <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged" CssClass="form-input-custom" placeholder="Choose a username"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" CssClass="val-avail" Visible="False"></asp:Label>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label class="form-label">Password</label>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" CssClass="form-input-custom" placeholder="Enter password"></asp:TextBox>
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <label class="form-label">Confirm Password</label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="form-input-custom" placeholder="Re-enter password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox4" ErrorMessage="Password mismatch" CssClass="val-error" Display="Dynamic"></asp:CompareValidator>
        </div>

        <!-- Submit Button -->
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register Admin" CssClass="btn-register-admin" />

        <!-- Status Result -->
        <asp:Label ID="Label1" runat="server" CssClass="status-message" Visible="False"></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="status-message" PostBackUrl="~/Main_Login.aspx" Visible="False">LOGIN!</asp:LinkButton>

    </div>
</asp:Content>