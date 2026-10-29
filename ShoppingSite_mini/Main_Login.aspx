<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Main_Login.aspx.cs" Inherits="ShoppingSite_mini.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .login-wrapper {
            max-width: 420px;
            margin: 40px auto;
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .login-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .login-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #222;
            margin-bottom: 6px;
        }

        .login-header p {
            font-size: 13px;
            color: #666;
            margin: 0;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.2s ease-in-out;
        }

        .form-input:focus {
            border-color: #f26522;
            outline: none;
        }

        .btn-login {
            width: 100%;
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 11px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-login:hover {
            background-color: #d9531e;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-wrapper">
        <div class="login-header">
            <h2>Welcome Back</h2>
            <p>Please enter your credentials to sign in</p>
        </div>

        <div class="form-group">
            <label class="form-label">Username</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" placeholder="Enter username"></asp:TextBox>
        </div>

        <div class="form-group">
            <label class="form-label">Password</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-input" placeholder="Enter password"></asp:TextBox>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" CssClass="btn-login" />
    </div>
</asp:Content>