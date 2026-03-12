<SCRIPT LANGUAGE="JavaScript" RUNAT="Server">
//=======================================================================
//
// "ASP Forums" - a web-based discussion forum implementation.
// Copyright (C) 1999, 2000  ASP Forums, http://www.aspforums.com/
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//=======================================================================

//=======================================================================
// ASP Forums version 2.0
//=======================================================================

// ======================================================================
//
// HTML OBJECT
//
// ======================================================================

function ASPFHTML
(
 strTagString
)
{
  this.setTagSource (strTagString);

  return this;
}

// ======================================================================
//
// Interface to private member variables.
//
// ======================================================================

function getTagSource_html_disc
(
)
{
  return String (this._tagSource);
}

function setTagSource_html_disc
(
 strNewTagSource
)
{
  this._tagSource = String (strNewTagSource);

  return;
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function A_open_html_disc
(
 strLinkURL_mand,
 strLinkTitle,
 strLinkName,
 strLinkTarget,
 strLinkID,
 strOnClick
)
{
  var strHTMLout = "";

  strHTMLout += "<A HREF=\"";
  strHTMLout += strLinkURL_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strLinkTitle))
    {
      strHTMLout += " TITLE=\"";
      strHTMLout += strLinkTitle;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strLinkName))
    {
      strHTMLout += " NAME=\"";
      strHTMLout += strLinkName;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strLinkTarget))
    {
      strHTMLout += " TARGET=\"";
      strHTMLout += strLinkTarget;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strLinkID))
    {
      strHTMLout += " ID=\"";
      strHTMLout += strLinkID;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnClick))
    {
      strHTMLout += " onclick=\"";
      strHTMLout += strOnClick;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function A_close_html_disc
(
)
{
  return "</A>";
}

function BASE_html_disc
(
 strHREF_mand
)
{
  return "<BASE HREF=\"" + strHREF_mand + "\">";
}

function BLOCKQUOTE_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<BLOCKQUOTE";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function BLOCKQUOTE_close_html_disc
(
)
{
  return "</BLOCKQUOTE>";
}

function BODY_open_html_disc
(
 strBackgroundColour,
 strBackgroundImage,
 strNormalLinkColour,
 strActiveLinkColour,
 strVisitedLinkColour,
 nTopMargin,
 nLeftMargin,
 nMarginHeight,
 nMarginWidth
)
{
  var strHTMLout = "";
  strHTMLout += "<BODY";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strBackgroundColour))
    {
      strHTMLout += " BGCOLOR=\"";
      strHTMLout += strBackgroundColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strBackgroundImage))
    {
      strHTMLout += " BACKGROUND=\"";
      strHTMLout += strBackgroundImage;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strNormalLinkColour))
    {
      strHTMLout += " LINK=\"";
      strHTMLout += strNormalLinkColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strActiveLinkColour))
    {
      strHTMLout += " ALINK=\"";
      strHTMLout += strActiveLinkColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strVisitedLinkColour))
    {
      strHTMLout += " VLINK=\"";
      strHTMLout += strVisitedLinkColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nTopMargin))
    {
      strHTMLout += " TOPMARGIN=\"";
      strHTMLout += nTopMargin;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nLeftMargin))
    {
      strHTMLout += " LEFTMARGIN=\"";
      strHTMLout += nLeftMargin;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nMarginHeight))
    {
      strHTMLout += " MARGINHEIGHT=\"";
      strHTMLout += nMarginHeight;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nMarginWidth))
    {
      strHTMLout += " MARGINWIDTH=\"";
      strHTMLout += nMarginWidth;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function BODY_close_html_disc
(
)
{
  return "</BODY>";
}

function BR_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<BR";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += " />";

  return strHTMLout;
}

