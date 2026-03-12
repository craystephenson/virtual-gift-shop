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
// MESSAGE OBJECT
//
// ======================================================================

function ASPFMessage
(
 objMessage,
 nSourceType
)
{
  this.setAllFields (objMessage, nSourceType);

  return this;
}

// ======================================================================
//
// Interface to private member variables.
//
// ======================================================================

function getSubject_msg_disc
(
)
{
  return String (this._subject);
}

function setSubject_msg_disc
(
 strNewSubject
)
{
  this._subject = String (strNewSubject);
  return;
}

function getBody_msg_disc
(
)
{
  return String (this._body);
}

function setBody_msg_disc
(
 strNewBody
)
{
  this._body = String (strNewBody);
  return;
}

function getSortCode_msg_disc
(
)
{
  return String (this._sortCode);
}

function setSortCode_msg_disc
(
 strNewSortCode
)
{
  this._sortCode = String (strNewSortCode);
  return;
}

function getAuthorName_msg_disc
(
)
{
  return String (this._authorName);
}

function setAuthorName_msg_disc
(
 strNewAuthorName
)
{
  this._authorName = String (strNewAuthorName);
  return;
}

function getAuthorEmail_msg_disc
(
)
{
  return String (this._authorEmail);
}

function setAuthorEmail_msg_disc
(
 strNewAuthorEmail
)
{
  this._authorEmail = String (strNewAuthorEmail);
  return;
}

function getAuthorFullname_msg_disc
(
)
{
  return String (this._authorFullname);
}

function setAuthorFullname_msg_disc
(
 strNewAuthorFullname
)
{
  this._authorFullname = String (strNewAuthorFullname);
  return;
}

function getMessageID_msg_disc
(
)
{
  return Number (this._messageID);
}

function setMessageID_msg_disc
(
 nNewMessageID
)
{
  this._messageID = Number (nNewMessageID);
  return;
}

function getParentID_msg_disc
(
)
{
  return Number (this._parentID);
}

function setParentID_msg_disc
(
 nNewParentID
)
{
  this._parentID = Number (nNewParentID);
  return;
}

function getThreadID_msg_disc
(
)
{
  return Number (this._threadID);
}

function setThreadID_msg_disc
(
 nNewThreadID
)
{
  this._threadID = Number (nNewThreadID);
  return;
}

function getNumChildren_msg_disc
(
)
{
  return Number (this._numChildren);
}

function setNumChildren_msg_disc
(
 nNewNumChildren
)
{
  this._numChildren = Number (nNewNumChildren);
  return;
}

function getDateCreated_msg_disc
(
)
{
  return new Date (this._dateCreated);
}

function setDateCreated_msg_disc
(
 dtNewDateCreated
)
{
  this._dateCreated = new Date (dtNewDateCreated);
  return;
}

function getDateModified_msg_disc
(
)
{
  return new Date (this._dateModified);
}

function setDateModified_msg_disc
(
 dtNewDateModified
)
{
  this._dateModified = new Date (dtNewDateModified);
  return;
}

function getEmailParentOnResponse_msg_disc
(
)
{
  var bEmailResponse = false;
  if ((this._emailParentOnResponse == "true") || (this._emailParentOnResponse == true))
    {
      bEmailResponse = true;
    }

  return bEmailResponse;
}

