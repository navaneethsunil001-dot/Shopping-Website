<%@ Page Title="Reply Feedback" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="ShoppingSite_mini.Reply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 450px; margin: 30px auto; padding: 20px; border: 1px solid #ccc; font-family: Arial;">
        <h2>Reply to User</h2>
        <hr />

        To Email:<br />
        <asp:TextBox ID="txtToEmail" runat="server" Width="100%"></asp:TextBox><br /><br />

        Subject:<br />
        <asp:TextBox ID="txtSubject" runat="server" Width="100%">Feedback Reply - GamesHopper</asp:TextBox><br /><br />

        Reply Message:<br />
        <asp:TextBox ID="txtReplyBody" runat="server" TextMode="MultiLine" Rows="4" Width="100%"></asp:TextBox><br /><br />

        <asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="btnSend_Click" Width="100%" Height="38px" /><br /><br />
        
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label>
    </div>
</asp:Content>