


<!--BEGIN Pop-up Images Script------------------------------------------->
<SCRIPT Language="JavaScript">
<!--
// Copyright 1999 - 2001 by Ray Stott, Pop-up Images Script ver 2.0
// OK to use if this copyright is included
// Script is available at http://www.crays.com/jsc

var pic = null
var popImg = null  // use this when referring to pop-up image
var picTitle = null
var imgCount = 0
var imgWinName = "popImg"

function openPopImg(picName, windowTitle, windowWidth, windowHeight){
  closePopImg()
  picTitle = windowTitle
  imgWinName = "popImg" + imgCount++ //unique name for each pop-up window
  popImg = window.open(picName, imgWinName,
           "toolbar=no,scrollbars=no,resizable=no,width=" 
           + (parseInt(windowWidth)+20)  + ",height=" 
           + (parseInt(windowHeight)+15)) 
  }
function closePopImg(){    // close pop-up window if it is open 
  if (navigator.appName != "Microsoft Internet Explorer" 
      || parseInt(navigator.appVersion) >=4) //do not close if early IE
    if(popImg != null) if(!popImg.closed) popImg.close() 
  }
function setStatus(msg){
  status = msg
  return true
  }
//-->
</SCRIPT>

<SCRIPT Language="JavaScript1.1">  
<!--
// for Netscape 3+ and IE 4+
var priorPic = new Array()
var noPic = 0
var foundit = false

function openPopImg(picName,  windowTitle, windowWidth, windowHeight){
  var i = 0
  if(pic == picName && winOpen()){
    popImg.focus()
    }
  else{
    foundit = false
    for(i=0; i<=noPic; i++){
      if (priorPic[i] == picName)
        foundit = true 
      }
    pic = picName
    closePopImg()
    picTitle = windowTitle
    imgWinName = "popImg" + imgCount++ //unique name for each pop-up window
    if(!foundit){
      priorPic[noPic++] = pic
      }
    popImg = openPopImgWin(imgWinName, windowWidth, windowHeight)
    }
  }
function openPopImgWin(imgWinName, windowWidth, windowHeight){
  var winFeatures = "toolbar=no,scrollbars=no,resizable=no,width=" 
    + windowWidth + ",height=" + windowHeight
  return window.open("pimg.htm", imgWinName, winFeatures)
  }
function winOpen(){
  if(popImg != null){ 
    if(popImg.closed != true) return true; else return false
    }  
  else
    return false
  }
//-->
</SCRIPT>

<SCRIPT Language="JavaScript1.2"> 
<!--
// Use this function to control placement of pop-up window
// in Netscape 4+ and Internet Explorer 4+
function openPopImgWin(imgWinName, windowWidth, windowHeight){
  var leftX = 20  // distance of window's left side from left of screen
  var topY = 20   // distance of window's top side from top of screen
  var winFeatures = "toolbar=no,scrollbars=no,resizable=no,width=" 
    + windowWidth + ",height=" + windowHeight
  if (leftX>0){
    winFeatures += ",screenX=" + leftX + ",left=" + leftX	
                + ",screenY=" + topY + ",top=" + topY
    }
  return window.open("pimg.htm", imgWinName, winFeatures)
  }
//-->
</SCRIPT>
<!--END Pop-up Images Script-------------------------------------------->


 


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Welcome to Honchie, The Band.</title>
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="102%" height="1">
  <tr>
    <td width="125%" height="1" valign="middle" align="center">

<p align="left"><font size="2" face="Arial"><a href="../categories/music.asp"><img border="0" src="../images/honchie_plain.jpg"></a>&nbsp;&nbsp;&nbsp;</font></p>

    </td>
  </tr>
</table>

<table border="0" width="85%" height="1">
  <tr>
    <td width="125%" height="1" valign="middle" align="center" colspan="2">

    </td>
  </tr>
  <tr>
    <td width="125%" height="1" valign="middle" align="left" colspan="2">

    <p align="left"><b><font size="2" face="Arial"><br>
    <br>
    What the hell should we name our first album?</font></b>

    </td>
  </tr>
  <tr>
    <td width="125%" height="1" valign="middle" align="left" colspan="2">

    <p align="left"><br>
    <br>

    </td>
  </tr>
  <tr>
    <td width="33%" height="1" valign="middle" align="center">

    <p align="center"><img border="0" src="eagle.jpg">

    </td>
    <td width="92%" height="1" valign="middle" align="left">

    <font size="2" face="Arial">This might be the most important thing that you
    accomplish in your lifetime. In fact, this might be the sole reason for your
    existence -- to help name Honchie's debut album.<br>
    <br>
    I would think so.&nbsp; </font>

    </td>
  </tr>
  <tr>
    <td width="33%" height="0" valign="middle" align="center">

    <br>
    <br>

    </td>
    <td width="92%" height="0" valign="middle" align="left">

    </td>
  </tr>
  <tr>
    <td width="33%" height="1" valign="middle" align="center">

    <p align="center"><img border="0" src="old_thinker.jpg">

    </td>
    <td width="92%" height="1" valign="middle" align="left">

    <font size="2" face="Arial">We need creative thinkers, jack-ass. Like this
    dead guy on the left. People who use their brains and can come up with
    award-winning debut album ideas. </font>

    </td>
  </tr>
  <tr>
    <td width="33%" height="0" valign="middle" align="center">

    <br>
    <br>

    </td>
    <td width="92%" height="0" valign="middle" align="left">

    </td>
  </tr>
  <tr>
    <td width="33%" height="1" valign="middle" align="center">

    <img border="0" src="seals.jpg">

    </td>
    <td width="92%" height="1" valign="middle" align="left">

    <font size="2" face="Arial">Think of beautiful things. Like poetry. Or baby
    seals in love. Then just let your creative juices flow. And see if that
    perfect name comes to you.</font>

    </td>
  </tr>
  <tr>
    <td width="33%" height="0" valign="middle" align="center">

    <br>
    <br>

    </td>
    <td width="92%" height="0" valign="middle" align="left">

    </td>
  </tr>
  <tr>
    <td width="33%" height="1" valign="middle" align="center">

    <img border="0" src="face.jpg">

    </td>
    <td width="92%" height="1" valign="middle" align="left">

    <font size="2" face="Arial">Do you want to make a baby? I can show you how.
    I have a meat tool. </font>

    </td>
  </tr>
  <tr>
    <td width="33%" height="0" valign="middle" align="center">

    <br>
    <br>

    </td>
    <td width="92%" height="0" valign="middle" align="left">

    </td>
  </tr>
  <tr>
    <td width="33%" height="1" valign="middle" align="center">

    <a href="album_entry.asp"><img border="0" src="jackass.jpg"></a>

    </td>
    <td width="92%" height="1" valign="middle" align="left">

    <font size="2" face="Arial">But that is irrelevant. If you would like to
    submit your name, click on the &quot;Click here you fucking jack-ass&quot;
    icon directly to the left. Look directly to your left. If you see an icon
    that says &quot;Click here you fucking jack-ass,&quot; then click on it.
    That's what you're going to want to click on if you would like to donate
    your name. Do you understand? Or are you just stupid? Please don't be an
    idiot, stupid.</font>

    </td>
  </tr>
</table>

<p>
&nbsp;
</p>

<p>
<font size="2" face="Arial">&nbsp;</font>
</p>

</body>

</html>