function setEmailParentOnResponse_msg_disc
(
 bNewEmailParentOnResponse
)
{
  this._emailParentOnResponse = Boolean (bNewEmailParentOnResponse);
  return;
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function setAllFieldsEmpty_msg_disc
(
)
{
  this.setSubject ("");
  this.setBody ("");
  this.setSortCode ("");
  this.setAuthorName ("");
  this.setAuthorEmail ("");
  this.setAuthorFullname ("");
  this.setMessageID (0);
  this.setParentID (0);
  this.setThreadID (0);
  this.setNumChildren (0);
  this.setDateCreated ("1/1/00");
  this.setDateModified ("1/1/00");
  this.setEmailParentOnResponse (false);

  return;
}

function setAllFieldsFromRecordSet_msg_disc
(
 rsNewMessageRecord
)
{
  if ((rsNewMessageRecord != null) && (!rsNewMessageRecord.EOF))
    {
      var dbDatabase = new ASPFDatabase ();

      this.setSubject (dbDatabase.getSubjectField (rsNewMessageRecord));
      this.setBody (dbDatabase.getBodyField (rsNewMessageRecord));
      this.setSortCode (dbDatabase.getSortCodeField (rsNewMessageRecord));
      this.setAuthorName (dbDatabase.getAuthorNameField (rsNewMessageRecord));
      this.setAuthorEmail (dbDatabase.getAuthorEmailField (rsNewMessageRecord));
      this.setAuthorFullname (dbDatabase.getAuthorFullnameField (rsNewMessageRecord));
      this.setMessageID (dbDatabase.getMessageIDField (rsNewMessageRecord));
      this.setParentID (dbDatabase.getParentIDField (rsNewMessageRecord));
      this.setThreadID (dbDatabase.getThreadIDField (rsNewMessageRecord));
      this.setNumChildren (dbDatabase.getNumChildrenField (rsNewMessageRecord));
      this.setDateCreated (dbDatabase.getDateCreatedField (rsNewMessageRecord));
      this.setDateModified (dbDatabase.getDateModifiedField (rsNewMessageRecord));
      this.setEmailParentOnResponse (dbDatabase.getEmailParentOnResponseField (rsNewMessageRecord));

      delete dbDatabase;
    }
  else
    {
      this.setAllFieldsEmpty ();
    }

  return;
}

function setAllFieldsFromMessage_msg_disc
(
 msgNewMessage
)
{
  this.setSubject (msgNewMessage.getSubject ());
  this.setBody (msgNewMessage.getBody ());
  this.setSortCode (msgNewMessage.getSortCode ());
  this.setAuthorName (msgNewMessage.getAuthorName ());
  this.setAuthorEmail (msgNewMessage.getAuthorEmail ());
  this.setAuthorFullname (msgNewMessage.getAuthorFullname ());
  this.setMessageID (msgNewMessage.getMessageID ());
  this.setParentID (msgNewMessage.getParentID ());
  this.setThreadID (msgNewMessage.getThreadID ());
  this.setNumChildren (msgNewMessage.getNumChildren ());
  this.setDateCreated (msgNewMessage.getDateCreated ());
  this.setDateModified (msgNewMessage.getDateModified ());
  this.setEmailParentOnResponse (msgNewMessage.getEmailParentOnResponse ());

  return;
}

function setAllFieldsFromForm_msg_disc
(
 frmNewMessageForm
)
{
  this.setSubject (safeStringDereference_disc (frmNewMessageForm.getSubject ()));
  this.setBody (safeStringDereference_disc (frmNewMessageForm.getBody ()));
  this.setSortCode (safeNumberDereference_disc (frmNewMessageForm.getSortCode ()));
  this.setParentID (safeNumberDereference_disc (frmNewMessageForm.getParentID ()));
  this.setThreadID (safeNumberDereference_disc (frmNewMessageForm.getThreadID ()));
  this.setMessageID (safeNumberDereference_disc (frmNewMessageForm.getMessageID ()));
  this.setEmailParentOnResponse (frmNewMessageForm.getEmailParentOnResponse ());
  this.setAuthorName (safeStringDereference_disc (frmNewMessageForm.getAuthorName ()));
  this.setAuthorEmail (safeStringDereference_disc (frmNewMessageForm.getAuthorEmail ()));
  this.setAuthorFullname (safeStringDereference_disc (frmNewMessageForm.getAuthorFullname ()));

  return;
}

function setAllFields_msg_disc
(
 objNewMessage,
 nSourceType
)
{
  if (isUndefined_disc (objNewMessage))
    {
      this.setAllFieldsEmpty ();
    }
  else
    {
      if (nSourceType == ASPF_FORM_OBJECT_TYPE_DISC)
	{
	  this.setAllFieldsFromForm (objNewMessage);
	}
      else if (nSourceType == ASPF_MESSAGE_OBJECT_TYPE_DISC)
	{
	  this.setAllFieldsFromMessage (objNewMessage);
	}
      else
	{
	  this.setAllFieldsFromRecordSet (objNewMessage);
	}
    }

  return;
}

function getExpandCollapse_msg_disc
(
 nViewIndex,
 nActiveThreadID,
 strPageURLToUse
)
{
  var exExpandCollapse = new ASPFExpandCollapse (this,
						 nViewIndex,
						 0,
						 nActiveThreadID,
						 strPageURLToUse);
  var strHTMLout = "";
  strHTMLout += ASPFHTML.FONT_open (config.ADMINSETTING_ExpandCollapseFontSize);
  strHTMLout += exExpandCollapse.getIcon ();
  strHTMLout += ASPFHTML.FONT_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TD_open (undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  config.ADMINSETTING_NoWrapMessageThreadViews);

  delete exExpandCollapse;
  return strHTMLout;
}

function getDHTMLExpandCollapse_msg_disc
(
 nCurrentIndentLevel,
 strPageURLToUse,
 nThreadCounter
)
{
  var exExpandCollapse = new ASPFExpandCollapse (this,
					       0,
					       0,
					       0,
					       strPageURLToUse);
  var strHTMLout = "";
  strHTMLout += ASPFHTML.FONT_open (config.ADMINSETTING_ExpandCollapseFontSize);
  strHTMLout += exExpandCollapse.getDHTMLIcon (nCurrentIndentLevel, nThreadCounter);
  strHTMLout += ASPFHTML.FONT_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TD_open (undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  config.ADMINSETTING_NoWrapMessageThreadViews);

  delete exExpandCollapse;
  return strHTMLout;
}

function getViewEntry_msg_disc
(
 nActiveMessageID
)
{
  var strHTMLout = ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewSubject);

  if (nActiveMessageID == this.getMessageID ())
    {
      strHTMLout += this.getSubject ().strong();
    }
  else
    {
      strHTMLout += this.getSubjectLink ().strong();
    }

  strHTMLout += ASPFHTML.SPAN_close ();

  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewAuthor);
  strHTMLout += config.USERTEXT_VIEW_SeparateSubjectAuthor;
  strHTMLout += this.getAuthorFullname ().strongSmall();
  strHTMLout += " (";
  strHTMLout += ASPFHTML.QUOTE_open ();
  strHTMLout += ASPFHTML.MAILTO (this.getAuthorEmail (),
				 this.getAuthorName (),
				 this.getAuthorName ());
  strHTMLout += ASPFHTML.QUOTE_close ();
  strHTMLout += ") ";
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewDate);
  strHTMLout += config.USERTEXT_VIEW_SeparateAuthorDate;
  strHTMLout += this.getDateCreated ().getShortFormat ();
  strHTMLout += ASPFHTML.SPAN_close ();

  if (this.getNumChildren () == 0)
    {
      strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewNoChildren);
      strHTMLout += " (";
      strHTMLout += config.USERTEXT_VIEW_NoRepliesTag;
      strHTMLout += ")";
      strHTMLout += ASPFHTML.SPAN_close ();
    }
  else if (this.getNumChildren () == 1)
    {
      strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewOneChild);
      strHTMLout += " (1";
      strHTMLout += config.USERTEXT_VIEW_OneReplyTag;
      strHTMLout += ")";
      strHTMLout += ASPFHTML.SPAN_close ();
    }
  else
    {
      strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassViewManyChildren);
      strHTMLout += " (";
      strHTMLout += this.getNumChildren ();
      strHTMLout += config.USERTEXT_VIEW_ManyRepliesTag;
      strHTMLout += ")";
      strHTMLout += ASPFHTML.SPAN_close ();
    }

  strHTMLout = strHTMLout.weakSmall();

  return strHTMLout;
}

