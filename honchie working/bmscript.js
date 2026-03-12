  IE4 = (document.all) ? 1 : 0;
  NS4 = (document.layers) ? 1 : 0;

  strABC_ = "abcdefghijklmnopqrstuvwxwz";

  function InitBrowser () {
    IE4 = (document.all) ? 1 : 0;
    NS4 = (document.layers) ? 1 : 0;
  }

  function GetLayer (str, doc) {
    var strNS = 'ns' + str.substring(2,str.length);
    var strNSLayer = "";
    if (str.length > 0) {
      strNSLayer  = "document.layers['" + str.substring(0,4) + "'].";
      strNSLayer += "document.layers['" + strNS.substring(0,4) + "']";
      for (var i = 1; i <= (str.length-4)/2; i++) {
        strNSLayer += ".document.layers['" + str.substring(0,4+(2*i)) + "']";
        strNSLayer += ".document.layers['" + strNS.substring(0,4+(2*i)) + "']";
      }
      if (doc == 1)
        strNSLayer += ".";
    }
    if (doc == 1)
      strNSLayer += "document";
    return strNSLayer;
  }

  function GetStyleString (str) {
    var strStyle = "";
    if (IE4) {
      strStyle = "document.all['" + str + "'].style";
    }
    else if (NS4) {
      var strStyle = "document.layers['" + str.substring(0,4) + "']";
      for (var i = 1; i <= (str.length-4)/2; i++) {
        strStyle += ".document.layers['" + str.substring(0,4+(2*i)) + "']";
      }
    }
    return strStyle;
  }

  function AbsPosition () {
    var str = arguments[0];
    var strStyle = GetStyleString (str);
    [eval(strStyle)].left = arguments[1];
    [eval(strStyle)].top  = arguments[2];
  }

  function RelPosition () {
    var str = arguments[0];
    var strStyle = GetStyleString (str);
    if (IE4) {
      eval(strStyle).left = parseInt(eval(strStyle).left) + arguments[1];
      eval(strStyle).top  = parseInt(eval(strStyle).top)  + arguments[2];
    }
    else if (NS4) {
      eval(strStyle).left += arguments[1];
      eval(strStyle).top  += arguments[2];
    }
  }

  function GetXPosition () {
    var str = arguments[0];
    var Position = 0;
    var strStyle = GetStyleString (str);
    if (IE4)
      Position = parseInt(eval(strStyle).left);
    else if (NS4)
      Position = eval(strStyle).left;
    return Position;
  }

  function GetYPosition () {
    var str = arguments[0];
    var strStyle = GetStyleString (str);
    var Position = 0;
    if (IE4)
      Position = parseInt(eval(strStyle).top);
    else if (NS4)
      Position = eval(strStyle).top;
    return Position;
  }

  function SetImageURL (strLayer, strImage, strURL) {
    if (IE4) {
      document.all[strImage].src = strURL;
    }
    else if (NS4) {
      var strNSLayer = GetLayer(strLayer, 1);
      eval(strNSLayer).images[strImage].src = strURL;
    }
  }

  function SetLayerBackground (strLayer, strURL) {
    if (NS4) {
      var strNSLayer = GetLayer(strLayer, 0);
      eval(strNSLayer).background.src = strURL;
    }
  }

  index=0;
  duration = 0;
  NumElements=0;
  
  function SkipImage (strLayer, strImage) {
  if(arguments.length)  
   {    
    strL= strLayer;
    strI = strImage;
    NumElements = arguments.length;
    duration=arguments[2];   
    srcArray = new Array(NumElements);
    for(i=0; i<NumElements-1; i++)  srcArray[i] = arguments[i+3];
   }
   if (IE4) {
       document.all[strI].src =srcArray[index];
     }
    else if (NS4) {
      var strNSLayer = GetLayer(strL, 1);
      eval(strNSLayer).images[strI].src =srcArray[index];
    }
    if(++index == NumElements-3)
       index =0;
   window.tm = setTimeout("SkipImage()",duration);
  }
