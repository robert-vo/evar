<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<TEAM1OIE2S.Models.SurgeonUploadModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SurgeonDataAnalysisInputForm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("SurgeonDataAnalysisInputForm", "Data", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
           <%: Html.TextBoxFor(model => model.EndograftBodyDiameter, new { style = "width:100px" })%> 
            <input type="submit" value="Save" />
    <% } %>
    <!--
    Request Patient from Database --- (Search by ID)
    Patient Number --- Extracted
    Sex --- Extracted
    Patient Age --- Calculated
    Date of Surgery --- Extracted
    Endograft Manufacturer --- Extracted

    Choose CT Scans --- Extracted
    Patient Selects CT Scan 

    CT Scan Date --- Extracted
    CT --- Extracted
    Delay --- Calculated

    Choose CT Series --- Extracted
    Patient Selects CT Series

    Total # of slices --- Extracted
    Thickness --- Extracted
    Pixel Size --- Extracted
    ROI Begin --- Entered
    Ilias Bif --- Entered
    ROI End --- Calculated 1 cm below
    Total Slides in ROI --- Calculated
    Length ROI (cm) --- Calculated
    Comment --- Entered

    BUTTON - SAVE DATA ANALYSIS IN DATA BASE-->
</asp:Content>
