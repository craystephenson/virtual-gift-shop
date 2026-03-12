<!--#include file="adovbs.inc"-->
<!--#include file="dsn.asp"-->
<%
	If IsEmpty(Request.QueryString("Date")) OR NOT IsDate(Request.QueryString("Date")) Then
		dDate = Date
	Else
		dDate = CDate(Request.QueryString("Date"))
	End If
%>	
<HTML>
<HEAD>
<TITLE>Events for <%= FormatDateTime(dDate, 1) %></TITLE>
</HEAD>
<BODY BACKGROUND="images/image3.gif" LEFTMARGIN="5">
<P>&nbsp;</P>
<P ALIGN=RIGHT><IMG SRC="images/events.gif" WIDTH=400 HEIGHT=50 BORDER=0 ALT=""></P>
<BR CLEAR=ALL>

<%
  ' Open a record set of schedules
	Response.Write "<FONT COLOR='Gray' FACE='Tahoma, Verdana' SIZE=2>" & FormatDateTime(dDate, 1) & "</FONT><BR><BR>" & vbCrLf
  Set Rs = Server.CreateObject("ADODB.RecordSet")
	sSQL = 	"SELECT * FROM tEvents " & _
					"WHERE Start_Date <= #" & dDate & "# AND End_Date >= #" & dDate & "# ORDER BY Event_ID "

  Rs.Open sSQL, sDSN, adOpenStatic, adLockReadOnly, adCmdText
	If NOT Rs.EOF Then
		arrColor =Array("#000000", "#CC9966", "#336600", "#003366", "#FFCC66", "#0000FF", "#FF0000")
		iIndex = 0
		
		Do While NOT Rs.EOF
			' Create the outer table
			Response.Write "<TABLE WIDTH='400' BORDER='0' CELLSPACING='0' CELLPADDING='1' BGCOLOR='" & arrColor(iIndex) & "'><TR><TD>" & vbCrLf
			' Create the inner table
			Response.Write "<TABLE WIDTH='100%' CELLSPACING=0 BORDER=0 CELLPADDING=2 BGCOLOR='White'>" & vbCrLf
			Response.Write "<TR BGCOLOR='" & arrColor(iIndex) & "'><TD HEIGHT=20 WIDTH=220 VALIGN='top'><B><FONT FACE='Verdana, Tahoma' SIZE='1' COLOR='White'>" & vbCrLf
			Response.Write Trim(Rs("Event_Title")) & VbCrLf
			Response.Write "</FONT></B>&nbsp;</TD>" & vbCrLf
			If Session("Admin") = 1 Then
				Response.Write "<TD WIDTH=90 HEIGHT=20 VALIGN='MIDDLE'><A HREF='addedit.asp?Event_ID=" & Rs("Event_ID") & "'><IMG SRC='images/edit.gif' BORDER=0 HEIGHT=20 WIDTH=90></A></TD>" & vbCrLf
				Response.Write "<TD WIDTH=90 HEIGHT=20 VALIGN='MIDDLE'><A HREF='delete.asp?date=" & Server.URLEncode(dDate) & "&Event_ID=" & Rs("Event_ID") & "'><IMG SRC='images/delete.gif' BORDER=0 HEIGHT=20 WIDTH=90></A></TD>" & vbCrLf
			End If
			Response.Write "</TR>" & vbCrLf
			
			Response.Write "<TR><TD VALIGN='top' COLSPAN='3'>" & vbCrLf
			
			' If the event lasts more than one day, indidate the start and end dates
			If Rs("Start_Date") <> Rs("End_Date") Then
				Response.Write "<FONT FACE='Verdana, Arial' SIZE=1 COLOR='Gray'>Starts: " & Rs("Start_Date") & vbCrLf
				Response.Write "<BR>Ends: " & Rs("End_Date") & vbCrLf
				Response.Write "</FONT><P>"
			End If
			
			' Print the event details
			Response.Write "<FONT FACE='Verdana, Tahoma' SIZE='1' COLOR='Black'>" & vbCrLf
			Response.Write Replace(Rs("Event_Details") & " ", vbCrLf, "<BR>") & vbCrLf
			Response.Write "</FONT></TD></TR>" & vbCrLf
			Response.Write "</TABLE></TD></TR></TABLE>" & vbCrLf
			
			Response.Write "<BR>" & vbCrLf
			Rs.MoveNext
			iIndex = iIndex + 1
			If iIndex = 3 Then
				iIndex = 0
			End If
		Loop
	End If	
%>

	



<!-- #include file="menu.inc" -->
</BODY>
</HTML>