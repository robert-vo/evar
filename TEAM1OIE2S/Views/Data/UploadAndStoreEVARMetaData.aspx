<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<TEAM1OIE2S.Models.SurgeonUploadModel>" %>

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
    <% using (Html.BeginForm("UploadAndStoreEVARMetaData", "Data", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <div>
        <input type="file" name="file" />
    </div>
    <div>
        <%: Html.LabelFor(model => model.DateOfSurgery)%>
        <%: Html.EditorFor(model => model.DateOfSurgery, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.BrandName)%>
        <%: Html.DropDownListFor(model => model.BrandName, new SelectList(new[] { "Brand1", "Brand2", "Brand3", "Brand4" }))%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.EndograftBodyDiameter)%>
        <%: Html.TextBoxFor(model => model.EndograftBodyDiameter, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.EndograftBodyLength)%>
        <%: Html.TextBoxFor(model => model.EndograftBodyLength, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.UnilateralLegDiameter)%>
        <%: Html.TextBoxFor(model => model.UnilateralLegDiameter, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.UnilateralLegLength)%>
        <%: Html.TextBoxFor(model => model.UnilateralLegLength, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.ContralateralLegDiameter)%>
        <%: Html.TextBoxFor(model => model.ContralateralLegDiameter, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.ContralateralLegLength)%>
        <%: Html.TextBoxFor(model => model.ContralateralLegLength, new { style = "width:100%" })%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.EntryPoint)%>
        Left
        <%: Html.RadioButtonFor(m => m.EntryPoint, "Left")%>
        Right   
        <%: Html.RadioButtonFor(m => m.EntryPoint, "Right")%>
    </div>
    <div>
        <input type="submit" value="Save" />
    </div>
    <% } %>
</asp:Content>
