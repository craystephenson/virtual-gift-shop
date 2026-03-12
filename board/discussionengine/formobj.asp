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
// FORM OBJECT
//
// ======================================================================

function ASPFForm
(
 objFormData,
 nSourceType
)
{
  this.setAllFields (objFormData, nSourceType);

  return this;
}

// ======================================================================
//
// Interface to private member variables.
//
// ======================================================================

function getMessageID_frm_disc
(
)
{
  return Number (this._messageID);
}

function setMessageID_frm_disc
(
 nNewMessageID
)
{
  this._messageID = Number (nNewMessageID);
  return;
}

function getSubject_frm_disc
(
)
{
  return String (this._subject);
}

function setSubject_frm_disc
(
 strNewSubject
)
{
  this._subject = String (strNewSubject);
  return;
}

function getBody_frm_disc
(
)
{
  return String (this._body);
}

function setBody_frm_disc
(
 strNewBody
)
{
  this._body = String (strNewBody);
  return;
}

function getSortCode_frm_disc
(
)
{
  return String (this._sortCode);
}

function setSortCode_frm_disc
(
 strNewSortCode
)
{
  this._sortCode = String (strNewSortCode);
  return;
}

function getParentID_frm_disc
(
)
{
  return Number (this._parentID);
}

function setParentID_frm_disc
(
 nNewParentID
)
{
  this._parentID = Number (nNewParentID);
  return;
}

function getThreadID_frm_disc
(
)
{
  return Number (this._threadID);
}

function setThreadID_frm_disc
(
 nNewThreadID
)
{
  this._threadID = Number (nNewThreadID);
  return;
}

function getEmailParentOnResponse_frm_disc
(
)
{
  return Boolean (this._emailParentOnResponse);
}

function setEmailParentOnResponse_frm_disc
(
 bNewEmailParentOnResponse
)
{
  this._emailParentOnResponse = Boolean (bNewEmailParentOnResponse);
  return;
}

function getSearchString_frm_disc
(
)
{
  return String (this._searchString);
}

function setSearchString_frm_disc
(
 strNewSearchString
)
{
  this._searchString = String (strNewSearchString);
  return;
}

