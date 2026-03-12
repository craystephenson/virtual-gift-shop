<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Album Name Suggestions</title>
</head>

<body bgcolor="#FFFFFF">

<p align="center"><font face="Arial" size="2"><br>
<b>What do our fans think our first album should be named?<br>
<br>
</b></font></p>
<table width="856">
  <tbody>
    <!--webbot bot="DatabaseRegionStart" startspan
    s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
    s-columntypes="3,202,202,203,202,135,3" s-dataconnection="albumname"
    b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice s-menuvalue
    b-tableborder="FALSE" b-tableexpand="FALSE" b-tableheader="FALSE"
    b-listlabels="TRUE" b-listseparator="TRUE" i-ListFormat="0"
    b-makeform="TRUE" s-recordsource="album_name"
    s-displaycolumns="ID,name,album_name,explanation,email,timestamp,computer ID"
    s-criteria s-order s-sql="SELECT * FROM album_name" b-procedure="FALSE"
    clientside SuggestedExt="asp" s-DefaultFields
    s-NoRecordsFound="No records returned." i-MaxRecords="256" i-GroupSize="5"
    BOTID="0" u-dblib="../_fpclass/fpdblib.inc"
    u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc"
    tag="TBODY"
    local_preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server with a web browser. The following table row will repeat once for every record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM album_name"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=7 align=left width=""100%"">No records returned.</td></tr>"
fp_sDataConn="albumname"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=5
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice=""
fp_sMenuValue=""
fp_iDisplayCols=7
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" i-CheckSum="37859" endspan -->
    <tr>
      <td width="15"><font face="Arial"><b>&nbsp;</b></font></td>
      <td width="139"><font face="Arial"><b>Time</b></font></td>
      <td width="132"><font face="Arial"><b>Name</b></font></td>
      <td width="129"><font face="Arial"><b>eMail</b></font></td>
      <td width="146"><font face="Arial"><b>Album Name</b></font></td>
      <td width="269"><font face="Arial"><b>Explanation</b></font></td>
    </tr>
    <tr>
      <td width="25">
        <font size="2" face="Arial"><b><a href="album_delete.asp?number=<%=FP_FieldURL(fp_rs,"id")%>"><img border="0" src="../internal/images/delete.gif"></a></b></font>
      </td>
      <td width="149"><font size="2" face="Arial"><!--webbot bot="DatabaseResultColumn"
        startspan
        s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
        s-column="timestamp" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;timestamp&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;timestamp&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"timestamp")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="22627" endspan -->
        </font></td>
      <td width="106"><font size="2" face="Arial"><!--webbot bot="DatabaseResultColumn"
        startspan
        s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
        s-column="name" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"name")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="5948" endspan -->
        </font></td>
      <td width="129"><font size="2" face="Arial"><!--webbot bot="DatabaseResultColumn"
        startspan
        s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
        s-column="email" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;email&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;email&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"email")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="10376" endspan -->
        </font></td>
      <td width="146"><font size="2" face="Arial"><!--webbot bot="DatabaseResultColumn"
        startspan
        s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
        s-column="album_name" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;album_name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;album_name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"album_name")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="30229" endspan --></font></td>
      <td width="269"><font size="2" face="Arial"><!--webbot bot="DatabaseResultColumn"
        startspan
        s-columnnames="ID,name,album_name,explanation,email,timestamp,computer ID"
        s-column="explanation" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;explanation&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;explanation&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"explanation")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="34383" endspan -->
        </font></td>
    </tr>
    <tr>
      <td width="783" colspan="6"></td>
    </tr>
    <tr>
      <td colspan="6" width="795"></td>
    </tr>
    <tr>
      <td colspan="6" width="796">&nbsp;
        <p>&nbsp;</td>
    </tr>
    <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE"
    b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="5"
    clientside tag="TBODY"
    local_preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;FORM&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;/FORM&gt;&lt;/td&gt;&lt;/tr&gt;"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" i-CheckSum="56926" endspan -->
  </tbody>
</table>

</body>

</html>
