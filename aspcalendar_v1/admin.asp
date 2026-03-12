<!-- #include file="dsn.asp" -->
<!-- #include file="adovbs.inc" -->
<%
	Dim sScript, iAdminStatus
	sScript = Request.ServerVariables("SCRIPT_NAME")
	If NOT IsEmpty(Request.Form("Login")) Then
		iAdminStatus = Check_Admin
		If iAdminStatus = 1 Then
			Session("Admin") = 1
			Response.Redirect "default.asp"
		Else
			Session("Admin") = 0
		End If
	End If
%>
<HTML>
<BODY BGCOLOR="#FFFFFF" onLoad="document.loginfrm.Login.focus()">
<IMG SRC="images/aspcalendar.gif" HEIGHT=50 WIDTH=400 BORDER=0>
<P><FONT FACE="Verdana, Helvetica" SIZE=2>
Enter "admin" for login and "admin" for password
</FONT></P>
<FORM NAME="loginfrm" ACTION="<% =sScript %>" METHOD=POST>
<TABLE WIDTH=300 BORDER=1 CELLPADDING=3 CELLSPACING=0 ALIGN=CENTER>
	<TR>
		<TD BGCOLOR="#BDBDFF" COLSPAN=2 ALIGN=LEFT VALIGN=TOP>
			<FONT FACE="Verdana, Helvetica" SIZE=2><B>Admin Panel</B></FONT>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=50 ALIGN=LEFT VALIGN=TOP>
			<FONT FACE="Verdana, Helvetica" SIZE=2><B>Login</B></FONT>
		</TD>
		<TD ALIGN=LEFT VALIGN=TOP>
			<INPUT TYPE=TEXT NAME="Login" SIZE=10 MAXLENGTH=10 VALUE="<% =Request.Form("Login") %>">
		</TD>
	</TR>
	<TR>
		<TD WIDTH=50 ALIGN=LEFT VALIGN=TOP>
			<FONT FACE="Verdana, Helvetica" SIZE=2><B>Password</B></FONT>
		</TD>
		<TD ALIGN=LEFT VALIGN=TOP>

			<INPUT TYPE=PASSWORD NAME="Password" SIZE=10 MAXLENGTH=10>
			<BR>
			<INPUT TYPE=SUBMIT VALUE="Enter">
		</TD>
	</TR>
</TABLE>
</FORM>

</BODY>
</HTML>

<%
Function Check_Admin
	Dim Rs, sSQL, sLogin, sPassword
	sLogin = Replace(Request.Form("Login"), "'", "''")
	sPassword = Replace(Request.Form("Password"), "'", "''")
	sSQL = "SELECT * FROM tAdmin WHERE Login='" & sLogin & "' AND Password='" & sPassword & "' "

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open sSQL, sDSN, adOpenForward, adLockReadOnly, adCmdText
	If Rs.EOF Then
		Check_Admin = 0
	Else
		Check_Admin = 1
	End If
End Function
%>
