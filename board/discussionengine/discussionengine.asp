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
// Global variables - yuk!
// ======================================================================
var currentMessage_disc;

var currentUsername_disc = "Name Unset";

var currentUserFullName_disc = "Unset";

var currentUserEmailAddress_disc = "unset@unset.com";

var isAdministrator_disc = false;

var config = new ASPFConfig ("");

var undefined_disc;

// ======================================================================
// CONSTANTS - well, pseudo-constants really...
// ======================================================================
var ASPF_FORM_OBJECT_TYPE_DISC = 100;
var ASPF_MESSAGE_OBJECT_TYPE_DISC = 101;
var ASPF_RECORDSET_OBJECT_TYPE_DISC = 102;

// ======================================================================
//
// The TRIVIAL interface.
//
// These functions are the simple objects users add to their HTML docs.
// They're a bit simplistic, but their trivially easy to use.
//
// None of them take parameters, and they directly output the object -
// they don't return a string.
//
// ======================================================================

function FORUM_LINK_DISC
(
)
{
  ASPFPageElement.showForumLink ();
  return;
}

function PARENT_MESSAGE_LINK_DISC
(
)
{
  ASPFPageElement.showParentMessageLink ();
  return;
}

function SEARCH_FORM_DISC
(
)
{
  ASPFPageElement.showSearchForm ();
  return;
}

function SMALL_SEARCH_FORM_DISC
(
)
{
  ASPFPageElement.showSmallSearchForm ();
  return;
}

function NEW_POST_BUTTON_DISC
(
)
{
  ASPFPageElement.showNewPostButton ();
  return;
}

function NEW_POST_LINK_DISC
(
)
{
  ASPFPageElement.showNewPostLink ();
  return;
}

function NEW_REPLY_BUTTON_DISC
(
)
{
  ASPFPageElement.showNewReplyButton ();
  return;
}

function EDIT_POST_BUTTON_DISC
(
)
{
  ASPFPageElement.showEditPostButton ();
  return;
}

function ALL_ROOT_POSTS_DISC
(
)
{
  ASPFPageElement.showAllThreads ();
  return;
}

function ALL_ROOT_POSTS_THREADED_DISC
(
)
{
  ASPFPageElement.showAllThreads ();
  return;
}

function CURRENT_POSTS_THREADED_DHTML_DISC
(
)
{
  ASPFPageElement.showCurrentThreads ();
  return;
}

function CURRENT_ROOT_POSTS_THREADED_DISC
(
)
{
  ASPFPageElement.showCurrentThreads ();
  return;
}

function CURRENT_ROOT_POSTS_THREADED_STATIC_DISC
(
)
{
  ASPFPageElement.showCurrentThreadsStatic ();
  return;
}

function NEW_POST_FORM_DISC
(
)
{
  ASPFPageElement.showNewPostForm ();
  return;
}

function EDIT_POST_FORM_DISC
(
)
{
  ASPFPageElement.showEditPostForm ();
  return;
}

function ARCHIVE_LINK_DISC
(
)
{
  ASPFPageElement.showArchiveLink ();
  return;
}

function ARCHIVE_SELECTOR_DISC
(
)
{
  ASPFPageElement.showArchiveSelector ();
  return;
}

function ARCHIVE_RESULTS_DISC
(
)
{
  ASPFPageElement.actionShowArchive ();
  return;
}

function ARCHIVE_DISC
(
)
{
  ASPFPageElement.showArchive ();
  return;
}

function SEARCH_RESULTS_DISC
(
)
{
  ASPFPageElement.actionSearch ();
  return;
}

function POST_MESSAGE_DISC
(
)
{
  ASPFPageElement.actionSaveNewMessage ();
  return;
}

function SAVE_EDITED_MESSAGE_DISC
(
)
{
  ASPFPageElement.actionSaveUpdatedMessage ();
  return;
}

function MESSAGE_DISC
(
)
{
  ASPFPageElement.showCurrentMessage ();
  return;
}

function THREAD_DISC
(
)
{
  ASPFPageElement.showCurrentThread ();
  return;
}

function ADMIN_TOOLS_DISC
(
)
{
  ASPFPageElement.showAdminSQLForm ();
  ASPFPageElement.actionExecuteAdminSQL ();
  return;
}

function STD_MESSAGE_DISC
(
)
{
  ASPFPageElement.showStandardMessage ();
  return;
}

