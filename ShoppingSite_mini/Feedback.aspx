<%@ Page Title="Product Feedback" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="ShoppingSite_mini.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .feedback-container {
            max-width: 950px;
            margin: 30px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            font-family: 'Poppins', Arial, sans-serif;
        }

        .feedback-header {
            border-bottom: 2px solid #eee;
            padding-bottom: 12px;
            margin-bottom: 20px;
        }

        .feedback-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #222;
            margin: 0;
        }

        /* Modern GridView Styling */
        .feedback-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        .feedback-table th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 600;
            padding: 12px 10px;
            border-bottom: 2px solid #dee2e6;
            text-align: center;
        }

        .feedback-table td {
            padding: 14px 10px;
            vertical-align: middle;
            border-bottom: 1px solid #eee;
            text-align: center;
        }

        .feedback-table tr:hover {
            background-color: #fafafa;
        }

        .product-thumb {
            width: 65px;
            height: 65px;
            object-fit: contain;
            border: 1px solid #eee;
            border-radius: 6px;
            background-color: #ffffff;
            padding: 2px;
        }

        .btn-select-fdbk {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 7px 15px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-select-fdbk:hover {
            background-color: #0056b3;
        }

        /* Inline Submission Box */
        .feedback-form-card {
            background-color: #fdfdfd;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 20px 25px;
            max-width: 500px;
            margin-top: 15px;
        }

        .feedback-form-card h3 {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-top: 0;
            margin-bottom: 12px;
        }

        .product-tag {
            display: inline-block;
            background-color: #eef2ff;
            color: #3730a3;
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
            font-size: 13px;
            margin-bottom: 12px;
        }

        .fdbk-textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            resize: vertical;
            transition: border-color 0.2s ease-in-out;
        }

        .fdbk-textarea:focus {
            border-color: #f26522;
            outline: none;
        }

        .btn-submit-fdbk {
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 10px 22px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            margin-top: 12px;
        }

        .btn-submit-fdbk:hover {
            background-color: #d9531e;
        }

        .status-msg {
            display: block;
            margin-top: 10px;
            font-weight: 600;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="feedback-container">
        
        <!-- Header -->
        <div class="feedback-header">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Purchased Products Feedback"></asp:Label>
        </div>

        <!-- Feedback GridView -->
        <asp:GridView ID="gridFeedback" runat="server" AutoGenerateColumns="False" OnRowCommand="gridFeedback_RowCommand" CssClass="feedback-table" GridLines="None">
            <Columns>
                <asp:BoundField DataField="pro_id" HeaderText="Product ID" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("pro_img") %>' CssClass="product-thumb" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="pro_name" HeaderText="Product Name" />
                <asp:BoundField DataField="pro_desc" HeaderText="Description" />
                
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnSendFdbk" runat="server" Text="Write Feedback" 
                            CommandName="SelectProduct" 
                            CommandArgument='<%# Eval("pro_id") %>' 
                            CssClass="btn-select-fdbk" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Feedback Input Form -->
        <asp:Panel ID="Panel1" runat="server" Visible="False" CssClass="feedback-form-card">
            <h3>Submit Your Feedback</h3>
            
            <div class="product-tag">
                Selected Product ID: #<asp:Label ID="lblselproid" runat="server"></asp:Label>
            </div>

            <div style="margin-top: 6px;">
                <label style="font-size: 13px; font-weight: 600; color: #444; display: block; margin-bottom: 5px;">Your Review / Feedback:</label>
                <asp:TextBox ID="txtfdbk" runat="server" TextMode="MultiLine" Rows="4" CssClass="fdbk-textarea" placeholder="Write your experience with this product..."></asp:TextBox>
            </div>

            <asp:Button ID="btnsubmit" runat="server" Text="Submit Review" OnClick="btnsubmit_Click" CssClass="btn-submit-fdbk" />

            <asp:Label ID="lblstatus" runat="server" CssClass="status-msg"></asp:Label>
        </asp:Panel>

    </div>
</asp:Content>