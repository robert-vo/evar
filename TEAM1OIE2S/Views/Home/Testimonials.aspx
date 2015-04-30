<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<TEAM1OIE2S.Models.TestimonialModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Client Testimonials</h2>
    <ul id="testimonials" class="three-up">
        <h3>
            Add Testiominals</h3>
        <p>
            &ldquo;We can build more robust sites faster. That impacts both cost and value.
            We can roll out powerful sites for lower budgets and clear a nice profit as an agency.&rdquo;</p>
    </ul>
    		<% foreach (var _audits in (List<TEAM1OIE2S.Models.TestimonialModel>)ViewData["Content"]){ %>
		<tr>
			<td colspan="1" align="center"><%: _audits.Content %></td>
		</tr>
		<%}%>
    <% using (Html.BeginForm())
       { %>
       <%: Html.TextBoxFor(m => m.Content, new { style="width:300px; height:50px"})%>


       <input type="submit" value="Submit Testimonial"/>
    <% } %>
</asp:Content>
