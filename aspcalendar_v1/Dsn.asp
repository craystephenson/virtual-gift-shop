<%
  Dim sDB, sPath, sDSNDir, sDSNFil, sDefDir, sDSN, sScriptDir

  ' This is the entire DB path - Physical with respect to root physical path 
  sDB   = "calendar.mdb" 

  '----------------------------------------------------
  ' DO NOT Edit the entries below
  '----------------------------------------------------

	' Retrieve the script directory
	sScriptDir = Request.ServerVariables("SCRIPT_NAME")
	sScriptDir = StrReverse(sScriptDir)
	sScriptDir = Mid(sScriptDir, InStr(1, sScriptDir, "/"))
	sScriptDir = StrReverse(sScriptDir)
	
  ' Set the virtual Directory
  sPath = Server.MapPath(sScriptDir) & "\"

  ' This is the DSN file Name for Access database
  sDSNFil = "Access.dsn"

  ' This is the resulting DSN string
  sDSN = "filedsn=" & sPath & sDSNFil & ";DefaultDir=" & sPath & ";DBQ=" & sPath & sDB & ";"

  '----------------------------------------------------
%>