function getSQLStatement_frm_disc
(
)
{
  return String (this._SQLStatement).replace (/\"/gi, "'");
}

function setSQLStatement_frm_disc
(
 strNewSQLStatement
)
{
  this._SQLStatement = String (strNewSQLStatement);
  return;
}

function getFormName_frm_disc
(
)
{
  return String (this._formName);
}

function setFormName_frm_disc
(
 strNewFormName
)
{
  this._formName = String (strNewFormName);
  return;
}

function getMessageIDToDelete_frm_disc
(
)
{
  var nMessageID = Number (this._messageIDToDelete);
  if (isNaN (nMessageID))
    {
      nMessageID = 0;
    }

  return nMessageID;
}

function setMessageIDToDelete_frm_disc
(
 nNewMessageIDToDelete
)
{
  this._messageIDToDelete = Number (nNewMessageIDToDelete);
  return;
}

function getSwitchEditableUserInfo_frm_disc
(
)
{
  return Boolean (this._switchEditableUserInfo);
}

function setSwitchEditableUserInfo_frm_disc
(
 bNewSwitchEditableUserInfo
)
{
  this._switchEditableUserInfo = Boolean (bNewSwitchEditableUserInfo);
  return;
}

function getAuthorName_frm_disc
(
)
{
  return String (this._authorName);
}

function setAuthorName_frm_disc
(
 strNewAuthorName
)
{
  this._authorName = String (strNewAuthorName);
  return;
}

function getAuthorEmail_frm_disc
(
)
{
  return String (this._authorEmail);
}

function setAuthorEmail_frm_disc
(
 strNewAuthorEmail
)
{
  this._authorEmail = String (strNewAuthorEmail);
  return;
}

function getAuthorFullname_frm_disc
(
)
{
  return String (this._authorFullname);
}

function setAuthorFullname_frm_disc
(
 strNewAuthorFullname
)
{
  this._authorFullname = String (strNewAuthorFullname);
  return;
}

function getArchiveDate_frm_disc
(
)
{
  return new Date (this._archiveDate);
}

function setArchiveDate_frm_disc
(
 dtNewArchiveDate
)
{
  this._archiveDate = new Date (dtNewArchiveDate);
  return;
}

function getPurgeCache_frm_disc
(
)
{
  return Boolean (this._purgeCache);
}

function setPurgeCache_frm_disc
(
 bNewPurgeCache
)
{
  this._purgeCache = Boolean (bNewPurgeCache);
  return;
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function setAllFields_frm_disc
(
 objNewFormData,
 nSourceType
)
{
  if (nSourceType == ASPF_MESSAGE_OBJECT_TYPE_DISC)
    {
      this.setAllFieldsFromMessage (objNewFormData);
    }
  else if (nSourceType == ASPF_FORM_OBJECT_TYPE_DISC)
    {
      this.setAllFieldsFromForm (objNewFormData);
    }
  else
    {
      this.setAllFieldsEmpty ();
    }

  return;
}

function setAllFieldsFromMessage_frm_disc
(
 msgMessageForForm
)
{
  this.setSubject (msgMessageForForm.getSubject ());
  this.setBody (msgMessageForForm.getBody ());
  this.setSortCode (msgMessageForForm.getSortCode ());
  this.setParentID (msgMessageForForm.getParentID ());
  this.setThreadID (msgMessageForForm.getThreadID ());
  this.setMessageID (msgMessageForForm.getMessageID ());
  this.setEmailParentOnResponse (msgMessageForForm.getEmailParentOnResponse ());
  this.setSearchString ("");
  this.setSQLStatement ("");
  this.setSwitchEditableUserInfo (config.getEditableUserInfoSwitch ());
  this.setAuthorName (msgMessageForForm.getAuthorName ());
  this.setAuthorEmail (msgMessageForForm.getAuthorEmail ());
  this.setAuthorFullname (msgMessageForForm.getAuthorFullname ());

  return;
}

function setAllFieldsFromForm_frm_disc
(
 objFormData
)
{
  this.setMessageID (safeStringDereference_disc (objFormData (config.FORM_FieldMessageID)));
  this.setSubject (safeStringDereference_disc (objFormData (config.FORM_FieldSubject)));
  this.setBody (safeStringDereference_disc (ASPFTextControl.getControlContents (objFormData, config.FORM_FieldMessage)));
  this.setSortCode (safeStringDereference_disc (objFormData (config.FORM_FieldSortCode)));
  this.setParentID (safeStringDereference_disc (objFormData (config.FORM_FieldParentID)));
  this.setThreadID (safeStringDereference_disc (objFormData (config.FORM_FieldThreadID)));
  this.setEmailParentOnResponse ((isUndefined_disc (objFormData (config.FORM_FieldEmailResponses)) ? config.getUserEmailResponsePreference (currentUsername_disc) : (objFormData (config.FORM_FieldEmailResponses) == config.FORM_CheckboxTrue ? true : false)));
  this.setSearchString (safeStringDereference_disc (objFormData (config.FORM_FieldSearchString)));
  this.setSQLStatement (safeStringDereference_disc (objFormData (config.FORM_FieldSQLStatement)));
  this.setMessageIDToDelete (safeStringDereference_disc (objFormData (config.FORM_FieldMessageIDToDelete)));
  this.setSwitchEditableUserInfo (config.getEditableUserInfoSwitch ());
  this.setArchiveDate (this.interpretMonthYearSubform (objFormData, config.FORM_FieldArchiveDate));
  this.setPurgeCache (safeStringDereference_disc (objFormData (config.FORM_FieldPurgeCache)) == config.FORM_CheckboxTrue ? true : false);

  if (this.getSwitchEditableUserInfo ())
    {
      this.setAuthorName (safeStringDereference_disc (objFormData (config.FORM_FieldUsername)));
      this.setAuthorEmail (safeStringDereference_disc (objFormData (config.FORM_FieldEmailaddress)));
      this.setAuthorFullname (safeStringDereference_disc (objFormData (config.FORM_FieldFullname)));
    }
  else
    {
      this.setAuthorName (currentUsername_disc);
      this.setAuthorEmail (currentUserEmailAddress_disc);
      this.setAuthorFullname (currentUserFullName_disc);
    }

  return;
}

function setAllFieldsEmpty_frm_disc
(
)
{
  this.setSubject ("");
  this.setBody ("");
  this.setSortCode ("");
  this.setParentID ("");
  this.setThreadID ("");
  this.setMessageID ("");
  this.setEmailParentOnResponse (false);
  this.setSearchString ("");
  this.setMessageIDToDelete ("");
  this.setSQLStatement ("");
  this.setSwitchEditableUserInfo (config.getEditableUserInfoSwitch ());
  this.setArchiveDate (undefined_disc);
  this.setPurgeCache (false);

  if (this.getSwitchEditableUserInfo ())
    {
      this.setAuthorName (this (config.FORM_FieldUsername));
      this.setAuthorEmail (this (config.FORM_FieldEmailaddress));
      this.setAuthorFullname (this (config.FORM_FieldFullname));
    }
  else
    {
      this.setAuthorName (currentUsername_disc);
      this.setAuthorEmail (currentUserEmailAddress_disc);
      this.setAuthorFullname (currentUserFullName_disc);
    }

  return;
}

function getSubjectInputField_frm_disc
(
)
{
  var strSubject = this.getSubject ();

  return ASPFHTML.INPUT_text (config.FORM_FieldSubject,
			      strSubject,
			      config.ADMINSETTING_SubjectInputboxSize);
}

function getBodyInputField_frm_disc
(
)
{
  var txtBodyTextControl = new ASPFTextControl (config.FORM_FieldMessage,
						this.getBody (),
						this.getFormName ());
  return txtBodyTextControl.getControl ();
}

function getSubjectSubform_frm_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormSubjectLabel);
  strHTMLout += config.USERTEXT_POST_SubjectPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormSubject);
  strHTMLout += this.getSubjectInputField ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  return strHTMLout;
}

