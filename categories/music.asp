
<%
 
Const NUMBER_OF_IMAGES = 29
 
Randomize
 
Dim intImageNumber  
  
intImageNumber = Int((NUMBER_OF_IMAGES * Rnd) + 1)

 
%>
 
<!--BEGIN Pop-up Images Script------------------------------------------->
<SCRIPT Language="JavaScript">
<!--


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
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Welcome to Honchie, The Band.</title>
<title>Photos</title>
</head>

<body bgcolor="#FFFFFF">

<table border="0" width="96%" height="1">
  <tr>
    <td width="31%" height="1" valign="middle" align="center">

<p align="left">
<a href="music.asp"><img border="0" src="../images/storefront/honchie_plain.jpg"></a>&nbsp;</p>

    </td>
    <td width="52%" height="1" valign="middle" align="center">

    </td>
    <td width="3%" height="1" valign="middle" align="center">

    </td>
    <td width="45%" height="1" valign="middle" align="center" bgcolor="#FFFFFF">

 <a href="JAVASCRIPT:openPopImg('../random/random_pics/rndimgs/full/<%= intImageNumber %>.jpg','Photo of The Moment', '360', '270')"> <br>
 <img border="0" src="../random/random_pics/rndimgs/<%= intImageNumber %>.jpg" loop="0" > 
 <br>
        
      
     </a>
<br>

    </td>
  </tr>
</table>

<table border="0" width="101%">
  <tr>
    <td width="100%" valign="middle" align="center">
    <font face="Arial" size="2">&nbsp;</font>
    </td>
  </tr>
</table>

<table border="0" width="101%">
  <tr>
    <td width="100%" valign="middle" align="center">
    <font face="Arial" size="2">&nbsp;<a href="http://www.live365.com/stations/283045">Radio</a>&nbsp;&nbsp;&nbsp;
    <a href="../music/mailing_list/mailing_list.asp">Mailing List</a>&nbsp;&nbsp;&nbsp;
    <a href="../music/photos/st_patricks_photos.asp">Photos</a>&nbsp;&nbsp;&nbsp;
    <a href="../music/guestbook/guestbook.asp">Forum</a>&nbsp;&nbsp; <a href="../contact/who.asp">Contact Us</a>&nbsp;&nbsp;&nbsp;
    <a href="../index_shop.asp">Shopping</a>&nbsp;&nbsp;&nbsp; <a href="http://home.flash.net/~honchie/">Honchie
    Old School</a>&nbsp; <a href="../flashchat/flashchat.html">Chat</a></font>
    </td>
  </tr>
</table>

<p><br>
<img border="0" src="../music/music_images/honchie_horseshit.jpg"></p>

<table border="0" width="101%" height="376">

<tr>
    <td width="13%" valign="middle" align="center" height="88">
    <img border="0" src="../music/video/remember/doug_hand.jpg">
    </td>
    <td width="87%" height="88"><font face="Arial" size="2"><b>See the hit new
      video for &quot;I Remember,&quot; written by Douglas Krause.<br>
      </b>High-speed connection? <a href="../music/video/remember/remember_2.3.asf">Click
      here.</a> (Windows Media Player / 2.3 MB)<br>
      Slow dial-up connection? <a href="../music/video/remember/remember_987.asf">Click
      here.</a> (Windows Media Player / 987KB)</font></td>
  </tr>






  <tr>
    <td width="13%" valign="middle" align="center" height="44">
    <img border="0" src="../music/music_images/alert.gif"><br>
    </td>
    <td width="87%" height="44"><font face="Arial" size="2"><b>Alert! Honchie considers name
      change.<br>
      </b><a href="../music/honchie_name_change.mp3">Click here</a> to listen to
      the what could be Honchie's new name.&nbsp;&nbsp;
      </font></td>
  </tr>
  <tr>
    <td width="13%" valign="middle" align="center" height="64">
    <a href="../music/video/totally_movie.asf"><img border="0" src="../music/music_images/awesome.jpg" width="50" height="50"></a>
    </td>
    <td width="87%" height="64"><font face="Arial" size="2"><b>Totally Awesome Video<br>
      </b><a href="../music/video/totally_movie.asf">Click here</a> to watch a video of
      our most empowering song&nbsp;<br>
      (Windows Media Player / 5.2 MB)</font></td>
  </tr>
  <tr>
    <td width="13%" valign="middle" align="center" height="42">
    <a href="../album_name/fan_results.asp">
    <img border="0" src="../album_name/eagle.jpg" width="60" height="40">
    </a>
    </td>
    <td width="87%" height="42"><font face="Arial" size="2"><b><a href="../album_name/fan_results.asp">Click
      here</a> to see what our fans think our album should be named.</b></font></td>
  </tr>
  <tr>
    <td width="13%" valign="middle" align="center" height="42">
    <img border="0" src="../album_name/eagle.jpg" width="60" height="40">
    </td>
    <td width="87%" height="42"><font face="Arial" size="2"><b><a href="../album_name/intro.asp">Be
      a hero</a>. Help name Honchie's debut album.</b></font></td>
  </tr>
  <tr>
    <td width="13%" valign="middle" align="center" height="72">
    <a href="../music/horseshit/horseshit.htm">
    <img border="0" src="../music/music_images/horsey.jpg">
    </a>
    </td>
    <td width="87%" height="72"><font face="Arial" size="2"><b><a href="../music/horseshit/horseshit.htm">Click
      here</a> for more horseshit.</b></font></td>
  </tr>
