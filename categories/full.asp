<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Honchie - Apparel</title>
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="113%">
  <tr>
    <td width="100%">
      <p align="left"><a href="../index2.asp"><img border="0" src="file:///C:/WINDOWS/Personal/My%20Webs/Honchie/images/storefront/honchie.gif" align="left"></a></p>
    </td>
  </tr>
</table>
<table border="0" width="102%">
  <tr>
    <td width="100%">
      <p align="center"><map name="FPMap0">
      <area href="home_office.asp" shape="rect" coords="1, 1, 85, 13">
      <area href="entertainment.asp" shape="rect" coords="96, 1, 171, 13">
      <area href="food_drink.asp" shape="rect" coords="181, 1, 262, 13">
      <area href="health_beauty.asp" shape="rect" coords="275, 1, 370, 13">
      <area href="apparel.asp" shape="rect" coords="384, 1, 428, 13">
      <area href="services.asp" shape="rect" coords="444, 1, 493, 13">
      <area href="greeting.asp" coords="508, 2, 587, 13" shape="rect">
      <area href="music.asp" shape="rect" coords="601, 2, 633, 13"></map><img border="0" src="file:///C:/WINDOWS/Personal/My%20Webs/Honchie/images/storefront/menu.gif" usemap="#FPMap0">&nbsp;&nbsp;</p>
    </td>
  </tr>
</table>
<!--webbot BOT="GeneratedScript" PREVIEW=" " startspan --><script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.name.value == "")
  {
    alert("Please enter a value for the \"name\" field.");
    theForm.name.focus();
    return (false);
  }

  if (theForm.name.value.length < 2)
  {
    alert("Please enter at least 2 characters in the \"name\" field.");
    theForm.name.focus();
    return (false);
  }
  return (true);
}
//--></script><!--webbot BOT="GeneratedScript" endspan --><form BOTID="0" METHOD="POST" ACTION="../s_results.asp" style="text-align: Center" onsubmit="return FrontPage_Form1_Validator(this)" name="FrontPage_Form1">
  <table BORDER="0" width="600">
    <tr>
      <td width="585" valign="middle" align="center">
        <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="2"
        --><input NAME="name" size="20" tabindex="1">&nbsp; <input TYPE="submit" value="Let's Shop!" name="name1" tabindex="0"></p>
      </td>
    </tr>
  </table>
</form>
<!--webbot bot="DatabaseRegionStart" startspan
s-columnnames="id,category,name,thumbnails,price,image,description" s-columntypes="3,202,202,203,6,202,203"
s-dataconnection="inventory" b-tableformat="FALSE" b-menuformat="FALSE"
s-menuchoice="name" s-menuvalue="name" b-tableborder="FALSE" b-tableexpand="TRUE"
b-tableheader="TRUE" b-listlabels="FALSE" b-listseparator="FALSE"
i-ListFormat="0" b-makeform="TRUE" s-recordsource="products"
s-displaycolumns="name,price,thumbnails" s-criteria="" s-order
s-sql="SELECT * FROM products" b-procedure="FALSE" clientside SuggestedExt="asp"
s-DefaultFields s-NoRecordsFound="No records returned." i-MaxRecords="256"
i-GroupSize="10" BOTID="0" u-dblib="../_fpclass/fpdblib.inc"
u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc" tag="BODY"
local_preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server using a web browser. The section of the page from here to the end of the Database Results region will repeat once for each record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"
preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" b-WasTableFormat="FALSE" b-ReplaceDatabaseRegion="FALSE" --><!--#include file="../_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM products"
fp_sDefault=""
fp_sNoRecords="No records returned."
fp_sDataConn="inventory"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=10
fp_fTableFormat=False
fp_fMenuFormat=False
fp_sMenuChoice="name"
fp_sMenuValue="name"
fp_iDisplayCols=3
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" i-CheckSum="52434" endspan -->
<p>&nbsp;&nbsp;</p>
<table border="0" width="56%" height="54">
  <tr>
    <td width="29%" height="50" valign="middle" align="center"><font size="1"><img border="0" src="<%=FP_FieldLink(fp_rs,"thumbnails")%>"></font></td>
    <td width="106%" height="50" valign="middle" align="center">
      <p align="left"><font size="2"><b><a href="../categories_detailed/apparel_detailed.asp?id=<% If Not IsEmpty (fp_rs) Then Response.Write cstr (fp_rs ("id"))%>"><!--webbot bot="DatabaseResultColumn" startspan
s-columnnames="id,category,name,thumbnails,price,image,description" s-column="name" b-tableformat="FALSE"
b-hasHTML="FALSE" clientside
local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"name")%><!--webbot
bot="DatabaseResultColumn" i-CheckSum="5948" endspan --></a></b>&nbsp;&nbsp;&nbsp;&nbsp;<br>
      <br>
      &nbsp;$<!--webbot bot="DatabaseResultColumn" startspan
s-columnnames="id,category,name,thumbnails,price,image,description" s-column="price" b-tableformat="FALSE"
b-hasHTML="FALSE" clientside
local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"price")%><!--webbot
bot="DatabaseResultColumn" i-CheckSum="11688" endspan -->&nbsp;&nbsp; Buy Now!</font></p>
    </td>
  </tr>
</table>
<p align="left"><br>
</p>
<!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="FALSE"
b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="10" clientside
tag="BODY"
local_preview="<table border=0 width=&quot;100%&quot;><tr><td bgcolor=&quot;#FFFF00&quot; align=&quot;center&quot;><font color=&quot;#000000&quot;>End of Database Results region.</font></td></tr><TR><TD ALIGN=LEFT VALIGN=MIDDLE><FORM><NOBR><INPUT TYPE=Button VALUE=&quot;  |<  &quot;><INPUT TYPE=Button VALUE=&quot;   <  &quot;><INPUT TYPE=Button VALUE=&quot;  >   &quot;><INPUT TYPE=Button VALUE=&quot;  >|  &quot;>  [1/10]</NOBR></FORM></td></tr></table>"
preview="<table border=0 width=&quot;100%&quot;><tr><td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;><font color=&quot;#000000&quot;>This is the end of a Database Results region.</font></td></tr><TR><TD ALIGN=LEFT VALIGN=MIDDLE><NOBR><INPUT TYPE=Button VALUE=&quot;  |<  &quot;><INPUT TYPE=Button VALUE=&quot;   <  &quot;><INPUT TYPE=Button VALUE=&quot;  >   &quot;><INPUT TYPE=Button VALUE=&quot;  >|  &quot;>  [1/10]</NOBR><BR></td></tr></table>" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" i-CheckSum="56926" endspan -->

</body>

</html>
