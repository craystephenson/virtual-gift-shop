<% Option Explicit %>
<!-- #include file = "secure.asp" -->
<!-- #include file = "dsn.asp" -->
<!-- #include file = "adovbs.inc" -->
<%
	Dim sStart_Date, sEnd_Date, sEvent_Title, sEvent_Details
	Dim imgStart_Date, imgEnd_Date, imgEvent_Title, imgEvent_Details
	Dim sMode, bError, sScriptPath
	
	' Get the name of the file
	sScriptPath = Request.ServerVariables("SCRIPT_NAME")
	
	' Determine if the action required is an add or an edit. If it is an edit,
	' retrieve the record and present it to the user. If not, present a 
	' blank form
	If IsEmpty(Request.Form("EVENT")) Then
		If NOT IsEmpty(Request.QueryString("Event_ID")) Then
			sMode = "EDIT"
			Get_Event(Request.QueryString("Event_ID"))
		Else
			sMode = "ADD"	
		End If	
		
		Show_Form()
	Else
		Update_Event(Request.Form("EVENT"))
	End If		
%>
<%
' This routine retrieves the event by the Event_ID. If the event is not found,
' set the mode to an "ADD".
Sub Get_Event(lEvent_ID)
	Dim sSQL, Rs
  ' Create a recordset and open the given event. If the Record is not found
	' set the mode to ADD
  sSQL = "SELECT * FROM tEvents WHERE Event_ID=" & lEvent_ID
  Set Rs = Server.CreateObject("ADODB.RecordSet")
  Rs.MaxRecords = 1
  Rs.Open sSQL, sDSN, adOpenStatic, adLockReadOnly, adCmdText
	
	If Not Rs.EOF Then
		sStart_Date = Rs("Start_Date")
		sEnd_Date = Rs("End_Date")
		sEvent_Title = Rs("Event_Title")
		sEvent_Details = Rs("Event_Details")
	Else
		sMode = "ADD"
	End If
End Sub	
%>	

<%
' This routines presents the form to the user. Depending on the mode, the
' form fields are filled with data or blank.
Sub Show_Form()
	Dim sButtonMsg, sTitle
  If sMode = "ADD" Then
		sButtonMsg = "Add Event"
	Else
		sButtonMsg = "Update Event"
	End If
	
	' Set the title of the page depending on if an error occurred during
	' form submission or not
	If bError = True Then
		sTitle = "Error in form submission"
	Else
		sTitle = "Add/Update an Event"
	End If		
%>
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
   <META NAME="Author" CONTENT="Manohar Kamath">
   <TITLE><% =sTitle %></TITLE>
	 
</HEAD>
<BODY BGCOLOR=FFFFFF onLoad="document.eventfrm.START_DATE.focus()">
<P>&nbsp;</P>
<P ALIGN=LEFT><IMG SRC="images/add_event.gif" WIDTH=200 HEIGHT=20 BORDER=0 ALT="">
</P>

<FORM NAME="eventfrm" ACTION="<% =sScriptPath %>" METHOD=POST>

<TABLE CELLSPACING=5 CELLPADDING=3 BORDER=0 WIDTH=95%>

<TR>
<TD VALIGN=TOP ALIGN=LEFT WIDTH=30%><FONT FACE=Verdana SIZE=2><B>Start Date</B>
<BR><FONT SIZE=1 COLOR='RED'><I>Required</I></FONT></FONT></TD>
<TD VALIGN=TOP ALIGN=LEFT WIDTH=70%><FONT FACE=Verdana SIZE=2><INPUT TYPE=TEXT SIZE=12 MAXLENGTH=12 NAME="START_DATE" VALUE="<% =Server.HTMLEncode(sStart_Date) %>"></FONT><% =imgStart_Date %></TD>
</TR>

<TR>
<TD VALIGN=TOP ALIGN=LEFT WIDTH=30%><FONT FACE=Verdana SIZE=2><B>End Date</B>
<BR><FONT SIZE=1 COLOR='RED'><I>Optional</I></FONT></FONT></TD>
<TD VALIGN=TOP ALIGN=LEFT WIDTH=70%><FONT FACE=Verdana SIZE=2><INPUT TYPE=TEXT SIZE=12 MAXLENGTH=12 NAME="END_DATE" VALUE="<% =Server.HTMLEncode(sEnd_Date) %>"></FONT><% =imgEnd_Date %></TD>
</TR>

<TR>
<TD VALIGN=TOP ALIGN=LEFT><FONT FACE=Verdana SIZE=2><B>Event Title</B>
<BR><FONT SIZE=1 COLOR='RED'><I>Required</I></FONT></FONT></TD>
<TD VALIGN=TOP ALIGN=LEFT><FONT FACE=Verdana SIZE=2><INPUT TYPE=TEXT SIZE=30 MAXLENGTH=100 NAME="EVENT_TITLE" VALUE="<% =Server.HTMLEncode(sEvent_Title) %>"><% =imgEvent_Title %></FONT></TD>
</TR>

