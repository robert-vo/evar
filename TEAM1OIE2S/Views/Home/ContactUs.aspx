<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
        Contact us
    <a href="https://www.google.com/maps/place/University+of+Houston/@29.719949,-95.342233,17z/data=!3m1!4b1!4m2!3m1!1s0x8640be5a8ebea199:0xc9f387eca8247e7">
    <asp:Image ID="imgMap" runat="server" Height="250px" ImageAlign="Right" 
        ImageUrl="../../Images/UHMap.JPG" style="margin-left: 0px" Width="580px" />
        </a>
    </h2>
    <h3>
        Location</h3>
    <p class="blurb">
        We are located at University of Houston in the PGH Building.</p>
    <p>
        Company Name: TEAM1OIE2S</p>
    <p>
        Address: 4800 Calhoun Rd</p>
    <p class="address_2">
        Houston, TX 77004</p>
    <p>
        Email: <a href="mailto:evarinfo@gmail.com">evarinfo@gmail.com</a></p>
    <p>
        For general inquiries, please fill out this form</p>

        <form name="htmlform" method="post" action="html_form_send.php">
<table width="450px">
</tr>
<tr>
 <td valign="top">
  <label for="first_name">First Name *</label>
 </td>
 <td valign="top">
  <input  type="text" name="first_name" maxlength="50" size="30">
 </td>
</tr>
 
<tr>
 <td valign="top"">
  <label for="last_name">Last Name *</label>
 </td>
 <td valign="top">
  <input  type="text" name="last_name" maxlength="50" size="30">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="email">Email Address *</label>
 </td>
 <td valign="top">
  <input  type="text" name="email" maxlength="80" size="30">
 </td>
 
</tr>
<tr>
 <td valign="top">
  <label for="telephone">Telephone Number</label>
 </td>
 <td valign="top">
  <input  type="text" name="telephone" maxlength="30" size="30">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="comments">Comments *</label>
 </td>
 <td valign="top">
  <textarea  name="comments" maxlength="1000" cols="25" rows="6"></textarea>
 </td>
 
</tr>
<tr>
 <td colspan="2" style="text-align:center">
  <input type="submit" value="Submit" class="submitButton">
 </td>
</tr>
</table>
</form>
</asp:Content>
