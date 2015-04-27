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
        <%: Html.LabelFor(model => model.MonthOfSurgery)%>
        <%: Html.DropDownListFor(model => model.MonthOfSurgery, new SelectList(new[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "Novemeber", "December" }))%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.DayOfSurgery)%>
        <%: Html.DropDownListFor(model => model.DayOfSurgery, new SelectList(new[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" }))%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.YearOfSurgery)%>
        <%: Html.DropDownListFor(model => model.YearOfSurgery, new SelectList(new[] { "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000" }))%>
    </div>
    <div>
        <%: Html.LabelFor(model => model.BrandName)%>
        <%: Html.DropDownListFor(model => model.BrandName, new SelectList(new[] { "Cook", "Boston Scientific", "Medtronic" }))%>
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