function getSubjectLink_msg_disc
(
)
{
  var strLinkURL = "";
  strLinkURL += config.getShowMessagePagePath ();
  strLinkURL += "?";
  strLinkURL += config.FORM_QueryStringMessageID;
  strLinkURL += "=";
  strLinkURL += this.getMessageID ();

  var strLinkTitle = "";
  strLinkTitle += config.USERTEXT_SHOW_PopupSubjectPrefix;
  strLinkTitle += ASPFHTML.QUOTE_open ();
  strLinkTitle += this.getSubject ().stripAllTags ();
  strLinkTitle += ASPFHTML.QUOTE_close ();

  var strHTMLout = "";

  strHTMLout += ASPFHTML.A_open (strLinkURL,
				 strLinkTitle,
				 undefined_disc,
				 config.ADMINSETTING_ShowMessagePageTarget);
  strHTMLout += this.getSubject ();
  strHTMLout += ASPFHTML.A_close ();

  return strHTMLout;
}

function getSummary_msg_disc
(
)
{
  var dtDateCreated = new Date (this.getDateCreated ());
  var strHTMLout = "";
  strHTMLout += ASPFHTML.LI ();
  strHTMLout += this.getSubjectLink ();
  strHTMLout += config.USERTEXT_VIEW_SeparateSubjectAuthor;
  strHTMLout += this.getAuthorName ();
  strHTMLout += config.USERTEXT_VIEW_SeparateAuthorDate;
  strHTMLout += dtDateCreated.getLongFormat ();
  strHTMLout += ASPFHTML.BLOCKQUOTE_open ();
  strHTMLout += this.getBody ().precis ();
  strHTMLout += ASPFHTML.BLOCKQUOTE_close ();

  return strHTMLout;
}