function DIV_open_html_disc
(
 strID,
 strStyle,
 strAlignment
)
{
  var strHTMLout = "";
  strHTMLout += "<DIV";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strID))
    {
      strHTMLout += " ID=\"";
      strHTMLout += strID;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"";
      strHTMLout += strStyle;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strAlignment))
    {
      strHTMLout += " ALIGN=\"";
      strHTMLout += strAlignment;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function DIV_close_html_disc
(
)
{
  return "</DIV>";
}

function DOUBLE_QUOTES_html_disc
(
)
{
  return "&quot;";
}

function DTD_html_disc
(
)
{
  return "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">\n";
}

function FONT_open_html_disc
(
 strSize,
 strFace,
 strColour,
 strStyle
)
{
  var strHTMLout = "";
  strHTMLout += "<FONT";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strSize))
    {
      strHTMLout += " SIZE=\"";
      strHTMLout += strSize;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strFace))
    {
      strHTMLout += " FACE=\"";
      strHTMLout += strFace;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strColour))
    {
      strHTMLout += " COLOR=\"";
      strHTMLout += strColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"";
      strHTMLout += strStyle;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function FONT_close_html_disc
(
)
{
  return "</FONT>";
}

function FORM_open_html_disc
(
 strActionURL_mand,
 strMethod,
 strName,
 strTarget
)
{
  var strHTMLout = "";
  strHTMLout += "<FORM ACTION=\"";
  strHTMLout += strActionURL_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strMethod))
    {
      strHTMLout += " METHOD=\"";
      strHTMLout += strMethod;
      strHTMLout += "\"";
    }
  else
    {
      strHTMLout += " METHOD=\"post\"";
    }

  if (isDefined_disc (strName))
    {
      strHTMLout += " NAME=\"";
      strHTMLout += strName;
      strHTMLout += "\"";
    }
  else
    {
      strHTMLout += " NAME=\"ASPF\"";
    }

  if (isDefined_disc (strTarget))
    {
      strHTMLout += " TARGET=\"";
      strHTMLout += strTarget;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function FORM_close_html_disc
(
)
{
  return "</FORM>";
}

function HR_html_disc
(
 strWidth
)
{
  var strHTMLout = "";

  strHTMLout += "<HR ";

  if (isDefined_disc (strWidth))
    {
      strHTMLout += strWidth;
    }
  else
    {
      strHTMLout += "80%";
    }
  strHTMLout += ">";

  return strHTMLout;
}

function HTML_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<HTML";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function HTML_close_html_disc
(
)
{
  return "</HTML>";
}

function IFRAME_open_html_disc
(
 strName_mand,
 strSrc_mand,
 strID,
 nWidth,
 nHeight
)
{
  var strHTMLout = "";
  strHTMLout += "<IFRAME NAME=\"";
  strHTMLout += strName_mand;
  strHTMLout += "\" SRC=\"";
  strHTMLout += strSrc_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strID))
    {
      strHTMLout += " ID=\"";
      strHTMLout += strID;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nWidth))
    {
      strHTMLout += " WIDTH=\"";
      strHTMLout += nWidth;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nHeight))
    {
      strHTMLout += " HEIGHT=\"";
      strHTMLout += nHeight;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function IFRAME_close_html_disc
(
)
{
  return "</IFRAME>";
}

function IMG_html_disc
(
 strSourceURL_mand,
 strAltText,
 nBorder,
 nWidth,
 nHeight,
 strID,
 strName,
 strOnClick,
 strOnMouseOver,
 strOnMouseOut,
 strOnMouseDown,
 strOnMouseUp,
 strAlign,
 nHspace,
 nVspace
)
{
  var strHTMLout = "";
  strHTMLout += "<IMG SRC=\"";
  strHTMLout += strSourceURL_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strAltText))
    {
      strHTMLout += " ALT=\"";
      strHTMLout += strAltText;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nBorder))
    {
      strHTMLout += " BORDER=\"";
      strHTMLout += nBorder;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nWidth))
    {
      strHTMLout += " WIDTH=\"";
      strHTMLout += nWidth;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nHeight))
    {
      strHTMLout += " HEIGHT=\"";
      strHTMLout += nHeight;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strID))
    {
      strHTMLout += " ID=\"";
      strHTMLout += strID;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strName))
    {
      strHTMLout += " NAME=\"";
      strHTMLout += strName;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnClick))
    {
      strHTMLout += " onclick=\"";
      strHTMLout += strOnClick;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnMouseOver))
    {
      strHTMLout += " onmouseover=\"";
      strHTMLout += strOnMouseOver;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnMouseOut))
    {
      strHTMLout += " onmouseout=\"";
      strHTMLout += strOnMouseOut;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnMouseDown))
    {
      strHTMLout += " onmousedown=\"";
      strHTMLout += strOnMouseDown;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnMouseUp))
    {
      strHTMLout += " onmouseup=\"";
      strHTMLout += strOnMouseUp;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strAlign))
    {
      strHTMLout += " ALIGN=\"";
      strHTMLout += strAlign;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nHspace))
    {
      strHTMLout += " HSPACE=\"";
      strHTMLout += nHspace;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nVspace))
    {
      strHTMLout += " VSPACE=\"";
      strHTMLout += nVspace;
      strHTMLout += "\"";
    }

  strHTMLout += " />";

  return strHTMLout;
}

