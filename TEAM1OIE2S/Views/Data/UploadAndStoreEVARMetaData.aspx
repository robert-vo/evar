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
    <form action="" method="post" enctype="multipart/form-data">
    <input type="file" name="file" id="file" />
    <input type="submit" />
    </form>

</asp:Content>
    