function sendAdminAlert_msg_disc
(
 strPureSubject,
 strPureBody
)
{
  if ("" != config.ADMINSETTING_EmailAdminAddress)
    {
      var emlAdminEmail;
      emlAdminEmail = new ASPFEmail ();
      emlAdminEmail.setToName (config.ADMINSETTING_EmailAdminName);
      emlAdminEmail.setToAddress (config.ADMINSETTING_EmailAdminAddress);
      emlAdminEmail.setFromName (this.getAuthorFullname ());
      emlAdminEmail.setFromAddress (this.getAuthorEmail ());
      emlAdminEmail.setSubject (config.USERTEXT_MAIL_AdminNewPostSubjectPrefix + " (" + config.ADMINSETTING_ForumName + "): " + strPureSubject.stripAllTags ());
      if (config.ADMINSWITCH_AllowHTMLEmail)
	{
	  var strHTMLBody = "";
	  strHTMLBody += config.USERTEXT_MAIL_AdminNewPostBodyPrefix;
	  strHTMLBody += this.getAuthorFullname ();
	  strHTMLBody += config.USERTEXT_MAIL_AdminNewPostSeparateNameForum;
	  strHTMLBody += config.ADMINSETTING_ForumName;
	  strHTMLBody += ASPFHTML.P_open ();
	  strHTMLBody += this.getSubject ().strong();
	  strHTMLBody += ASPFHTML.P_close ();
	  strHTMLBody += this.getBody ().messageBody();
	  strHTMLBody += ASPFHTML.P_open ();
	  strHTMLBody += ASPFPageElement.getNewReplyButton ();
	  strHTMLBody += ASPFHTML.P_close ();
	  emlAdminEmail.setBody (emlAdminEmail.getHTMLMessageBody (this, config.ADMINSETTING_ForumName, strHTMLBody, config.ADMINSETTING_EmailAlertSignatureHTML));

	  emlAdminEmail.sendHTML ();
	}
      else
	{
	  var strBody = "";
	  strBody += config.USERTEXT_MAIL_AdminNewPostBodyPrefix;
	  strBody += this.getAuthorFullname ();
	  strBody += config.USERTEXT_MAIL_AdminNewPostSeparateNameForum;
	  strBody += config.ADMINSETTING_ForumName;
	  strBody += "\n\n";
	  strBody += strPureBody.stripAllTags ();

	  emlAdminEmail.setBody (strBody);
	  emlAdminEmail.send ();
	}
      delete emlAdminEmail;
    }

  return;
}