<TR>
<TD VALIGN=TOP ALIGN=LEFT><FONT FACE=Verdana SIZE=2><B>Event Details</B>
<BR><FONT SIZE=1 COLOR='RED'><I>Required</I></FONT></FONT></TD>
<TD VALIGN=TOP ALIGN=LEFT><FONT FACE=Verdana SIZE=2><TEXTAREA COLS=30 ROWS=5 NAME="EVENT_DETAILS" WRAP=PHYSICAL><% =Server.HTMLEncode(sEvent_Details) %></TEXTAREA></FONT><% =imgEvent_Details %></TD>
</TR>

</TABLE>
<BR>
<INPUT TYPE=HIDDEN NAME=EVENT VALUE=<% =sMode %>>
<INPUT TYPE=HIDDEN NAME=EVENT_ID VALUE=<% =Request.QueryString("EVENT_ID") %>>
<FONT FACE="Verdana" SIZE="2"><INPUT TYPE=SUBMIT VALUE="<% =sButtonMsg %>"></FONT>

</FORM>
</BODY>
</HTML>
<% End Sub %>

<%
Sub Update_Event(sUpdateMode)
	Dim sErrImage, Rs, sSQL, sTitle
	bError = False
  sErrImage = "<IMG SRC='images/error.gif' BORDER=0 HEIGHT=15 WIDTH=50>"
	
	' Get the form data into variables
	sStart_Date = Request.Form("START_DATE")
	sEnd_Date = Request.Form("END_DATE")
	sEvent_Title = Request.Form("EVENT_TITLE")
	sEvent_Details = Request.Form("EVENT_DETAILS")
	
	' The error checking routines start here. If any of the fields fails
	' error check, the bError flag is raised, and the corresponding image
	' string is set to the image source
	
	' Check to see if Start date is a valid date
	If NOT IsDate(sStart_Date) Then
		bError = True
		imgStart_Date = sErrImage
	End If 
	
	' Check if the End date is a valid date provided it is not empty
	If Trim(sEnd_Date) <> "" AND NOT IsDate(sEnd_Date) Then
		bError = True
		imgEnd_Date = sErrImage
	End If
	
	' Check if the event title field is blank
	If Trim(sEvent_Title) = "" Then
		bError = True
		imgEvent_Title = sErrImage
	End If 
	
	' Check if the event details field is blank
	If Trim(sEvent_Details) = "" Then
		bError = True
		imgEvent_Details = sErrImage
	End If 
	
	' Check if the start date and end date correspond to a valid range
	' so that Start date is always prior to the end date
	If IsDate(sStart_Date) AND IsDate(sEnd_Date) Then
		If CDate(sStart_Date) > CDate(sEnd_Date) Then
			bError = True
			imgStart_Date = sErrImage
			imgEnd_Date = sErrImage
		End If
	End If

	If bError = False Then
	  ' Create a recordset
	  Set Rs = Server.CreateObject("ADODB.RecordSet")
		
		' Depending on the Mode, open the Recordset in eith Add or Edit mode
		If sUpdateMode = "EDIT" Then
		  sSQL = "SELECT * FROM tEvents WHERE Event_ID=" & Request.Form("Event_ID")
		  Rs.Open sSQL, sDSN, adOpenKeySet, adLockPessimistic, adCmdText
		Else
		  Rs.Open "tEvents", sDSN, adOpenKeySet, adLockPessimistic, adCmdTable
		  Rs.AddNew
		  Rs("Date_Added") = Now()
		End If
		
		' Populate the RecordSet fields
    Rs("Start_Date") = CDate(Request.Form("START_DATE"))
		
		' If the end date is blank, it equals start date
		If Trim(sEnd_Date) <> "" Then
	    Rs("End_Date") = CDate(Request.Form("END_DATE"))
		Else
	    Rs("End_Date") = CDate(Request.Form("START_DATE"))
		End If	
		
		Rs("Event_Title") = Request.Form("EVENT_TITLE")
		Rs("Event_Details") = Request.Form("EVENT_Details")
	  Rs.Update
		
	  Rs.Close
	  Set Rs = Nothing
		
		If sUpdateMode = "ADD" Then
			sTitle = "Event Added"
		Else
			sTitle = "Event Updated"
		End If
%>
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
   <META NAME="Author" CONTENT="Manohar Kamath">
   <TITLE><% =sTitle %></TITLE>
</HEAD>
<BODY BGCOLOR=FFFFFF>
<H3><FONT FACE="Verdana"><% =sTitle %></FONT></H3>
<FONT SIZE=2 FACE="Verdana">

<P>
Thank you!
</P>
</FONT>

<!-- #include file="menu.inc" -->

</BODY>
</HTML>

<%		
	Else
		Show_Form()
	End If	
End Sub	
%>
