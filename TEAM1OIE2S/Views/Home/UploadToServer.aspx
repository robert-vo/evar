<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Upload Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading1" runat="server">
    Upload
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubHeading1" runat="server">
    Upload Anonymized Zip File to Server
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    Patient Number:<br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
    Date of Surgery<asp:TextBox ID="txtSurgeryDate" runat="server" 
        Width="100px"></asp:TextBox>
    <br />
    <h3><strong>
        Endograft Characteristics
    </strong></h3>
    Brand<asp:DropDownList ID="drpBrand" runat="server" Width="200">
    </asp:DropDownList>
    <br />
    <table>
        <tr>
            <th />
            <th>
                Diameter
            </th>
            <th>
                Length
            </th>
        </tr>
        <tr>
            <td>
                Endograft Body
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtBodyDiam" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtBodyLeng" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
        </tr>
        <tr>
            <td>
                Unilateral Leg
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtUniDiam" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtUniLeng" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
        </tr>
        <tr>
            <td>
                Contralateral Leg
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtContraDiam" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
            <td>
                <center>
        <asp:TextBox ID="txtContraLeng" runat="server" Height="25px" Width="100px"></asp:TextBox></center>
            </td>
        </tr>
        <tr>
            <td>
                Entry Point
            </td>
            <td>
                <center>
        <asp:RadioButton ID="radLeft" runat="server" Text="Left" />
        </center>
            </td>
            <td>
                <center>
        <asp:RadioButton ID="radRight" runat="server" Text="Right" /></center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" />
    </form>
</asp:Content>
