<%@ Page Title="My Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_Cart.aspx.cs" Inherits="ShoppingSite_mini.User_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .cart-wrapper {
            max-width: 1000px;
            margin: 30px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .cart-header {
            font-size: 26px;
            font-weight: 700;
            color: #222;
            margin-bottom: 20px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        /* Modern GridView Table Styling */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        .cart-table th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 600;
            padding: 12px 10px;
            border-bottom: 2px solid #dee2e6;
            text-align: center;
        }

        .cart-table td {
            padding: 14px 10px;
            vertical-align: middle;
            border-bottom: 1px solid #eee;
            text-align: center;
        }

        .cart-table tr:hover {
            background-color: #fafafa;
        }

        .cart-table img {
            border-radius: 6px;
            border: 1px solid #eee;
            object-fit: contain;
            background: #fff;
            padding: 2px;
        }

        /* Action Links in GridView (Edit/Update/Cancel/Delete) */
        .cart-table a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            margin: 0 4px;
        }

        .cart-table a:hover {
            text-decoration: underline;
        }

        /* Total and Checkout Section */
        .cart-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 2px solid #eee;
        }

        .total-box {
            font-size: 20px;
            font-weight: 700;
            color: #222;
        }

        .total-amount {
            color: #f26522;
            margin-left: 5px;
        }

        .btn-checkout {
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 12px 28px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.2s ease-in-out;
        }

        .btn-checkout:hover {
            background-color: #d9531e;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-wrapper">
        
        <!-- Cart Title -->
        <div class="cart-header">
            <asp:Label ID="Label1" runat="server" Text="Your Shopping Cart"></asp:Label>
        </div>

        <!-- Cart GridView -->
        <asp:GridView ID="cartgrid" runat="server" AutoGenerateColumns="False" DataKeyNames="cart_id" 
            OnRowCancelingEdit="cartgrid_RowCancelingEdit" 
            OnRowDeleting="cartgrid_RowDeleting" 
            OnRowEditing="cartgrid_RowEditing" 
            OnRowUpdating="cartgrid_RowUpdating" 
            CssClass="cart-table" GridLines="None">
            
            <Columns>
                <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                <asp:CommandField ShowDeleteButton="True" HeaderText="Remove" />
                
                <asp:ImageField DataImageUrlField="pro_img" HeaderText="Product Image">
                    <ControlStyle Height="75px" Width="75px" />
                </asp:ImageField>

                <asp:BoundField DataField="pro_name" HeaderText="Product Name" ReadOnly="True" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="subtotal" HeaderText="Subtotal (₹)" ReadOnly="True" />
            </Columns>
        </asp:GridView>

        <!-- Summary & Actions -->
        <div class="cart-summary">
            <div class="total-box">
                Grand Total: <span class="total-amount">₹<asp:Label ID="grandtotallabel" runat="server" Text="0"></asp:Label></span>
            </div>

            <div>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed to Checkout" CssClass="btn-checkout" />
            </div>
        </div>

    </div>
</asp:Content>