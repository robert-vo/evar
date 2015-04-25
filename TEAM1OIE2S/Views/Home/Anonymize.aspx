<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>


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

        
    <form action="" method="post" enctype="multipart/form-data">
    <label for="file">
        Filename:</label>
    <input type="file" name="file" id="file" />
    <input type="submit" />
    </form>
</asp:Content>