function sendUserAlert_msg_disc
(
 strPureSubject,
 strPureBody
)
{
  if ((config.ADMINSWITCH_AllowEmailResponses) && (this.getParentID () != 0))
    {
      var dbDatabase = new ASPFDatabase ();
      var msgParentMessage = dbDatabase.getMessageByID (this.getParentID ());

      if (msgParentMessage != null)
	{
	  if (msgParentMessage.getEmailParentOnResponse ())
	    {
	      var emlUserAlert = new ASPFEmail ();
	      emlUserAlert.setToAddress (msgParentMessage.getAuthorEmail ());
	      emlUserAlert.setToName (msgParentMessage.getAuthorFullname ());
	      emlUserAlert.setFromAddress (config.ADMINSETTING_EmailAlertFromAddress);
	      emlUserAlert.setFromName (config.ADMINSETTING_EmailAlertFromName);
	      emlUserAlert.setSubject (config.USERTEXT_MAIL_UserNewResponseSubjectPrefix + " (" + config.ADMINSETTING_ForumName + "): " + strPureSubject.stripAllTags ());

	      var strSubject = strPureSubject;

	      if ((config.ADMINSWITCH_AllowHTMLEmail)
		  && (config.getUserHTMLMailPreference (msgParentMessage.getAuthorName ())))
		{
		  var strHTMLBody = "";
		  strHTMLBody += this.getAuthorFullname ();
		  strHTMLBody += config.USERTEXT_MAIL_UserNewPostNameSuffix;
		  strHTMLBody += config.USERTEXT_MAIL_UserNewPostMessagePrefix;
		  strHTMLBody += ASPFHTML.P_open () + strSubject.strong() + ASPFHTML.P_close ();
		  strHTMLBody += this.getBody ().messageBody ();
		  strHTMLBody += ASPFHTML.P_open ();
		  strHTMLBody += ASPFPageElement.getNewReplyButton ();
		  strHTMLBody += ASPFHTML.P_close ();

		  emlUserAlert.setBody (emlUserAlert.getHTMLMessageBody (this, config.ADMINSETTING_ForumName, strHTMLBody, config.ADMINSETTING_EmailAlertSignatureHTML));

		  emlUserAlert.sendHTML ();
		}
	      else
		{
		  var strBody = "";
		  strBody += this.getAuthorFullname ();
		  strBody += config.USERTEXT_MAIL_UserNewPostSeparateNameMessage;
		  strBody += strSubject;
		  strBody += "\n\n";
		  strBody += config.USERTEXT_MAIL_UserNewPostMessagePrefix;
		  strBody += "\n\n\n";
		  strBody += strSubject;
		  strBody += "\n\n";
		  strBody += strPureBody.stripAllTags ();
		  strBody += "\n";
		  strBody += config.ADMINSETTING_EmailAlertSignature;

		  emlUserAlert.setBody (strBody);
		  emlUserAlert.send ();
		}

	      delete emlUserAlert;
	    }
	}

      delete dbDatabase;
    }

  return;
}

function saveAsNewMessage_msg_disc
(
 strSuccessfulMessage,
 strFailedMessagePrefix
)
{
  var bSuccessful;
  var strPureBody = this.getBody ().purify ();
  var strPureSubject = this.getSubject ().purify ();

  this.normalisePost ();

  var errSuccessOrFailure = this.validatePost ();
  if (errSuccessOrFailure.number == config.CONST_NoError)
    {
      var dbDatabase = new ASPFDatabase ();
      dbDatabase.saveNewRecord (this);

      strSuccessfulMessage.strong ().show ();
      currentMessage_disc = this;
      bSuccessful = true;

      this.sendAdminAlert (strPureSubject, strPureBody);
      this.sendUserAlert (strPureSubject, strPureBody);

      delete dbDatabase;
    }
  else
    {
      strFailedMessagePrefix = strFailedMessagePrefix.paragraph ();
      strFailedMessagePrefix.show ();
      errSuccessOrFailure.description.show ();
      bSuccessful = false;
    }

  delete errSuccessOrFailure;
  return bSuccessful;
}

function saveAsUpdatedMessage_msg_disc
(
 strSuccessfulMessage,
 strFailedMessagePrefix
)
{
  var bSuccessful;
  var strErrorString;

  this.normalisePost();

  var errSuccessOrFailure = this.validatePost ();
  if (errSuccessOrFailure.number == config.CONST_NoError)
    {
      var dbDatabase = new ASPFDatabase ();
      dbDatabase.saveUpdatedRecord (this);

      strSuccessfulMessage = strSuccessfulMessage.paragraph ();
      strSuccessfulMessage.strong ().show();
      bSuccessful = true;

      delete dbDatabase;
    }
  else
    {
      strFailedMessagePrefix = strFailedMessagePrefix.paragraph ();
      strFailedMessagePrefix.show ();
      errSuccessOrFailure.description.show ();
      bSuccessful = false;
    }

  delete errSuccessOrFailure;
  return bSuccessful;
}