function INPUT_checkbox_html_disc
(
 strFieldName_mand,
 strFieldValue_mand,
 strCheckedOrNot
)
{
  var strHTMLout = "";
  strHTMLout += "<INPUT NAME=\"";
  strHTMLout += strFieldName_mand;
  strHTMLout += "\" VALUE=\"";
  strHTMLout += strFieldValue_mand;
  strHTMLout += "\" TYPE=\"checkbox\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strCheckedOrNot))
    {
      strHTMLout += strCheckedOrNot;
    }

  strHTMLout += " />";

  return strHTMLout;
}

function INPUT_hidden_html_disc
(
 strFieldName_mand,
 strFieldValue_mand
)
{
  var strHTMLout = "";
  strHTMLout += "<INPUT NAME=\"";
  strHTMLout += strFieldName_mand;
  strHTMLout += "\" VALUE=\"";
  strHTMLout += strFieldValue_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += "\" TYPE=\"hidden\" />";

  return strHTMLout;
}

function INPUT_password_html_disc
(
 strFieldName_mand,
 strFieldValue_mand,
 strFieldSize,
 strFieldMaxLength
)
{
  var strHTMLout = "";
  strHTMLout += "<INPUT NAME=\"";
  strHTMLout += strFieldName_mand;
  strHTMLout += "\" VALUE=\"";
  strHTMLout += strFieldValue_mand;
  strHTMLout += "\" TYPE=\"password\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isUndefined_disc (strFieldSize))
    {
      strFieldSize = config.ADMINSETTING_TextAreaRows;
    }

  strHTMLout += " SIZE=\"";
  strHTMLout += strFieldSize;
  strHTMLout += "\"";

  if (isUndefined_disc (strFieldMaxLength))
    {
      strFieldMaxLength = config.ADMINSETTING_InputboxMaxLength;
    }
  strHTMLout += " MAXLENGTH=\"";
  strHTMLout += strFieldMaxLength;
  strHTMLout += "\">";

  return strHTMLout;
}

function INPUT_submit_html_disc
(
 strFieldName,
 strFieldValue_mand
)
{
  var strHTMLout = "";

  if (ASPFTextControl.isUsed ())
    {
      strHTMLout += "<INPUT VALUE=\"";
      strHTMLout += strFieldValue_mand;
      strHTMLout += "\" TYPE=\"button\" onclick=\"submitRecord (); return false;\"";

      if (isDefined_disc (strFieldName))
	{
	  strHTMLout += " NAME=\"";
	  strHTMLout += strFieldName;
	  strHTMLout += "\"";
	}

      if (isDefined_disc (config.ADMINSETTING_CSSClass))
	{
	  strHTMLout += " CLASS=\"";
	  strHTMLout += config.ADMINSETTING_CSSClass;
	  strHTMLout += "\"";
	}

      strHTMLout += " />";
    }
  else
    {
      strHTMLout += "<INPUT VALUE=\"";
      strHTMLout += strFieldValue_mand;
      strHTMLout += "\" TYPE=\"submit\"";

      if (isDefined_disc (config.ADMINSETTING_CSSClass))
	{
	  strHTMLout += " CLASS=\"";
	  strHTMLout += config.ADMINSETTING_CSSClass;
	  strHTMLout += "\"";
	}

      if (isDefined_disc (strFieldName))
	{
	  strHTMLout += " NAME=\"";
	  strHTMLout += strFieldName;
	  strHTMLout += "\"";
	}
      strHTMLout += " />";
    }

  return strHTMLout;
}

function INPUT_text_html_disc
(
 strFieldName_mand,
 strFieldValue_mand,
 strFieldSize,
 strFieldMaxLength
)
{
  var strHTMLout = "";
  strHTMLout += "<INPUT NAME=\"";
  strHTMLout += strFieldName_mand;
  strHTMLout += "\" VALUE=\"";
  strHTMLout += strFieldValue_mand;
  strHTMLout += "\" TYPE=\"text\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isUndefined_disc (strFieldSize))
    {
      strFieldSize = config.ADMINSETTING_TextAreaRows;
    }
  strHTMLout += " SIZE=\"";
  strHTMLout += strFieldSize;
  strHTMLout += "\"";

  if (isUndefined_disc (strFieldMaxLength))
    {
      strFieldMaxLength = config.ADMINSETTING_InputboxMaxLength;
    }
  strHTMLout += " MAXLENGTH=\"";
  strHTMLout += strFieldMaxLength;
  strHTMLout += "\">";

  return strHTMLout;
}

