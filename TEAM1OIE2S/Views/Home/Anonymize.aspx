<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Anonymize Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading1" runat="server">
    Anonymize Data
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubHeading1" runat="server">
    Anonymize EVAR data before upload
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
Click <a href="http://www.dclunie.com/pixelmed/software/webstart/DicomCleanerUsage.html">here</a> to anonymize EVAR data.<br />
Follow the instructions and click the next button when you are ready to proceed to the next step.
<br />
<br />
<input type="button" value="NEXT" onclick="window.location.href='<%= Url.Action("UploadAndStoreEVARMetaData", "Data") %>';" />
</asp:Content>
