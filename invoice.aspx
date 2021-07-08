<%@ Page Language="C#" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="webapp1.invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 256px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <table style="width:100%;" border="1">
                    <tr>
                        <td class="auto-style1">&nbsp;
                            <asp:Label ID="Label5" runat="server" Text="Distributer Name:"></asp:Label>
                            <asp:Label ID="lbDist" runat="server"></asp:Label>
                        </td>
                        <td rowspan="2">
                            <asp:Label ID="Label2" runat="server" Text="Invoice Number:"></asp:Label>
                            <asp:Label ID="lbInvoice" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Date:"></asp:Label>
                            <asp:Label ID="lbDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="Distributer Number:"></asp:Label>
                            <asp:Label ID="lbDistNo" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Time:"></asp:Label>
                            <asp:Label ID="lbTime" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label7" runat="server" Text="Customer Name:"></asp:Label>
                            <asp:Label ID="lbCust" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label8" runat="server" Text="Customer Number:"></asp:Label>
                            <asp:Label ID="lbCustNo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Company_Name" HeaderText="Company_Name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Product_name" HeaderText="Product_name">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Type" HeaderText="Type">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Number_Of_CementBags" HeaderText="Number_Of_CementBags">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Price" HeaderText="Price">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Amount" HeaderText="Amount">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Grand Total"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbgtotal" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label10" runat="server" Text="Amount(In Words):"></asp:Label>
                            <asp:Label ID="lbamount" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Distributer Sign."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbDist1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">**This is Computer Ganrated Invoice</td>
                    </tr>
                </table>
              
            </asp:Panel>
<asp:Button ID="download" runat="server" Text="Download " OnClick="download_Click" />
        </div>
    </form>
</body>
</html>