function getBodySubform_frm_disc
(
)
{
  var strHTMLout = "";

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  2);
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormBodyLabel);
  strHTMLout += (ASPFHTML.NBSP () + config.USERTEXT_POST_BodyPrompt).weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.BR ();
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormBody);
  strHTMLout += this.getBodyInputField ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  return strHTMLout;
}

function getEmailResponsesSubform_frm_disc
(
)
{
  var strEmailResponsesChecked;
  if ((this.getEmailParentOnResponse () == true)
      || (this.getEmailParentOnResponse () == config.FORM_CheckboxTrue))
    {
      strEmailResponsesChecked = config.FORM_CheckboxChecked;
    }
  else
    {
      strEmailResponsesChecked = config.FORM_CheckboxUnchecked;
    }

  var strHTMLout = "";
  if (config.ADMINSWITCH_AllowEmailResponses)
    {
      strHTMLout += ASPFHTML.TR_open ();
      strHTMLout += ASPFHTML.TD_open (undefined_disc,
				      undefined_disc,
				      undefined_disc,
				      undefined_disc,
				      undefined_disc,
				      2);
      strHTMLout += ASPFHTML.P_open ();
      strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormEmailResponses);
      strHTMLout += ASPFHTML.INPUT_checkbox (config.FORM_FieldEmailResponses,
					     config.FORM_CheckboxTrue,
					     strEmailResponsesChecked);
      strHTMLout += ASPFHTML.SPAN_close ();
      strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormEmailResponsesLabel);
      strHTMLout += config.USERTEXT_POST_EmailResponsesPrompt.weak ();
      strHTMLout += ASPFHTML.SPAN_close ();
      strHTMLout += ASPFHTML.P_close ();
      strHTMLout += ASPFHTML.TD_close ();
      strHTMLout += ASPFHTML.TR_close ();
    }

  return strHTMLout;
}

function getNonEditableUserInfoSubform_frm_disc
(
)
{
  var strUsername = "";
  strUsername += this.getAuthorName ();
  strUsername += " (";
  strUsername += ASPFHTML.QUOTE_open ();
  strUsername += this.getAuthorFullname ();
  strUsername += ASPFHTML.QUOTE_close ();
  strUsername += ", ";
  strUsername += this.getAuthorEmail ();
  strUsername += ")";
  strUsername = strUsername.weak ();

  var strHTMLout = "";
  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormPostedByLabel);
  strHTMLout += config.USERTEXT_POST_PostedByPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormPostedBy);
  strHTMLout += strUsername.strong ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  return strHTMLout;
}

