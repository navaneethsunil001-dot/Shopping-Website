<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="ShoppingSite_mini.UserRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .reg-wrapper {
            max-width: 750px;
            margin: 30px auto;
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .reg-header {
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
        }

        .reg-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #222;
            margin: 0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px 20px;
        }

        .form-grid-full {
            grid-column: span 2;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .form-control-custom {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.2s ease-in-out;
        }

        .form-control-custom:focus {
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

        .btn-register {
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
            margin-top: 15px;
        }

        .btn-register:hover {
            background-color: #d9531e;
        }

        .status-label {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: 600;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="reg-wrapper">
        <div class="reg-header">
            <h2>Create an Account</h2>
        </div>

        <div class="form-grid">
            
            <!-- Full Name -->
            <div class="form-group">
                <label class="form-label">Full Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control-custom" placeholder="Enter your full name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is mandatory" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Age -->
            <div class="form-group">
                <label class="form-label">Age</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control-custom" placeholder="e.g. 21" TextMode="Number"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Age must be above 16" MaximumValue="99" MinimumValue="16" Type="Integer" CssClass="val-error" Display="Dynamic"></asp:RangeValidator>
            </div>

            <!-- Phone -->
            <div class="form-group">
                <label class="form-label">Phone Number</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control-custom" placeholder="10-digit phone number"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter a valid 10-digit phone number" ValidationExpression="^[6-9]\d{9}$" CssClass="val-error" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label class="form-label">Email Address</label>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Email" CssClass="form-control-custom" placeholder="name@example.com"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="val-error" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Address (Full Width) -->
            <div class="form-group form-grid-full">
                <label class="form-label">Address</label>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control-custom" placeholder="House name, street, locality"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Address is required" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- State -->
            <div class="form-group">
                <label class="form-label">State</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control-custom" placeholder="e.g. Kerala"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="State is required" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Pincode -->
            <div class="form-group">
                <label class="form-label">Pincode</label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control-custom" placeholder="6-digit pincode"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter a valid 6-digit pincode" ValidationExpression="^[1-9][0-9]{5}$" CssClass="val-error" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <!-- Username (Full Width) -->
            <div class="form-group form-grid-full">
                <label class="form-label">Username</label>
                <asp:TextBox ID="TextBox8" runat="server" AutoPostBack="True" OnTextChanged="TextBox8_TextChanged" CssClass="form-control-custom" placeholder="Choose a username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="Username is required" CssClass="val-error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" CssClass="val-avail"></asp:Label>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label class="form-label">Password</label>
                <asp:TextBox ID="TextBox10" runat="server" TextMode="Password" CssClass="form-control-custom" placeholder="Enter password"></asp:TextBox>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label class="form-label">Confirm Password</label>
                <asp:TextBox ID="TextBox9" runat="server" TextMode="Password" CssClass="form-control-custom" placeholder="Re-enter password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox10" ControlToValidate="TextBox9" ErrorMessage="Passwords do not match" CssClass="val-error" Display="Dynamic"></asp:CompareValidator>
            </div>

        </div>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register Account" CssClass="btn-register" />

        <asp:Label ID="Label1" runat="server" CssClass="status-label" Visible="False"></asp:Label>

        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="status-label" PostBackUrl="~/Main_Login.aspx" Visible="False">LOGIN!</asp:LinkButton>
    </div>
</asp:Content>