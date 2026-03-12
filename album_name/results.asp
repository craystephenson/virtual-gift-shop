<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>?</title>
</head>

<body bgcolor="#FFFFFF">

<p>&nbsp;</p>

<table width="824" height="199">
  <tbody>
    <!--webbot bot="DatabaseRegionStart" startspan
    s-columnnames="user,say,hair,love,ID,time,name,love2"
    s-columntypes="202,203,202,202,3,135,202,202" s-dataconnection="name"
    b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice s-menuvalue
    b-tableborder="FALSE" b-tableexpand="FALSE" b-tableheader="FALSE"
    b-listlabels="TRUE" b-listseparator="TRUE" i-ListFormat="0"
    b-makeform="TRUE" s-recordsource="name"
    s-displaycolumns="user,say,hair,love,time,name,love2" s-criteria s-order
    s-sql="SELECT * FROM name" b-procedure="FALSE" clientside SuggestedExt="asp"
    s-DefaultFields s-NoRecordsFound="No records returned." i-MaxRecords="256"
    i-GroupSize="5" BOTID="0" u-dblib="../_fpclass/fpdblib.inc"
    u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc"
    tag="TBODY"
    local_preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server with a web browser. The following table row will repeat once for every record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;"
    preview="<tr><td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;><font color=&quot;#000000&quot;>This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.</font></td></tr>" --><!--#include file="../_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM name"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=7 align=left width=""100%"">No records returned.</td></tr>"
fp_sDataConn="name"
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
<!--webbot bot="DatabaseRegionStart" i-CheckSum="6583" endspan -->
    <tr>
      <td width="122" height="10"><font face="Arial" size="1"><b>Name</b></font></td>
      <td width="92" height="10"><font face="Arial" size="1"><b>eMail</b></font></td>
      <td width="110" height="10"><font face="Arial" size="1"><b>Time</b></font></td>
      <td width="133" height="10"><font face="Arial" size="1"><b>Computer ID</b></font></td>
      <td width="335" height="10"><font face="Arial" size="1"><b>Memo</b></font></td>
    </tr>
    <tr>
      <td width="122" height="18"><font face="Arial" size="1"><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="user,say,hair,love,ID,time,name,love2" s-column="name"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"name")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="5948" endspan -->
        </font>
      </td>
      <td width="92" height="18"><font face="Arial" size="1"><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="user,say,hair,love,ID,time,name,love2" s-column="hair"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;hair&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;hair&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"hair")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="5586" endspan -->
        </font>
      </td>
      <td width="110" height="18"><font face="Arial" size="1"><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="user,say,hair,love,ID,time,name,love2" s-column="time"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;time&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;time&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"time")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="7356" endspan -->
        </font>
      </td>
      <td width="133" height="18"><font face="Arial" size="1"><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="user,say,hair,love,ID,time,name,love2" s-column="love2"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;love2&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;love2&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"love2")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="10861" endspan -->
        </font>
      </td>
      <td width="335" height="18"><font face="Arial" size="1"><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="user,say,hair,love,ID,time,name,love2" s-column="say"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;say&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;say&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"say")%><!--webbot
        bot="DatabaseResultColumn" i-CheckSum="4558" endspan --></font>
      </td>
    </tr>
    <tr>
      <td colspan="5" width="758" height="40"><br>
      </td>
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
