<%
	If Session("Admin") <> 1 Then
		Response.Redirect "invalid.asp"
	End If
%>