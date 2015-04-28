<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DatabaseAudit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table class="table table-hover">
	<thead>
		<tr>
			<th colspan="1">Type</th>
			<th colspan="1">TableName</th>
			<th colspan="1">FieldName</th>
			<th colspan="1">OldValue</th>
			<th colspan="1">NewValue</th>
			<th colspan="1">UpdateDate</th>
		</tr>
	</thead>
	<tbody>
		<% foreach (var _audits in (List<TEAM1OIE2S.Models.AuditModel>)ViewData["auditsList"]){ %>
		<tr>
			<td  colspan="1"><%: _audits.Type %></td>
			<td  colspan="1"><%: _audits.TableName %></td>
			<td  colspan="1"><%: _audits.FieldName %></td>
			<td  colspan="1"><%: _audits.OldValue %></td>
			<td  colspan="1"><%: _audits.NewValue %></td>
			<td  colspan="1"><%: _audits.UpdateDate %></td>
		</tr>
		<%}%>
	</tbody>
</table>


  
 

</asp:Content>
