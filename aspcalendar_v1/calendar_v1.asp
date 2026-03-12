<!-- #include file ="dsn.asp" -->
<!-- #include file="adovbs.inc" -->
<%
	' Name: ASP Calendar
	' Author: Manohar Kamath
	' Version: 1.0
	' Copyright Manohar Kamath. Original calendar copyright Wrox Press
%>
<%
	'------------------------------------------------------------
	' This function finds the last date of the given month
	'------------------------------------------------------------
	Function GetLastDay(intMonthNum, intYearNum)
		Dim dNextStart
		If CInt(intMonthNum) = 12 Then
			dNextStart = CDate( "1/1/" & intYearNum)
		Else
			dNextStart = CDate(intMonthNum + 1 & "/1/" & intYearNum)
		End If
		GetLastDay = Day(dNextStart - 1)
	End Function
	
	'-------------------------------------------------------------------------
	' This routine prints the individual table divisions for days of the month
	'-------------------------------------------------------------------------
	Sub Write_TD(sValue, sClass)
		Response.Write "		<TD ALIGN='RIGHT' WIDTH=20 HEIGHT=15 VALIGN='BOTTOM' CLASS='" & sClass & "'> " & sValue & "</TD>" & vbCrLf
	End Sub


	' Constants for the days of the week
	Const cSUN = 1, cMON = 2, cTUE = 3, cWED = 4, cTHU = 5, cFRI = 6, cSAT = 7
	
	' Get the name of this file
	sScript = Request.ServerVariables("SCRIPT_NAME")
	
	' Check for valid month input
	If IsEmpty(Request("MONTH")) OR NOT IsNumeric(Request("MONTH")) Then
	  datToday = Date()
	  intThisMonth = Month(datToday)
	ElseIf CInt(Request("MONTH")) < 1 OR CInt(Request("MONTH")) > 12 Then
	  datToday = Date()
	  intThisMonth = Month(datToday)
	Else
	  intThisMonth = CInt(Request("MONTH"))
	End If
	
	' Check for valid year input
	If IsEmpty(Request("YEAR")) OR NOT IsNumeric(Request("YEAR")) Then
	  datToday = Date()
	  intThisYear = Year(datToday)
	Else
	  intThisYear = CInt(Request("YEAR"))
	End If

	strMonthName = MonthName(intThisMonth)
	datFirstDay = DateSerial(intThisYear, intThisMonth, 1)
	intFirstWeekDay = WeekDay(datFirstDay, vbSunday)
	intLastDay = GetLastDay(intThisMonth, intThisYear)
	
	' Get the previous month and year
	intPrevMonth = intThisMonth - 1
	If intPrevMonth = 0 Then
		intPrevMonth = 12
		intPrevYear = intThisYear - 1
	Else
		intPrevYear = intThisYear	
	End If
	
	' Get the next month and year
	intNextMonth = intThisMonth + 1
	If intNextMonth > 12 Then
		intNextMonth = 1
		intNextYear = intThisYear + 1
	Else
		intNextYear = intThisYear
	End If

	' Get the last day of previous month. Using this, find the sunday of
	' last week of last month
	LastMonthDate = GetLastDay(intLastMonth, intPrevYear) - intFirstWeekDay + 2
	NextMonthDate = 1

	' Initialize the print day to 1  
	intPrintDay = 1

	' Open a record set of schedules
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	
	' These dates are used in the SQL
	dFirstDay = intThisMonth & "/1/" & intThisYear
	dLastDay 	= intThisMonth & "/" & intLastDay & "/" & intThisYear

	sSQL = 	"SELECT DISTINCT Start_Date, End_Date FROM tEvents WHERE " & _
					"(Start_Date >=#" & dFirstDay & "# AND Start_Date <= #" & dLastDay & "#) " & _
					"OR " & _
					"(End_Date >=#" & dFirstDay & "# AND End_Date <= #" & dLastDay & "#) " & _
					"OR " & _
					"(Start_Date < #" & dFirstDay & "# AND End_Date > #" & dLastDay & "# )"  & _
					"ORDER BY Start_Date"
	'Response.Write sSQL

	' Open the RecordSet with a static cursor. This cursor provides bi-directional navigation
	Rs.Open sSQL, sDSN, adOpenStatic, adLockReadOnly, adCmdText
%>

