<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>
        Data analysis</h2>
    <p>
        We analyze data and stuff. Dope.</p>

        <form id="form1" runat="server">
<table>
</tr>
<tr>
 <td valign="top" style="width: 611px">
     Patient ID
 </td>
 <td valign="top">
  <input  type="text" name="first_name" maxlength="50" size="30">
 </td>
</tr>
 
<tr>
 <td valign="top"" style="width: 611px">
     Patient Number:
 </td>
 <td valign="top">
  <input  type="text" name="last_name" maxlength="50" size="30">
 </td>
</tr>
<tr>
 <td valign="top" style="width: 611px">
     Sex:</td>
 <td valign="top">
  <input  type="text" name="email" maxlength="80" size="30">
 </td>
 
</tr>
<tr>
 <td valign="top" style="width: 611px">
     Patient Age:
 </td>
 <td valign="top">
  <input  type="text" name="telephone" maxlength="30" size="30">
 </td>
</tr>
<tr>
 <td valign="top" style="width: 611px">
     Date of Surgery:</td>
 <td valign="top">
     <input  type="text" name="telephone0" maxlength="30" size="30"></td>
 
</tr>
    <tr>
 <td valign="top" style="width: 611px; height: 46px;">
     Graft Manufactuerer:</td>
 <td valign="top" style="height: 46px">
     <input  type="text" name="telephone1" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     CT Scans (CHANGE THIS TO A DROP DOWN MENU)</td>
 <td valign="top">
     <asp:DropDownList ID="DropDownList2" runat="server">
     </asp:DropDownList>
        </td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     CT Scan Date</td>
 <td valign="top">
     <input  type="text" name="telephone3" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     CT</td>
 <td valign="top">
     <input  type="text" name="telephone4" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Delay:</td>
 <td valign="top">
     <input  type="text" name="telephone5" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     CT Series</td>
 <td valign="top">
     <asp:DropDownList ID="DropDownList1" runat="server" 
         onselectedindexchanged="DropDownList1_SelectedIndexChanged">
     </asp:DropDownList>
        </td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Total number of slices</td>
 <td valign="top">
     <input  type="text" name="telephone7" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Thickness</td>
 <td valign="top">
     <input  type="text" name="telephone8" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Pixel Size:</td>
 <td valign="top">
     <input  type="text" name="telephone9" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     ROI Begin</td>
 <td valign="top">
     <input  type="text" name="telephone10" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Iliac Bif</td>
 <td valign="top">
     <input  type="text" name="telephone11" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     ROI End</td>
 <td valign="top">
     <input  type="text" name="telephone12" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Total Slides in ROI</td>
 <td valign="top">
     <input  type="text" name="telephone13" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Length ROI (cm)</td>
 <td valign="top">
     <input  type="text" name="telephone14" maxlength="30" size="30"></td>
 
    </tr>
    <tr>
 <td valign="top" style="width: 611px">
     Comments</td>
 <td valign="top">
     <input  type="text" name="telephone15" maxlength="30" size="30"></td>
 
    </tr>
<tr>
 <td colspan="2" style="text-align:center">
     <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
         Text="Save Data Analysis to Database" />
 </td>
</tr>
</table>
    </form>
</asp:Content>
