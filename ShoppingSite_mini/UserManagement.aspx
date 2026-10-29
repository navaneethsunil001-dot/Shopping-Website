<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="ShoppingSite_mini.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 20px; font-family: Arial;">
        <h2>User Management</h2>
        <hr />

        <asp:GridView ID="gridUsers" runat="server" AutoGenerateColumns="False" OnRowCommand="gridUsers_RowCommand" CellPadding="6">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="phone" HeaderText="Phone" />
                <asp:BoundField DataField="status" HeaderText="Status" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnBan" runat="server" Text="Ban" 
                            CommandName="ban_user" 
                            CommandArgument='<%# Eval("user_id") %>' />
                        &nbsp;
                        <asp:Button ID="btnUnban" runat="server" Text="Unban" 
                            CommandName="unban_user" 
                            CommandArgument='<%# Eval("user_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label>
    </div>
</asp:Content>