function LI_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<LI";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += " />";

  return strHTMLout;
}

function JS_open_html_disc
(
)
{
  return "\n<SCR" + "IPT LANGUAGE=\"JavaScript\">\n<" + "!--\n";
}

function JS_close_html_disc
(
)
{
  return "\n/" + "/ -->\n</SCR" + "IPT>\n";
}

function MAILTO_html_disc
(
 strEmailAddress,
 strName_mand,
 strEmailLinkText
)
{
  var strHTMLout = "";
  if (config.ADMINSWITCH_ShowEmailAddresses)
    {
      var strLinkURL = "mailto:" + strEmailAddress;
      var strLinkText = "";
      strLinkText += config.USERTEXT_SHOW_PopupEmailPrefix;
      strLinkText += strName_mand;
      strLinkText += " (";
      strLinkText += strEmailAddress;
      strLinkText += ")";

      strHTMLout += ASPFHTML.A_open (strLinkURL, strLinkText);
      strHTMLout += strEmailLinkText;
      strHTMLout += ASPFHTML.A_close ();
    }
  else
    {
      strHTMLout += strName_mand;
    }

  return strHTMLout;
}

function NBSP_html_disc
(
 nNumRequired
)
{
  var strHTMLout = "&nbsp;";

  if (isDefined_disc (nNumRequired))
    {
      for (var nCounter = 1; nCounter < nNumRequired; nCounter++)
	{
	  strHTMLout += "&nbsp;";
	}
    }

  return strHTMLout;
}

function OL_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<OL";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += " />";

  return strHTMLout;
}

function OL_close_html_disc
(
)
{
  return "</OL>";
}

function OPTION_html_disc
(
 strValue_mand,
 bSelected
)
{
  var strSelected = "";
  if (isDefined_disc (bSelected) && bSelected)
    {
      strSelected = " SELECTED";
    }

  var strHTMLout = "";
  strHTMLout += "<OPTION VALUE=\"";
  strHTMLout += strValue_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += strSelected;
  strHTMLout += " />";

  return strHTMLout;
}

function P_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<P";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function P_close_html_disc
(
)
{
  return "</P>";
}

function QUOTE_open_html_disc
(
)
{
  return "&#145;";
}

function QUOTE_close_html_disc
(
)
{
  return "&#146;";
}

function SCRIPT_open_html_disc
(
 strSource,
 strID,
 strLanguage
)
{
  var strHTMLout = "";

  strHTMLout += "<" + "SCRIPT";

  if (isDefined_disc (strSource))
    {
      strHTMLout += " SRC=\"";
      strHTMLout += strSource;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strID))
    {
      strHTMLout += " ID=\"";
      strHTMLout += strID;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strLanguage))
    {
      strHTMLout += " LANGUAGE=\"";
      strHTMLout += strLanguage;
      strHTMLout += "\"";
    }
  else
    {
      strHTMLout += " LANGUAGE=\"Javascript\"";
    }

  return strHTMLout;
}

function SCRIPT_close_html_disc
(
)
{
  return "</" + "SCRIPT";
}

function SELECT_open_html_disc
(
 strName_mand,
 strOnChange
)
{
  var strHTMLout = "";
  strHTMLout += "<SELECT NAME=\"";
  strHTMLout += strName_mand;
  strHTMLout += "\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strOnChange))
    {
      strHTMLout += " onchange=\"";
      strHTMLout += strOnChange;
      strHTMLout += "\"";
    }
  strHTMLout += ">";

  return strHTMLout;
}

function SELECT_close_html_disc
(
)
{
  return "</SELECT>";
}

function SPAN_open_html_disc
(
 strClass_mand
)
{
  var strHTMLout = "";
  strHTMLout += "<SPAN CLASS=\"";
  strHTMLout += strClass_mand;
  strHTMLout += "\">";

  return strHTMLout;
}

function SPAN_close_html_disc
(
)
{
  return "</SPAN>";
}

