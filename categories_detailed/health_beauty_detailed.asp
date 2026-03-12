<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Honchie - Health and Beauty</title>
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="113%">
  <tr>
    <td width="100%">
      <p align="left"><a href="../index2.asp"><img border="0" src="../images/storefront/honchie.gif" align="left"></a></p>
      <p align="left">&nbsp;</p>
      <p align="left">&nbsp;</p>
    </td>
  </tr>
</table>
<table border="0" width="102%">
  <tr>
    <td width="100%">
      <p align="center"><map name="FPMap0">
      <area href="../categories/home_office.asp" shape="rect" coords="0, 0, 87, 14">
      <area href="../categories/entertainment.asp" shape="rect" coords="103, 1, 180, 13">
      <area href="../categories/food_drink.asp" shape="rect" coords="198, 1, 285, 13">
      <area href="../categories/health_beauty.asp" shape="rect" coords="295, 2, 390, 14">
      <area href="../categories/apparel.asp" shape="rect" coords="407, 2, 451, 14">
      <area href="../categories/services.asp" shape="rect" coords="465, 2, 514, 14">
      <area href="../categories/music.asp" coords="524, 2, 610, 13" shape="rect">
      <area href="../categories/questions.asp" shape="rect" coords="623, 3, 682, 14">
      <area href="../board/default.asp" shape="rect" coords="696, 3, 732, 14"></map><img border="0" src="../images/storefront/menu.gif" usemap="#FPMap0">&nbsp;&nbsp;&nbsp;</p>
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
<p align="center">&nbsp;</p>
<!--webbot bot="DatabaseRegionStart" startspan
s-columnnames="category,name,thumbnails,price,image,description,id"
s-columntypes="202,202,203,6,202,203,3" s-dataconnection="inventory"
b-tableformat="FALSE" b-menuformat="FALSE" s-menuchoice="name" s-menuvalue="name"
b-tableborder="FALSE" b-tableexpand="FALSE" b-tableheader="FALSE"
b-listlabels="FALSE" b-listseparator="FALSE" i-ListFormat="0" b-makeform="FALSE"
s-recordsource="products" s-displaycolumns="name,price,image,description,id"
s-criteria="{id} EQ {id} +" s-order
s-sql="SELECT * FROM products WHERE (id =  ::id::)" b-procedure="FALSE"
clientside SuggestedExt="asp" s-DefaultFields="id="
s-NoRecordsFound="No records returned." i-MaxRecords="256" i-GroupSize="0"
BOTID="0" u-dblib="../_fpclass/fpdblib.inc" u-dbrgn1="../_fpclass/fpdbrgn1.inc"
u-dbrgn2="../_fpclass/fpdbrgn2.inc" tag="BODY"
local_preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server using a web browser. The section of the page from here to the end of the Database Results region will repeat once for each record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"
preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" b-WasTableFormat="FALSE" b-ReplaceDatabaseRegion="FALSE" --><!--#include file="../_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM products WHERE (id =  ::id::)"
fp_sDefault="id="
fp_sNoRecords="No records returned."
fp_sDataConn="inventory"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=0
fp_fTableFormat=False
fp_fMenuFormat=False
fp_sMenuChoice="name"
fp_sMenuValue="name"
fp_iDisplayCols=5
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" i-CheckSum="50247" endspan -->
<table border="0" width="81%" height="40">
  <tr>
    <td width="8%" height="36" valign="middle" align="center"><font size="1"><img border="0" src="<%=FP_FieldLink(fp_rs,"image")%>"></font></td>
    <td width="4%" height="36" valign="middle" align="center"></td>
    <td width="31%" height="36" valign="middle" align="center">
      <p align="left"><font size="2"><b><!--webbot bot="DatabaseResultColumn"
      startspan s-columnnames="category,name,thumbnails,price,image,description,id"
      s-column="name" b-tableformat="FALSE" b-hasHTML="FALSE" clientside
      local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
      preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"name")%><!--webbot
      bot="DatabaseResultColumn" i-CheckSum="5948" endspan --> &nbsp;&nbsp;&nbsp;&nbsp;
      </b>$<!--webbot
      bot="DatabaseResultColumn" startspan
      s-columnnames="category,name,thumbnails,price,image,description,id"
      s-column="price" b-tableformat="FALSE" b-hasHTML="FALSE" clientside
      local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
      preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;price&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"price")%><!--webbot
      bot="DatabaseResultColumn" i-CheckSum="11688" endspan -->
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="../orders/orders.asp?id=<% If Not IsEmpty (fp_rs) Then Response.Write cstr (fp_rs ("id"))%>">
      Buy Now!</a><br>
      <br>
      <!--webbot bot="DatabaseResultColumn" startspan
      s-columnnames="category,name,thumbnails,price,image,description,id"
      s-column="description" b-tableformat="FALSE" b-hasHTML="FALSE" clientside
      local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
      preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"description")%><!--webbot
      bot="DatabaseResultColumn" i-CheckSum="32140" endspan -->
      <br>
      </font></td>
  </tr>
</table>
<!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="FALSE"
b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="0" clientside
tag="BODY"
local_preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;center&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;End of Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"
preview="&lt;table border=0 width=&quot;100%&quot;&gt;&lt;tr&gt;&lt;td bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" i-CheckSum="56926" endspan -->
<table border="0" width="13%" height="54">
</table>

</body>

</html>
