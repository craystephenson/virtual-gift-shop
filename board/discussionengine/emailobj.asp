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
// EMAIL OBJECT
//
// ======================================================================

function ASPFEmail
(
)
{
  this.setToName ("");
  this.setToAddress ("");
  this.setFromName ("");
  this.setFromAddress ("");
  this.setSubject ("");
  this.setBody ("");

  return this;
}

// ======================================================================
//
// Interface to private member variables.
//
// ======================================================================

function getToName_eml_disc
(
)
{
  return String (this._toName);
}

function setToName_eml_disc
(
 strNewToName
)
{
  this._toName = String (strNewToName);
  return;
}

function getToAddress_eml_disc
(
)
{
  return String (this._toAddress);
}

function setToAddress_eml_disc
(
 strNewToAddress
)
{
  this._toAddress = String (strNewToAddress);
  return;
}

function getFromName_eml_disc
(
)
{
  return String (this._fromName);
}

function setFromName_eml_disc
(
 strNewFromName
)
{
  this._fromName = String (strNewFromName);
  return;
}

function getFromAddress_eml_disc
(
)
{
  return String (this._fromAddress);
}

function setFromAddress_eml_disc
(
 strNewFromAddress
)
{
  this._fromAddress = String (strNewFromAddress);
  return;
}

function getSubject_eml_disc
(
)
{
  return String (this._subject);
}

function setSubject_eml_disc
(
 strNewSubject
)
{
  this._subject = String (strNewSubject);
  return;
}

function getBody_eml_disc
(
)
{
  return String (this._body);
}