<html>
<head>
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule for <% = strMonthName & " " & intThisYear %></title>
<style TYPE="text/css">
  TD.NON {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#C0C0C0; font-weight :normal;}
  TD.TOP {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#0000FF; font-weight :bold;}
  TD.Some {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal;}

  A.NOEVENT:Link {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal; text-decoration: none;}
  A.NOEVENT:Visited {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :normal; text-decoration: none;}

  A.EVENT:Link {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :bold; text-decoration: none;}
  A.EVENT:Visited {font-family :Tahoma, Verdana, Arial; font-size :12px; color :#000000; font-weight :bold; text-decoration: none;}

  A.NORMAL:Link {font-family :Verdana, Arial; font-size :12px; color :#0000FF; font-weight :normal; text-decoration: none;}
  A.NORMAL:Visited {font-family :Verdana, Arial; font-size :12px; color :#0000FF; font-weight :normal; text-decoration: none;}
</style>
</head>
<body BGCOLOR="#CCCCFF" TEXT="#0000FF" LEFTMARGIN="3" LINK="#000000" VLINK="#000000">
<br>

<table ALIGN="CENTER" BORDER="1" CELLSPACING="0" CELLPADDING="2" BGCOLOR="White" BORDERCOLOR="Gray">
<tr><td>
	<table WIDTH="140" BORDER="0" CELLPADDING="1" CELLSPACING="0" BGCOLOR="#FFFFFF">
		<tr HEIGHT="18" BGCOLOR="Silver">
			<td WIDTH="20" HEIGHT="18" ALIGN="LEFT" VALIGN="MIDDLE"><a HREF="<% =sScript%>?month=<% =IntPrevMonth %>&amp;year=<% =IntPrevYear %>"><img SRC="images/prev.gif" WIDTH="10" HEIGHT="18" BORDER="0" ALT="Previous Month"></a></td>
			<td WIDTH="120" COLSPAN="5" ALIGN="CENTER" VALIGN="MIDDLE" CLASS="SOME"><% = strMonthName & " " & intThisYear %></td>
			<td WIDTH="20" HEIGHT="18" ALIGN="RIGHT" VALIGN="MIDDLE"><a HREF="<% =sScript %>?month=<% =IntNextMonth %>&amp;year=<% =IntNextYear %>"><img SRC="images/next.gif" WIDTH="10" HEIGHT="18" BORDER="0" ALT="Next Month"></a></td>
		</tr>
	  <tr>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">S</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">M</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">T</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">W</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">T</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">F</td>
			<td ALIGN="RIGHT" CLASS="SOME" WIDTH="20" HEIGHT="15" VALIGN="BOTTOM">S</td>
	  </tr>
	  <tr><td HEIGHT="1" ALIGN="MIDDLE" COLSPAN="7"><img SRC="images/line.gif" HEIGHT="1" WIDTH="140" BORDER="0"></td></tr>
	  <%
			' Initialize the end of rows flag to false
			EndRows = False
			Response.Write vbCrLf
			
			' Loop until all the rows are exhausted
		 	Do While EndRows = False
				' Start a table row
				Response.Write "	<TR>" & vbCrLf
				' This is the loop for the days in the week
				For intLoopDay = cSUN To cSAT
					' If the first day is not sunday then print the last days of previous month in grayed font
					If intFirstWeekDay > cSUN Then
						Write_TD LastMonthDate, "NON"
						LastMonthDate = LastMonthDate + 1
						intFirstWeekDay = intFirstWeekDay - 1
					' The month starts on a sunday	
					Else
						' If the dates for the month are exhausted, start printing next month's dates
						' in grayed font
						If intPrintDay > intLastDay Then
							Write_TD NextMonthDate, "NON"
							NextMonthDate = NextMonthDate + 1
							EndRows = True 
						Else
							' If last day of the month, flag the end of the row
							If intPrintDay = intLastDay Then
								EndRows = True
							End If
							
							dToday = CDate(intThisMonth & "/" & intPrintDay & "/" & intThisYear)  
							If NOT Rs.EOF Then
								' Set events flag to false. This means the day has no event in it
								bEvents = False
							  Do While NOT Rs.EOF AND bEvents = False
									' If the date falls within the range of dates in the recordset, then 
									' the day has an event. Make the events flag True
							    If dToday >= Rs("Start_Date") AND dToday <= Rs("End_Date") Then
										' Print the date in a highlighted font
							      Write_TD "<A HREF=events.asp?date="& Server.URLEncode(dToday) & " CLASS='EVENT' TARGET='rightframe'> " & intPrintDay & "</A>", "HL"
										bEvents = True
									' If the Start date is greater than the date itself, there is no point
									' checking other records. Exit the loop	
							    ElseIf dToday < Rs("Start_Date") Then
										Exit Do
									' Move to the next record
									Else	
								    Rs.MoveNext
									End If
							  Loop
								' Checks for that day
								Rs.MoveFirst
							End If
							
							' If the event flag is not raise for that day, print it in a plain font
							If bEvents = False Then
								Write_TD "<A HREF=events.asp?date="& Server.URLEncode(dToday) & " CLASS='NOEVENT' TARGET='rightframe'> " & intPrintDay & "</A>", "SOME"
							End If
						End If 
						
						' Increment the date. Done once in the loop.
						intPrintDay = intPrintDay + 1
					End If
				
				' Move to the next day in the week
				Next
				Response.Write "	</TR>" & vbCrLf
				
			Loop 
			Rs.Close
			Set Rs = Nothing
		%>
	</table>
	</td></tr>
</table>
<p>&nbsp;</p>

<!-- #include file="form.inc" -->
</body>
</html>
