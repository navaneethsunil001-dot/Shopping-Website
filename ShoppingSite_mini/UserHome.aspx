<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="ShoppingSite_mini.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .home-container {
            max-width: 1100px;
            margin: 20px auto;
            padding: 0 15px;
            font-family: Arial, sans-serif;
        }

        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
            margin-bottom: 25px;
        }

        .cart-btn {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 9px 18px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .cart-btn:hover {
            background-color: #0056b3;
        }

        /* Category Card Tile Styling */
        .category-card {
            width: 240px;
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 12px;
            margin: 10px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .category-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
        }

        .category-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 6px;
            cursor: pointer;
        }

        .category-title {
            display: block;
            margin-top: 10px;
            font-size: 17px;
            color: #333333;
        }

        .short-desc {
            display: block;
            width: 100%;
            margin-top: 6px;
            font-size: 13px;
            color: #666666;
            line-height: 1.4em;
            text-align: center;
            word-break: break-word;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-container">
        
        
        <div class="header-bar">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Browse Categories"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="🛒 View Cart" CssClass="cart-btn" />
        </div>

        
        <asp:DataList ID="Cat_list" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellSpacing="15">
            <ItemTemplate>
                <div class="category-card">
                    <asp:ImageButton ID="catimagebtn" runat="server" 
                        ImageUrl='<%# Eval("cat_img") %>' 
                        CommandArgument='<%# Eval("cat_id") %>' 
                        OnCommand="catimagebtn_Command" 
                        CssClass="category-img" />
                    
                    <asp:Label ID="catname" runat="server" Font-Bold="True" Text='<%# Eval("cat_name") %>' CssClass="category-title"></asp:Label>
                    
                    <div class="short-desc">
                        <asp:Label ID="catdesc" runat="server" Text='<%# Eval("cat_desc") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>