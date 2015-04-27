<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Sorry, you do not have sufficient permissions to access this web page. 
    </h2>
</asp:Content>
