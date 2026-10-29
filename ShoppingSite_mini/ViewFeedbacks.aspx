<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewFeedbacks.aspx.cs" Inherits="ShoppingSite_mini.ViewFeedbacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4">
    <Columns>
        <asp:BoundField DataField="user_id" HeaderText="UserID" />
        <asp:BoundField DataField="product_id" HeaderText="ProID" />
        <asp:BoundField DataField="fdbk_msg" HeaderText="FeedBack" />
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CommandArgument='<%# Eval("user_id") %>' 
                    OnCommand="LinkButton1_Command">Reply</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</asp:Content>