function getEditableUserInfoSubform_frm_disc
(
)
{
  var strHTMLout = "";
  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormPostedByLabel);
  strHTMLout += config.USERTEXT_POST_PostedByPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormPostedBy);
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldUsername,
				     this.getAuthorName (),
				     25,
				     50);
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormFullNameLabel);
  strHTMLout += config.USERTEXT_POST_FullnamePrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormFullName);
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldFullname,
				     this.getAuthorFullname (),
				     25,
				     50);
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableTitleColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormEmailAddressLabel);
  strHTMLout += config.USERTEXT_POST_EmailAddressPrompt.weak ();
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();

  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFieldColumnWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom");
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormEmailAddress);
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldEmailaddress,
				     this.getAuthorEmail (),
				     25,
				     50);
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();

  return strHTMLout;
}

function getUserInfoSubform_frm_disc
(
)
{
  var strUserInfoSubform = "";

  if (this.getSwitchEditableUserInfo ())
    {
      strUserInfoSubform = this.getEditableUserInfoSubform ();
    }
  else
    {
      strUserInfoSubform = this.getNonEditableUserInfoSubform ();
    }

  return strUserInfoSubform;
}

function getDateSubform_frm_disc
(
 dtFieldValue,
 strFieldName,
 nStartYear,
 nEndYear
)
{
  if ((isUndefined_disc (dtFieldValue)) || isNaN (dtFieldValue))
    {
      dtFieldValue = new Date ();
    }
  else
    {
      dtFieldValue = new Date (dtFieldValue);
    }

  var strHTMLout = "";
  strHTMLout += this.getDateElement (strFieldName,
				     dtFieldValue.getDate ());
  strHTMLout += this.getMonthElement (strFieldName,
				      dtFieldValue.getMonth ());
  strHTMLout += this.getYearElement (strFieldName,
				     dtFieldValue.getFullYear (),
				     nStartYear, nEndYear);

  return strHTMLout;
}

function getMonthYearSubform_frm_disc
(
 dtFieldValue,
 strFieldName,
 nStartYear,
 nEndYear
)
{
  if ((isUndefined_disc (dtFieldValue)) || isNaN (dtFieldValue))
    {
      dtFieldValue = new Date ();
    }
  else
    {
      dtFieldValue = new Date (dtFieldValue);
    }

  var strHTMLout = "";
  strHTMLout += this.getMonthElement (strFieldName,
				      dtFieldValue.getMonth ());
  strHTMLout += this.getYearElement (strFieldName,
				     dtFieldValue.getFullYear (),
				     nStartYear,
				     nEndYear);

  return strHTMLout;
}

function getMessageForm_frm_disc
(
 strActionPath,
 strButtonLabel,
 strURLTarget
)
{
  this.setFormName (config.FORM_MessageFormName);
  var strHTMLout = "";
  strHTMLout += ASPFHTML.FORM_open (strActionPath, undefined_disc, this.getFormName (), strURLTarget);
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldMessageID, this.getMessageID ());
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldParentID, this.getParentID ());
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldThreadID, this.getThreadID ());
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldSortCode, this.getSortCode ());
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldHiddenEmailOnResponse,
				       this.getEmailParentOnResponse ());

  strHTMLout += ASPFHTML.TABLE_open (config.ADMINSETTING_TableBorderSize,
				     config.ADMINSETTING_TableFullWidth,
				     undefined_disc,
				     undefined_disc,
				     0,
				     0);

  strHTMLout += this.getUserInfoSubform ();

  strHTMLout += this.getSubjectSubform ();

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

  strHTMLout += this.getBodySubform ();

  strHTMLout += this.getEmailResponsesSubform ();

  strHTMLout += ASPFHTML.TR_open ();
  strHTMLout += ASPFHTML.TD_open (config.ADMINSETTING_TableFullWidth,
				  undefined_disc,
				  undefined_disc,
				  undefined_disc,
				  "bottom",
				  2);
  strHTMLout += ASPFHTML.INPUT_submit (strButtonLabel,
				       strButtonLabel);
  strHTMLout += ASPFHTML.TD_close ();
  strHTMLout += ASPFHTML.TR_close ();
  strHTMLout += ASPFHTML.TABLE_close ();
  strHTMLout += ASPFHTML.FORM_close ();

  return strHTMLout;
}

function getSearchForm_frm_disc
(
 strLabel
)
{
  this.setFormName (config.FORM_SearchFormName);
  var strHTMLout = "";
  strHTMLout = ASPFHTML.FORM_open (config.getSearchPagePath (),
				   undefined_disc,
				   this.getFormName (),
				   config.ADMINSETTING_SearchPageTarget);
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormSearch);
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldSearchString,
				     this.getSearchString (),
				     "25");
  strHTMLout += ASPFHTML.INPUT_submit (strLabel, strLabel);
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.FORM_close ();

  return strHTMLout;
}

