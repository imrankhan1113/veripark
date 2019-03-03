<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="BookCheckInAndOut.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 150px;
        }

        .auto-style3 {
            height: 24px;
        }

        .auto-style4 {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-style: normal;
            text-align: left;
            height: 25px;
        }

        .auto-style5 {
            width: 150px;
            height: 25px;
        }

        .auto-style6 {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-style: normal;
            text-align: left;
            height: 22px;
            direction: ltr;
        }

        .auto-style7 {
            width: 150px;
            height: 22px;
            direction: ltr;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <table id="contentTable" border="0">

        <tr>
            <td class="text2">Name:</td>
            <td class="auto-style2">
                <asp:TextBox CssClass="textbox" ID="txtName" runat="server" />
                <asp:RequiredFieldValidator ID="RFDtxtName" CssClass="Errortext" ControlToValidate="txtName" runat="server" ErrorMessage="Name is a required field"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="text2">Mobile Number:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtMobile" CssClass="textbox" runat="server" />
                <asp:RegularExpressionValidator CssClass="Errortext" Display="Dynamic" ID="ReMobileNumber" runat="server" ErrorMessage="Mobile Number should be 11 digits xxxxxxxxxxx"
                    ControlToValidate="txtMobile" ValidationExpression="[0-9]{11}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RFDMobile" CssClass="Errortext" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile Number is a required field"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="text2">National ID:</td>

            <td class="auto-style2">
                <asp:TextBox CssClass="textbox" ID="txtNationalID" runat="server" />
                <asp:RequiredFieldValidator Display="Dynamic" CssClass="Errortext" ID="RFDNationalID" runat="server" ControlToValidate="txtNationalID" ErrorMessage="National ID is a required field"></asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr>
            <td class="text2">Check Out Date:</td>
            <td class="auto-style5">
                <asp:Label CssClass="text" ID="lblCheckOutDate" runat="server" /></td>
        </tr>

        <tr>
            <td class="text2">Return Date:</td>
            <td class="auto-style7">
                <asp:Label CssClass="text" ID="lblReturnDate" runat="server" /></td>
        </tr>

        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>

        <tr>
            <td></td>
            <td style="text-align: right" class="auto-style2">
                <asp:Button ID="btnCheckOut" Text="Check Out" CssClass="button" runat="server" OnClick="btnCheckOut_Click" /></td>
        </tr>

        <tr>
            <td class="text2" colspan="2">Book Check Out History</td>
        </tr>

        <tr>

            <td colspan="2">

                <table id="HistoryTable">
                    <tr>
                        <td class="GridHeading">Name </td>
                        <td class="GridHeading">Check Out Date  </td>
                        <td class="GridHeading">Returned Date </td>
                    </tr>

                    <asp:ListView ID="HistoryList" runat="server" ClientIDMode="Static">
                        <ItemTemplate>
                            <tr>
                                <td class="text"><%# Eval("Name") %></td>
                                <td class="text"><%# Eval("CheckOutDate") %> </td>
                                <td class="text"><%# Eval("ReturnDate") %> </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>

                </table>


            </td>

        </tr>

    </table>
</asp:Content>