function saveUpdatedData_msg_disc
(
)
{
  var dbDatabase = new ASPFDatabase ();
  dbDatabase.saveUpdatedRecord (this);

  delete dbDatabase;
  return;
}

function normalisePost_msg_disc
(
)
{
  this.setThreadID (Number (this.getThreadID ()));
  this.setSortCode (String (this.getSortCode ()).substr (0, config.DATABASE_MaxSortcodeSize));
  this.setParentID (Number (this.getParentID ()));

  this.setEmailParentOnResponse (this.getEmailParentOnResponse ());
  this.setSubject (this.getSubject ().substr (0, config.DATABASE_MaxSubjectSize).formatForStoring ().stripAllTags ());
  this.setBody (this.getBody ().substr (0, config.DATABASE_MaxMessageSize).formatForStoring ());
  this.setAuthorName (this.getAuthorName ().substr (0, config.DATABASE_MaxUsernameSize).formatForStoring ());
  this.setAuthorFullname (this.getAuthorFullname ().substr (0, config.DATABASE_MaxFullnameSize).formatForStoring ());
  this.setAuthorEmail (this.getAuthorEmail ().substr (0, config.DATABASE_MaxEmailAddressSize).formatForStoring ());

  return;
}

function validatePost_msg_disc
(
)
{
  var strErrors = "";
  var bValid = true;

  strErrors += ASPFHTML.UL_open ();
  if (this.getAuthorName () == "")
    {
      strErrors += ASPFHTML.LI ();
      strErrors += config.USERTEXT_POST_ErrorNoUsername;
      bValid = false;
    }

  if (this.getAuthorFullname () == "")
    {
      strErrors += ASPFHTML.LI ();
      strErrors += config.USERTEXT_POST_ErrorNoName;
      bValid = false;
    }

  if (this.getAuthorEmail () == "")
    {
      strErrors += ASPFHTML.LI ();
      strErrors += config.USERTEXT_POST_ErrorNoEmail;
      bValid = false;
    }

  if (this.getSubject () == "")
    {
      strErrors += ASPFHTML.LI ();
      strErrors += config.USERTEXT_POST_ErrorNoSubject;
      bValid = false;
    }

  if (this.getBody () == "")
    {
      strErrors += ASPFHTML.LI ();
      strErrors += config.USERTEXT_POST_ErrorNoBody;
      bValid = false;
    }

  strErrors += ASPFHTML.UL_close ();
  bValid = (bValid ? config.CONST_NoError : config.CONST_Error);

  return new ASPFError (bValid, strErrors);
}

function getRenderedHTML_msg_disc
(
)
{
  var strHTMLout = "";
  strHTMLout += ASPFHTML.TABLE_open (config.ADMINSETTING_TableBorderSize,
				     config.ADMINSETTING_TableFullWidth,
				     undefined_disc,
				     undefined_disc,
				     0,
				     0);


  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgPostedByLabel);
  strHTMLout += config.USERTEXT_SHOW_PostedByPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgPostedBy);

  var emlUserInfo = new ASPFEmail();
  emlUserInfo.setFromName (this.getAuthorFullname ());
  emlUserInfo.setFromAddress (this.getAuthorEmail ());

  var strUserInfo = "";
  strUserInfo += this.getAuthorName ();
  strUserInfo += config.USERTEXT_SHOW_AuthorEmailSeparator;
  strUserInfo += ASPFHTML.QUOTE_open ();
  strUserInfo += emlUserInfo.getFromEmailLink ();
  strUserInfo += ASPFHTML.QUOTE_close ();
  strUserInfo += config.USERTEXT_SHOW_EmailSuffix;
  delete emlUserInfo;

  strHTMLout += strUserInfo.strong ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgPostedOnLabel);
  strHTMLout += config.USERTEXT_SHOW_PostedOnPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgPostedOn);
  strHTMLout += this.getDateCreated ().getLongFormat ().strong ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  2);
  strHTMLout += ASPFHTML.NBSP ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  2);
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgBodyLabel);
  strHTMLout += (config.USERTEXT_SHOW_BodyPrompt + ASPFHTML.BR ()).strong ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassMsgBody);
  strHTMLout += this.getBody ().messageBody ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TABLE_close ();

  return strHTMLout;
}

