<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<TEAM1OIE2S.Models.RegisterModel>" %>

<%--Joseph Eldridge SQA 1112505--%>
<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create a New Account</h2>
    <p>
        Use the form below to create a new account.
    </p>
    <p>
        Passwords are required to be a minimum of
        <%: ViewData["PasswordLength"] %>
        characters in length.
    </p>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
    <table>
        <tr>
            <td>
                <legend>Account Information</legend>
            </td>
        </tr>
        <tr>
            <td>
                First Name
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.firstName, new { style="width:300px; height:30px"})%>
                <%: Html.ValidationMessageFor(m => m.firstName)%>
            </td>
        </tr>
        <tr>
            <td>
                Last Name
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.lastName, new { style = "width:300px; height:50px" })%>
                <%: Html.ValidationMessageFor(m => m.lastName)%>
            </td>
        </tr>
        <tr>
            <td>
                Institution
            </td>
            <td>
                <%: Html.DropDownListFor(m => m.institutionID, new SelectList(new[] { "Methodist; Houston, TX", "Strassbourg; Strassbourg, France", "London; London, UK", "Gainsville; Gainsville, FL"}), new { style = "width:300px;height:30px;" })%>
            </td>
        </tr>
        <tr>
            <td>
                Occupation
            </td>
            <td>
                <%: Html.DropDownListFor(m => m.occupation, new SelectList(new[] { "Surgeon", "Administrator", "Super Administrator", "Customer Service", "Audit" }), new { style="width:300px;height:30px;" })%>
            </td>
        </tr>
        <tr>
            <td>
                User Name
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.UserName, new { style = "width:300px; height:30px" })%>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
            </td>
        </tr>
        <tr>
            <td>
                Email
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.Email, new { style = "width:300px; height:30px" })%>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </td>
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <%: Html.PasswordFor(m => m.Password, new { style = "width:300px; height:30px" })%>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </td>
        </tr>
        <tr>
            <td>
                Confirm Password
            </td>
            <td>
                <%: Html.PasswordFor(m => m.ConfirmPassword, new { style = "width:300px; height:30px" })%>
                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </td>
        </tr>
    </table>
    <p>
        <input type="submit" value="Register" />
    </p>

    <% } %>
</asp:Content>
