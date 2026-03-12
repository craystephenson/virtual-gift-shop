<!-- #include file = "secure.asp" -->
<!-- #include file = "dsn.asp" -->
<!-- #include file = "adovbs.inc" -->
<%
	  ' Create a recordset and open it for adding records
	  sSQL = "DELETE * FROM tEvents "
	  Set Rs = Server.CreateObject("ADODB.RecordSet")
	  Rs.Open sSQL, sDSN, adOpenKeySet, adLockPessimistic, adCmdText
	  Set Rs = Nothing
%>
