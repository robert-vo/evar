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
    <div>
        <fieldset>
            <legend>Account Information</legend>
            <div class="editor-label">
                <label>
                    First Name
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.firstName)%>
                <%: Html.ValidationMessageFor(m => m.firstName)%>
            </div>
            <div class="editor-label">
                <label>
                    Last Name
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.lastName)%>
                <%: Html.ValidationMessageFor(m => m.lastName)%>
            </div>
            <div class="editor-label">
                <label>
                    Company</label>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.company)%>
                <%: Html.ValidationMessageFor(m => m.company)%>
            </div>
            
            <div class="editor-label">
                <label>
                    Occupation
                </label>
            </div>
            <div class = "editor-field">
                <%: Html.DropDownListFor(m => m.occupation, new SelectList(new[] { "Surgeon", "Computational Scientist", "CFD Scientist", "Administrator"})) %>
            </div>

            <div class="editor-label">
                <label>
                    User Name
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.UserName) %>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
            </div>
            <div class="editor-label">
                <label>
                    Email
                </label>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </div>
            <div class="editor-label">
                <label>
                    Password
                </label>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.Password) %>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </div>
            <div class="editor-label">
                <label>
                    Confirm Password
                </label>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </div>
            <p>
                <input type="submit" value="Register" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