</table>

<p>&nbsp;
</p>

<p>
<img border="0" src="../music/music_images/dates.jpg">
</p>

<table width="648">
  <tbody>
    <!--webbot bot="DatabaseRegionStart" startspan
    s-columnnames="id,date,club,cover,description"
    s-columntypes="3,135,202,3,203" s-dataconnection="calendar"
    b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice="id" s-menuvalue="id"
    b-tableborder="FALSE" b-tableexpand="FALSE" b-tableheader="FALSE"
    b-listlabels="TRUE" b-listseparator="TRUE" i-ListFormat="0"
    b-makeform="FALSE" s-recordsource="calendar"
    s-displaycolumns="id,date,club,cover,description" s-criteria="" s-order="[date] +"
    s-sql="SELECT * FROM calendar ORDER BY date ASC" b-procedure="FALSE" clientside
    SuggestedExt="asp" s-DefaultFields="" s-NoRecordsFound="We currently have no gigs lined up. Please don't cry. We'll be back shortly."
    i-MaxRecords="256" i-GroupSize="5" BOTID="1"
    u-dblib="../_fpclass/fpdblib.inc" u-dbrgn1="../_fpclass/fpdbrgn1.inc"
    u-dbrgn2="../_fpclass/fpdbrgn2.inc" tag="TBODY"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" b-WasTableFormat="TRUE" b-ReplaceDatabaseRegion="TRUE" --><!--#include file="../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM calendar ORDER BY date ASC"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=5 align=left width=""100%"">We currently have no gigs lined up. Please don't cry. We'll be back shortly.</td></tr>"
fp_sDataConn="calendar"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=5
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice="id"
fp_sMenuValue="id"
fp_iDisplayCols=5
fp_fCustomQuery=False
BOTID=1
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" endspan -->
    <tr>


      <td width="51"><img border="0" src="../music/music_images/date.gif"></td>
      <td width="583"><b><font face="Arial" size="2">
      <!--webbot
        bot="DatabaseResultColumn" startspan
        s-columnnames="id,date,club,cover,description" s-column="date"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;date&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"date")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
        </font></b></td>
    </tr>
    <tr>
      <td width="51"><img border="0" src="../music/music_images/club.gif"></td>
      <td width="583"><font face="Arial" size="2">
      <!--webbot
        bot="DatabaseResultColumn" startspan
        s-columnnames="id,date,club,cover,description" s-column="club"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;club&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"club")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
        </font></td>
    </tr>
    <tr>
      <td width="51"><img border="0" src="../music/music_images/cover.gif"></td>
      <td width="583"><font face="Arial" size="2">$<!--webbot
        bot="DatabaseResultColumn" startspan
        s-columnnames="id,date,club,cover,description" s-column="cover"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;cover&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"cover")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
        </font></td>
    </tr>
    <tr>
      <td width="51"><img border="0" src="../music/music_images/calendar_description.gif"></td> 
      <td width="583"><font face="Arial" size="2">
      <!--webbot
        bot="DatabaseResultColumn" startspan
        s-columnnames="id,date,club,cover,description" s-column="description"
        b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"description")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
        </font></td>
    </tr>
    <tr>
      <td width="634" colspan="2">        
      <br>
      </td>
    </tr>
    <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE"
    b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="5"
    clientside tag="TBODY"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" endspan -->
 </tbody>
</table>

<p>
&nbsp;
</p>

<p><img border="0" src="../music/music_images/honchie_mp3s.jpg">
</p>

<table width="440" height="44">
    <tr>
      <td width="523" height="40">

<form method="POST" action="../music/demo_mp3s.asp">
  <p align="left"><font face="Arial" size="2"><nobr>
  <!--webbot
  bot="DatabaseRegionStart" startspan
  s-columnnames="id,title,location,descriptions,date_recorded"
  s-columntypes="3,202,202,203,202" s-dataconnection="mp3demos"
  b-tableformat="FALSE" b-menuformat="TRUE" s-menuchoice="title"
  s-menuvalue="title" b-tableborder="TRUE" b-tableexpand="TRUE"
  b-tableheader="TRUE" b-listlabels="TRUE" b-listseparator="TRUE"
  i-ListFormat="0" b-makeform="TRUE" s-recordsource
  s-displaycolumns="id,title,location,descriptions,date_recorded" s-criteria
  s-order s-sql="SELECT * FROM music" b-procedure="FALSE" clientside
  SuggestedExt="asp" s-DefaultFields s-NoRecordsFound="We currently don't have any gigs lined up. Please don't cry. We'll be back soon."
  i-MaxRecords="256" i-GroupSize="0" BOTID="0" u-dblib="../_fpclass/fpdblib.inc"
  u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc"
  preview=" &lt;span style=&quot;color: rgb(0,0,0); background-color: rgb(255,255,0)&quot;&gt;Database&lt;/span&gt; "
  b-InForm="TRUE" b-WasTableFormat="FALSE" --><!--#include file="../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM music"