function getSmallSearchForm_frm_disc
(
 strLabel
)
{
  this.setFormName (config.FORM_SearchFormName);

  var strHTMLout = "";
  strHTMLout += ASPFHTML.FORM_open (config.getSearchPagePath (),
				    undefined_disc,
				    this.getFormName (),
				    config.ADMINSETTING_SearchPageTarget);
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormSearchSmall);
  strHTMLout += config.USERTEXT_SEARCH_SmallSearchPrefix.weakSmall ();
  strHTMLout += ASPFHTML.BR ();
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldSearchString,
				     this.getSearchString (),
				     "10");
  strHTMLout += ASPFHTML.SPAN_close ();
  strHTMLout += ASPFHTML.FORM_close ();

  return strHTMLout;
}

function getArchiveSelector_frm_disc
(
)
{
  var dtCurrentDate = new Date ();
  var nCurrentYear = dtCurrentDate.getFullYear ();

  this.setFormName (config.FORM_ArchiveFormName);

  var strHTMLout = "";
  strHTMLout += ASPFHTML.FORM_open (config.getArchivePagePath (),
				    "get",
				    this.getFormName (),
				    config.ADMINSETTING_ArchivePageTarget);
  strHTMLout += this.getMonthYearSubform (this.getArchiveDate (),
					  config.FORM_FieldArchiveDate,
					  config.ADMINSETTING_ArchiveBeginYear,
					  nCurrentYear);
  strHTMLout += ASPFHTML.INPUT_submit (undefined_disc, config.USERTEXT_ARCHIVE_ShowResults);
  strHTMLout += ASPFHTML.FORM_close ();

  return strHTMLout;
}

function getAdminForm_frm_disc
(
)
{
  this.setFormName (config.FORM_AdminDeleteFormName);

  var strHTMLout = "";
  strHTMLout += ASPFHTML.FORM_open (config.getAdminPagePath (),
				    undefined_disc,
				    this.getFormName (),
				    config.ADMINSETTING_AdminPageTarget);
  strHTMLout += ASPFHTML.INPUT_submit (config.USERTEXT_SQL_DeleteHierarchyButton,
				       config.USERTEXT_SQL_DeleteHierarchyButton);
  strHTMLout += ASPFHTML.NBSP ();
  strHTMLout += ASPFHTML.INPUT_text (config.FORM_FieldMessageIDToDelete, "", 10);
  strHTMLout += ASPFHTML.FORM_close ();

  this.setFormName (config.FORM_AdminPurgeFormName);

  strHTMLout += ASPFHTML.FORM_open (config.getAdminPagePath (),
				    undefined_disc,
				    this.getFormName (),
				    config.ADMINSETTING_AdminPageTarget);
  strHTMLout += ASPFHTML.INPUT_hidden (config.FORM_FieldPurgeCache,
				       config.FORM_CheckboxTrue);
  strHTMLout += ASPFHTML.INPUT_submit (config.USERTEXT_SQL_PurgeCacheButton,
				       config.USERTEXT_SQL_PurgeCacheButton);
  strHTMLout += ASPFHTML.FORM_close ();

  this.setFormName (config.FORM_AdminSQLFormName);

  strHTMLout += ASPFHTML.FORM_open (config.getAdminPagePath (),
				    undefined_disc,
				    this.getFormName (),
				    config.ADMINSETTING_AdminPageTarget);
  strHTMLout += ASPFHTML.TEXTAREA_open (config.FORM_FieldSQLStatement,
					config.ADMINSETTING_TextAreaCols,
					config.ADMINSETTING_TextAreaRows);
  strHTMLout += this.getSQLStatement ();
  strHTMLout += ASPFHTML.TEXTAREA_close ();
  strHTMLout += ASPFHTML.BR ();
  strHTMLout += ASPFHTML.INPUT_submit (config.USERTEXT_SQL_ExecutePrompt,
				       config.USERTEXT_SQL_ExecutePrompt);
  strHTMLout += ASPFHTML.FORM_close ();

  return strHTMLout;
}

