<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Welcome to Honchie - The World's First Virtual Gift Shop</title>
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="99%" height="1">
  <tr>
    <td width="125%" height="1" valign="middle" align="center">

<table border="0" width="98%">
  <tr>
    <td width="100%">
      <p align="center"><font face="Arial"><img border="0" src="images/storefront/honchie.gif" align="left"></font></p>
    </td>
  </tr>
</table>

<table border="0" width="78%">
  <tr>
    <td width="100%">
      <p align="center"><font face="Arial"><map name="FPMap0">
      <area href="categories/home_office.asp" shape="rect" coords="0, 1, 84, 13">
      <area href="categories/entertainment.asp" shape="rect" coords="96, 1, 171, 13">
      <area href="categories/food_drink.asp" shape="rect" coords="181, 1, 262, 13">
      <area href="categories/health_beauty.asp" shape="rect" coords="275, 1, 370, 13">
      <area href="categories/apparel.asp" shape="rect" coords="384, 1, 428, 13">
      <area href="categories/services.asp" shape="rect" coords="444, 1, 493, 13">
      <area href="categories/greeting.asp" coords="508, 2, 587, 13" shape="rect">
      <area href="categories/music.asp" shape="rect" coords="602, 3, 634, 14"></map><img border="0" src="images/storefront/menu.gif" usemap="#FPMap0" align="right"></font></p>
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
//--></script><!--webbot BOT="GeneratedScript" endspan --><form BOTID="0" METHOD="POST" ACTION="s_results.asp" style="text-align: Center" onsubmit="return FrontPage_Form1_Validator(this)" name="FrontPage_Form1">
  <table BORDER="0" width="671">
    <tr>
      <td width="656" valign="middle" align="center">
        <p align="center"><font face="Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--webbot bot="Validation" B-Value-Required="TRUE" I-Minimum-Length="2"
        --><input NAME="name" VALUE="<%=Request("name")%>" size="20" tabindex="1">&nbsp;
        <input TYPE="submit" value="Let's Shop!" name="name1" tabindex="0" style="font-family: Arial"></font></p>
      </td>
    </tr>
  </table>
</form>

<table border="0" width="99%" height="338">
  <tr>
    <td width="116%" height="301" valign="middle" align="center">
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
    </td>
  </tr>
</table>
    </td>
  </tr>
</table>

</body>

</html>
