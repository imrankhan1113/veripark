<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BookCheckInAndOut.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-style: normal;
            text-align: left;
            width: 182px;
        }
        .auto-style3 {
            width: 182px;
        }
        .auto-style4 {
            width: 208px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id ="tblContent">
    <tr>
        <td class="text2">Title:</td> <td class="auto-style4"><asp:Label class="text" ID ="lblTitle" runat="server" /></td>
        </tr>

        <tr>
        <td class="text2">ISBN:</td> <td class="auto-style4"><asp:Label class="text" ID ="lblISBN" runat="server" /></td>
        </tr>

        <tr>
        <td class="text2">Publish year:</td> <td class="auto-style4"><asp:Label class="text" ID ="lblpublishDate" runat="server" /></td>
        </tr>

        <tr>
        <td class="text2">Cover Price :</td> <td class="auto-style4"><asp:Label class="text" ID ="lblcoverprice" runat="server" /></td>
        </tr>

        <tr>
        <td class="text2":</td> <td class="auto-style4"><asp:Label class="text" ID ="lblcheckoutstatus" runat="server" /></td>
        </tr>


     </table>
</asp:Content>