ASPFMessage.prototype.getSubject = getSubject_msg_disc;
ASPFMessage.prototype.setSubject = setSubject_msg_disc;
ASPFMessage.prototype.getBody = getBody_msg_disc;
ASPFMessage.prototype.setBody = setBody_msg_disc;
ASPFMessage.prototype.getSortCode = getSortCode_msg_disc;
ASPFMessage.prototype.setSortCode = setSortCode_msg_disc;
ASPFMessage.prototype.getAuthorName = getAuthorName_msg_disc;
ASPFMessage.prototype.setAuthorName = setAuthorName_msg_disc;
ASPFMessage.prototype.getAuthorEmail = getAuthorEmail_msg_disc;
ASPFMessage.prototype.setAuthorEmail = setAuthorEmail_msg_disc;
ASPFMessage.prototype.getAuthorFullname = getAuthorFullname_msg_disc;
ASPFMessage.prototype.setAuthorFullname = setAuthorFullname_msg_disc;
ASPFMessage.prototype.getMessageID = getMessageID_msg_disc;
ASPFMessage.prototype.setMessageID = setMessageID_msg_disc;
ASPFMessage.prototype.getParentID = getParentID_msg_disc;
ASPFMessage.prototype.setParentID = setParentID_msg_disc;
ASPFMessage.prototype.getThreadID = getThreadID_msg_disc;
ASPFMessage.prototype.setThreadID = setThreadID_msg_disc;
ASPFMessage.prototype.getNumChildren = getNumChildren_msg_disc;
ASPFMessage.prototype.setNumChildren = setNumChildren_msg_disc;
ASPFMessage.prototype.getDateCreated = getDateCreated_msg_disc;
ASPFMessage.prototype.setDateCreated = setDateCreated_msg_disc;
ASPFMessage.prototype.getDateModified = getDateModified_msg_disc;
ASPFMessage.prototype.setDateModified = setDateModified_msg_disc;
ASPFMessage.prototype.getEmailParentOnResponse = getEmailParentOnResponse_msg_disc;
ASPFMessage.prototype.setEmailParentOnResponse = setEmailParentOnResponse_msg_disc;

ASPFMessage.prototype.getSummary = getSummary_msg_disc;
ASPFMessage.prototype.getSubjectLink = getSubjectLink_msg_disc;
ASPFMessage.prototype.getViewEntry = getViewEntry_msg_disc;
ASPFMessage.prototype.setAllFieldsEmpty = setAllFieldsEmpty_msg_disc;
ASPFMessage.prototype.setAllFieldsFromForm = setAllFieldsFromForm_msg_disc;
ASPFMessage.prototype.setAllFieldsFromMessage = setAllFieldsFromMessage_msg_disc;
ASPFMessage.prototype.setAllFieldsFromRecordSet = setAllFieldsFromRecordSet_msg_disc;
ASPFMessage.prototype.setAllFields = setAllFields_msg_disc;
ASPFMessage.prototype.getExpandCollapse = getExpandCollapse_msg_disc;
ASPFMessage.prototype.getDHTMLExpandCollapse = getDHTMLExpandCollapse_msg_disc;
ASPFMessage.prototype.sendAdminAlert = sendAdminAlert_msg_disc;
ASPFMessage.prototype.sendUserAlert = sendUserAlert_msg_disc;
ASPFMessage.prototype.saveAsNewMessage = saveAsNewMessage_msg_disc;
ASPFMessage.prototype.saveAsUpdatedMessage = saveAsUpdatedMessage_msg_disc;
ASPFMessage.prototype.saveUpdatedData = saveUpdatedData_msg_disc;
ASPFMessage.prototype.normalisePost = normalisePost_msg_disc;
ASPFMessage.prototype.validatePost = validatePost_msg_disc;
ASPFMessage.prototype.getRenderedHTML = getRenderedHTML_msg_disc;
</SCRIPT>

