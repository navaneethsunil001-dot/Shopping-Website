<%@ Page Title="Category Products" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cat_products.aspx.cs" Inherits="ShoppingSite_mini.Cat_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .products-container {
            max-width: 1100px;
            margin: 20px auto;
            padding: 0 15px;
            font-family: 'Poppins', Arial, sans-serif;
        }

        .header-title-bar {
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
            margin-bottom: 25px;
        }

        .page-heading {
            font-size: 24px;
            font-weight: 700;
            color: #222;
        }

        /* Product Card Tile Styling */
        .product-card {
            width: 230px;
            background: #ffffff;
            border: 1px solid #e5e5e5;
            border-radius: 8px;
            padding: 15px;
            margin: 10px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.12);
        }

        .product-card-img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 12px;
        }

        .product-card-title {
            display: block;
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .product-card-price {
            display: block;
            font-size: 16px;
            font-weight: 700;
            color: #f26522;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="products-container">
        
        <!-- Header Title Bar -->
        <div class="header-title-bar">
            <asp:Label ID="Label1" runat="server" CssClass="page-heading" Text="Products"></asp:Label>
        </div>

        <!-- Products DataList Grid -->
        <asp:DataList ID="prolist" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellSpacing="15">
            <ItemTemplate>
                <div class="product-card">
                    <asp:ImageButton ID="proimgbtn" runat="server" 
                        ImageUrl='<%# Eval("pro_img") %>' 
                        CommandArgument='<%# Eval("pro_id") %>' 
                        OnCommand="proimgbtn_Command" 
                        CssClass="product-card-img" />
                    
                    <asp:Label ID="proname" runat="server" Text='<%# Eval("pro_name") %>' CssClass="product-card-title"></asp:Label>
                    
                    <span class="product-card-price">
                        ₹<asp:Label ID="proprice" runat="server" Text='<%# Eval("pro_price") %>'></asp:Label>
                    </span>
                </div>
            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>