function FORUM_TITLE_DISC
(
)
{
  ASPFPageElement.showForumTitle ();
  return;
}

function SUBJECT_DISC
(
)
{
  ASPFPageElement.showMessageSubject ();
  return;
}

function MESSAGE_BODY_DISC
(
)
{
  ASPFPageElement.showMessageBody ();
  return;
}

function AUTHOR_DISC
(
)
{
  ASPFPageElement.showMessageAuthorName ();
  return;
}

function AUTHOR_EMAIL_DISC
(
)
{
  ASPFPageElement.showMessageAuthorEmail ();
  return;
}

function AUTHOR_FULL_NAME_DISC
(
)
{
  ASPFPageElement.showMessageAuthorFullname ();
  return;
}

function DATE_CREATED_DISC
(
)
{
  ASPFPageElement.showMessageDateCreated ();
  return;
}

function DATE_MODIFIED_DISC
(
)
{
  ASPFPageElement.showMessageDateModified ();
  return;
}

function SORT_CODE_DISC
(
)
{
  ASPFPageElement.showMessageSortCode ();
  return;
}

function NUM_CHILDREN_DISC
(
)
{
  ASPFPageElement.showMessageNumChildren ();
  return;
}

function MESSAGE_ID_DISC
(
)
{
  ASPFPageElement.showMessageID ();
  return;
}

function PARENT_ID_DISC
(
)
{
  ASPFPageElement.showMessageParentID ();
  return;
}

function THREAD_ID_DISC
(
)
{
  ASPFPageElement.showMessageThreadID ();
  return;
}

function CLEANUP_DISC
(
)
{
  var dbDatabase = new ASPFDatabase ();
  dbDatabase.cleanup ();

  if (config.CACHE_PurgeOnPageCleanup)
    {
      var cchRecordCache = new ASPFCache ();
      cchRecordCache.purge ();

      delete cchRecordCache;
    }

  delete dbDatabase;
  delete config;
  delete currentMessage_disc;
  return;
}

//=======================================================================
//
// Some global helper functions.  Some of these should have been built into
// the language if you ask me...
//
//=======================================================================

function isUndefined_disc
(
 JSvariable
)
{
  var bIsUndefined;

  if ("object" == typeof (JSvariable))
    {
      bIsUndefined = false;
    }
  else
    {
      bIsUndefined = (String (JSvariable).valueOf () == "undefined" ? true : false);
    }

  return bIsUndefined;
}

function isDefined_disc
(
 JSvariable
)
{
  return !isUndefined_disc (JSvariable);
}

function safeStringDereference_disc
(
 JSvariable
)
{
  return (isUndefined_disc (String (JSvariable)) ? "" : String (JSvariable));
}

function safeNumberDereference_disc
(
 JSvariable
)
{
  return (isUndefined_disc (JSvariable) ? "0" : JSvariable);
}

function isCurrentPage_disc
(
 strURLToCheck
)
{
  var bURLIsCurrentPage = false;
  var strCurrentPage = String (Request.ServerVariables ("PATH_INFO"));

  var strURLToCheckUC = strURLToCheck.toUpperCase ();
  var strCurrentPageUC = strCurrentPage.toUpperCase ();

  if ((strURLToCheckUC == strCurrentPageUC) || ((strURLToCheckUC + "DEFAULT.ASP") == strCurrentPageUC))
    {
      bURLIsCurrentPage = true;
    }

  return bURLIsCurrentPage;
}

</SCRIPT>

<!-- #INCLUDE file="cacheobj.asp"-->
<!-- #INCLUDE file="configobj.asp"-->
<!-- #INCLUDE file="databaseobj.asp"-->
<!-- #INCLUDE file="dateobj.asp"-->
<!-- #INCLUDE file="errorobj.asp"-->
<!-- #INCLUDE file="emailobj.asp"-->
<!-- #INCLUDE file="expandcollapseobj.asp"-->
<!-- #INCLUDE file="formobj.asp"-->
<!-- #INCLUDE file="htmlobj.asp"-->
<!-- #INCLUDE file="messageobj.asp"-->
<!-- #INCLUDE file="pageobj.asp"-->
<!-- #INCLUDE file="stringobj.asp"-->
<!-- #INCLUDE file="textcontrolobj.asp"-->
<!-- #INCLUDE file="threadobj.asp"-->
<!-- #INCLUDE file="viewobj.asp"-->