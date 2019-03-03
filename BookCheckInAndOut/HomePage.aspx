<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BookCheckInAndOut.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            height: 80px;
        }
        .auto-style2 {
            height: 30px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <table id="ListTable" class="table" border="0" >
        <tr>

            <td style="width:0px"> </td>
              <td class="RadioButtonColumn"> Select </td>
              <td class="GridHeading"> Title </td>
              <td class="GridHeading"> ISBN  </td> 
              <td class="GridHeading"> PublishYear </td> 
              <td class="GridHeading"> CoverPrice </td> 
              <td class="GridHeading"> Status </td> 
            </tr>  
         
    <asp:ListView ID="BooksList" runat="server" ClientIDMode="Static">
        
        <ItemTemplate>
            <tr>
                <td> <asp:HiddenField runat="server" ID="hd" ClientIDMode="AutoID" Value='<%# Eval("BookID") %>' /> </td>
              <td> <asp:RadioButton runat="server" id="rd" ClientIDMode="AutoID" onclick=  "OnCheckChange(this) "  /> </td>
              
              <td class="text"> <%# Eval("Title") %></td>
              <td class="text"> <%# Eval("ISBN") %> </td> 
              <td class="text"> <%# Eval("PublishYear") %> </td> 
              <td class="text"> <%# Eval("CoverPrice") %> </td> 
              <td class="text"> <%# Eval("CheckOutStatusDescription") %> </td> 
            </tr>           
        </ItemTemplate>
    </asp:ListView>

        <tr><td style="height:50px" ></td></tr>
        <tr>
            <td></td><td></td><td></td><td></td><td style="text-align:right">
                <asp:Button ID="btnDetail" CssClass="button"  ClientIDMode="Static" runat="server" Text="Details" OnClick="btnDetail_Click"  /></td>
            <td style="text-align:right">
                <asp:Button ID="btnCheckOut" CssClass="button"  ClientIDMode="Static" runat="server" Text="Check Out" OnClick="btnCheckOut_Click"  />
            </td><td style="text-align:right">
                <asp:Button ID="btnCheckIn" CssClass="button" ClientIDMode="Static" runat="server" Text="Check In" OnClick="btnCheckIn_Click" />
             </td>

        </tr>
   </table>

    
    
    <asp:HiddenField ID="hdnField" runat="server" ClientIDMode="Static" />

    <script type="text/javascript">


        function OnCheckChange(rb) {
            debugger
            
            //logic for exclusive setting the radio button that was last clicked.
            var table = document.getElementById('ListTable');
                                 
            var radiobtn = table.getElementsByTagName('input');
           
            for (k = 0; k < radiobtn.length; k++)
            {
                if ((radiobtn[k].type == 'radio') && (rb.id == radiobtn[k].id))
                {
                    radiobtn[k].checked = true;
            }
                else
                    radiobtn[k].checked = false;

            }

            //Book id against the selected radio button.
          var hdfield = rb.parentNode.parentNode.cells[0].getElementsByTagName('input');
                             
            if (hdfield[0].type == 'hidden')
                document.getElementById("hdnField").value = hdfield[0].value;;

            //enabling /disabling buttons on the basis of checkin /checkout
         
          if (rb.parentNode.parentNode.cells[hdfield[0].value].innerHTML == 'Checked In') {
              document.getElementById('btnCheckIn').disabled = false;
              document.getElementById('btnCheckOut').disabled = true;
          }
          else if (rb.parentNode.parentNode.cells[hdfield[0].value].innerHTML == 'Checked Out') {
              document.getElementById('btnCheckOut').disabled = true;
              document.getElementById('btnCheckIn').disabled = false;
          }

        }


        </script>
   
</asp:Content>
