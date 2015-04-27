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
    <br />
    <br />
    <table>
        <tr>
            <td>
                <h3>
                    Date Of Surgery</h3>
            </td>
            <td>
                <%: Html.DropDownListFor(model => model.MonthOfSurgery, new SelectList(new[] { "January", "February", "March", "ADD MORE MONTHS HERE" }), new { style = "width:250px" })%>
            </td>
            <td>
                <%: Html.DropDownListFor(model => model.DayOfSurgery, new SelectList(new[] { "1", "2", "3", "4" }), new { style = "width:100px" })%>
            <td>
                <%: Html.DropDownListFor(model => model.YearOfSurgery, new SelectList(new[] { "2015", "2014", "2013", "2012", "2011", "2010" }), new { style = "width:150px" })%>
            </td>
        </tr>
    </table>
    <h3>
        <strong>
            <center>Endograft Characteristics</center>
        </strong>
    </h3>
    
    <p>Brand<%: Html.DropDownListFor(model => model.BrandName, new SelectList(new[] { "Brand 1", "Brand 2", "Brand 3", "Brand 4", "Brand 5" }), new { style = "width:250px" })%></p>
    
    


        <table>
        <tr>
            <td>
            </td>
            <td>
                <center>Diameter</center>
            </td>
            <td>
                <center>Length</center>
            </td>
        </tr>
        <tr>
            <td>
                Endograft Body
            </td>
            <td>
                <center><%: Html.TextBoxFor(model => model.EndograftBodyDiameter, new { style = "width:100px" })%>
        </center>
            </td>
            <td>
                <center>
            <%: Html.TextBoxFor(model => model.EndograftBodyLength, new { style = "width:100px" })%>
            </center>
            </td>
        </tr>
        <tr>
            <td>
                Unilateral Leg
            </td>
            <td>
                <center><%: Html.TextBoxFor(model => model.UnilateralLegDiameter, new { style = "width:100px" })%>
        </center>
            </td>
            <td>
                <center>
            <%: Html.TextBoxFor(model => model.UnilateralLegLength, new { style = "width:100px" })%>
            </center>
            </td>
        </tr>
        <tr>
            <td>
                Contralateral Leg
            </td>
            <td>
                <center><%: Html.TextBoxFor(model => model.ContralateralLegDiameter, new { style = "width:100px" })%>
        </center>
            </td>
            <td>
                <center>
                    <%: Html.TextBoxFor(model => model.ContralateralLegLength, new { style = "width:100px" })%>
</center>
            </td>
        </tr>
        <tr>
            <td>
                Entry Point
            </td>
            <td>
                <center>Left
        <%: Html.RadioButtonFor(m => m.EntryPoint, "Left")%>        </center>
            </td>
            <td>
                <center>
                    Right
        <%: Html.RadioButtonFor(m => m.EntryPoint, "Right")%></center>
            </td>
        </tr>
    </table>
    <div>
        <input type="submit" value="Save" />
    </div>
    <% } %>
</asp:Content>
