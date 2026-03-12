<!-- #include file = "secure.asp" -->
<!-- #include file = "dsn.asp" -->
<!-- #include file = "adovbs.inc" -->
<%
	  ' Create a recordset and open it for adding records
	  sSQL = "DELETE * FROM tEvents WHERE Event_ID=" & Request.QueryString("Event_ID")
	  Set Rs = Server.CreateObject("ADODB.RecordSet")
	  Rs.Open sSQL, sDSN, adOpenKeySet, adLockPessimistic, adCmdText
	  Set Rs = Nothing
	  Response.Redirect "events.asp?date=" & Request.QueryString("Date")
%>