function setBody_eml_disc
(
 strNewBody
)
{
  this._body = String (strNewBody);
  return;
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function getFromEmailLink_eml_disc
(
)
{
  var strHTMLout = "";

  if (config.ADMINSWITCH_ShowEmailAddresses)
    {
      var strLinkURL = "mailto:" + this.getFromAddress ();
      var strLinkText = "";
      strLinkText += config.USERTEXT_SHOW_PopupEmailPrefix;
      strLinkText += this.getFromName ();
      strLinkText += " (";
      strLinkText += this.getFromAddress ();
      strLinkText += ")";

      strHTMLout += A_open_html_disc (strLinkURL, strLinkText);
      strHTMLout += this.getFromName ();
      strHTMLout += ASPFHTML.A_close ();
    }
  else
    {
      strHTMLout = this.getFromName ();
    }

  return strHTMLout;
}

function getHTMLMessageBody_eml_disc
(
 msgCurrentMessage,
 strTitle,
 strBodyText,
 strSignature
)
{
  var strMessageBody = "";
  strMessageBody += ASPFHTML.DTD ();
  strMessageBody += ASPFHTML.HTML_open ();

  strMessageBody += ASPFHTML.BODY_open ("#FFFFFF",
					undefined_disc,
					"#0000FF",
					"#FF0000",
					"#660066");

  strMessageBody += ASPFHTML.TABLE_open (config.ADMINSETTING_TableBorderSize,
					 undefined_disc,
					 undefined_disc,
					 undefined_disc,
					 0,
					 0);

  strMessageBody += ASPFHTML.TR_open ();
  strMessageBody += ASPFHTML.TD_open (120,
				      undefined_disc,
				      "#336699");
  strMessageBody += ASPFHTML.DIV_open (undefined_disc,
				       undefined_disc,
				       "center");
  strMessageBody += ASPFHTML.A_open ("http://www.aspforums.com/");
  strMessageBody += ASPFHTML.IMG ("http://www.aspforums.com/images/logo.gif",
				  "ASP Forums",
				  0,
				  120,
				  60);
  strMessageBody += ASPFHTML.A_close ();
  strMessageBody += ASPFHTML.DIV_close ();
  strMessageBody += ASPFHTML.TD_close ();
  strMessageBody += ASPFHTML.TD_open (468, undefined_disc, "#336699");
  strMessageBody += ASPFHTML.FONT_open (5, "Tahoma", "#FFFFFF");
  strMessageBody += ASPFHTML.NBSP ();
  strMessageBody += strTitle;
  strMessageBody += ASPFHTML.FONT_close ();
  strMessageBody += ASPFHTML.TD_close ();
  strMessageBody += ASPFHTML.TR_close ();
  strMessageBody += ASPFHTML.TABLE_close ();

  strMessageBody += ASPFHTML.BLOCKQUOTE_open ();
  strMessageBody += ASPFHTML.FONT_open (-1, "Tahoma");
  strMessageBody += strBodyText;
  strMessageBody += ASPFHTML.FONT_close ();

  strMessageBody += ASPFHTML.P_open ();
  strMessageBody += ASPFHTML.NBSP ();
  strMessageBody += ASPFHTML.P_close ();
  strMessageBody += ASPFHTML.BLOCKQUOTE_close ();

  strMessageBody += strSignature;

  strMessageBody += ASPFHTML.P_open ();
  strMessageBody += ASPFHTML.NBSP ();
  strMessageBody += ASPFHTML.P_close ();

  return strMessageBody;
}

function sendHTML_eml_disc ()
{
  var strFrom = this.getFromName () + " <" + this.getFromAddress () + ">";
  var strTo = this.getToAddress ();

  sendHTMLMailMessage_eml_disc (strTo,
				strFrom,
				this.getSubject (),
				this.getBody (),
				config.getSiteBaseURL ());

  return;
}

function send_eml_disc ()
{
  var strFrom = this.getFromName () + " <" + this.getFromAddress () + ">";
  var strTo = this.getToAddress ();

  sendRegularMailMessage_eml_disc (strTo,
				   strFrom,
				   this.getSubject (),
				   this.getBody ());

  return;
}

ASPFEmail.prototype.getToName = getToName_eml_disc;
ASPFEmail.prototype.setToName = setToName_eml_disc;
ASPFEmail.prototype.getToAddress = getToAddress_eml_disc;
ASPFEmail.prototype.setToAddress = setToAddress_eml_disc;
ASPFEmail.prototype.getFromName = getFromName_eml_disc;
ASPFEmail.prototype.setFromName = setFromName_eml_disc;
ASPFEmail.prototype.getFromAddress = getFromAddress_eml_disc;
ASPFEmail.prototype.setFromAddress = setFromAddress_eml_disc;
ASPFEmail.prototype.getSubject = getSubject_eml_disc;
ASPFEmail.prototype.setSubject = setSubject_eml_disc;
ASPFEmail.prototype.getBody = getBody_eml_disc;
ASPFEmail.prototype.setBody = setBody_eml_disc;

ASPFEmail.prototype.getFromEmailLink = getFromEmailLink_eml_disc;
ASPFEmail.prototype.getHTMLMessageBody = getHTMLMessageBody_eml_disc;
ASPFEmail.prototype.sendHTML = sendHTML_eml_disc;
ASPFEmail.prototype.send = send_eml_disc;
</SCRIPT>

<SCRIPT LANGUAGE="VBScript" RUNAT="Server">
' Has to be in VBScript for the error recovery.
Sub sendRegularMailMessage_eml_disc (messageTo, messageFrom, messageSubject, messageBody)
  On Error Resume Next

  Dim mailMessage
  Set mailMessage = Server.CreateObject ("CDONTS.NewMail")

  if Not mailMessage is Nothing then
    mailMessage.From = messageFrom
    mailMessage.To = messageTo
    mailMessage.Subject = messageSubject
    mailMessage.Body = messageBody

    mailMessage.Send
    Set mailMessage = Nothing
  end if
End Sub

Sub sendHTMLMailMessage_eml_disc (messageTo, messageFrom, messageSubject, messageBody, baseURL)
  On Error Resume Next

  Dim mailMessage
  Set mailMessage = Server.CreateObject ("CDONTS.NewMail")

  if Not mailMessage is Nothing then
    mailMessage.From = messageFrom
    mailMessage.To = messageTo
    mailMessage.Subject = messageSubject
    mailMessage.Body = messageBody

    mailMessage.ContentBase = baseURL
    mailMessage.BodyFormat = 0
    mailMessage.MailFormat = 0 

    mailMessage.Send
    Set mailMessage = Nothing
  end if
End Sub
</SCRIPT>

