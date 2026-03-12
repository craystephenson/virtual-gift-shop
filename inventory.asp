<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Inventory</title>
</head>

<body bgcolor="#FFFFFF">

<p><img border="0" src="images/storefront/honchie.gif"><br>
<br>
<br>
</p>
<!--webbot bot="DatabaseRegionStart" startspan
s-columnnames="name,price,image,description" s-columntypes="202,6,202,203"
s-dataconnection="inventory" b-tableformat="FALSE" b-menuformat="FALSE"
s-menuchoice="name" s-menuvalue="name" b-tableborder="FALSE" b-tableexpand="TRUE"
b-tableheader="TRUE" b-listlabels="FALSE" b-listseparator="FALSE"
i-ListFormat="0" b-makeform="TRUE" s-recordsource="products"
s-displaycolumns="name,price,description,image" s-criteria s-order
s-sql="SELECT * FROM products" b-procedure="FALSE" clientside SuggestedExt="asp"
s-DefaultFields s-NoRecordsFound="No records returned." i-MaxRecords="256"
i-GroupSize="5" BOTID="0" u-dblib="_fpclass/fpdblib.inc"
u-dbrgn1="_fpclass/fpdbrgn1.inc" u-dbrgn2="_fpclass/fpdbrgn2.inc" tag="BODY"
local_preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server using a web browser. The section of the page from here to the end of the Database Results region will repeat once for each record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"
preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" b-WasTableFormat="FALSE" b-ReplaceDatabaseRegion="FALSE" --><!--#include file="_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM products"
fp_sDefault=""
fp_sNoRecords="No records returned."
fp_sDataConn="inventory"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=5
fp_fTableFormat=False
fp_fMenuFormat=False
fp_sMenuChoice="name"
fp_sMenuValue="name"
fp_iDisplayCols=4
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" i-CheckSum="10209" endspan -->
<p><img border="0" src="<%=FP_FieldLink(fp_rs,"image")%>"></p>
<p><font size="2"><b><!--webbot bot="DatabaseResultColumn" startspan
s-columnnames="name,price,image,description" s-column="name" b-tableformat="FALSE"
b-hasHTML="FALSE" clientside
local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"name")%><!--webbot
bot="DatabaseResultColumn" i-CheckSum="5948" endspan --></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
$<!--webbot bot="DatabaseResultColumn" startspan
s-columnnames="name,price,image,description" s-column="price" b-tableformat="FALSE"
b-hasHTML="FALSE" clientside
local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"price")%><!--webbot
bot="DatabaseResultColumn" i-CheckSum="11688" endspan -->
<br>
<br>
</font></p>
<table border="0" width="52%">
  <tr>
    <td width="100%"><font size="2"><!--webbot bot="DatabaseResultColumn"
      startspan s-columnnames="name,price,image,description" s-column="description"
      b-tableformat="FALSE" b-hasHTML="FALSE" clientside
      local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
      preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"description")%><!--webbot
      bot="DatabaseResultColumn" i-CheckSum="32140" endspan -->
      </font></td>
  </tr>
</table>
<p>&nbsp;</p>
<hr size="1" align="left" width="60%">
<!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="FALSE"
b-menuformat="FALSE" u-dbrgn2="_fpclass/fpdbrgn2.inc" i-groupsize="5" clientside
tag="BODY"
local_preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;center&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;End of Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE&gt;&lt;FORM&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;/FORM&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"
preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" --><!--#include file="_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" i-CheckSum="62730" endspan -->
<p>&nbsp;</p>

</body>

</html>