fp_sDefault=""
fp_sNoRecords="We currently don't have any gigs lined up. Please don't cry. We'll be back soon."
fp_sDataConn="mp3demos"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=0
fp_fTableFormat=False
fp_fMenuFormat=True
fp_sMenuChoice="title"
fp_sMenuValue="title"
fp_iDisplayCols=5
fp_fCustomQuery=True
BOTID=0
fp_iRegion=BOTID
%>
<!--webbot bot="DatabaseRegionStart" endspan -->
  <select NAME="title" SIZE="1">
    <!--webbot bot="AspInclude" startspan CLIENTSIDE
    U-INCFILE="../_fpclass/fpdbrgn1.inc" --><!--#include file="../_fpclass/fpdbrgn1.inc"--><!--webbot
    bot="AspInclude" endspan -->
    <option><%=FP_FieldHTML(fp_rs,"title")%></option>
    <!--webbot bot="AspInclude" startspan CLIENTSIDE
    U-INCFILE="../_fpclass/fpdbrgn2.inc" --><!--#include file="../_fpclass/fpdbrgn2.inc"--><!--webbot
    bot="AspInclude" endspan -->
  </select><!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="FALSE"
  b-menuformat="TRUE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="0"
  clientside
  preview=" &lt;span style=&quot;color: rgb(0,0,0); background-color: rgb(255,255,0)&quot;&gt;Results&lt;/span&gt; " --><!--webbot
  bot="DatabaseRegionEnd" endspan -->
  </nobr></font><nobr><input type="submit" value="Demo MP3" name="Get MP3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</nobr></p>
</form>

      </td>
    </tr>
</table>

<table width="492" height="44">
    <tr>
      <td width="575" height="40">

<form method="POST" action="../music/live_mp3s.asp">
  <p align="left"><font face="Arial" size="2"><nobr>
  <!--webbot
  bot="DatabaseRegionStart" startspan
  s-columnnames="club,id,title,location,descriptions,date_recorded"
  s-columntypes="202,3,202,202,203,202" s-dataconnection="livemp3s"
  b-tableformat="FALSE" b-menuformat="TRUE" s-menuchoice="title"
  s-menuvalue="title" b-tableborder="TRUE" b-tableexpand="TRUE"
  b-tableheader="TRUE" b-listlabels="TRUE" b-listseparator="TRUE"
  i-ListFormat="0" b-makeform="TRUE" s-recordsource="music"
  s-displaycolumns="club,id,title,location,descriptions,date_recorded"
  s-criteria s-order s-sql="SELECT * FROM music" b-procedure="FALSE" clientside
  SuggestedExt="asp" s-DefaultFields s-NoRecordsFound="No records returned."
  i-MaxRecords="256" i-GroupSize="0" BOTID="2" u-dblib="../_fpclass/fpdblib.inc"
  u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc"
  preview=" &lt;span style=&quot;color: rgb(0,0,0); background-color: rgb(255,255,0)&quot;&gt;Database&lt;/span&gt; " --><!--#include file="../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM music"
fp_sDefault=""
fp_sNoRecords="No records returned."
fp_sDataConn="livemp3s"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=0
fp_fTableFormat=False
fp_fMenuFormat=True
fp_sMenuChoice="title"
fp_sMenuValue="title"
fp_iDisplayCols=6
fp_fCustomQuery=False
BOTID=2
fp_iRegion=BOTID
%>
<!--webbot bot="DatabaseRegionStart" endspan -->
  <select NAME="title" SIZE="1">
    <!--webbot bot="AspInclude" startspan CLIENTSIDE
    U-INCFILE="../_fpclass/fpdbrgn1.inc" --><!--#include file="../_fpclass/fpdbrgn1.inc"--><!--webbot
    bot="AspInclude" endspan -->
    <option><%=FP_FieldHTML(fp_rs,"title")%></option>
    <!--webbot bot="AspInclude" startspan CLIENTSIDE
    U-INCFILE="../_fpclass/fpdbrgn2.inc" --><!--#include file="../_fpclass/fpdbrgn2.inc"--><!--webbot
    bot="AspInclude" endspan -->
  </select><!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="FALSE"
  b-menuformat="TRUE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="0"
  clientside
  preview=" &lt;span style=&quot;color: rgb(0,0,0); background-color: rgb(255,255,0)&quot;&gt;Results&lt;/span&gt; " --><!--webbot
  bot="DatabaseRegionEnd" endspan -->
  </nobr></font><nobr><input type="submit" value="Live MP3" name="Get MP3"></nobr></p>
</form>

      </td>
    </tr>
</table>

<p><br>
<img border="0" src="../music/music_images/puppy.gif">
<br>  
</p>

      
</body>

</html>