function STRONG_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<STRONG";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function STRONG_close_html_disc
(
)
{
  return "</STRONG>";
}

function STYLE_open_html_disc
(
 strType
)
{
  if (isUndefined_disc (strType))
    {
      strType = "text/css";
    }

  return "<STYLE TYPE=\"" + strType + "\">";
}

function STYLE_close_html_disc
(
)
{
  return "</STYLE>";
}

function TABLE_open_html_disc
(
 nBorder,
 nWidth,
 strBackgroundColour,
 strStyle,
 nCellpadding,
 nCellspacing,
 strBackgroundImage
)
{
  var strHTMLout = "";
  strHTMLout += "<TABLE";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nBorder))
    {
      strHTMLout += " BORDER=\"";
      strHTMLout += nBorder;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nWidth))
    {
      strHTMLout += " WIDTH=\"";
      strHTMLout += nWidth;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strBackgroundColour))
    {
      strHTMLout += " BGCOLOR=\"";
      strHTMLout += strBackgroundColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"";
      strHTMLout += strStyle;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nCellpadding))
    {
      strHTMLout += " CELLPADDING=\"";
      strHTMLout += nCellpadding;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nCellspacing))
    {
      strHTMLout += " CELLSPACING=\"";
      strHTMLout += nCellspacing;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strBackgroundImage))
    {
      strHTMLout += " BACKGROUND=\"";
      strHTMLout += strBackgroundImage;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function TABLE_close_html_disc
(
)
{
  return "</TABLE>";
}

function TD_open_html_disc
(
 nWidth,
 strStyle,
 strBackgroundColour,
 strAlignment,
 strVAlignment,
 nColspan,
 bNowrap,
 strBackgroundImage
)
{
  var strHTMLout = "";
  strHTMLout += "<TD";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nWidth))
    {
      strHTMLout += " WIDTH=\"";
      strHTMLout += nWidth;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"";
      strHTMLout += strStyle;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strBackgroundColour))
    {
      strHTMLout += " BGCOLOR=\"";
      strHTMLout += strBackgroundColour;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strAlignment))
    {
      strHTMLout += " ALIGN=\"";
      strHTMLout += strAlignment;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strVAlignment))
    {
      strHTMLout += " VALIGN=\"";
      strHTMLout += strVAlignment;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nColspan))
    {
      strHTMLout += " COLSPAN=\"";
      strHTMLout += nColspan;
      strHTMLout += "\"";
    }

  if (isDefined_disc (bNowrap))
    {
      if (bNowrap)
	{
	  strHTMLout += " NOWRAP";
	}
    }

  if (isDefined_disc (strBackgroundImage))
    {
      strHTMLout += " BACKGROUND=\"";
      strHTMLout += strBackgroundImage;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function TD_close_html_disc
(
)
{
  return "</TD>";
}

function TEXTAREA_open_html_disc
(
 strFieldName_mand,
 nColumns,
 nRows
)
{
  var strHTMLout = "";
  strHTMLout += "<TEXTAREA NAME=\"";
  strHTMLout += strFieldName_mand;
  strHTMLout += "\" WRAP=\"PHYSICAL\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nColumns))
    {
      strHTMLout += " COLS=\"";
      strHTMLout += nColumns;
      strHTMLout += "\"";
    }

  if (isDefined_disc (nRows))
    {
      strHTMLout += " ROWS=\"";
      strHTMLout += nRows;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function TEXTAREA_close_html_disc
(
)
{
  return "</TEXTAREA>";
}

function TH_open_html_disc
(
 strStyle,
 strAlignment,
 strVAlignment,
 bNowrap
)
{
  var strHTMLout = "";
  strHTMLout += "<TH";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"";
      strHTMLout += strStyle;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strAlignment))
    {
      strHTMLout += " ALIGN=\"";
      strHTMLout += strAlignment;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strVAlignment))
    {
      strHTMLout += " VALIGN=\"";
      strHTMLout += strVAlignment;
      strHTMLout += "\"";
    }

  if (isDefined_disc (bNowrap))
    {
      if (bNowrap)
	{
	  strHTMLout += " NOWRAP";
	}
    }

  strHTMLout += ">";

  return strHTMLout;
}

function TH_close_html_disc
(
)
{
  return "</TH>";
}

