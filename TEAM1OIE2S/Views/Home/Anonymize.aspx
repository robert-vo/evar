<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    protected void btnAnonymize_Click(object sender, EventArgs e)
    {
        fuEVAR.SaveAs(Server.MapPath("~//C://" + fuEVAR.FileName));
    }
    
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Anonymize Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading1" runat="server">
Anonymize Data
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubHeading1" runat="server">
Anonymize data before upload EVAR data
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    Choose file to anonymize and zip:<br />
&nbsp;<asp:FileUpload ID="fuEVAR" runat="server" Height="24px" Width="253px" />
    <br />
    <br />
    <asp:Button ID="btnAnonymize" runat="server" Text="Next : Upload Zip File" 
        onclick="btnAnonymize_Click" />
    </form>

</asp:Content>
