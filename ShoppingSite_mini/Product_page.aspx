<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_page.aspx.cs" Inherits="ShoppingSite_mini.Product_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .product-card-panel {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 25px;
            margin: 20px auto;
            max-width: 900px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .prod-title {
            font-size: 24px;
            font-weight: 700;
            color: #222222;
        }

        .prod-price {
            font-size: 22px;
            font-weight: 700;
            color: #f26522;
        }

        .prod-desc {
            font-size: 14px;
            color: #666666;
            line-height: 1.5em;
        }

        .stock-badge {
            display: inline-block;
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
        }

        .qty-textbox {
            width: 70px;
            padding: 5px 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
        }

        .subtotal-tag {
            font-size: 16px;
            font-weight: 600;
            color: #333333;
        }

        .btn-add {
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 8px 18px;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-add:hover {
            background-color: #d85213;
        }

        .btn-secondary-custom {
            background-color: #333333;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-secondary-custom:hover {
            background-color: #111111;
        }

        .btn-cart-custom {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-cart-custom:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-card-panel">
        <table class="w-100" style="border-collapse: separate; border-spacing: 0 12px;">
            <tr>
                <!-- Left: Product Image -->
                <td style="width: 40%; vertical-align: top; text-align: center; padding-right: 25px;">
                    <asp:Image ID="propic" runat="server" Height="320px" Width="320px" style="object-fit: contain; border: 1px solid #eee; border-radius: 6px; padding: 10px;" />
                </td>

                <!-- Right: Product Details -->
                <td style="width: 60%; vertical-align: top;">
                    
                    <div>
                        <asp:Label ID="proname" runat="server" CssClass="prod-title"></asp:Label>
                    </div>

                    <div style="margin-top: 8px;">
                        <span class="prod-price">₹<asp:Label ID="proprice" runat="server"></asp:Label></span>
                    </div>

                    <div style="margin-top: 12px;">
                        <asp:Label ID="prodesc" runat="server" CssClass="prod-desc"></asp:Label>
                    </div>

                    <div style="margin-top: 14px;">
                        <span class="stock-badge">
                            Stock Available: <asp:Label ID="quantity_av" runat="server"></asp:Label>
                        </span>
                    </div>

                    <div style="margin-top: 16px;">
                        <label style="font-weight: 600;">Quantity: </label>
                        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" CssClass="qty-textbox"></asp:TextBox>
                    </div>

                    <div style="margin-top: 12px;">
                        <span class="subtotal-tag">
                            Subtotal: ₹<asp:Label ID="subtotal" runat="server" Visible="False"></asp:Label>
                        </span>
                    </div>

                    <div style="margin-top: 20px;">
                        <asp:Button ID="addtocart" runat="server" OnClick="addtocart_Click" Text="Add To Cart" CssClass="btn-add" />
                        &nbsp;&nbsp;
                        <asp:Button ID="continue" runat="server" OnClick="continue_Click" Text="Continue" CssClass="btn-secondary-custom" />
                        &nbsp;&nbsp;
                        <asp:Button ID="viewcart" runat="server" OnClick="viewcart_Click" Text="View Cart" CssClass="btn-cart-custom" />
                    </div>

                    <div style="margin-top: 12px;">
                        <asp:Label ID="status" runat="server" Visible="False" Font-Bold="True" ForeColor="#d9534f"></asp:Label>
                    </div>

                </td>
            </tr>
        </table>
    </div>
</asp:Content>