function getDateElement_frm_disc
(
 strFieldName,
 strFieldValue
)
{
  var strHTMLout = "";
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormDateElement);
  strHTMLout += ASPFHTML.SELECT_open (strFieldName + config.FORM_FieldDateDaySuffix);
  for (var nCounter = 1; nCounter < 32; nCounter++)
    {
      strHTMLout += ASPFHTML.OPTION (nCounter, (nCounter == strFieldValue));
      strHTMLout += nCounter + Date.getDateSuffixByIndex (nCounter);
    }

  strHTMLout += ASPFHTML.SELECT_close ();
  strHTMLout += ASPFHTML.SPAN_close ();

  return strHTMLout;
}

function getMonthElement_frm_disc
(
 strFieldName,
 strFieldValue
)
{
  var strHTMLout = "";
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormMonthElement);
  strHTMLout += ASPFHTML.SELECT_open (strFieldName + config.FORM_FieldDateMonthSuffix);
  for (var nCounter = 0; nCounter < 12; nCounter++)
    {
      strHTMLout += ASPFHTML.OPTION (nCounter, (nCounter == strFieldValue));
      strHTMLout += Date.getMonthNameByIndex (nCounter);
    }

  strHTMLout += ASPFHTML.SELECT_close ();
  strHTMLout += ASPFHTML.SPAN_close ();

  return strHTMLout;
}

function getYearElement_frm_disc
(
 strFieldName,
 strFieldValue,
 nStartYear,
 nEndYear
)
{
  var strHTMLout = "";
  strHTMLout += ASPFHTML.SPAN_open (config.ADMINSETTING_CSSClassFormYearElement);
  strHTMLout += ASPFHTML.SELECT_open (strFieldName + config.FORM_FieldDateYearSuffix);
  for (var nCounter = nStartYear; nCounter < (nEndYear + 1); nCounter++)
    {
      strHTMLout += ASPFHTML.OPTION (nCounter, (nCounter == strFieldValue));
      strHTMLout += nCounter;
    }

  strHTMLout += ASPFHTML.SELECT_close ();
  strHTMLout += ASPFHTML.SPAN_close ();

  return strHTMLout;
}

function interpretDateSubform_frm_disc
(
 objForm,
 strFieldName
)
{
  var dtFieldDate;

  if (isDefined_disc (objForm (strFieldName + config.FORM_FieldDateMonthSuffix)))
    {
      var nDateValue = safeNumberDereference_disc (String (objForm (strFieldName + config.FORM_FieldDateDaySuffix)));
      var nMonthValue = safeNumberDereference_disc (String (objForm (strFieldName + config.FORM_FieldDateMonthSuffix)));
      var nYearValue = safeNumberDereference_disc (String (objForm (strFieldName + config.FORM_FieldDateYearSuffix)));
      dtFieldDate = new Date (config.SYS_SafeDefaultDate);
      dtFieldDate.setYear (nYearValue);
      dtFieldDate.setMonth (nMonthValue);
      dtFieldDate.setDate (nDateValue);
    }

  return dtFieldDate;
}

function interpretMonthYearSubform_frm_disc
(
 objForm,
 strFieldName
)
{
  var dtFieldDate;

  if (isDefined_disc (String (objForm (strFieldName + config.FORM_FieldDateMonthSuffix))))
    {
      var nMonthValue = safeNumberDereference_disc (String (objForm (strFieldName + config.FORM_FieldDateMonthSuffix)));
      var nYearValue = safeNumberDereference_disc (String (objForm (strFieldName + config.FORM_FieldDateYearSuffix)));
      dtFieldDate = new Date (config.SYS_SafeDefaultDate);
      dtFieldDate.setYear (nYearValue);
      dtFieldDate.setMonth (nMonthValue);
      dtFieldDate.setDate (1);
    }

  return dtFieldDate;
}