function TR_open_html_disc
(
 strStyle
)
{
  var strHTMLout = "";
  strHTMLout += "<TR";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  if (isDefined_disc (strStyle))
    {
      strHTMLout += " STYLE=\"" + strStyle + "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function TR_close_html_disc
(
)
{
  return "</TR>";
}

function UL_open_html_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += "<UL TYPE=\"square\"";

  if (isDefined_disc (config.ADMINSETTING_CSSClass))
    {
      strHTMLout += " CLASS=\"";
      strHTMLout += config.ADMINSETTING_CSSClass;
      strHTMLout += "\"";
    }

  strHTMLout += ">";

  return strHTMLout;
}

function UL_close_html_disc
(
)
{
  return "</UL>";
}

function sanitise_html_disc
(
)
{
  var strSanitisedTag = "";

  if (this.isImage ())
    {
      strSanitisedTag = this.sanitiseImage ();
    }
  else if (this.isLinkOpen ())
    {
      strSanitisedTag = this.sanitiseLink ();
    }
  else
    {
      strSanitisedTag = this.getTagSource ();
    }

  return strSanitisedTag;
}

function isImage_html_disc
(
)
{
  var bIsImageTag = false;
  if (this.getTagSource ().search ("^<\\s*IMG\\s") > -1)
    {
      bIsImageTag = true;
    }

  return bIsImageTag;
}

function isLinkOpen_html_disc
(
)
{
  var bIsLinkTag = false;
  if (this.getTagSource ().search ("^<\\s*A\\s") > -1)
    {
      bIsLinkTag = true;
    }

  return bIsLinkTag;
}

function isLinkClose_html_disc ()
{
  var bIsLinkTag = false;
  if (this.getTagSource ().search ("^<\\s*\\/\\s*A\\s") > -1)
    {
      bIsLinkTag = true;
    }

  return bIsLinkTag;
}

// ======================================================================
//
// Private member methods.
//
// ======================================================================

function sanitiseImage_html_disc
(
)
{
  var strTag = this.getTagSource ();

  var strSrc = strTag.getAttribute ("src");
  var strAlt = strTag.getAttribute ("alt");
  if ((isDefined_disc (strAlt)) && (strAlt != config.USERTEXT_STRING_WarningUnverifiedImage))
    {
      strAlt = config.USERTEXT_STRING_WarningUnverifiedImage + this.QUOTE_open () + strAlt + this.QUOTE_close ();
    }
  else
    {
      strAlt = config.USERTEXT_STRING_WarningUnverifiedImage;
    }

  var nBorder = strTag.getAttribute ("border");
  var strAlign = strTag.getAttribute ("align");
  var nHspace = strTag.getAttribute ("hspace");
  var nVspace = strTag.getAttribute ("vspace");

  return this.IMG (strSrc,
		   strAlt,
		   nBorder,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   undefined_disc,
		   strAlign,
		   nHspace,
		   nVspace);
}

function sanitiseLink_html_disc
(
)
{
  var strTag = this.getTagSource ();
  var strHref = strTag.getAttribute ("href");
  var strTitle = strTag.getAttribute ("title");
  if ((isDefined_disc (strTitle)) && (strTitle != config.USERTEXT_STRING_WarningUnverifiedLink))
    {
      strTitle = config.USERTEXT_STRING_WarningUnverifiedLink + this.QUOTE_open () + strTitle + this.QUOTE_close ();
    }
  else
    {
      strTitle = config.USERTEXT_STRING_WarningUnverifiedLink;
    }
  var strName = strTag.getAttribute ("name");
  var strID = strTag.getAttribute ("id");

  return this.A_open (strHref, strTitle, strName, undefined_disc, strID);
}

ASPFHTML.A_open = A_open_html_disc;
ASPFHTML.A_close = A_close_html_disc;
ASPFHTML.BASE = BASE_html_disc;
ASPFHTML.BLOCKQUOTE_open = BLOCKQUOTE_open_html_disc;
ASPFHTML.BLOCKQUOTE_close = BLOCKQUOTE_close_html_disc;
ASPFHTML.BODY_open = BODY_open_html_disc;
ASPFHTML.BODY_close = BODY_close_html_disc;
ASPFHTML.BR = BR_html_disc;
ASPFHTML.DIV_open = DIV_open_html_disc;
ASPFHTML.DIV_close = DIV_close_html_disc;
ASPFHTML.DOUBLE_QUOTES = DOUBLE_QUOTES_html_disc;
ASPFHTML.DTD = DTD_html_disc;
ASPFHTML.FONT_open = FONT_open_html_disc;
ASPFHTML.FONT_close = FONT_close_html_disc;
ASPFHTML.FORM_open = FORM_open_html_disc;
ASPFHTML.FORM_close = FORM_close_html_disc;
ASPFHTML.HR = HR_html_disc;
ASPFHTML.HTML_open = HTML_open_html_disc;
ASPFHTML.HTML_close = HTML_close_html_disc;
ASPFHTML.IFRAME_open = IFRAME_open_html_disc;
ASPFHTML.IFRAME_close = IFRAME_close_html_disc;
ASPFHTML.IMG = IMG_html_disc;
ASPFHTML.INPUT_checkbox = INPUT_checkbox_html_disc;
ASPFHTML.INPUT_hidden = INPUT_hidden_html_disc;
ASPFHTML.INPUT_password = INPUT_password_html_disc;
ASPFHTML.INPUT_submit = INPUT_submit_html_disc;
ASPFHTML.INPUT_text = INPUT_text_html_disc;
ASPFHTML.JS_open = JS_open_html_disc;
ASPFHTML.JS_close = JS_close_html_disc;
ASPFHTML.LI = LI_html_disc;
ASPFHTML.MAILTO = MAILTO_html_disc;
ASPFHTML.NBSP = NBSP_html_disc;
ASPFHTML.NBSP_multi = NBSP_html_disc;
ASPFHTML.OL_open = OL_open_html_disc;
ASPFHTML.OL_close = OL_close_html_disc;
ASPFHTML.OPTION = OPTION_html_disc;
ASPFHTML.P_open = P_open_html_disc;
ASPFHTML.P_close = P_close_html_disc;
ASPFHTML.QUOTE_open = QUOTE_open_html_disc;
ASPFHTML.QUOTE_close = QUOTE_close_html_disc;
ASPFHTML.SCRIPT_open = SCRIPT_open_html_disc;
ASPFHTML.SCRIPT_close = SCRIPT_close_html_disc;
ASPFHTML.SELECT_open = SELECT_open_html_disc;
ASPFHTML.SELECT_close = SELECT_close_html_disc;
ASPFHTML.SPAN_open = SPAN_open_html_disc;
ASPFHTML.SPAN_close = SPAN_close_html_disc;
ASPFHTML.STRONG_open = STRONG_open_html_disc;
ASPFHTML.STYLE_open = STYLE_open_html_disc;
ASPFHTML.STYLE_close = STYLE_close_html_disc;
ASPFHTML.STRONG_close = STRONG_close_html_disc;
ASPFHTML.TABLE_open = TABLE_open_html_disc;
ASPFHTML.TABLE_close = TABLE_close_html_disc;
ASPFHTML.TD_open = TD_open_html_disc;
ASPFHTML.TD_close = TD_close_html_disc;
ASPFHTML.TEXTAREA_open = TEXTAREA_open_html_disc;
ASPFHTML.TEXTAREA_close = TEXTAREA_close_html_disc;
ASPFHTML.TH_open = TH_open_html_disc;
ASPFHTML.TH_close = TH_close_html_disc;
ASPFHTML.TR_open = TR_open_html_disc;
ASPFHTML.TR_close = TR_close_html_disc;
ASPFHTML.UL_open = UL_open_html_disc;
ASPFHTML.UL_close = UL_close_html_disc;


ASPFHTML.prototype.getTagSource = getTagSource_html_disc;
ASPFHTML.prototype.setTagSource = setTagSource_html_disc;

ASPFHTML.prototype.A_open = A_open_html_disc;
ASPFHTML.prototype.A_close = A_close_html_disc;
ASPFHTML.prototype.BASE = BASE_html_disc;
ASPFHTML.prototype.BLOCKQUOTE_open = BLOCKQUOTE_open_html_disc;
ASPFHTML.prototype.BLOCKQUOTE_close = BLOCKQUOTE_close_html_disc;
ASPFHTML.prototype.BODY_open = BODY_open_html_disc;
ASPFHTML.prototype.BODY_close = BODY_close_html_disc;
ASPFHTML.prototype.BR = BR_html_disc;
ASPFHTML.prototype.DIV_open = DIV_open_html_disc;
ASPFHTML.prototype.DIV_close = DIV_close_html_disc;
ASPFHTML.prototype.DOUBLE_QUOTES = DOUBLE_QUOTES_html_disc;
ASPFHTML.prototype.DTD = DTD_html_disc;
ASPFHTML.prototype.FONT_open = FONT_open_html_disc;
ASPFHTML.prototype.FONT_close = FONT_close_html_disc;
ASPFHTML.prototype.FORM_open = FORM_open_html_disc;
ASPFHTML.prototype.FORM_close = FORM_close_html_disc;
ASPFHTML.prototype.HR = HR_html_disc;
ASPFHTML.prototype.HTML_open = HTML_open_html_disc;
ASPFHTML.prototype.HTML_close = HTML_close_html_disc;
ASPFHTML.prototype.IFRAME_open = IFRAME_open_html_disc;
ASPFHTML.prototype.IFRAME_close = IFRAME_close_html_disc;
ASPFHTML.prototype.IMG = IMG_html_disc;
ASPFHTML.prototype.INPUT_checkbox = INPUT_checkbox_html_disc;
ASPFHTML.prototype.INPUT_hidden = INPUT_hidden_html_disc;
ASPFHTML.prototype.INPUT_password = INPUT_password_html_disc;
ASPFHTML.prototype.INPUT_submit = INPUT_submit_html_disc;
ASPFHTML.prototype.INPUT_text = INPUT_text_html_disc;
ASPFHTML.prototype.JS_open = JS_open_html_disc;
ASPFHTML.prototype.JS_close = JS_close_html_disc;
ASPFHTML.prototype.LI = LI_html_disc;
ASPFHTML.prototype.MAILTO = MAILTO_html_disc;
ASPFHTML.prototype.NBSP = NBSP_html_disc;
ASPFHTML.prototype.NBSP_multi = NBSP_html_disc;
ASPFHTML.prototype.OPTION = OPTION_html_disc;
ASPFHTML.prototype.OL_open = OL_open_html_disc;
ASPFHTML.prototype.OL_close = OL_close_html_disc;
ASPFHTML.prototype.P_open = P_open_html_disc;
ASPFHTML.prototype.P_close = P_close_html_disc;
ASPFHTML.prototype.QUOTE_open = QUOTE_open_html_disc;
ASPFHTML.prototype.QUOTE_close = QUOTE_close_html_disc;
ASPFHTML.prototype.SCRIPT_open = SCRIPT_open_html_disc;
ASPFHTML.prototype.SCRIPT_close = SCRIPT_close_html_disc;
ASPFHTML.prototype.SELECT_open = SELECT_open_html_disc;
ASPFHTML.prototype.SELECT_close = SELECT_close_html_disc;
ASPFHTML.prototype.STRONG_open = STRONG_open_html_disc;
ASPFHTML.prototype.SPAN_open = SPAN_open_html_disc;
ASPFHTML.prototype.SPAN_close = SPAN_close_html_disc;
ASPFHTML.prototype.STRONG_close = STRONG_close_html_disc;
ASPFHTML.prototype.STYLE_open = STYLE_open_html_disc;
ASPFHTML.prototype.STYLE_close = STYLE_close_html_disc;
ASPFHTML.prototype.TABLE_open = TABLE_open_html_disc;
ASPFHTML.prototype.TABLE_close = TABLE_close_html_disc;
ASPFHTML.prototype.TD_open = TD_open_html_disc;
ASPFHTML.prototype.TD_close = TD_close_html_disc;
ASPFHTML.prototype.TEXTAREA_open = TEXTAREA_open_html_disc;
ASPFHTML.prototype.TEXTAREA_close = TEXTAREA_close_html_disc;
ASPFHTML.prototype.TH_open = TH_open_html_disc;
ASPFHTML.prototype.TH_close = TH_close_html_disc;
ASPFHTML.prototype.TR_open = TR_open_html_disc;
ASPFHTML.prototype.TR_close = TR_close_html_disc;
ASPFHTML.prototype.UL_open = UL_open_html_disc;
ASPFHTML.prototype.UL_close = UL_close_html_disc;

ASPFHTML.prototype.sanitise = sanitise_html_disc;
ASPFHTML.prototype.isImage = isImage_html_disc;
ASPFHTML.prototype.isLinkOpen = isLinkOpen_html_disc;
ASPFHTML.prototype.isLinkClose = isLinkClose_html_disc;
ASPFHTML.prototype.sanitiseImage = sanitiseImage_html_disc;
ASPFHTML.prototype.sanitiseLink = sanitiseLink_html_disc;

</SCRIPT>