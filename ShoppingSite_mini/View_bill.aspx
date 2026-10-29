<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="View_bill.aspx.cs" Inherits="ShoppingSite_mini.View_bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 700px; margin: 20px auto; border: 2px solid #333; padding: 20px; font-family: Arial, sans-serif;">
    
    <h2 style="text-align: center; margin-bottom: 5px;">INVOICE / RECEIPT</h2>
    <hr />

    
    <table style="width: 100%; margin-bottom: 20px;">
        <tr>
            <td style="width: 50%; vertical-align: top;">
                <strong>Customer Details:</strong><br />
                Name: <asp:Label ID="lblCustomerName" runat="server"></asp:Label><br />
                Address: <asp:Label ID="lblAddress" runat="server"></asp:Label><br />
                Phone: <asp:Label ID="lblPhone" runat="server"></asp:Label><br />
                Email: <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </td>
            <td style="width: 50%; vertical-align: top; text-align: right;">
                <strong>Payment Details:</strong><br />
                Payment ID: #<asp:Label ID="lblPaymentId" runat="server"></asp:Label><br />
                Order Date: <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    
    <asp:GridView ID="gridBill" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="8" GridLines="Both">
        <HeaderStyle BackColor="#333333" ForeColor="White" Font-Bold="True" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="pro_name" HeaderText="Product Name" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("pro_img") %>' Height="60px" Width="60px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="pro_price" HeaderText="Unit Price (₹)" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="subtotal" HeaderText="Subtotal (₹)" />
        </Columns>
    </asp:GridView>

    
    <div style="text-align: right; margin-top: 20px; font-size: 18px; font-weight: bold;">
        Grand Total: ₹<asp:Label ID="lblGrandTotal" runat="server"></asp:Label>  
        
    </div>
        <div style="text-align: right;">
            <asp:Button ID="paymentredirect" runat="server" Text="Proceed To Payment" OnClick="paymentredirect_Click" />
        </div>
</div>
</asp:Content>