ASPFForm.prototype.getMessageID = getMessageID_frm_disc;
ASPFForm.prototype.setMessageID = setMessageID_frm_disc;
ASPFForm.prototype.getSubject = getSubject_frm_disc;
ASPFForm.prototype.setSubject = setSubject_frm_disc;
ASPFForm.prototype.getBody = getBody_frm_disc;
ASPFForm.prototype.setBody = setBody_frm_disc;
ASPFForm.prototype.getSortCode = getSortCode_frm_disc;
ASPFForm.prototype.setSortCode = setSortCode_frm_disc;
ASPFForm.prototype.getParentID = getParentID_frm_disc;
ASPFForm.prototype.setParentID = setParentID_frm_disc;
ASPFForm.prototype.getThreadID = getThreadID_frm_disc;
ASPFForm.prototype.setThreadID = setThreadID_frm_disc;
ASPFForm.prototype.getEmailParentOnResponse = getEmailParentOnResponse_frm_disc;
ASPFForm.prototype.setEmailParentOnResponse = setEmailParentOnResponse_frm_disc;
ASPFForm.prototype.getSearchString = getSearchString_frm_disc;
ASPFForm.prototype.setSearchString = setSearchString_frm_disc;
ASPFForm.prototype.getSQLStatement = getSQLStatement_frm_disc;
ASPFForm.prototype.setSQLStatement = setSQLStatement_frm_disc;
ASPFForm.prototype.getFormName = getFormName_frm_disc;
ASPFForm.prototype.setFormName = setFormName_frm_disc;
ASPFForm.prototype.getMessageIDToDelete = getMessageIDToDelete_frm_disc;
ASPFForm.prototype.setMessageIDToDelete = setMessageIDToDelete_frm_disc;
ASPFForm.prototype.getSwitchEditableUserInfo = getSwitchEditableUserInfo_frm_disc;
ASPFForm.prototype.setSwitchEditableUserInfo = setSwitchEditableUserInfo_frm_disc;
ASPFForm.prototype.getAuthorName = getAuthorName_frm_disc;
ASPFForm.prototype.setAuthorName = setAuthorName_frm_disc;
ASPFForm.prototype.getAuthorEmail = getAuthorEmail_frm_disc;
ASPFForm.prototype.setAuthorEmail = setAuthorEmail_frm_disc;
ASPFForm.prototype.getAuthorFullname = getAuthorFullname_frm_disc;
ASPFForm.prototype.setAuthorFullname = setAuthorFullname_frm_disc;
ASPFForm.prototype.getArchiveDate = getArchiveDate_frm_disc;
ASPFForm.prototype.setArchiveDate = setArchiveDate_frm_disc;
ASPFForm.prototype.getPurgeCache = getPurgeCache_frm_disc;
ASPFForm.prototype.setPurgeCache = setPurgeCache_frm_disc;

ASPFForm.prototype.setAllFields = setAllFields_frm_disc;
ASPFForm.prototype.setAllFieldsFromForm = setAllFieldsFromForm_frm_disc;
ASPFForm.prototype.setAllFieldsFromMessage = setAllFieldsFromMessage_frm_disc;
ASPFForm.prototype.setAllFieldsEmpty = setAllFieldsEmpty_frm_disc;
ASPFForm.prototype.getSubjectInputField = getSubjectInputField_frm_disc;
ASPFForm.prototype.getBodyInputField = getBodyInputField_frm_disc;
ASPFForm.prototype.getSubjectSubform = getSubjectSubform_frm_disc;
ASPFForm.prototype.getBodySubform = getBodySubform_frm_disc;
ASPFForm.prototype.getEmailResponsesSubform = getEmailResponsesSubform_frm_disc;
ASPFForm.prototype.getNonEditableUserInfoSubform = getNonEditableUserInfoSubform_frm_disc;
ASPFForm.prototype.getEditableUserInfoSubform = getEditableUserInfoSubform_frm_disc;
ASPFForm.prototype.getDateSubform = getDateSubform_frm_disc;
ASPFForm.prototype.getMonthYearSubform = getMonthYearSubform_frm_disc;
ASPFForm.prototype.getUserInfoSubform = getUserInfoSubform_frm_disc;
ASPFForm.prototype.getMessageForm = getMessageForm_frm_disc;
ASPFForm.prototype.getSearchForm = getSearchForm_frm_disc;
ASPFForm.prototype.getSmallSearchForm = getSmallSearchForm_frm_disc;
ASPFForm.prototype.getArchiveSelector = getArchiveSelector_frm_disc;
ASPFForm.prototype.getAdminForm = getAdminForm_frm_disc;
ASPFForm.prototype.getDateElement = getDateElement_frm_disc;
ASPFForm.prototype.getMonthElement = getMonthElement_frm_disc;
ASPFForm.prototype.getYearElement = getYearElement_frm_disc;
ASPFForm.prototype.interpretDateSubform = interpretDateSubform_frm_disc;
ASPFForm.prototype.interpretMonthYearSubform = interpretMonthYearSubform_frm_disc;
</SCRIPT>

