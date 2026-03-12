<html>
<head>

<script LANGUAGE="JavaScript"><!--
// Preload and play audio files with event handler (MouseOver sound)
// designed by JavaScript Archive, (c)1999
// Get more free javascripts at http://jsarchive.8m.com

var aySound = new Array();
// Below: source for sound files to be preloaded
aySound[0] = "../honchie%20working/questions/honchie.wav";

// DO NOT edit below this line
document.write('<BGSOUND ID="auIEContainer">')
IE = (navigator.appVersion.indexOf("MSIE")!=-1 && document.all)? 1:0;
NS = (navigator.appName=="Netscape" && navigator.plugins["LiveAudio"])? 1:0;
ver4 = IE||NS? 1:0;
onload=auPreload;

function auPreload() {
if (!ver4) return;
if (NS) auEmb = new Layer(0,window);
else {
Str = "<DIV ID='auEmb' STYLE='position:absolute;'></DIV>";
document.body.insertAdjacentHTML("BeforeEnd",Str);
}
var Str = '';
for (i=0;i<aySound.length;i++)
Str += "<EMBED SRC='"+aySound[i]+"' AUTOSTART='FALSE' HIDDEN='TRUE'>"
if (IE) auEmb.innerHTML = Str;
else {
auEmb.document.open();
auEmb.document.write(Str);
auEmb.document.close();
}
auCon = IE? document.all.auIEContainer:auEmb;
auCon.control = auCtrl;
}
function auCtrl(whSound,play) {
if (IE) this.src = play? aySound[whSound]:'';
else eval("this.document.embeds[whSound]." + (play? "play()":"stop()"))
}
function playSound(whSound) { if (window.auCon) auCon.control(whSound,true); }
function stopSound(whSound) { if (window.auCon) auCon.control(whSound,false); }
//-->
</script>



<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" fptype="dynamicanimation">
<!--
function dynAnimation() {}
function clickSwapImg() {}
//-->
</script>
<script language="JavaScript1.2" fptype="dynamicanimation" src="../animate.js">
</script>
</head>


<body bgcolor="#FFFFFF" onload="dynAnimation()">

<A HREF="test.asp" onMouseOver="playSound(0)" onMouseOut="stopSound(0)">Move mouse over to play sound</A>


<div id="Layer1" style="position: absolute; left: 1; top: 197; width: 162; height: 187; z-index: 1"><a href='' onmouseover="location.href='../honchie working/questions/honchie.wav';document['fpAnimswapImgFP1'].imgRolln=document['fpAnimswapImgFP1'].src;document['fpAnimswapImgFP1'].src=document['fpAnimswapImgFP1'].lowsrc;" onmouseout="document['fpAnimswapImgFP1'].src=document['fpAnimswapImgFP1'].imgRolln" href="javascript:void(0)"><img border="0" src="../images/questions/honchie.jpg" id="fpAnimswapImgFP1" name="fpAnimswapImgFP1" dynamicanimation="fpAnimswapImgFP1" lowsrc="../images/questions/honchie2.jpg"></a><a name='caption'></a></div>
<div id="Layer2" style="position: absolute; left: 128; top: 194; width: 427; height: 200; z-index: 2"> 
  <p><img src="../images/questions/intro.jpg" width="423" height="181"> 
  </p>
  </div>
<div id="Layer3" style="position: absolute; left: 127; top: 409; width: 427; height: 42; z-index: 3"><img src="../images/questions/what.jpg" width="423" height="42"></div>
<div id="Layer4" style="position: absolute; left: 128; top: 476; width: 428; height: 78; z-index: 4"><img src="../images/questions/work.jpg" width="423" height="78"></div>
<div id="Layer5" style="position: absolute; left: 129; top: 579; width: 427; height: 88; z-index: 5"><img src="../images/questions/impossible.jpg" width="423" height="88"></div>
<div id="Layer6" style="position: absolute; left: 129; top: 697; width: 426; height: 55; z-index: 6"><img src="../images/questions/oldhonchie.jpg" width="423" height="54"></div>
<div id="Layer7" style="position: absolute; left: 130; top: 775; width: 428; height: 70; z-index: 7"><img src="../images/questions/band.jpg" width="423" height="65"></div>
<div id="Layer8" style="position: absolute; left: 129; top: 865; width: 429; height: 66; z-index: 8"><img src="../images/questions/myproduct.jpg" width="423" height="66"></div>
<p><img border="0" src="../images/storefront/honchie.gif" width="450" height="108"></p>
<p><img border="0" src="../images/storefront/menu.gif" width="700" height="15"></p>
&nbsp;
<p><img border="0" dynsrc="../honchie%20working/questions/honchie.avi" start="mouseover"></p>
 
<p><a href="../honchie%20working/questions/honchie.wav">../honchie working/questions/honchie.wav</a></p>
 
</body>
</html>
