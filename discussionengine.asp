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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
// Global variables - yuk!
// ======================================================================
var currentMessage_disc;

var currentUsername_disc = 'Name Unset';

var currentUserFullName_disc = 'Unset';

var currentUserEmailAddress_disc = 'unset@unset.com';

var isAdministrator_disc = false;

var monthName_disc;

var dayName_disc;

var daySuffix_disc;

var config = new ForumConfig('');

var DBConnection_disc = '';

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

function FORUM_LINK_DISC ()
{
	showVersion ();

	var link = getForumLinkWithText_disc (config.postForumLinkPrefix + config.forumName);
	link = link.weak ();
	link = link.paragraph();
	link.show ();
}

function PARENT_MESSAGE_LINK_DISC ()
{
	showVersion ();

	parentMessageLinkWithText_disc (config.postPreviousMessageLinkText);
}

function SEARCH_FORM_DISC ()
{
	showVersion ();

	searchFormWithText_disc (config.searchSubmitButton);
}

function SMALL_SEARCH_FORM_DISC ()
{
	showVersion ();

	smallSearchFormWithText_disc (config.searchSmallSearchPrefix);
}

function NEW_POST_BUTTON_DISC ()
{
	showVersion ();

	newPostButtonWithText_disc (config.showMsgNewPostButton);
}

function NEW_POST_LINK_DISC ()
{
	showVersion ();

	newPostLinkWithText_disc (config.showMsgNewPostButton);
}

function NEW_REPLY_BUTTON_DISC ()
{
	showVersion ();

	newReplyButtonWithText_disc (config.showMsgReplyPostButton);
}

function EDIT_POST_BUTTON_DISC ()
{
	editMessageButtonWithText_disc (config.showMsgEditPostButton);
}

function ALL_ROOT_POSTS_DISC ()
{
	showVersion ();

	showAllThreadsSorted_disc (config.switchViewPostsAscending);
}

function ALL_ROOT_POSTS_THREADED_DISC ()
{
	showVersion ();

	showAllThreadsSorted_disc (config.switchViewPostsAscending);
}

function CURRENT_POSTS_THREADED_DHTML_DISC ()
{
	showVersion ();

	var expandTokensPresent = ('' + Request.QueryString ('expand') == 'undefined') ? false : true;
	var collapseTokensPresent = ('' + Request.QueryString ('collapse') == 'undefined') ? false : true;

	if ((expandTokensPresent) || (collapseTokensPresent))
	{
		showCurrentThreadsSorted_disc (config.switchViewPostsAscending);
	}
	else
	{
		showCurrentThreadsSortedDHTML_disc (config.switchViewPostsAscending);
	}
}

function CURRENT_ROOT_POSTS_THREADED_DISC ()
{
	showVersion ();

	showCurrentThreadsSorted_disc (config.switchViewPostsAscending);
}

function NEW_POST_FORM_DISC ()
{
	showVersion ();

	showPostForm_disc ();
}

function EDIT_POST_FORM_DISC ()
{
	showVersion ();

	showEditPostForm_disc ();
}

function SEARCH_RESULTS_DISC ()
{
	showVersion ();

	searchAndShowResults_disc ();
}

function POST_MESSAGE_DISC ()
{
	showVersion ();

	postMessageWithText_disc (config.postPostSuccessful, config.postPostFailedPrefix);
}

function SAVE_EDITED_MESSAGE_DISC ()
{
	showVersion ();

	updateMessageWithText_disc (config.postUpdateSuccessful, config.postUpdateFailedPrefix);
}

function MESSAGE_DISC ()
{
	showVersion ();

	showCurrentMessage_disc ();
}

function THREAD_DISC ()
{
	showVersion ();

	showCurrentThreadAlone_disc ();
}

function ADMIN_TOOLS_DISC ()
{
	showVersion ();

	ADMIN_SQL_FORM_DISC ();
	ADMIN_SQL_EXECUTE_DISC ();
}

function STD_MESSAGE_DISC ()
{
	showVersion ();

	MESSAGE_DISC ();

	FORUM_LINK_DISC ();

	var table = '<TABLE BORDER="0"><TR><TD>';
	table.show ();

	NEW_REPLY_BUTTON_DISC ();

	table = '</TD><TD>';
	table.show ();

	if (config.switchShowNewPostButtonOnMessage == true)
	{
		NEW_POST_BUTTON_DISC ();
	}

	table = '</TD><TD>';
	table.show ()

	EDIT_POST_BUTTON_DISC ();

	table = '</TD></TR></TABLE>';
	table.show ();
}

// ======================================================================
//
// The NOT-QUITE-SO-TRIVIAL interface.
//
// Again there's nothing too complicated here.  These are basic controls
// that output the requested message field.
//
// And again, no comments!
//
// ======================================================================

function FORUM_TITLE_DISC ()
{
	setCurrentMessage_disc ();

	config.forumName.show ();
}

function SUBJECT_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.subject.show ();
}

function MESSAGE_BODY_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.body.show ();
}

function AUTHOR_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.authorName.show ();
}

function AUTHOR_EMAIL_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.authorEmail.show ();
}

function AUTHOR_FULL_NAME_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.authorFullname.show ();
}

function DATE_CREATED_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.dateCreated.show ();
}

function SORT_CODE_DISC ()
{
	setCurrentMessage_disc ();

	currentMessage_disc.sortCode.show ();
}

function NUM_CHILDREN_DISC ()
{
	setCurrentMessage_disc ();

	String (currentMessage_disc.numChildren).show ();
}

function MESSAGE_ID_DISC ()
{
	setCurrentMessage_disc ();

	String (currentMessage_disc.messageID).show ();
}

function PARENT_ID_DISC ()
{
	setCurrentMessage_disc ();

	String (currentMessage_disc.parentID).show ();
}

function THREAD_ID_DISC ()
{
	setCurrentMessage_disc ();

	String (currentMessage_disc.threadID).show ();
}

function ADMIN_SQL_FORM_DISC ()
{
	showAdminSQLForm_disc ();
}

function ADMIN_SQL_EXECUTE_DISC ()
{
	executeAdminSQL_disc ();
}

function showVersion ()
{
	var versionRef = '\n<' + '!-- GENERATED BY: ' + config.currentVersionReference + ' -->\n';
	versionRef.show ();
}

function getForumLink_disc (textToUse)
{
	return getForumLinkWithText_disc (config.postForumLinkPrefix + config.forumName);
}

function getForumLinkWithText_disc (textToUse)
{
	return '<A HREF="' + config.pageMainPreferredFullPath + '" TITLE="' + config.forumName + '">' + textToUse + '</A>';
}

function getSubject_disc ()
{
	setCurrentMessage_disc ();

	return String (currentMessage_disc.subject);
}

// ======================================================================
//
// The EVEN-LESS-TRIVIAL interface.
//
// These are the forum objects/components in the trivial interface, but
// this time they're customisable in that you can supply the text that is
// used.
//
// ======================================================================

function searchFormWithText_disc (textToUse)
{
	var searchForm = new ForumForm (Request.Form);
	searchForm.showSearchForm (textToUse);
}

function smallSearchFormWithText_disc (textToUse)
{
	var searchForm = new ForumForm (Request.Form);
	searchForm.showSmallSearchForm (textToUse);
}

function newPostButtonWithText_disc (textToUse)
{
	var postButton;
	postButton = '<FORM ACTION="' + config.pageNewPostFullPath + '" METHOD="POST"><INPUT TYPE="SUBMIT" VALUE="' + textToUse + '"></FORM>';

	postButton.show ();
}

function newPostLinkWithText_disc (textToUse)
{
	return '<A HREF="' + config.pageNewPostFullPath + '">' + textToUse + '</A>';
}

function newReplyButtonWithText_disc (textToUse)
{
	newReplyButtonWithTextWithMessage_disc (textToUse, currentMessage_disc);
}

function newReplyButtonWithTextWithMessage_disc (textToUse, message)
{
	var newReplyButton;
	newReplyButton = getNewReplyButtonWithTextWithMessage_disc (textToUse, message);

	newReplyButton.show ();
}

function getNewReplyButtonWithTextWithMessage_disc (textToUse, message)
{
	var newReplyButton;
	newReplyButton = '<FORM ACTION="' + config.pageNewPostFullPath + '" METHOD="POST">';

	newReplyButton += '<INPUT TYPE="hidden" NAME="parentID" VALUE="' + message.messageID + '">';
	newReplyButton += '<INPUT TYPE="hidden" NAME="threadID" VALUE="' + message.threadID + '">';
	newReplyButton += '<INPUT TYPE="hidden" NAME="sortCode" VALUE="' + message.sortCode + '">';
	newReplyButton += '<INPUT TYPE="hidden" NAME="subject" VALUE="' + message.subject + '">';
	newReplyButton += '<INPUT TYPE="submit" VALUE="' + textToUse + '"></FORM>';

	return newReplyButton;
}

function editMessageButtonWithText_disc (textToUse)
{
	editPostButtonWithText_disc (textToUse, currentMessage_disc)
}

function editPostButtonWithText_disc (textToUse, message)
{
	var editButton;

	if (((message.authorName == currentUsername_disc) && (config.switchAllowUserEditing == true)) || isAdministrator_disc)
	{
		editButton = '<FORM ACTION="' + config.pageEditPostFullPath + '" METHOD="post">';
		editButton += '<INPUT TYPE="hidden" NAME="messageID" VALUE="' + message.messageID + '">';
		editButton += '<INPUT TYPE="submit" VALUE="' + textToUse + '"></FORM>';

		editButton.show ();
	}
}

function showAdminSQLForm_disc ()
{
	var prompt = '<P>Enter your SQL queries or updates below:</P>';
	prompt.show ();

	var adminForm = new ForumForm (Request.Form);
	adminForm.showAdminForm ();
}

function postMessageWithText_disc (successfulMessage, failedMessage)
{
	postMessage_disc (successfulMessage, failedMessage)
}

function updateMessageWithText_disc (successfulMessage, failedMessage)
{
	updateMessage_disc (successfulMessage, failedMessage)
}

function setCurrentMessage_disc ()
{
	if (currentMessage_disc == null)
	{
		if (!isNaN (Request.QueryString('messageID')))
		{
			var dBase = new ForumDatabase ();
			currentMessage_disc = dBase.getRecordByID (Request.QueryString('messageID'));
		}
	}
}

// ======================================================================
//
// Start with the public "show" functions.  These are primarily focused on
// outputting the information or actions to the user.
//
// ======================================================================

function showCurrentMessage_disc ()
{
	setCurrentMessage_disc ();

	showMessage_disc (currentMessage_disc);
}

function showAllRootSubjectsSortAscending_disc ()
{
	showAllThreadsSorted_disc (true);
}

function showAllRootSubjectsSortDescending_disc ()
{
	showAllThreadsSorted_disc (false);
}

function showAllThreadsSorted_disc (asc)
{
	var currentMessageID;
	if (currentMessage_disc == null)
	{
		currentMessageID = 0;
	}
	else
	{
		currentMessageID = currentMessage_disc.messageID;
	}

	var currentMessages = new ForumThread (currentMessageID);
	currentMessages.showAllSorted (asc);
}

function showCurrentThreadsSorted_disc (asc)
{
	var currentMessageID;
	if (currentMessage_disc == null)
	{
		currentMessageID = 0;
	}
	else
	{
		currentMessageID = currentMessage_disc.messageID;
	}

	var currentMessages = new ForumThread (currentMessageID);
	currentMessages.showCurrentSorted (asc);
}

function showCurrentThreadsSortedDHTML_disc (asc)
{
	var currentMessageID;
	if (currentMessage_disc == null)
	{
		currentMessageID = 0;
	}
	else
	{
		currentMessageID = currentMessage_disc.messageID;
	}

	var currentMessages = new ForumThread (currentMessageID);
	currentMessages.showCurrentSortedDHTML (asc);
}

function showCurrentThreadAlone_disc ()
{
	setCurrentMessage_disc ();

	showThread_disc (currentMessage_disc.threadID);
}

function showFullThread_disc (threadID, activeThreadID, activeMessageID, showExpandCollapse)
{
	if (threadID != '')
	{
		showAllThreadMessages_disc (threadID, activeThreadID, activeMessageID, showExpandCollapse);
	}
	else
	{
		(FORUM_NO_MESSAGES_TO_SHOW_DISC + '<BR>').weak ().show();
	}
}

// ======================================================================
//
// !!! PRIVATE ROUTINES !!!
//
// These should _never_ normally be called by anything outside this file.
// They're for our internal use only, and bad things could happen if
// they're not used correctly.
//
// ======================================================================

function showThread_disc (threadID)
{
	var currentMessageID;
	if (currentMessage_disc == null)
	{
		currentMessageID = 0;
	}
	else
	{
		currentMessageID = currentMessage_disc.messageID;
	}

	var expandedThread = new ForumThread (currentMessageID);
	expandedThread.showFullThread (threadID)
}

function showPostForm_disc ()
{
	var newMessageForm = new ForumForm (Request.Form);
	var newMessage = newForumMessageFromForm_disc (newMessageForm);
	var subject = String (newMessage.subject).unformatFromStoring ();

	if ((subject != '') && (String (newMessage.threadID) != '') && (subject.substring(0, config.postReplySubjectPrefix.length) != config.postReplySubjectPrefix))
	{
		newMessage.subject = config.postReplySubjectPrefix + subject;
	}
	else
	{
		newMessage.subject = subject;
	}

	newMessageForm.showMessageForm (newMessage, config.pageNewPostActionFullPath, config.postSubmitButton)
}

function showEditPostForm_disc ()
{
	var newMessageForm = new ForumForm (Request.Form)
	var dbase = new ForumDatabase ()
	var newMessage = dbase.getRecordByID (newMessageForm.messageID)
	newMessageForm = newForumFormFromMessage_disc (newMessage);

	if ((newMessage.authorName == currentUsername_disc) || isAdministrator_disc)
	{
		newMessageForm.showMessageForm (newMessage, config.pageEditPostActionFullPath, config.postSaveChangesButton)
	}
	else
	{
		String (config.postNotAuthorisedToEditMessage).weak().show();
	}
}

function parentMessageLinkWithText_disc (textToUse)
{
	var messageForm = new ForumForm (Request.Form)
	var parentID = messageForm.parentID;
	if (parentID != 0)
	{
		var parentLink;
		parentLink = '<P><A HREF="' + config.pageShowMessageFullPath + '?messageID=' + parentID + '" TITLE="' + textToUse + '">' + textToUse.weak () + '</A></P>';
		parentLink.show ();
	}
}

function showMessage_disc (message)
{
	message.render ();
}

function searchAndShowResults_disc ()
{
	var searchForm = new ForumForm (Request.Form);
	var searchString = searchForm.searchString;

	if ('' != searchString)
	{
		var dBase = new ForumDatabase ();
		var foundMessages = dBase.searchForum (searchString);

		var searchResultsHeader;
		searchResultsHeader = config.searchResultsHeader1 + ('&#145;' + searchString + '&#146;').strong();
		searchResultsHeader += config.searchResultsHeader2 + String (foundMessages.RecordCount).strong();
		if (foundMessages.RecordCount == 0)
		{
			searchResultsHeader += config.searchResultsHeaderSuffix0Match + '<BR>';
		}
		else
		{
			if (foundMessages.RecordCount == 1)
			{
				searchResultsHeader += config.searchResultsHeaderSuffix1Match + '<BR>';
			}
			else
			{
				searchResultsHeader += config.searchResultsHeaderSuffixManyMatches + '<BR>';
			}
		}

		searchResultsHeader.show();

		var searchResults = '';
		if (!foundMessages.EOF)
		{
			var currentMessage;

			foundMessages.MoveFirst ();
			searchResults = '<OL>';

			while (!foundMessages.EOF)
			{
				currentMessage = new ForumMessage (foundMessages);

				searchResults += currentMessage.summarise();

				foundMessages.MoveNext ();
			}
			searchResults += '</OL>';
		}

		foundMessages.Close ();
		delete foundMessages;
		searchResults.show ();
	}
}

function postMessage_disc (successfulMessage, failedMessagePrefix)
{
	var newMessageForm = new ForumForm (Request.Form)
	var newMessage = newForumMessageFromForm_disc (newMessageForm)

	if (!newMessage.saveAsNewMessage(successfulMessage, failedMessagePrefix))
	{
		var invalidMessageForm = new ForumForm (Request.Form)
		showPostForm_disc (invalidMessageForm, config.pageNewPostActionFullPath);
	}

	currentMessage_disc = newMessage;

	return;
}

function updateMessage_disc (successfulMessage, failedMessagePrefix)
{
	var newMessageForm = new ForumForm (Request.Form)
	var newMessage = newForumMessageFromForm_disc (newMessageForm, config.pageEditPostActionFullPath)

	if (!newMessage.saveAsUpdatedMessage(successfulMessage, failedMessagePrefix))
	{
		var invalidMessageForm = new ForumForm (Request.Form)
		showEditPostForm_disc (invalidMessageForm, config.pageEditPostActionFullPath);
	}
}

</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// CONFIG OBJECT
//
// ======================================================================

ForumConfig.prototype.switchEditableUserInfo = switchEditableUserInfo_disc;
ForumConfig.prototype.setPaths = setPaths_disc;
ForumConfig.prototype.userPrefersHTMLMail = userPrefersHTMLMail_disc;
ForumConfig.prototype.userPrefersResponsesEmailed = userPrefersResponsesEmailed_disc;
ForumConfig.prototype.getDatabaseDSN = getDatabaseDSN_disc;

function ForumConfig ()
{
	this.currentVersion = '1.11';
	this.currentVersionReference = 'ASP Forums ' + this.currentVersion;
	this.databaseFilename = 'forum.mdb';

	var currentURL = String (Request.ServerVariables ('URL'));
	pathElements = currentURL.split ('/');
	filename = String (pathElements [pathElements.length - 1]);
	lengthOfFilename = filename.length;
	var virtualPath = currentURL.substring (0, currentURL.length - lengthOfFilename);

	this.databaseTable = '[Forum]';
	this.databaseDSN = "";
	this.daysMessagesActive = 28;
	this.forumName = 'Discussion Forum';
	this.siteURL = 'http://' + String (Request.ServerVariables ('HTTP_HOST'));

	this.emailAdminName = '';
	this.emailAdminAddress = '';

	this.emailAlertFromName = 'ASP Forums (unknown forum) auto-alert';
	this.emailAlertFromAddress = 'asp-auto-alert@aspforums.com';
	this.emailAlertSignature = '--\nThis message was generated by ASP Forums discussion software.\nVisit http://www.aspforums.com/ for further information.';
	this.emailAlertSignatureHTML = '<FONT FACE="Tahoma,Arial,Helvetica,Sans Serif" SIZE="-2"><P><HR width="80%" align="left"><P>This message was generated by <A HREF="http://www.aspforums.com/" TITLE="ASP Forums web site">ASP Forums discussion software</A>.<BR>&copy; Copyright 1999 ASP Forums. All rights reserved. Please read our <A href="http://www.aspforums.com/about/privacy/" TITLE="ASP Forums&#146; statement on privacy and use of personal information.">privacy policy</A> to see how we try to protect your privacy.</P></FONT>';

	this.switchAllowEmailResponses = true;
	this.switchShowEmailAddresses = true;
	this.switchAllowUserEditing = true;
	this.switchShowNewPostButtonOnMessage = true;
	this.switchViewPostsAscending = false;
	this.switchAllowRichFormatting = true;
	this.switchAllowRichFormattingImages = false;
	this.switchAllowHTMLEmail = true;

	this.fullTableWidth = 468;
	this.titleColumnWidth = 100;
	this.fieldColumnWidth = 368;
	this.maxTextAreaRows = 10;
	this.maxTextAreaCols = 55;

	this.expandAllThreads = false;
	this.expandFirstNThreads = '';
	this.showAtMostNRecords = 0;

	this.forumNoMessages = 'There are no messages to display.';

	this.forumNoRepliesTag = 'No&nbsp;replies';
	this.forumOneReplyTag = '&nbsp;reply';
	this.forumManyRepliesTag = '&nbsp;replies';

	this.separateSubjectAuthor = ' by ';
	this.separateAuthorDate = ' on ';

	this.popupSubjectPrefix = 'Open message: ';
	this.popupEmailPrefix = 'Email: ';
	this.popupExpandLink = '&#145;+&#146; Expand this thread';
	this.popupCollapseLink = '&#145;-&#146; Collapse this thread';

	this.showMsgNewPostButton = 'Post a new message';
	this.showMsgEditPostButton = 'Edit this post';
	this.showMsgReplyPostButton = 'Post a reply';
	this.showMsgPostedByPrompt = 'Posted&nbsp;by:';
	this.showMsgPostedOnPrompt = 'Posted on:';
	this.showMsgBodyPrompt = 'Message:';

	this.postUpdateFailedPrefix = 'Saving failed: ';
	this.postUpdateSuccessful = 'Your changes have been saved.';
	this.postPostFailedPrefix = 'Posting failed: ';
	this.postPostSuccessful = 'Your message has been posted.  Please do not refresh this page, since that will repost your message!';
	this.postForumLinkPrefix = 'Go back to ';
	this.postReplySubjectPrefix = 'Re: ';
	this.postPreviousMessageLinkText = 'Go back to the previous message.';
	this.postUsernamePrompt = '&nbsp;Username:';
	this.postFullnamePrompt = '&nbsp;Full Name:';
	this.postEmailAddressPrompt = '&nbsp;Email Address:';
	this.postPostedByPrompt = '&nbsp;Posted by:';
	this.postSubjectPrompt = '&nbsp;Subject:';
	this.postBodyPrompt = 'Message:';
	this.postEmailResponsesPrompt = 'Email me when someone responds to my post';
	this.postSubmitButton = 'Post Message';
	this.postSaveChangesButton = 'Save';
	this.postNotAuthorisedToEditMessage = 'You are not authorised to edit this message.';

	this.errorNoSubject = 'A subject is required for each post.';
	this.errorNoBody = 'A message is required for each post.';
	this.errorNoUsername = 'No username was supplied for posting.';
	this.errorNoName = 'No name was supplied for posting.';
	this.errorNoEmail = 'No email address was supplied for posting.';
	this.errorInvalidThreadID = 'An internal error (invalid thread ID) occurred.';
	this.errorInvalidParentID = 'An internal error (invalid parent ID) occurred.';

	this.warningUnverifiedEmail = 'WARNING: Email link created by poster.';
	this.warningUnverifiedImage = 'WARNING: Image embedded by poster.';
	this.warningUnverifiedLink = 'WARNING: URL created by poster.';

	this.searchSmallSearchPrefix = 'Keyword search forum:';
	this.searchSubmitButton = 'Search Forum';
	this.searchResultsHeader1 = 'Your search for ';
	this.searchResultsHeader2 = ' found ';
	this.searchResultsHeaderSuffix0Match = ' matches.';
	this.searchResultsHeaderSuffix1Match = ' match.';
	this.searchResultsHeaderSuffixManyMatches = ' matches.';
	this.searchResultsPrecisLength = 150;

	this.sqlExecutePrompt = 'Execute SQL';
	this.sqlResultsPrefix = 'Results:';
	this.sqlStatementPrefix = 'SQL statement: ';
	this.sqlVBSErrorsPrefix = 'VBScript errors occured:';
	this.sqlVBSErrorNumberPrompt = 'Error Number = ';
	this.sqlVBSErrorDescriptionPrompt = 'Error Description = ';
	this.sqlVBSErrorHelpContextPrompt = 'Help Context = ';
	this.sqlVBSErrorHelpPathPrompt = 'Help Path = ';
	this.sqlVBSErrorNativeErrorPrompt = 'Native Error = ';
	this.sqlVBSErrorSourcePrompt = 'Source = ';
	this.sqlVBSErrorSQLStatePrompt = 'SQL State = ';
	this.sqlVBSErrorNoErrorPrompt = 'No VBScript errors occured.';
	this.sqlDBErrorPrefix = 'Database errors occured:';
	this.sqlDBErrorNumberPrompt = 'Error Number = ';
	this.sqlDBErrorDescriptionPrompt = 'Error description = ';
	this.sqlDBErrorNoErrorPrompt = 'No database errors occured.';
	this.sqlDeleteSuccessfulMessage = 'Deletion successful';
	this.sqlDeleteUnsuccessfulMessage = 'Deletion failed';
	this.sqlDeleteHierarchyButton = 'Delete Subthread From Message ID';

	this.mailAdminNewPostSubjectPrefix = 'New Post';
	this.mailAdminNewPostBodyPrefix = 'A new message by ';
	this.mailAdminNewPostSeparateNameForum = ' was posted in ';
	this.mailUserNewPostSeparateNameForum = ' has responded to your post in ';
	this.mailUserNewPostSeparateNameMessage = ' has responded to your message: ';
	this.mailUserNewPostNameSuffix = ' has responded to your message. ';
	this.mailUserNewPostMessagePrefix = 'The response reads: ';

	this.DBMaxSortcodeSize = 25;
	this.DBMaxSubjectSize = 100;
	this.DBMaxMessageSize = 2500;
	this.DBMaxUsernameSize = 50;
	this.DBMaxFullnameSize = 50;
	this.DBMaxEmailAddressSize = 50;

	this.viewExpandTag = 'expand';
	this.viewCollapseTag = 'collapse';
	this.viewCentreOnMessage = 'centreOnMessage-';

	this.pageMainLocalPath = 'default.asp';
	this.pageMainPreferredLocalPath = './';
	this.pageAdminLocalPath = 'admin.asp';
	this.pageNewPostLocalPath = 'newpost.asp';
	this.pageEditPostLocalPath = 'editpost.asp';
	this.pageNewPostActionLocalPath = 'newpostaction.asp';
	this.pageEditPostActionLocalPath = 'editpostaction.asp';
	this.pageSearchLocalPath = 'search.asp';
	this.pageShowMessageLocalPath = 'showmessage.asp';

	this.pageMainFullPath = virtualPath + this.pageMainLocalPath;
	this.pageMainPreferredFullPath = virtualPath;
	this.pageAdminFullPath = virtualPath + this.pageAdminLocalPath;
	this.pageNewPostFullPath = virtualPath + this.pageNewPostLocalPath;
	this.pageEditPostFullPath = virtualPath + this.pageEditPostLocalPath;
	this.pageNewPostActionFullPath = virtualPath + this.pageNewPostActionLocalPath;
	this.pageEditPostActionFullPath = virtualPath + this.pageEditPostActionLocalPath;
	this.pageSearchFullPath = virtualPath + this.pageSearchLocalPath;
	this.pageShowMessageFullPath = virtualPath + this.pageShowMessageLocalPath;

	this.useExpandCollapse = true;

	this.expandImage = 'plus.gif';
	this.expandImageWidth = 11;
	this.expandImageHeight = 11;
	this.collapseImage = 'minus.gif';
	this.collapseImageWidth = 11;
	this.collapseImageHeight = 11;
	this.noExpandImage = 'blank.gif';
	this.noExpandImageWidth = 11;
	this.noExpandImageHeight = 11;

	monthName_disc = new Array (12);
	monthName_disc [0] = 'January';
	monthName_disc [1] = 'February';
	monthName_disc [2] = 'March';
	monthName_disc [3] = 'April';
	monthName_disc [4] = 'May';
	monthName_disc [5] = 'June';
	monthName_disc [6] = 'July';
	monthName_disc [7] = 'August';
	monthName_disc [8] = 'September';
	monthName_disc [9] = 'October';
	monthName_disc [10] = 'November';
	monthName_disc [11] = 'December';

	dayName_disc = new Array (7);
	dayName_disc [0] = 'Sunday';
	dayName_disc [1] = 'Monday';
	dayName_disc [2] = 'Tuesday';
	dayName_disc [3] = 'Wednesday';
	dayName_disc [4] = 'Thursday';
	dayName_disc [5] = 'Friday';
	dayName_disc [6] = 'Saturday';

	daySuffix_disc = new Array (32);
	daySuffix_disc [0] = 'Error';
	daySuffix_disc [1] = 'st';
	daySuffix_disc [2] = 'nd';
	daySuffix_disc [3] = 'rd';
	daySuffix_disc [4] = 'th';
	daySuffix_disc [5] = 'th';
	daySuffix_disc [6] = 'th';
	daySuffix_disc [7] = 'th';
	daySuffix_disc [8] = 'th';
	daySuffix_disc [9] = 'th';
	daySuffix_disc [10] = 'th';
	daySuffix_disc [11] = 'th';
	daySuffix_disc [12] = 'th';
	daySuffix_disc [13] = 'th';
	daySuffix_disc [14] = 'th';
	daySuffix_disc [15] = 'th';
	daySuffix_disc [16] = 'th';
	daySuffix_disc [17] = 'th';
	daySuffix_disc [18] = 'th';
	daySuffix_disc [19] = 'th';
	daySuffix_disc [20] = 'th';
	daySuffix_disc [21] = 'st';
	daySuffix_disc [22] = 'nd';
	daySuffix_disc [23] = 'rd';
	daySuffix_disc [24] = 'th';
	daySuffix_disc [25] = 'th';
	daySuffix_disc [26] = 'th';
	daySuffix_disc [27] = 'th';
	daySuffix_disc [28] = 'th';
	daySuffix_disc [29] = 'th';
	daySuffix_disc [30] = 'th';
	daySuffix_disc [31] = 'st';

	this.switchEditableUserInfo = switchEditableUserInfo_disc;
	this.setPaths = setPaths_disc;
	this.setPaths (virtualPath);

	return this;
}

function switchEditableUserInfo_disc ()
{
	if ((currentUsername_disc == '') || (currentUserFullName_disc == '') || (currentUserEmailAddress_disc == ''))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function setPaths_disc (virtualPath)
{
	this.pageMainFullPath = virtualPath + this.pageMainLocalPath;
	this.pageMainPreferredFullPath = virtualPath;
	this.pageAdminFullPath = virtualPath + this.pageAdminLocalPath;
	this.pageNewPostFullPath = virtualPath + this.pageNewPostLocalPath;
	this.pageEditPostFullPath = virtualPath + this.pageEditPostLocalPath;
	this.pageNewPostActionFullPath = virtualPath + this.pageNewPostActionLocalPath;
	this.pageEditPostActionFullPath = virtualPath + this.pageEditPostActionLocalPath;
	this.pageSearchFullPath = virtualPath + this.pageSearchLocalPath;
	this.pageShowMessageFullPath = virtualPath + this.pageShowMessageLocalPath;

	if (virtualPath != '')
	{
		this.pageMain = this.pageMainLocalPath;
		this.pageMainPreferred = this.pageMainPreferredLocalPath;
		this.pageAdmin = this.pageAdminLocalPath;
		this.pageNewPosth = this.pageNewPostLocalPath;
		this.pageEditPost = this.pageEditPostLocalPath;
		this.pageNewPostAction = this.pageNewPostActionLocalPath;
		this.pageEditPostAction = this.pageEditPostActionLocalPath;
		this.pageSearch = this.pageSearchLocalPath;
		this.pageShowMessage = this.pageShowMessageLocalPath;
	}
	else
	{
		this.pageMain = this.pageMainFullPath;
		this.pageMainPreferred = this.pageMainPreferredFullPath;
		this.pageAdmin = this.pageAdminFullPath;
		this.pageNewPosth = this.pageNewPostFullPath;
		this.pageEditPost = this.pageEditPostFullPath;
		this.pageNewPostAction = this.pageNewPostActionFullPath;
		this.pageEditPostAction = this.pageEditPostActionFullPath;
		this.pageSearch = this.pageSearchFullPath;
		this.pageShowMessage = this.pageShowMessageFullPath;
	}
}

function userPrefersHTMLMail_disc (usernameToCheck)
{
	return true;
}

function userPrefersResponsesEmailed_disc (usernameToCheck)
{
	return false;
}

function getDatabaseDSN_disc ()
{
	if (this.databaseDSN == "")
	{
		var DBPath = Server.MapPath (this.databaseFilename);

		this.databaseDSN = 'DRIVER=Microsoft Access Driver (*.mdb);UID=admin;UserCommitSync=Yes;Threads=3;SafeTransactions=0;PageTimeout=5;MaxScanRows=8;MaxBufferSize=512;ImplicitCommitSync=Yes;FIL=MS Access;DriverId=25;DefaultDir=;DBQ=' + DBPath
	}

	return this.databaseDSN;
}
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// DATABASE OBJECT
//
// ======================================================================

function ForumDatabase ()
{
	return this;
}

function getSubjectField_disc (messageRecord)
{
	return String (messageRecord.fields ('subject'));
}

function getBodyField_disc (messageRecord)
{
	return String (messageRecord.fields ('body'));
}

function getSortCodeField_disc (messageRecord)
{
	return String (messageRecord.fields ('sortCode'));
}

function getAuthorNameField_disc (messageRecord)
{
	return String (messageRecord.fields ('author'));
}

function getAuthorEmailField_disc (messageRecord)
{
	return String (messageRecord.fields ('authorEmail'));
}

function getAuthorFullnameField_disc (messageRecord)
{
	return String (messageRecord.fields ('authorFullname'));
}

function getAuthorEmailField_disc (messageRecord)
{
	return String (messageRecord.fields ('authorEmail'));
}

function getMessageIDField_disc (messageRecord)
{
	return messageRecord.fields ('messageID');
}

function getParentIDField_disc (messageRecord)
{
	return messageRecord.fields ('parent');
}

function getThreadIDField_disc (messageRecord)
{
	return messageRecord.fields ('threadID');
}

function getNumChildrenField_disc (messageRecord)
{
	return messageRecord.fields ('numChildren');
}

function getDateCreatedField_disc (messageRecord)
{
	return String (messageRecord.fields ('dateCreated'));
}

function getDateModifiedField_disc (messageRecord)
{
	return String (messageRecord.fields ('dateModified'));
}

function getEmailParentOnResponseField_disc (messageRecord)
{
	return messageRecord.fields ('emailParentOnResponse');
}

function getAllRootMessages_disc (sortAscending)
{
	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE parent=0 ORDER BY dateCreated';
	if (sortAscending)
	{
		SQLString = SQLString + " ASC";
	}
	else
	{
		SQLString = SQLString + " DESC";
	}

	return this.executeSQL (SQLString);
}

function getCurrentRootMessages_disc (sortAscending)
{
	var cutoffDate = new Date();
	cutoffDate.setDate (cutoffDate.getDate() - config.daysMessagesActive);

	var SQLString = "SELECT * FROM " + config.databaseTable + " WHERE dateCreated > {d '" + cutoffDate.getODBCNormalisedDate () + "'} AND (parent=0 OR parent IN (SELECT messageID FROM " + config.databaseTable + " WHERE dateCreated < {d '" + cutoffDate.getODBCNormalisedDate () + "'})) ORDER BY dateCreated";
	if (sortAscending)
	{
		SQLString += " ASC";
	}
	else
	{
		SQLString += " DESC";
	}

	return this.executeSQL (SQLString);
}

function getAllCurrentMessages_disc (sortAscending)
{
	var cutoffDate = new Date();
	cutoffDate.setDate (cutoffDate.getDate() - config.daysMessagesActive);

	var sortOrder;
	if (sortAscending)
	{
		sortOrder = " ASC";
	}
	else
	{
		sortOrder = " DESC";
	}

	var SQLString = "SELECT * FROM " + config.databaseTable + " WHERE dateCreated > {d '" + cutoffDate.getODBCNormalisedDate () + "'} ORDER BY threadID " + sortOrder + ", sortCode ASC";

	return this.executeSQL (SQLString);
}

function getAllThreadMessages_disc (threadID)
{
	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE threadID=' + threadID + ' ORDER BY sortCode';

	return this.executeSQL (SQLString);
}

function getSubThreadMessages_disc (threadID, startAtSortCode)
{
	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE threadID=' + threadID + ' AND sortCode >= \'' + startAtSortCode + '\' ORDER BY sortCode';

	var subThread = this.executeSQL (SQLString);

	return subThread;
}

function getRecordByID_disc (messageID)
{
	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE messageID=' + messageID;
	var message = new ForumMessage (this.executeSQL (SQLString))

	return message;
}

function getRecordBySortCode_disc (sortCode)
{
	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE sortCode=' + sortCode;

	return new ForumMessage (this.executeSQL (SQLString));
}

function getRecordByDateCreated_disc (dateCreated)
{
	var SQLString = "SELECT * FROM " + config.databaseTable + " WHERE dateCreated = {d '" + dateCreated.getODBCNormalisedDate () + "'}";

	var messageRecord = this.executeSQL (SQLString);
	var message = new ForumMessage (messageRecord);
	delete messageRecord;
	return message;
}

function getOpenDatabaseConnection_disc ()
{
	var connection;

	if (DBConnection_disc != '')
	{
		connection = DBConnection_disc;
	}
	else
	{
		connection = Server.CreateObject ("ADODB.Connection");
		connection.Mode = adModeReadWrite;

		connection.Open (config.getDatabaseDSN ());
		DBConnection_disc = connection;
	}

	return connection;
}

function executeSQL_disc (SQLString)
{
	var connection;

	connection = this.getOpenDatabaseConnection ();

	return this.executeSQLUsingConnection (SQLString, connection);
}

function executeSQLUsingConnection_disc (SQLString, connection)
{
	var recordSet;
	var command;

	command = Server.CreateObject ('ADODB.Command');
	command.CommandText = SQLString;
	command.CommandType = adCmdText;

	recordSet = Server.CreateObject ('ADODB.RecordSet');

	//Response.Write ('</H5>' + SQLString + '</H5>');

	recordSet.Open (SQLString, connection, adOpenKeyset, adLockOptimistic, adCmdText);

	delete command;

	return recordSet;
}

function searchForum_disc (stringToSearchFor)
{
	var searchString;
	searchString = String (stringToSearchFor).replace (/\'/gi, '&quot');

	var SQLString = "SELECT * FROM " + config.databaseTable + " WHERE body LIKE '%" + searchString + "%' OR " + "subject LIKE '%" + searchString + "%' OR " + "author LIKE '%" + searchString + "%' OR " + "authorEmail LIKE '%" + searchString + "%' OR " + "authorFullName LIKE '%" + searchString + "%' ORDER BY dateCreated DESC";

	return this.executeSQL (SQLString);
}

function saveNewRecord_disc (message)
{
	var postedDate = new Date();

	var connection;
	var weStartedTransaction;
	if (DBConnection_disc == '')
	{
		connection = this.getOpenDatabaseConnection ();
		connection.BeginTrans ();
		DBConnection_disc = connection;
		weStartedTransaction = true;
	}
	else
	{
		connection = DBConnection_disc;
		weStartedTransaction = false;
	}

	message.sortCode = this.getNewSortCode (message.parentID);
	message.dateCreated = postedDate;
	message.dateModified = postedDate;

	var newMessageRecord = Server.CreateObject('ADODB.RecordSet');

	newMessageRecord.Open (config.databaseTable, connection, adOpenKeyset, adLockPessimistic, adCmdTable);
	newMessageRecord.AddNew ();

	newMessageRecord.Fields('dateCreated') = postedDate.toLocaleString ();
	newMessageRecord.Fields('dateModified') = postedDate.toLocaleString ();
	newMessageRecord.Fields('parent') = message.parentID;
	newMessageRecord.Fields('numChildren') = 0;
	newMessageRecord.Fields('sortCode') = message.sortCode;
	newMessageRecord.Fields('threadID') = message.threadID;
	newMessageRecord.Fields('author') = message.authorName;
	newMessageRecord.Fields('authorFullName') = message.authorFullname;
	newMessageRecord.Fields('authorEmail') = message.authorEmail;
	newMessageRecord.Fields('emailParentOnResponse') = (message.emailParentOnResponse == true ? 'True' : 'False');
	newMessageRecord.Fields('subject') = message.subject;
	newMessageRecord.Fields('body') = message.body;

	newMessageRecord.Update ();
	var newMessage = new ForumMessage (newMessageRecord);
	var newID = String (newMessage.messageID);

	message.messageID = String (newMessage.messageID);
	if (('' + message.threadID == 'undefined') || (message.threadID == 0))
	{
		message.threadID = String (newMessage.messageID);
	}

	if (newMessage.sortCode == '0')
	{
		var SQLString = 'UPDATE ' + config.databaseTable + ' SET threadID=' + newMessage.messageID + ', sortCode=str(' + newMessage.messageID + ') WHERE messageID=' + newMessage.messageID;
		this.executeSQLUsingConnection (SQLString, connection);
	}

	newMessageRecord.Close ();
	delete newMessageRecord;

	if (connection.Errors.Count == 0)
	{
		if (weStartedTransaction == true)
		{
			connection.CommitTrans ();
		}
	}
	else
	{
		if (weStartedTransaction == true)
		{
			connection.RollbackTrans ();
		}
	}

	return newID;
}

function saveUpdatedRecord_disc (message)
{
	var modifiedDate = new Date();
	message.dateModified = modifiedDate;

	var connection;
	var weStartedTransaction;
	if (DBConnection_disc == '')
	{
		connection = this.getOpenDatabaseConnection ();
		connection.BeginTrans ();
		DBConnection_disc = connection;
		weStartedTransaction = true;
	}
	else
	{
		connection = DBConnection_disc;
		weStartedTransaction = false;
	}

	var SQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE messageID=' + message.messageID;
	var messageRecord = this.executeSQLUsingConnection (SQLString, connection);

	var newNumChildren;
	if (message.numChildren > messageRecord.Fields('numChildren'))
	{
		newNumChildren = message.numChildren;
	}
	else
	{
		newNumChildren = messageRecord.Fields('numChildren');
	}

	messageRecord.Fields('dateModified') = modifiedDate.toLocaleString ();
	messageRecord.Fields('numChildren') = newNumChildren;
	messageRecord.Fields('author') = message.authorName;
	messageRecord.Fields('authorFullName') = message.authorFullname;
	messageRecord.Fields('authorEmail') = message.authorEmail;
	messageRecord.Fields('emailParentOnResponse') = (message.emailParentOnResponse == true ? 'True' : 'False');
	messageRecord.Fields('subject') = message.subject;
	messageRecord.Fields('body') = message.body;

	messageRecord.Update ();

	if (connection.Errors.Count == 0)
	{
		message = new ForumMessage (messageRecord);
		if (weStartedTransaction == true)
		{
			connection.CommitTrans ();
		}
	}
	else
	{
		if (weStartedTransaction == true)
		{
			connection.RollbackTrans ();
		}
	}

	messageRecord.Close ();
	delete messageRecord;
}

function getNewSortCode_disc (parentID)
{
	if (parentID == 0)
	{
		return '0';
	}
	else
	{
		var dBase = new ForumDatabase ();
		var parentMessage = dBase.getRecordByID (parentID);

		parentMessage.numChildren += 1;

		var sortCode = parentMessage.sortCode + '.' + parentMessage.numChildren;

		parentMessage.saveUpdatedData ();

		delete parentMessage;
		return sortCode;
	}
}

function deleteMessage_disc (connection, messageID)
{
	var messageToDelete = this.getRecordByID (messageID);
	var parentID = String (messageToDelete.parentID);
	if (messageToDelete.numChildren > 0)
	{
		var threadSQLString = 'SELECT * FROM ' + config.databaseTable + ' WHERE threadID=' + messageToDelete.threadID + ' AND sortCode LIKE \'' + messageToDelete.sortCode + '%\' ORDER BY sortCode';
		var children = 	this.executeSQLUsingConnection (threadSQLString, connection);
		while (!children.EOF)
		{
			children.Delete();
			children.MoveNext();
		}
	}

	delete messageToDelete;

	var SQLString = 'DELETE FROM ' + config.databaseTable + ' WHERE messageID=' + messageID;
	this.executeSQLUsingConnection (SQLString, connection);
}

function decrementNumChildren_disc (connection, parentID)
{
	if (parentID != 0)
	{
		var parentMessage = this.getRecordByID (parentID);

		var SQLString = 'UPDATE ' + config.databaseTable + ' SET numChildren=' + (parentMessage.numChildren - 1) + ' WHERE messageID=' + parentID;
		this.executeSQLUsingConnection (SQLString, connection);
	}
}

function deleteMessageHierarchy_disc (messageID)
{
	var messageToDelete = this.getRecordByID (messageID);
	var parentID = String (messageToDelete.parentID);
	delete messageToDelete;

	var connection;
	connection = this.getOpenDatabaseConnection ();
	connection.BeginTrans ();

	this.deleteMessage (connection, messageID);

	this.decrementNumChildren (connection, parentID);

	if (connection.Errors.Count == 0)
	{
		config.sqlDeleteSuccessfulMessage.strong ().show ();
		connection.CommitTrans ();
	}
	else
	{
		config.sqlDeleteUnsuccessfulMessage.strong ().show ();
		connection.RollbackTrans ();
	}
}

function executeAdminSQL_disc ()
{
	var SQLForm = new ForumForm (Request.Form);
	var SQLString = String (SQLForm.SQLStatement);

	if (SQLString != '')
	{
		var DB = new ForumDatabase ();
		var connection = DB.getOpenDatabaseConnection ();

		var dbase = new ForumDatabase ();
		var returnedRecords;

		returnedRecords = dbase.executeSQLUsingConnection (SQLString, connection);

		('<TABLE WIDTH="100%" BGCOLOR="#FFFFFF"><TR><TD>').show();
			(config.sqlResultsPrefix + '<BR>').strong().show();
			(config.sqlStatementPrefix.weak() + String (SQLString).strongSmall() + '<BR>').show();

			('</TD></TR><TR><TD>').show ();

			showSQLAdminResults_disc (SQLString, returnedRecords);

			showConnectionErrors_disc (connection);

			connection.close();
			delete connection;
			delete returnedRecords;

		('</TD></TR></TABLE>').show();
	}

	var messageIDToDelete = String (SQLForm.messageIDToDelete);
	if (messageIDToDelete != '')
	{
		if (0 != Number (messageIDToDelete))
		{
			var deleteDBase = new ForumDatabase ();
			deleteDBase.deleteMessageHierarchy (messageIDToDelete);
		}
	}
}

function showSQLAdminResults_disc (SQLString, recordSet)
{
	if (String (SQLString).search(/select/gi) > -1)
	{
		var numRecordFields;
		numRecordFields = recordSet.fields.count - 1;

		var table = '<TABLE BORDER="2" BGCOLOR="#FFFFFF"><TR>';
		table.show();
		var counter;
		for (counter = 0; counter < numRecordFields; counter++)
		{
			('<TH ALIGN="left" NOWRAP>' + String (recordSet(counter).name).strong() + '</TH>').show();
		}
		('</TR>').show();

		while (!recordSet.EOF)
		{
			('</TR>').show();

			for (counter = 0; counter < numRecordFields; counter++)
			{
				('<TD NOWRAP>' + recordSet.fields(counter).value + '</TD>').show();
			}

			('</TR>').show();

			recordSet.movenext ();
		}

		'</TABLE>'.show ();
	}
}

function showConnectionErrors_disc (connection)
{
	if (connection.errors.count > 0)
	{
		('<BR>' + config.sqlDBErrorPrefix).weak().show ();
		var counter;
		for (counter = 0; counter < connection.errors.count; counter++)
		{
			('<BR>' + config.sqlDBErrorNumberPrompt + connection.errors(counter).number).weak().show();
			('<BR>' + config.sqlDBErrorDescriptionPrompt + connection.errors(counter).description).weak().show();
		}
	}
	else
	{
		('<BR>' + config.sqlDBErrorNoErrorPrompt).weak().show();
	}
}

ForumDatabase.prototype.getSubjectField = getSubjectField_disc;
ForumDatabase.prototype.getBodyField = getBodyField_disc;
ForumDatabase.prototype.getSortCodeField = getSortCodeField_disc;
ForumDatabase.prototype.getAuthorNameField = getAuthorNameField_disc;
ForumDatabase.prototype.getAuthorEmailField = getAuthorEmailField_disc;
ForumDatabase.prototype.getAuthorFullnameField = getAuthorFullnameField_disc;
ForumDatabase.prototype.getAuthorEmailField = getAuthorEmailField_disc;
ForumDatabase.prototype.getMessageIDField = getMessageIDField_disc;
ForumDatabase.prototype.getParentIDField = getParentIDField_disc;
ForumDatabase.prototype.getThreadIDField = getThreadIDField_disc;
ForumDatabase.prototype.getNumChildrenField = getNumChildrenField_disc;
ForumDatabase.prototype.getDateCreatedField = getDateCreatedField_disc;
ForumDatabase.prototype.getDateModifiedField = getDateModifiedField_disc;
ForumDatabase.prototype.getEmailParentOnResponseField = getEmailParentOnResponseField_disc;
ForumDatabase.prototype.getAllRootMessages = getAllRootMessages_disc;
ForumDatabase.prototype.getCurrentRootMessages = getCurrentRootMessages_disc;
ForumDatabase.prototype.getAllCurrentMessages = getAllCurrentMessages_disc;
ForumDatabase.prototype.getAllThreadMessages = getAllThreadMessages_disc;
ForumDatabase.prototype.getSubThreadMessages = getSubThreadMessages_disc;
ForumDatabase.prototype.getRecordByID = getRecordByID_disc;
ForumDatabase.prototype.getRecordBySortCode = getRecordBySortCode_disc;
ForumDatabase.prototype.getRecordByDateCreated = getRecordByDateCreated_disc;
ForumDatabase.prototype.getOpenDatabaseConnection = getOpenDatabaseConnection_disc;
ForumDatabase.prototype.executeSQL = executeSQL_disc;
ForumDatabase.prototype.executeSQLUsingConnection = executeSQLUsingConnection_disc;
ForumDatabase.prototype.getNewSortCode = getNewSortCode_disc;
ForumDatabase.prototype.deleteMessage = deleteMessage_disc;
ForumDatabase.prototype.decrementNumChildren = decrementNumChildren_disc;
ForumDatabase.prototype.deleteMessageHierarchy = deleteMessageHierarchy_disc;
ForumDatabase.prototype.searchForum = searchForum_disc;
ForumDatabase.prototype.saveNewRecord = saveNewRecord_disc;
ForumDatabase.prototype.saveUpdatedRecord = saveUpdatedRecord_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// DATE OBJECT ADDITIONS
//
// ======================================================================

function getODBCNormalisedDate_disc ()
{
	var yearString;
	var monthString;
	var dayString;

	yearString = this.getFullYear ();

	monthString = this.getMonth () + 1;
	if (monthString < 10)
	{
		monthString = '0' + monthString;
	}

	dayString = this.getDate ();
	if (dayString < 10)
	{
		dayString = '0' + dayString;
	}

	return yearString + '-' + monthString + '-' + dayString;
}

function getODBCNormalisedTime_disc ()
{
	var normalisedTime = '';

	if (this.getHours () >= 10)
	{
		normalisedTime += this.getHours ();
	}
	else
	{
		normalisedTime += '0' + this.getHours ();
	}

	normalisedTime += ':';

	if (this.getMinutes () >= 10)
	{
		normalisedTime += this.getMinutes ();
	}
	else
	{
		normalisedTime += '0' + this.getMinutes ();
	}

	normalisedTime += ':';

	if (this.getSeconds () >= 10)
	{
		normalisedTime += this.getSeconds ();
	}
	else
	{
		normalisedTime += '0' + this.getSeconds ();
	}

	return normalisedTime;
}

function getODBCNormalisedTimeStamp_disc ()
{
	return this.getNormalisedDate () + ' ' + this.getNormalisedTime ();
}

Date.prototype.getODBCNormalisedDate = getODBCNormalisedDate_disc;
Date.prototype.getODBCNormalisedTime = getODBCNormalisedTime_disc;
Date.prototype.getODBCNormalisedTimeStamp = getODBCNormalisedTimeStamp_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// EMAIL OBJECT
//
// ======================================================================

function ForumEmail ()
{
	this.toName = '';
	this.toAddress = '';
	this.fromName = '';
	this.fromAddress = '';
	this.subject = '';
	this.body = '';

	return this;
}

function getFromEmailLink_disc ()
{
	if (config.switchShowEmailAddresses)
	{
		return '<A HREF="mailto:' + this.fromAddress + '" title="' + config.popupEmailPrefix + this.fromName + ' (' + this.fromAddress + ')">' + this.fromName + '</A>';
	}
	else
	{
		return this.fromName;
	}
}

function getEmailLink_disc (emailAddress, name, emailLinkText)
{
	var emailLink;
	if (config.switchShowEmailAddresses)
	{
		emailLink = '<A HREF="mailto:' + emailAddress + '" title="' + config.popupEmailPrefix + name + 
			' (' + emailAddress + ')">' + emailLinkText + '</A>';
	}
	else
	{
		emailLink = name;
	}

	return emailLink;
}

function getHTMLMessageBody_disc (message, title, bodyText, signature)
{
	var messageBody = '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">\n' + '<HTML>';

	messageBody = '<BODY BGCOLOR="#FFFFFF" VLINK="#660066" LINK="#0000FF" ALINK="#FF0000">';

	messageBody += '<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">';

	messageBody += '<TR><TD WIDTH="140" BGCOLOR="#99CCFF"><DIV ALIGN="center"><A href="http://www.aspforums.com/"><IMG alt="ASP Forums" border="0" height="56" src="http://www.aspforums.com/images/logo.gif" width="120"></A></DIV></TD><TD BGCOLOR="#336699" WIDTH="468"><FONT FACE="Tahoma" COLOR="#FFFFFF" SIZE="5">&nbsp;' + title + '</FONT></TD></TR>';

	messageBody += '<TR><TD WIDTH="140">&nbsp;</TD><TD WIDTH="468">';

	messageBody += '<P>&nbsp;</P><FONT FACE="Tahoma" SIZE="-1">';

	messageBody += bodyText + '</FONT></TD></TR>'

	messageBody += '<TR><TD WIDTH="140">&nbsp;</TD><TD WIDTH="468">';

	messageBody += signature + '<P>&nbsp;</P></FONT></TD></TR>'

	messageBody += '</TABLE>';

	return messageBody;
}

function sendHTML_disc ()
{
	var From = this.fromName + ' <' + this.fromAddress + '>';
	var To = this.toAddress;

	sendHTMLMailMessage_disc (To, From, this.subject, this.body);
}

function send_disc ()
{
	var From = this.fromName + ' <' + this.fromAddress + '>';
	var To = this.toAddress;

	sendRegularMailMessage_disc (To, From, this.subject, this.body);
}

ForumEmail.prototype.getFromEmailLink = getFromEmailLink_disc;
ForumEmail.prototype.getEmailLink = getEmailLink_disc;
ForumEmail.prototype.getHTMLMessageBody = getHTMLMessageBody_disc;
ForumEmail.prototype.sendHTML = sendHTML_disc;
ForumEmail.prototype.send = send_disc;
</SCRIPT>

<SCRIPT LANGUAGE="VBScript" RUNAT="Server">
' Has to be in VBScript for the error recovery.
Sub sendRegularMailMessage_disc (messageTo, messageFrom, messageSubject, messageBody)
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

Sub sendHTMLMailMessage_disc (messageTo, messageFrom, messageSubject, messageBody)
On Error Resume Next

	Dim mailMessage
	Set mailMessage = Server.CreateObject ("CDONTS.NewMail")

	if Not mailMessage is Nothing then
		mailMessage.From = messageFrom
		mailMessage.To = messageTo
		mailMessage.Subject = messageSubject
		mailMessage.Body = messageBody

		mailMessage.ContentBase = config.siteURL
		mailMessage.BodyFormat = 0
		mailMessage.MailFormat = 0 

		mailMessage.Send
		Set mailMessage = Nothing
	end if
End Sub
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// EXPANDCOLLAPSE OBJECT
//
// ======================================================================

function ForumExpandCollapse (message, viewIndex, currentThreadID, activeThreadID)
{
	this.message = message;
	this.viewIndex = viewIndex;
	this.currentThreadID = currentThreadID;
	this.activeThreadID = activeThreadID;
	this.QueryString = '';

	return this;
}

function getIcon_disc ()
{
	var toggle;
	if (config.useExpandCollapse)
	{
		if (this.message.numChildren == 0)
		{
			toggle = this.getNoExpandToggle();
		}
		else
		{
			if (((this.currentThreadID == this.activeThreadID) || (this.viewIndex <= config.expandFirstNThreads)) && !(this.doWeCollapse()))
			{
				toggle = this.getCollapseToggle();
			}
			else
			{
				toggle = this.getExpandToggle();
			}
		}
	}

	return toggle;
}

function getDHTMLIcon_disc (currentIndentLevel)
{
	var toggle;

	if (this.message.numChildren == 0)
	{
		toggle = '<IMG ALT=" " BORDER="0" SRC="' + config.noExpandImage + '" HEIGHT="' + config.noExpandImageHeight + '" WIDTH="' + config.noExpandImageWidth + '" ID="' + this.message.messageID + '" onClick="expandCollapseForumClick_disc (event); return false;">&nbsp;';
	}
	else
	{
		if (currentIndentLevel == 1)
		{
			toggle = this.getExpandLinkTag () +  '<IMG ALT="+" BORDER="0" SRC="' + config.expandImage + '" HEIGHT="' + config.expandImageHeight + '" WIDTH="' + config.expandImageWidth + '" ID="' + this.message.messageID + '" onClick="expandCollapseForumClick_disc (event); return false;"></A>&nbsp;';
		}
		else
		{
			toggle = this.getCollapseLinkTag () +  '<IMG ALT="-" BORDER="0" SRC="' + config.collapseImage + '" HEIGHT="' + config.collapseImageHeight + '" WIDTH="' + config.collapseImageWidth + '" ID="' + this.message.messageID + '" onClick="expandCollapseForumClick_disc (event); return false;"></A>&nbsp;';
		}
	}

	return toggle;
}

function getNoExpandToggle_disc ()
{
	var noExpandToggle = '<IMG ALT=" " BORDER="0" SRC="' + config.noExpandImage + '" HEIGHT="' + config.noExpandImageHeight + '" WIDTH="' + config.noExpandImageWidth + '">&nbsp;';

	return noExpandToggle;
}

function getExpandLinkTag_disc ()
{
	return '<A HREF="' + this.getExpandURL() + '#' + config.viewCentreOnMessage + this.message.messageID + '" TITLE="' + config.popupExpandLink + '" NAME="' + config.viewCentreOnMessage + '-' + this.message.messageID + '" ID="A-' + this.message.sortCode + '">';
}

function getExpandToggle_disc ()
{
	var expandToggle = this.getExpandLinkTag () + '<IMG ALT="+" BORDER="0" SRC="' + config.expandImage + '" HEIGHT="' + config.expandImageHeight + '" WIDTH="' + config.expandImageWidth + '"></A>&nbsp;';

	return expandToggle;
}

function getCollapseLinkTag_disc ()
{
	return '<A HREF="' + this.getCollapseURL() + '#' + config.viewCentreOnMessage + '-' + this.message.messageID + '" TITLE="' + config.popupCollapseLink + '" NAME="' + config.viewCentreOnMessage + '-' + this.message.messageID + '" ID="A-' + this.message.sortCode + '">';
}

function getCollapseToggle_disc ()
{
	var collapseToggle = this.getCollapseLinkTag () + '<IMG ALT="-" BORDER="0" SRC="' + config.collapseImage + '" HEIGHT="' + config.collapseImageHeight + '" WIDTH="' + config.collapseImageWidth + '"></A>&nbsp;';

	return collapseToggle;
}

function getExpandURL_disc ()
{
	var URL = config.pageMainFullPath;

	if (this.stripThisIDFromQString())
	{
		return (this.queryString == '' ? config.pageMainPreferredFullPath : URL + '?' + this.queryString);
	}
	else
	{
		return URL + '?' + config.viewExpandTag + '=' + this.message.messageID + (this.queryString == '' ? '' : '&' + this.queryString);
	}
}

function getCollapseURL_disc ()
{
	var URL = config.pageMainFullPath;

	if (this.stripThisIDFromQString())
	{
		return (this.queryString == '' ? config.pageMainPreferredFullPath : URL + '?' + this.queryString);
	}
	else
	{
		return URL + '?' + config.viewCollapseTag + '=' + this.message.messageID + (this.queryString == '' ? '' : '&' + this.queryString);
	}
}

function stripThisIDFromQString_disc ()
{
	var IDRemoved = false;
	var QString = '';
	var item;
	var numitems;

	numitems = Request.QueryString (config.viewExpandTag).count;
	for (item = 1; item <= numitems; item++)
	{
		if (Request.QueryString (config.viewExpandTag)(item) == this.message.messageID)
		{
			IDRemoved = true;
		}
		else
		{
			QString = QString + config.viewExpandTag + '=' + Server.URLEncode (Request.QueryString (config.viewExpandTag)(item)) + '&';
		}
	}

	numitems = Request.QueryString (config.viewCollapseTag).count;
	for (item = 1; item <= numitems; item++)
	{
		if (Request.QueryString (config.viewCollapseTag)(item) == this.message.messageID)
		{
			IDRemoved = true;
		}
		else
		{
			QString = QString + config.viewCollapseTag + '=' + Server.URLEncode (Request.QueryString (config.viewCollapseTag)(item)) + '&';
		}
	}

	this.queryString = QString.substr(0, QString.length - 1);
	return IDRemoved;
}

function doWeExpand_disc ()
{
	var expand = false;
	var item;
	var numitems;

	if (config.expandAllThreads)
	{
		return true;
	}
	else
	{
		if (this.viewIndex <= config.expandFirstNThreads)
		{
			return true;
		}
		else
		{
			numitems = Request.QueryString (config.viewExpandTag).count;
			for (item = 1; item <= numitems; item++)
			{
				if (Request.QueryString (config.viewExpandTag)(item) == this.message.messageID)
				{
					expand = true;
				}
			}

			return expand;
		}
	}
}

function doWeCollapse_disc ()
{
	var collapse = false;
	var item;
	var numitems;

	numitems = Request.QueryString (config.viewCollapseTag).count;
	for (item = 1; item <= numitems; item++)
	{
		if (Request.QueryString (config.viewCollapseTag)(item) == this.message.messageID)
		{
			collapse = true;
		}
	}

	return collapse;
}

ForumExpandCollapse.prototype.getIcon = getIcon_disc;
ForumExpandCollapse.prototype.getDHTMLIcon = getDHTMLIcon_disc;
ForumExpandCollapse.prototype.getNoExpandToggle = getNoExpandToggle_disc;
ForumExpandCollapse.prototype.getExpandLinkTag = getExpandLinkTag_disc;
ForumExpandCollapse.prototype.getExpandToggle = getExpandToggle_disc;
ForumExpandCollapse.prototype.getCollapseLinkTag = getCollapseLinkTag_disc;
ForumExpandCollapse.prototype.getCollapseToggle = getCollapseToggle_disc;
ForumExpandCollapse.prototype.getExpandURL = getExpandURL_disc;
ForumExpandCollapse.prototype.getCollapseURL = getCollapseURL_disc;
ForumExpandCollapse.prototype.stripThisIDFromQString = stripThisIDFromQString_disc;
ForumExpandCollapse.prototype.doWeExpand = doWeExpand_disc;
ForumExpandCollapse.prototype.doWeCollapse = doWeCollapse_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// FORUMFORM OBJECT
//
// ======================================================================

function ForumForm (currentForm)
{
	if (currentForm != null)
	{
		this.messageID = 
			(String (currentForm('messageID')).valueOf() == 'undefined' ? '' : currentForm ('messageID'));
		this.subject = 
			(String (currentForm ('subject')).valueOf() == 'undefined' ? '' : currentForm ('subject'));
		this.body = 
			(String (currentForm ('message')).valueOf() == 'undefined' ? '' : currentForm ('message'));
		this.sortCode = 
			(String (currentForm ('sortCode')).valueOf() == 'undefined' ? '' : currentForm ('sortCode'));
		this.parentID = 
			(String (currentForm ('parentID')).valueOf() == 'undefined' ? '' : currentForm ('parentID'));
		this.threadID = 
			(String (currentForm ('threadID')).valueOf() == 'undefined' ? '' : currentForm ('threadID'));
		this.emailParentOnResponse = 
			(String (currentForm ('emailResponses')).valueOf() == 'undefined' ? config.userPrefersResponsesEmailed (currentUsername_disc) : (currentForm ('emailResponses') == 'Yes' ? true : false));
		this.searchString = 
			(String (currentForm ('SearchString')).valueOf() == 'undefined' ? '' : currentForm ('SearchString'));
		this.SQLStatement = 
			(String (currentForm ('SQLStatement')).valueOf() == 'undefined' ? '' : currentForm ('SQLStatement'));
		this.messageIDToDelete = 
			(String (currentForm ('messageIDToDelete')).valueOf() == 'undefined' ? '' : currentForm ('messageIDToDelete'));
		this.switchEditableUserInfo = config.switchEditableUserInfo ();

		if (this.switchEditableUserInfo)
		{
			this.authorName = 
				(String (currentForm ('username')).valueOf() == 'undefined' ? '' : currentForm ('username'));
			this.authorEmail = 
				(String (currentForm ('emailaddress')).valueOf() == 'undefined' ? '' : currentForm ('emailaddress'));
			this.authorFullname = 
				(String (currentForm ('fullname')).valueOf() == 'undefined' ? '' : currentForm ('fullname'));
		}
		else
		{
			this.authorName = currentUsername_disc;
			this.authorEmail = currentUserEmailAddress_disc;
			this.authorFullname = currentUserFullName_disc;
		}
	}
	else
	{
		this.subject = '';
		this.body = '';
		this.sortCode = '';
		this.parentID = '';
		this.threadID = '';
		this.messageID = '';
		this.emailParentOnResponse = '';
		this.searchString = '';
		this.messageIDToDelete = '';
		this.SQLStatement = '';
		this.switchEditableUserInfo = config.switchEditableUserInfo();

		if (this.switchEditableUserInfo)
		{
			this.authorName = this ('username');
			this.authorEmail = this ('emailaddress');
			this.authorFullname = this ('fullname');
		}
		else
		{
			this.authorName = currentUsername_disc;
			this.authorEmail = currentUserEmailAddress_disc;
			this.authorFullname = currentUserFullName_disc;
		}
	}

	return this;
}

function newForumFormFromMessage_disc (message)
{
	var newForm = new ForumForm (Request.Form);

	newForm.subject = message.subject;
	newForm.body = message.body;
	newForm.sortCode = message.sortCode;
	newForm.parentID = message.parentID;
	newForm.threadID = message.threadID;
	newForm.messageID = message.messageID;
	newForm.emailParentOnResponse = message.emailParentOnResponse;
	newForm.searchString = '';
	newForm.SQLStatement = '';
	newForm.switchEditableUserInfo = config.switchEditableUserInfo();

	if (newForm.switchEditableUserInfo)
	{
		newForm.authorName = message.authorName;
		newForm.authorEmail = message.authorEmail;
		newForm.authorFullname = message.authorFullname;
	}
	else
	{
		newForm.authorName = currentUsername_disc;
		newForm.authorEmail = currentUserEmailAddress_disc;
		newForm.authorFullname = currentUserFullName_disc;
	}

	return newForm;
}

function getSubjectInputField_disc ()
{
	var subject = String (this.subject).unconvertRichFormatting ();
	return '<INPUT TYPE="TEXT" NAME="subject" MAXLENGTH="100" SIZE="50" VALUE="' + subject + '">';
}

function getBodyInputField_disc ()
{
	var body = String (this.body).unformatFromStoring ();
	return '<TEXTAREA NAME="message" WRAP="PHYSICAL" COLS="' + config.maxTextAreaCols + '" ROWS="' + config.maxTextAreaRows + '">' + body + '</TEXTAREA>';
}

function getSubjectSubform_disc ()
{
	var subjectPrompt;
	subjectPrompt = config.postSubjectPrompt;

	var subjectSubform = subjectPrompt.weak ().tableTitleCol () + this.getSubjectInputField ().tableFieldCol ();

	subjectSubform = subjectSubform.tableRow ();

	return subjectSubform;
}

function showSubjectSubform_disc ()
{
	var subjectSubform = this.getSubjectSubform ();
	subjectSubform.show ();
}

function getBodySubform_disc ()
{
	var bodyPrompt;
	bodyPrompt = '&nbsp;' + config.postBodyPrompt;

	var body = bodyPrompt.weak () + '<BR>' + this.getBodyInputField ();
	body = body.tableColSpan (2);
	body = body.tableRow ();

	return body;
}

function showBodySubform_disc ()
{
	var body = this.getBodySubform ();
	body.show ();
}

function getEmailResponsesSubform_disc ()
{
	var emailResponsesChecked;
	if ((this.emailParentOnResponse == true) || (this.emailParentOnResponse == 'Yes'))
	{
		emailResponsesChecked = ' CHECKED';
	}
	else
	{
		emailResponsesChecked = '';
	}

	var emailResponses = '';
	if (config.switchAllowEmailResponses)
	{
		emailResponses = '<P><INPUT NAME="EmailResponses" VALUE="Yes" TYPE="checkbox"' + emailResponsesChecked + '>';
		emailResponses += config.postEmailResponsesPrompt.weak () + '</P>';

		emailResponses = emailResponses.tableColSpan (2);
		emailResponses = emailResponses.tableRow ();
	}

	return emailResponses;
}

function showEmailResponsesSubform_disc ()
{
	var emailResponses = this.getEmailResponsesSubform ();
	emailResponses.show ();
}

function getNonEditableUserInfoSubform_disc ()
{
	var postedByPrompt;
	postedByPrompt = config.postPostedByPrompt;

	var username;
	username = String (this.authorName).weak () + (' (&#145;' + this.authorFullname + '&#146;, ' + this.authorEmail + ')').weak ();

	var userSubform;
	userSubform = postedByPrompt.weak ().tableTitleCol () + username.strong ().tableFieldCol ();

	userSubform.tableRow ();

	return userSubform;
}

function showNonEditableUserInfoSubform_disc ()
{
	var userSubform = this.getNonEditableUserInfoSubform ();
	userSubform.show ();
}

function getEditableUserInfoSubform_disc ()
{
	var postedByPrompt;
	postedByPrompt = config.postPostedByPrompt;

	var username;
	username = '<INPUT NAME="username" SIZE="25" MAXLENGTH="50" VALUE="' + this.authorName + '">';

	var fullnamePrompt;
	fullnamePrompt = config.postFullnamePrompt;

	var fullname;
	fullname = '<INPUT NAME="fullname" SIZE="25" MAXLENGTH="50" VALUE="' + this.authorFullname + '">';

	var emailPrompt;
	emailPrompt = config.postEmailAddressPrompt;

	var emailAddress;
	emailAddress = '<INPUT NAME="emailaddress" SIZE="25" MAXLENGTH="50" VALUE="' + this.authorEmail + '">'

	var userSubform;
	userSubform = (postedByPrompt.weak ().tableTitleCol () + username.tableFieldCol ()).tableRow ();
	userSubform += (fullnamePrompt.weak ().tableTitleCol () + fullname.tableFieldCol ()).tableRow ();
	userSubform += (emailPrompt.weak ().tableTitleCol () + emailAddress.tableFieldCol ()).tableRow ();

	return userSubform;
}

function showEditableUserInfoSubform_disc ()
{
	var userSubform = this.getEditableUserInfoSubform ();
	userSubform.show();
}

function getUserInfoSubform_disc ()
{
	if (this.switchEditableUserInfo)
	{
		return this.getEditableUserInfoSubform ();
	}
	else
	{
		return this.getNonEditableUserInfoSubform ();
	}
}

function showUserInfoSubform_disc ()
{
	var userInfo = this.getUserInfoSubform ();
	userInfo.show ();
}

function getMessageForm_disc (message, actionPath, buttonLabel)
{
	var formString = String ('<FORM ACTION="' + actionPath + '" METHOD="post">');

	formString += '<INPUT TYPE="hidden" NAME="messageID" VALUE="' + this.messageID + '">';
	formString += '<INPUT TYPE="hidden" NAME="parentID" VALUE="' + this.parentID + '">';
	formString += '<INPUT TYPE="hidden" NAME="threadID" VALUE="' + this.threadID + '">';
	formString += '<INPUT TYPE="hidden" NAME="sortCode" VALUE="' + this.sortCode + '">';
	formString += '<INPUT TYPE="hidden" NAME="emailParentOnResponse" VALUE="' + this.emailParentOnResponse + '">';

	formString += '<TABLE BORDER="0" WIDTH="' + config.fullTableWidth + '" CELLPADDING="0" CELLSPACING="0">';

	formString += this.getUserInfoSubform ();

	this.subject = message.subject;
	formString += this.getSubjectSubform ();

	var spacer = '&nbsp;';
	formString += spacer.tableColSpan (2);

	formString += this.getBodySubform ();

	formString += this.getEmailResponsesSubform ();

	formString += '<TR><TD VALIGN="BOTTOM" WIDTH="' + config.fullTableWidth + '" COLSPAN="2">';
	formString += '<INPUT TYPE="SUBMIT" VALUE="' + buttonLabel + '"></TD></TR></TABLE></FORM>';

	return formString;
}

function showMessageForm_disc (message, actionPath, buttonLabel)
{
	var formString = this.getMessageForm (message, actionPath, buttonLabel);
	formString.show ();
}

function getSearchForm_disc (label)
{
	return '<FORM ACTION="' + config.pageSearchFullPath + '" METHOD="POST"><INPUT TYPE="TEXT" NAME="SearchString" VALUE="' + this.searchString + '"><INPUT TYPE="SUBMIT" VALUE="'+ label + '"></FORM>';
}

function showSearchForm_disc (label)
{
	var searchForm = this.getSearchForm (label);
	searchForm.show ();
}

function getSmallSearchForm_disc (label)
{
	return '<FORM ACTION="' + config.pageSearchFullPath + '" METHOD="POST">' + label.weakSmall () + '<BR><INPUT TYPE="TEXT" NAME="SearchString" SIZE="10"></FORM>';
}

function showSmallSearchForm_disc (label)
{
	var searchForm = this.getSmallSearchForm (label);
	searchForm.show ();
}

function getAdminForm_disc ()
{
	var adminForm;
	adminForm = '<FORM METHOD="POST" ACTION="' + config.pageAdminFullPath + '">';
	adminForm += '<INPUT VALUE="' + config.sqlDeleteHierarchyButton + '" TYPE="SUBMIT">&nbsp;';
	adminForm += '<INPUT NAME="messageIDToDelete" SIZE="10">';
	adminForm += '</FORM>';

	adminForm += '<FORM METHOD="POST" ACTION="' + config.pageAdminFullPath + '">';
	adminForm += '<TEXTAREA NAME="SQLStatement" WRAP="PHYSICAL" ROWS="10" COLS="50">' + this.SQLStatement + '</TEXTAREA><BR>';
	adminForm += '<INPUT TYPE="submit" VALUE="' + config.sqlExecutePrompt + '"></FORM>';

	return adminForm;
}

function showAdminForm_disc ()
{
	var adminForm = this.getAdminForm ();
	adminForm.show ();
}

ForumForm.prototype.getSubjectInputField = getSubjectInputField_disc;
ForumForm.prototype.getBodyInputField = getBodyInputField_disc;
ForumForm.prototype.getSubjectSubform = getSubjectSubform_disc;
ForumForm.prototype.showSubjectSubform = showSubjectSubform_disc;
ForumForm.prototype.getBodySubform = getBodySubform_disc;
ForumForm.prototype.showBodySubform = showBodySubform_disc;
ForumForm.prototype.getEmailResponsesSubform = getEmailResponsesSubform_disc;
ForumForm.prototype.showEmailResponsesSubform = showEmailResponsesSubform_disc;
ForumForm.prototype.getNonEditableUserInfoSubform = getNonEditableUserInfoSubform_disc;
ForumForm.prototype.showNonEditableUserInfoSubform = showNonEditableUserInfoSubform_disc;
ForumForm.prototype.getEditableUserInfoSubform = getEditableUserInfoSubform_disc;
ForumForm.prototype.showEditableUserInfoSubform = showEditableUserInfoSubform_disc;
ForumForm.prototype.getUserInfoSubform = getUserInfoSubform_disc;
ForumForm.prototype.showUserInfoSubform = showUserInfoSubform_disc;
ForumForm.prototype.getMessageForm = getMessageForm_disc;
ForumForm.prototype.showMessageForm = showMessageForm_disc;
ForumForm.prototype.getSearchForm = getSearchForm_disc;
ForumForm.prototype.showSearchForm = showSearchForm_disc;
ForumForm.prototype.getSmallSearchForm = getSmallSearchForm_disc;
ForumForm.prototype.showSmallSearchForm = showSmallSearchForm_disc;
ForumForm.prototype.getAdminForm = getAdminForm_disc;
ForumForm.prototype.showAdminForm = showAdminForm_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// MESSAGE OBJECT
//
// ======================================================================

function ForumMessage (messageRecord)
{
	if ((messageRecord != null) && (!messageRecord.EOF))
	{
		var dBase = new ForumDatabase ();

		this.subject = dBase.getSubjectField (messageRecord);
		this.body = dBase.getBodyField (messageRecord);
		this.sortCode = dBase.getSortCodeField (messageRecord);
		this.authorName = dBase.getAuthorNameField (messageRecord);
		this.authorEmail = dBase.getAuthorEmailField (messageRecord);
		this.authorFullname = dBase.getAuthorFullnameField (messageRecord);
		this.messageID = dBase.getMessageIDField (messageRecord).Value;
		this.parentID = dBase.getParentIDField (messageRecord).Value;
		this.threadID = dBase.getThreadIDField (messageRecord).Value;
		this.numChildren = dBase.getNumChildrenField (messageRecord).Value;
		this.dateCreated = dBase.getDateCreatedField (messageRecord);
		this.dateModified = dBase.getDateModifiedField (messageRecord);
		this.emailParentOnResponse = dBase.getEmailParentOnResponseField (messageRecord).Value;

		delete dBase;
	}
	else
	{
		this.subject = '';
		this.body = '';
		this.sortCode = '';
		this.authorName = '';
		this.authorEmail = '';
		this.authorFullname = '';
		this.messageID = 0
		this.parentID = 0
		this.threadID = 0
		this.numChildren = 0
		this.dateCreated = '1/1/00';
		this.dateModified = '1/1/00';
		this.emailParentOnResponse = false;
	}

	this.validationFailureReason = '';

	return this;
}

function resync_disc (messageRecord)
{
	if (messageRecord != null)
	{
		var dBase = new ForumDatabase ();

		this.subject = dBase.getSubjectField (messageRecord);
		this.body = dBase.getBodyField (messageRecord);
		this.sortCode = dBase.getSortCodeField (messageRecord);
		this.authorName = dBase.getAuthorNameField (messageRecord);
		this.authorEmail = dBase.getAuthorEmailField (messageRecord);
		this.authorFullname = dBase.getAuthorFullnameField (messageRecord);
		this.messageID = dBase.getMessageIDField (messageRecord).Value;
		this.parentID = dBase.getParentIDField (messageRecord).Value;
		this.threadID = dBase.getThreadIDField (messageRecord).Value;
		this.numChildren = dBase.getNumChildrenField (messageRecord).Value;
		this.dateCreated = dBase.getDateCreatedField (messageRecord);
		this.dateModified = dBase.getDateModifiedField (messageRecord);
		this.emailParentOnResponse = dBase.getEmailParentOnResponseField (messageRecord).Value;

		delete dBase;
	}
	else
	{
		this.subject = '';
		this.body = '';
		this.sortCode = '';
		this.authorName = '';
		this.authorEmail = '';
		this.authorFullname = '';
		this.messageID = 0
		this.parentID = 0
		this.threadID = 0
		this.numChildren = 0
		this.dateCreated = '1/1/00';
		this.dateModified = '1/1/00';
		this.emailParentOnResponse = false;
	}

	this.validationFailureReason = '';

	return this;
}

function newForumMessageFromForm_disc (newMessageForm)
{
	var forumMessage = new ForumMessage (null);

	forumMessage.subject = (newMessageForm.subject == 'undefined' ? '' : newMessageForm.subject);
	forumMessage.body = (newMessageForm.body == 'undefined' ? '' : newMessageForm.body);
	forumMessage.sortCode = (newMessageForm.sortCode == 'undefined' ? '0' : newMessageForm.sortCode);
	forumMessage.parentID = (newMessageForm.parentID == 'undefined' ? '0' : newMessageForm.parentID);
	forumMessage.threadID = (newMessageForm.threadID == 'undefined' ? '0' : newMessageForm.threadID);
	forumMessage.messageID = (newMessageForm.messageID == 'undefined' ? '0' : newMessageForm.messageID);
	forumMessage.emailParentOnResponse = (newMessageForm.emailParentOnResponse == 'undefined' ? '' : newMessageForm.emailParentOnResponse);
	forumMessage.authorName = (newMessageForm.authorName == 'undefined' ? '' : newMessageForm.authorName);
	forumMessage.authorEmail = (newMessageForm.authorEmail == 'undefined' ? '' : newMessageForm.authorEmail);
	forumMessage.authorFullname = (newMessageForm.authorFullname == 'undefined' ? '' : newMessageForm.authorFullname);

	return forumMessage;
}

function getExpandCollapse_disc (viewIndex, activeThreadID)
{
	var expandCollapse = new ForumExpandCollapse (this, viewIndex, 0, activeThreadID);

	return '<FONT SIZE="2">' + expandCollapse.getIcon() + '</FONT></TD><TD>';
}

function getDHTMLExpandCollapse_disc (currentIndentLevel)
{
	var expandCollapse = new ForumExpandCollapse (this, 0, 0, 0);

	return '<FONT SIZE="2">' + expandCollapse.getDHTMLIcon (currentIndentLevel) + '</FONT></TD><TD>';
}

function getViewEntry_disc (activeMessageID)
{
	var subjectLineString = '';

	if (Number (activeMessageID) == Number (this.messageID))
	{
		subjectLineString += this.subject.strong();
	}
	else
	{
		subjectLineString += this.getSubjectLink().strong();
	}

	subjectLineString += config.separateSubjectAuthor + String (this.authorFullname).strongSmall();
	var emailLink = new ForumEmail ();
	subjectLineString += ' (&#145;' + emailLink.getEmailLink (this.authorEmail, this.authorName, this.authorName) + '&#146;) ' + config.separateAuthorDate + String (this.dateCreated).dateShort();

	if (this.numChildren == 0)
	{
		subjectLineString = subjectLineString + " ("  + config.forumNoRepliesTag + ")";
	}
	else if (this.numChildren == 1)
	{
		subjectLineString = subjectLineString + " (" + this.numChildren + config.forumOneReplyTag + ")";
	}
	else
	{
		subjectLineString = subjectLineString + " (" + this.numChildren + config.forumManyRepliesTag + ")";
	}

	subjectLineString = subjectLineString.weakSmall();
	return subjectLineString;
}

function getSubjectLink_disc ()
{
	var openLink = '<A HREF="' + config.pageShowMessageFullPath + '?messageID=' + this.messageID + '" TITLE="' + config.popupSubjectPrefix + '&#145;' + this.subject.stripAllCodes () + '&#146;">';

	var newSubject = this.subject;

	var closeLink = '</A>';

	return openLink + newSubject + closeLink;
}

function summarise_disc ()
{
	return '<LI>' + this.getSubjectLink () + config.separateSubjectAuthor + this.authorName + config.separateAuthorDate + String (this.dateCreated).dateLong () + '<BLOCKQUOTE>' + this.body.precis () + '</BLOCKQUOTE>';
}

function precis_disc ()
{
	var precisString = String (this.body);
	precisString = precisString.substr(0, config.searchResultsPrecisLength);
	precisString = precisString.replace ('\<P\>', ' ');
	precisString = precisString.replace ('\</P\>', ' ');
	precisString = precisString.replace ('\<BR\>', ' ');

	if (precisString.lastIndexOf ('>') < precisString.lastIndexOf ('<'))
	{
		precisString = precisString.substr (0, precisString.lastIndexOf ('<'));
	}

	return precisString;
}

function sendAdminAlert_disc (pureSubject, pureBody)
{
	if ('' != config.emailAdminAddress)
	{
		var adminEmail;
		adminEmail = new ForumEmail ();
		adminEmail.toName = config.emailAdminName;
		adminEmail.toAddress = config.emailAdminAddress;
		adminEmail.fromName = this.authorFullname;
		adminEmail.fromAddress = this.authorEmail;
		adminEmail.subject = config.mailAdminNewPostSubjectPrefix + ' (' + config.forumName + '): ' + pureSubject;
		if (config.switchAllowHTMLEmail)
		{
			var HTMLBody;
			HTMLBody = config.mailAdminNewPostBodyPrefix + this.authorFullname + config.mailAdminNewPostSeparateNameForum + config.forumName
			HTMLBody += '<P>' + this.subject.strong() + '</P>';
			HTMLBody += this.body.messageBody();
			HTMLBody += '<P>' + getNewReplyButtonWithTextWithMessage_disc (config.showMsgReplyPostButton, this) + '</P>';
			adminEmail.body = adminEmail.getHTMLMessageBody (this, config.forumName, HTMLBody, config.emailAlertSignatureHTML);

			adminEmail.sendHTML ();
		}
		else
		{
			adminEmail.body = config.mailAdminNewPostBodyPrefix + this.authorFullname + 
				config.mailAdminNewPostSeparateNameForum + config.forumName + '\n\n' + pureBody.stripAllCodes ();
			adminEmail.send ();
		}
	}

}

function sendUserAlert_disc (pureSubject, pureBody)
{
	if ((config.switchAllowEmailResponses) && (this.parentID != 0))
	{
		var parentRecord;

		var dBase = new ForumDatabase ();

		parentRecord = dBase.getRecordByID (this.parentID);

		if (parentRecord != null)
		{
			if (parentRecord.emailParentOnResponse)
			{
				var userAlert = new ForumEmail ();
				userAlert.subject = this.authorFullname + config.mailUserNewPostSeparateNameForum + config.forumName;

				userAlert.toAddress = parentRecord.authorEmail;
				userAlert.toName = parentRecord.authorFullname;
				userAlert.fromAddress = config.emailAlertFromAddress;
				userAlert.fromName = config.emailAlertFromName;

				var subject = pureSubject;

				if ((config.switchAllowHTMLEmail) && (config.userPrefersHTMLMail (parentRecord.authorName)))
				{
					var HTMLBody;
					HTMLBody = this.authorFullname + config.mailUserNewPostNameSuffix + config.mailUserNewPostMessagePrefix;
					HTMLBody += '<P>' + subject.strong() + '</P>';
					HTMLBody += this.body.messageBody();
					HTMLBody += '<P>' + getNewReplyButtonWithTextWithMessage_disc (config.showMsgReplyPostButton, this) + '</P>';

					userAlert.body = userAlert.getHTMLMessageBody (this, config.forumName, HTMLBody, config.emailAlertSignatureHTML);

					userAlert.sendHTML ();
				}
				else
				{
					userAlert.body = this.authorFullname + config.mailUserNewPostSeparateNameMessage + subject;
					userAlert.body += '\n\n' + config.mailUserNewPostMessagePrefix + '\n\n\n' + subject;
					userAlert.body += '\n\n' + pureBody.stripAllCodes () + '\n' + config.emailAlertSignature;
					userAlert.send ();
				}
			}
		}
	}

	return;
}

function saveAsNewMessage_disc (successfulMessage, failedMessagePrefix)
{
	var pureBody = String (this.body).purify();
	var pureSubject = String (this.subject).purify();

	this.normalisePost();

	if (this.validatePost())
	{
		var dBase = new ForumDatabase ();
		dBase.saveNewRecord (this);

		successfulMessage.strong().show();
	}
	else
	{
		failedMessagePrefix = failedMessagePrefix.paragraph();
		failedMessagePrefix.show();
		this.validationFailureReason.show();
		return false;
	}

	this.sendAdminAlert (pureSubject, pureBody);

	this.sendUserAlert (pureSubject, pureBody);

	return true;
}

function saveAsUpdatedMessage_disc (successfulMessage, failedMessagePrefix)
{
	this.normalisePost();

	var errorString
	if (this.validatePost(errorString))
	{
		var dBase = new ForumDatabase ();
		dBase.saveUpdatedRecord (this);

		successfulMessage = String (successfulMessage).paragraph();
		successfulMessage.strong().show();
		return true;
	}
	else
	{
		failedMessagePrefix = failedMessagePrefix.paragraph();
		failedMessagePrefix.show ();
		this.validationFailureReason.show();
		return false;
	}
}

function saveUpdatedData_disc ()
{
	var dBase = new ForumDatabase ();
	dBase.saveUpdatedRecord (this);
}

function normalisePost_disc ()
{
	this.threadID = Number (this.threadID);
	this.sortCode = String (this.sortCode).substr (0, config.DBMaxSortcodeSize);
	this.parentID = Number (this.parentID);

	this.emailResponses = Boolean (this.emailResponses);

	this.subject = String (this.subject).substr (0, config.DBMaxSubjectSize).formatForStoring ();
	this.body = String (this.body).substr (0, config.DBMaxMessageSize).formatForStoring ();
	this.authorName = String (this.authorName).substr (0, config.DBMaxUsernameSize).formatForStoring ();
	this.authorFullname = String (this.authorFullname).substr (0, config.DBMaxFullnameSize).formatForStoring ();
	this.authorEmailAddress = String (this.authorEmailAddress).substr (0, config.DBMaxEmailAddressSize).formatForStoring ();
}

function validatePost_disc ()
{
	var errors = '<UL TYPE="square">';
	var valid = true;

	if (this.authorName == '')
	{
		errors += '<LI>' + config.errorNoUsername;
		valid = false;
	}

	if (this.authorFullname == '')
	{
		errors += '<LI>' + config.errorNoName;
		valid = false;
	}

	if (this.authorEmail == '')
	{
		errors += '<LI>' + config.errorNoEmail;
		valid = false;
	}

	if (this.subject == '')
	{
		errors += '<LI>' + config.errorNoSubject;
		valid = false;
	}

	if (this.body == '')
	{
		errors += '<LI>' + config.errorNoBody;
		valid = false;
	}

	if (!valid)
	{
		this.validationFailureReason = errors + '</UL>';
	}

	return valid;
}

function renderMessage_disc ()
{
	var pageString = '';
	pageString += '<TABLE BORDER="0" WIDTH="' + config.fullTableWidth + '" CELLPADDING="0" CELLSPACING="0">'
	pageString.show();

	var prompt;
	prompt = config.showMsgPostedByPrompt;

	var email = new ForumEmail();
	email.fromName = this.authorFullname
	email.fromAddress = this.authorEmail

	var value;
	value = this.authorName + ' (&#145;' + email.getFromEmailLink() + '&#146;)'

	var subform;
	subform = prompt.weak ().tableTitleCol () + value.strong ().tableFieldCol ();

	subform = subform.tableRow ();
	subform.show ();

	prompt = config.showMsgPostedOnPrompt;
	value = this.dateCreated.dateLong().strong ();
	subform = prompt.weak().tableTitleCol () + value.tableFieldCol ();
	subform = subform.tableRow ();
	subform.show ();

	var spacer = '&nbsp;';
	spacer.tableColSpan (2).show();

	prompt = config.showMsgBodyPrompt + '<BR>';
	value = this.body;
	subform = prompt.strong ()
	subform += value.messageBody () ;
	subform = subform.tableColSpan (2);
	subform = subform.tableRow ();
	subform.show ();

	pageString = '</TABLE>';
	pageString.show ();
}

ForumMessage.prototype.resync = resync_disc;
ForumMessage.prototype.newForumMessageFromForm = newForumMessageFromForm_disc;
ForumMessage.prototype.summarise = summarise_disc;
ForumMessage.prototype.precis = precis_disc;
ForumMessage.prototype.getSubjectLink = getSubjectLink_disc;
ForumMessage.prototype.getViewEntry = getViewEntry_disc;
ForumMessage.prototype.getEmailLink = getEmailLink_disc;
ForumMessage.prototype.getExpandCollapse = getExpandCollapse_disc;
ForumMessage.prototype.getDHTMLExpandCollapse = getDHTMLExpandCollapse_disc;
ForumMessage.prototype.sendAdminAlert = sendAdminAlert_disc;
ForumMessage.prototype.sendUserAlert = sendUserAlert_disc;
ForumMessage.prototype.saveAsNewMessage = saveAsNewMessage_disc;
ForumMessage.prototype.saveAsUpdatedMessage = saveAsUpdatedMessage_disc;
ForumMessage.prototype.saveUpdatedData = saveUpdatedData_disc;
ForumMessage.prototype.normalisePost = normalisePost_disc;
ForumMessage.prototype.validatePost = validatePost_disc;
ForumMessage.prototype.render = renderMessage_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// STRING OBJECT ADDITIONS
//
// ======================================================================

var END_OF_URL_REGEXP = "[^A-Za-z0-9\.:;,=@_&\\/\\?\\+\\$\\{\\}]";
var OPEN_URL_TAG_REGEXP = '\\[\\s*url\\s*\\]'
var CLOSE_URL_TAG_REGEXP = '\\[\\s*\\/\\s*url\\s*\\]'
var OPEN_IMG_TAG_REGEXP = '\\[\\s*img\\s*\\]'
var CLOSE_IMG_TAG_REGEXP = '\\[\\s*\\/\\s*img\\s*\\]'
var OPEN_HTTP_REGEXP = 'http\:\\/\\/'
var OPEN_WWW_REGEXP =  'www\.'

var finishedAt = 0;

function strong_disc ()
{
	return String ('<FONT><STRONG>' + this + '</STRONG></FONT>');
}

function strongBig_disc ()
{
	return String ('<FONT SIZE="+1"><STRONG>' + this + '</STRONG></FONT>');
}

function strongSmall_disc ()
{
	return String ('<FONT SIZE="-1"><STRONG>' + this + '</STRONG></FONT>');
}

function weak_disc ()
{
	return String ('<FONT>' + this + '</FONT>');
}

function weakBig_disc ()
{
	return String ('<FONT SIZE="+1">' + this + '</FONT>');
}

function weakSmall_disc ()
{
	return String ('<FONT SIZE="-1">' + this + '</FONT>');
}

function messageBody_disc ()
{
	return String ('<BLOCKQUOTE>' + this + '</BLOCKQUOTE>');
}

function paragraph_disc ()
{
	return String ('<P>' + this + '</P>');
}

function dateShort_disc ()
{
	dateValue = new Date (this);
	return String (dayName_disc [dateValue.getDay()] + ', ' + dateValue.getDate() + daySuffix_disc [dateValue.getDate()] + ' ' + monthName_disc [dateValue.getMonth()] + ' ' + dateValue.getFullYear());
}

function dateLong_disc ()
{
	dateValue = new Date (this);
	return String (dayName_disc [dateValue.getDay()] + ', ' + dateValue.getDate() + daySuffix_disc [dateValue.getDate()] + ' ' + monthName_disc [dateValue.getMonth()] + ' ' + dateValue.getFullYear());
}

function showHTML_disc ()
{
	Response.Write (this);
}

function formatForURL_disc ()
{
	var workingText;

	workingText = this;
	workingText = workingText.replace (/\ /gi, '%20');
	workingText = workingText.replace (/\\/gi, '/');

	return workingText;
}

function safeFormat_dir ()
{
	var workingText;

	workingText = this;

	workingText = Server.HTMLEncode (workingText);
	workingText = workingText.replace (/\'/gi, '&#146;');
	workingText = workingText.replace (/\"/gi, '&quot;');

	return workingText;
}

function purify_disc ()
{
	var workingText = this;
	workingText = workingText.replace (/motherfuck/gi, '**********');
	workingText = workingText.replace (/fuck/gi, '****');
	workingText = workingText.replace (/shit/gi, '****');
	workingText = workingText.replace (/cunt/gi, '****');
	workingText = workingText.replace (/bastard/gi, '*******');

	return workingText;
}

function formatForStoring_disc ()
{
	var workingText;

	workingText = this.purify();

	workingText = Server.HTMLEncode (workingText);
	workingText = workingText.replace (/\n\n/gi, '<P></P>');
	workingText = workingText.replace (/\n/gi, '<BR>');

	if (config.switchAllowRichFormatting)
	{
		workingText = workingText.convertRichFormatting ();
	}

	return workingText;
}

function stripCodes_disc ()
{
	var workingText;

	workingText = this;
	workingText = workingText.replace (/\<[a-zA-Z]+\>/gi, '');
	workingText = workingText.replace (/\<\/[a-zA-Z]+\>/gi, '');
	workingText = workingText.replace (/\[[a-zA-Z]+\]/gi, '');
	workingText = workingText.replace (/\[\/[a-zA-Z]+\]/gi, '');

	return workingText;
}

function stripAllCodes_disc ()
{
	var workingText;

	workingText = this;
	workingText = workingText.replace (/\<[a-zA-Z]+\>/gi, '');
	workingText = workingText.replace (/\<\/[a-zA-Z]+\>/gi, '');
	workingText = workingText.replace (/\[[a-zA-Z]+\]/gi, '');
	workingText = workingText.replace (/\[\/[a-zA-Z]+\]/gi, '');

	return workingText;
}

function unformatFromStoring_disc ()
{
	var workingText;

	workingText = this;

	if (config.switchAllowRichFormatting)
	{
		workingText = workingText.unconvertRichFormatting ();
	}

	workingText = workingText.replace (/\<P\>/gi, '\n');
	workingText = workingText.replace (/\<\/P\>/gi, '\n');
	workingText = workingText.replace (/\<BR\>/gi, '\n');
	workingText = workingText.replace (/\&amp\;/gi, '&');
	workingText = workingText.replace (/\"/gi, '&quot;');

	return workingText;
}

function tableStartRow_disc ()
{
	return this + '<TR>';
}

function tableEndRow_disc ()
{
	return this + '</TR>';
}

function tableRow_disc ()
{
	return '<TR WIDTH="' + config.fullTableWidth + '">' + this + '</TR>';
}

function tableColSpan_disc (numberOfColumns)
{
	return '<TD VALIGN="BOTTOM" COLSPAN="' + numberOfColumns + '">' + this + '</TD>';
}

function tableTitleCol_disc ()
{
	return '<TD VALIGN="BOTTOM" WIDTH="' + config.titleColumnWidth + '">' + this + '</TD>';
}

function tableFieldCol_disc ()
{
	return '<TD VALIGN="BOTTOM" WIDTH="' + config.fieldColumnWidth + '">' + this + '</TD>';
}

function appendBreak_disc ()
{
	return this + '<BR>';
}

function appendEmptyPara_disc ()
{
	return this + '<P>&nbsp;</P>';
}

function convertRichFormatting_disc ()
{
	var workingText = this;

	workingText = fixBrokenCodes_disc (workingText);

	workingText = convertBoldTag_disc (workingText);
	workingText = convertItalicTag_disc (workingText);
	workingText = convertQuoteTag_disc (workingText);
	workingText = convertPreTag_disc (workingText);
	workingText = convertBreakTag_disc (workingText);
	workingText = convertTagEmail_disc (workingText);
	workingText = convertComplexTags_disc (workingText);

	return workingText;
}

function unconvertRichFormatting_disc ()
{
	var workingText = this;

	workingText = unconvertBoldTag_disc (workingText);
	workingText = unconvertItalicTag_disc (workingText);
	workingText = unconvertQuoteTag_disc (workingText);
	workingText = unconvertPreTag_disc (workingText);
	workingText = unconvertBreakTag_disc (workingText);
	workingText = unconvertTagHyperlinks_disc (workingText);
	workingText = unconvertTagImage_disc (workingText);

	return workingText;
}

function fixBrokenCodes_disc (textToClean)
{
	var workingText = textToClean;

	workingText = fixTag_disc (workingText, 'b');
	workingText = fixTag_disc (workingText, 'i');
	workingText = fixTag_disc (workingText, 'pre');
	workingText = fixTag_disc (workingText, 'quote');
	workingText = fixTag_disc (workingText, 'img');
	workingText = fixTag_disc (workingText, 'url');
	workingText = fixTag_disc (workingText, 'email');

	return workingText;
}

function fixTag_disc (textToClean, tag)
{
	var workingText = textToClean;
	var openTag = new RegExp ('\\[' + tag + '\]', 'gi');
	var closeTag = new RegExp ('\\[\\/' + tag + '\]', 'gi');
	var tagDifference = countTags_disc (workingText, openTag) - countTags_disc (workingText, closeTag);

	if (tagDifference > 0)
	{
		for (counter = 0; counter < tagDifference; counter++)
		{
			workingText += '[/' + tag + ']';
		}
	}

	return workingText;
}

function countTags_disc (richText, tag)
{
	var counter = 0;
	var workingText = richText;
	var foundAt = workingText.search (tag);
	while (foundAt != -1)
	{
		counter = counter + 1;
		workingText = workingText.substr (foundAt + 1, workingText.length - foundAt + 1);

		foundAt = workingText.search (tag);
	}

	return counter;
}

function convertBoldTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/\[b\]/gi, '<B>');
	formattedText = formattedText.replace (/\[\/b\]/gi, '</B>');

	return formattedText;
}

function unconvertBoldTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/<b>/gi, '[B]');
	formattedText = formattedText.replace (/<\/b>/gi, '[/B]');

	return formattedText;
}

function convertItalicTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/\[i\]/gi, '<I>');
	formattedText = formattedText.replace (/\[\/i\]/gi, '</I>');

	return formattedText;
}

function unconvertItalicTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/<i>/gi, '[I]');
	formattedText = formattedText.replace (/<\/i>/gi, '[/I]');

	return formattedText;
}

function convertQuoteTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/\[quote\]/gi, '<BLOCKQUOTE>');
	formattedText = formattedText.replace (/\[\/quote\]/gi, '</BLOCKQUOTE>');

	return formattedText;
}

function unconvertQuoteTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/<BLOCKQUOTE>/gi, '[QUOTE]');
	formattedText = formattedText.replace (/<\/BLOCKQUOTE>/gi, '[/QUOTE]');

	return formattedText;
}

function convertBreakTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/\[br\]/gi, '<BR>');
	formattedText = formattedText.replace (/\[\/br\]/gi, '');

	return formattedText;
}

function unconvertBreakTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/<br>/gi, '\n');
	formattedText = formattedText.replace (/<\/br>/gi, '');

	return formattedText;
}

function convertPreTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/\[pre\]/gi, '<PRE>');
	formattedText = formattedText.replace (/\[\/pre\]/gi, '</PRE>');

	return formattedText;
}

function unconvertPreTag_disc (textToFormat)
{
	var formattedText = String (textToFormat);

	formattedText = formattedText.replace (/<pre>/gi, '[PRE]');
	formattedText = formattedText.replace (/<\/pre>/gi, '[/PRE]');

	return formattedText;
}

function convertComplexTags_disc (textToFormat)
{
	var workingText = textToFormat;
	var newText = '';
	var openAtRX = new RegExp (OPEN_URL_TAG_REGEXP + '|' + OPEN_IMG_TAG_REGEXP + '|' + OPEN_HTTP_REGEXP + '|' + OPEN_WWW_REGEXP, 'gi');
	var foundAt = workingText.search (openAtRX);

	var endAt;
	while (foundAt != -1)
	{
		newText += workingText.substring (0, foundAt);

		if (foundAt == workingText.search (OPEN_URL_TAG_REGEXP))
		{
			newText += handleURLTag_disc (workingText.substring (foundAt, workingText.length));
		}
		else if (foundAt == workingText.search (OPEN_IMG_TAG_REGEXP))
		{
			newText += handleIMGTag_disc (workingText.substring (foundAt, workingText.length));
		}
		else
		{
			newText += handleBareURL_disc (workingText.substring (foundAt, workingText.length));
		}

		workingText = workingText.substring (foundAt + finishedAt, workingText.length);
		foundAt = workingText.search (openAtRX);
	}

	return newText + workingText;
}

function handleURLTag_disc (textToFormat)
{
	var workingText = textToFormat;
	var endOfOpeningTag = workingText.indexOf (']') + 1;
	var startOfClosingTag = workingText.search (CLOSE_URL_TAG_REGEXP)
	var endOfClosingTag = workingText.indexOf (']', startOfClosingTag) + 1;

	var URLText = workingText.substring (endOfOpeningTag, startOfClosingTag).stripAllCodes ();

	var URLLink = '<A HREF="' + addProtocol_disc (URLText) + '" TITLE="' + config.warningUnverifiedLink + '">' + URLText + '</A>';

	finishedAt = endOfClosingTag;
	return URLLink;
}

function handleIMGTag_disc (textToFormat)
{
	var workingText = textToFormat;
	var endOfOpeningTag = workingText.indexOf (']') + 1;
	var startOfClosingTag = workingText.search (CLOSE_IMG_TAG_REGEXP)
	var endOfClosingTag = workingText.indexOf (']', startOfClosingTag) + 1;

	var URLText = workingText.substring (endOfOpeningTag, startOfClosingTag).stripAllCodes ();

	var imageLink = '<IMG SRC="' + addProtocol_disc (URLText) + '" TITLE="' + config.warningUnverifiedImage + '">';

	finishedAt = endOfClosingTag;
	return imageLink;
}

function handleBareURL_disc (textToFormat)
{
	var whitespace =  new RegExp (END_OF_URL_REGEXP, 'gi');
	var workingText = textToFormat;
	var endOfOpeningTag = 0;
	var startOfClosingTag = workingText.search (whitespace)
	var endOfClosingTag = startOfClosingTag;

	var URLText = workingText.substring (endOfOpeningTag, startOfClosingTag).stripAllCodes ();

	var URLLink = '<A HREF="' + addProtocol_disc (URLText) + '" TITLE="' + config.warningUnverifiedLink + '">' + URLText + '</A>';

	finishedAt = endOfClosingTag;
	return URLLink;
}

function unconvertTagHyperlinks_disc (textToFormat)
{
	var workingText = textToFormat;
	var afterStart;
	var newText = '';
	var tag = 'url';
	var openTag = new RegExp ('\\<A', 'gi');
	var tagEnd = new RegExp ('\\>', 'gi');
	var closeTag = new RegExp ('\\<\\/A', 'gi');

	var counter = 0;
	var tagEnds = 0;
	var foundAt = workingText.search (openTag);
	var endAt;
	var linkText;
	var linkTag;

	while (foundAt != -1)
	{
		newText += workingText.substring (0, foundAt);
		tagEnds = workingText.substring (foundAt, workingText.length).search (tagEnd);

		afterStart = workingText.substring (foundAt + tagEnds + 1, workingText.length);
		endAt = afterStart.search (closeTag);

		linkText = afterStart.substring (0, endAt);
		linkTag = workingText.substring (foundAt, foundAt + tagEnds + 1);

		if (linkTag.search (/mailto\:/gi) != -1)
		{
			newText += '[email]' + linkText + '[/email]';
		}
		else
		{
			newText += '[url]' + linkText + '[/url]';
		}

		tagEnds = afterStart.substring (endAt, afterStart.length).search (tagEnd);

		workingText = afterStart.substring (tagEnds + endAt + 1, afterStart.length);

		foundAt = workingText.search (openTag);
	}

	newText += workingText;

	return newText;
}

function unconvertTagImage_disc (textToFormat)
{
	var workingText = textToFormat;
	var afterStart;
	var newText = '';
	var tag = 'image';
	var openTag = new RegExp ('\<IMG', 'gi');
	var tagEnd = new RegExp ('\>', 'gi');

	var counter = 0;
	var tagEnds = 0;
	var foundAt = workingText.search (openTag);
	var endAt;
	var imageSrc;
	var imageEndAt;
	var linkTag;
	var srcTag;

	while (foundAt != -1)
	{
		newText += workingText.substring (0, foundAt);
		tagEnds = workingText.substring (foundAt, workingText.length).search (tagEnd);

		afterStart = workingText.substring (foundAt + tagEnds + 1, workingText.length);

		linkTag = workingText.substring (foundAt, foundAt + tagEnds + 1);
		srcTag = linkTag.substring (linkTag.search(/src/gi) + 4, linkTag.length);

		if ((srcTag.charAt(0) == '"') || (srcTag.charAt(0) == "'"))
		{
			if (srcTag.charAt(0) == '"')
			{
				imageEndAt = srcTag.substring(1,srcTag.length).search (/"/gi);
				imageSrc = srcTag.substring (1, imageEndAt + 1);
			}
			else
			{
				imageEndAt = srcTag.substring(1,srcTag.length).search (/'/gi);
				imageSrc = imageSrc.substring (1, imageEndAt + 1);
			}
		}
		else
		{
			imageSrc = srcTag.getNextToken (/ /gi);
		}

		newText += '[img]' + imageSrc + '[/img]';

		workingText = afterStart.substring (tagEnds + endAt + 1, afterStart.length);

		foundAt = workingText.search (openTag);
	}

	newText += workingText;

	return newText;
}

function getNextToken_disc (tokenCutoff)
{
	var endAt = this.search (tokenCutoff);

	if (endAt > 0)
	{
		return this.substring (0, endAt);
	}
	else
	{
		return this;
	}
}

function convertTagEmail_disc (textToFormat)
{
	var workingText = textToFormat;
	var afterStart;
	var newText = '';
	var tag = 'email';
	var openTag = new RegExp ('\\[' + tag + '\]', 'gi');
	var closeTag = new RegExp ('\\[\\/' + tag + '\]', 'gi');
	var atSign = new RegExp ('[a-zA-Z0-9_%\\.]+@{1}[a-zA-Z0-9\\.]+', 'gi');
	var whitespace =  new RegExp (END_OF_URL_REGEXP, 'gi');

	var counter = 0;
	var foundTag = workingText.search (openTag);
	var foundSign = workingText.search (atSign);
	var foundAt = getMinPositiveNumberOfTwo_disc (foundTag, foundSign);
	var endAt;
	var mailuserText;

	while (foundAt != -1)
	{
		if (foundAt == foundTag)
		{
			afterStart = workingText.substring (foundAt + tag.length + 2, workingText.length);
			endAt = afterStart.search (closeTag);
		}
		else
		{
			mailuserText = workingText.substring (0, foundAt);
			foundAt = (foundAt == -1 ? 0 : foundAt);
			afterStart = workingText.substring (foundAt, workingText.length);
			endAt = afterStart.search (whitespace);
			endAt = ((endAt == 0) || (endAt == -1) ? afterStart.length : endAt);
			if (afterStart.charAt (endAt - 1) == ".")
			{
				endAt = endAt - 1;
			}
		}

		linkText = afterStart.substring (0, endAt);

		newText += workingText.substring (0, foundAt);
		newText += '<A HREF="mailto:' + linkText + '" TITLE="' + config.warningUnverifiedEmail + '">' + linkText + '</A>';

		if (foundAt == foundTag)
		{
			workingText = afterStart.substring (endAt + tag.length + 3, afterStart.length);
		}
		else
		{
			workingText = afterStart.substring (endAt, afterStart.length);
		}

		foundTag = workingText.search (openTag);
		foundSign = workingText.search (atSign);
		foundAt = getMinPositiveNumberOfTwo_disc (foundTag, foundSign);
	}

	if (newText == '')
	{
		newText = workingText;
	}
	else
	{
		newText = newText + workingText;
	}

	return newText;
}

function addProtocol_disc (URL)
{
	if (URL.substr (0, 7) == 'http://')
	{
		return URL;
	}
	else
	{
		if (URL.substr (0, 6) == 'ftp://')
		{
			return URL;
		}
		else
		{
			return 'http://' + URL;
		}
	}
}

function getMinPositiveNumberOfTwo_disc (number1, number2)
{
	var retval;
	if (number1 == -1)
	{
		retval = number2;
	}
	else if (number2 == -1)
	{
		retval = number1;
	}
	else
	{
		retval = Math.min (number1, number2);
	}
	return retval;
}

function precis_disc ()
{
	var precisString = String (this);
	var stopAt = precisString.search (/\<BR\>/i);
	if (stopAt == -1)
	{
		stopAt = 2000;
	}
	precisString = precisString.substr(0, stopAt);
	precisString = precisString.replace ('\<P\>', ' ');
	precisString = precisString.replace ('\</P\>', ' ');
	precisString = precisString.replace ('\<BR\>', ' ');

	if (precisString.lastIndexOf ('>') < precisString.lastIndexOf ('<'))
	{
		precisString = precisString.substr (0, precisString.lastIndexOf ('<'));
	}

	return precisString;
}

String.prototype.strong = strong_disc;
String.prototype.strongBig = strongBig_disc;
String.prototype.strongSmall = strongSmall_disc;
String.prototype.weak = weak_disc;
String.prototype.weakBig = weakBig_disc;
String.prototype.weakSmall = weakSmall_disc;
String.prototype.messageBody = messageBody_disc;
String.prototype.paragraph = paragraph_disc;
String.prototype.dateShort = dateShort_disc;
String.prototype.dateLong = dateLong_disc;
String.prototype.show = showHTML_disc;
String.prototype.formatForURL = formatForURL_disc;
String.prototype.safeFormat = safeFormat_dir;
String.prototype.purify = purify_disc;
String.prototype.formatForStoring = formatForStoring_disc;
String.prototype.unformatFromStoring = unformatFromStoring_disc;
String.prototype.stripCodes = stripCodes_disc;
String.prototype.stripAllCodes = stripAllCodes_disc;
String.prototype.tableTitleCol = tableTitleCol_disc;
String.prototype.tableFieldCol = tableFieldCol_disc;
String.prototype.tableRow = tableRow_disc;
String.prototype.tableColSpan = tableColSpan_disc;
String.prototype.appendBreak = appendBreak_disc;
String.prototype.appendEmptyPara = appendEmptyPara_disc;
String.prototype.convertRichFormatting = convertRichFormatting_disc;
String.prototype.unconvertRichFormatting = unconvertRichFormatting_disc;
String.prototype.getNextToken = getNextToken_disc;
String.prototype.precis = precis_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// THREAD OBJECT
//
// ======================================================================

function ForumThread (currentMessageID)
{
	this.currentMessageID = currentMessageID;

	return this;
}

function getAllSorted_disc (sortAscending)
{
	var messages;
	var dbase = new ForumDatabase ();

	messages = dbase.getAllRootMessages(sortAscending);

	var messageView = new ForumView (messages, this.currentMessageID);
	var threadInfo = messageView.getView ();

	messages.close ();
	delete messages;

	return threadInfo;
}

function showAllSorted_disc (sortAscending)
{
	var threadInfo = this.getAllSorted (sortAscending);
	threadInfo.show ();
}

function getCurrentSorted_disc (sortAscending)
{
	var messages;
	var dbase = new ForumDatabase ();

	messages = dbase.getCurrentRootMessages (sortAscending);

	var messageView = new ForumView (messages, this.currentMessageID);
	var threadInfo = messageView.getView ();

	messages.close();
	delete messages;

	return threadInfo;
}

function showCurrentSorted_disc (sortAscending)
{
	var threadInfo = this.getCurrentSorted (sortAscending);
	threadInfo.show ();
}

function getCurrentSortedDHTML_disc (sortAscending)
{
	var messages;
	var dbase = new ForumDatabase ();

	messages = dbase.getAllCurrentMessages (sortAscending);

	var messageView = new ForumView (messages, this.currentMessageID);
	var threadInfo = messageView.getDHTMLView ();

	messages.close();
	delete messages;

	return threadInfo;
}

function showCurrentSortedDHTML_disc (sortAscending)
{
	var threadInfo = this.getCurrentSortedDHTML (sortAscending);
	threadInfo.show ();
}

function getExpandedThread_disc (threadID, startAt)
{
	var messages;
	var dbase = new ForumDatabase ();

	messages = dbase.getSubThreadMessages (threadID, startAt);

	var messageView = new ForumView (messages, this.currentMessageID);
	var expandedThread = messageView.getViewThread ();

	messages.close();
	delete messages;

	return expandedThread;
}

function showExpandedThread_disc (threadID, startAt)
{
	var threadInfo = this.getExpandedThread (threadID, startAt);
	threadInfo.show ();
}

function getSubThread_disc (threadID, startAt)
{
	var messages;
	var dbase = new ForumDatabase ();

	messages = dbase.getSubThreadMessages (threadID, startAt);

	var messageView = new ForumView (messages, this.currentMessageID);
	var subThread = messageView.getViewFullThread ();

	messages.close();
	delete messages;

	return subThread;
}

function showSubThread_disc (threadID, startAt)
{
	var threadInfo = this.getSubThread (threadID, startAt);
	threadInfo.show ();
}

function getFullThread_disc (threadID)
{
	var messages;
	var dbase = new ForumDatabase ();
	var threadLayout;

	messages = dbase.getAllThreadMessages (threadID);

	var messageView = new ForumView (messages, this.currentMessageID);
	threadLayout = messageView.getViewFullThread ();

	messages.close();
	delete messages;

	return threadLayout;
}

function showFullThread_disc (threadID)
{
	var threadInfo = this.getFullThread (threadID);
	threadInfo.show ();
}

ForumThread.prototype.getAllSorted = getAllSorted_disc;
ForumThread.prototype.showAllSorted = showAllSorted_disc;
ForumThread.prototype.getCurrentSorted = getCurrentSorted_disc;
ForumThread.prototype.showCurrentSorted = showCurrentSorted_disc;
ForumThread.prototype.getCurrentSortedDHTML = getCurrentSortedDHTML_disc;
ForumThread.prototype.showCurrentSortedDHTML = showCurrentSortedDHTML_disc;
ForumThread.prototype.getExpandedThread = getExpandedThread_disc;
ForumThread.prototype.showExpandedThread = showExpandedThread_disc;
ForumThread.prototype.getSubThread = getSubThread_disc;
ForumThread.prototype.showSubThread = showSubThread_disc;
ForumThread.prototype.getFullThread = getFullThread_disc;
ForumThread.prototype.showFullThread = showFullThread_disc;
</SCRIPT>

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
// ASP Forums version 1.11 - 22nd May 2000.
//=======================================================================

// ======================================================================
//
// VIEW OBJECT
//
// ======================================================================

function ForumView (messages, currentMessageID)
{
	this.messages = messages;
	this.currentMessageID = currentMessageID;

	return this;
}

function getView_disc ()
{
	if (this.messages.EOF)
	{
		return String (config.forumNoMessages).weak();
	}
	this.messages.MoveFirst()

	var currentMessage;
	var viewLine;
	var view = '';
	var viewCounter = 0;
	var showMaxRecords;
	if (config.showAtMostNRecords > 0)
	{
		showMaxRecords = config.showAtMostNRecords;
	}
	else
	{
		showMaxRecords = this.messages.RecordCount;
	}

	while ((!this.messages.EOF) && (viewCounter < showMaxRecords))
	{
		viewCounter += 1;

		currentMessage = new ForumMessage (this.messages);
		var expandCollapse = new ForumExpandCollapse (currentMessage, viewCounter, currentMessage.messageID, 0);
		if (expandCollapse.doWeExpand())
		{
			var expandedThread = new ForumThread (this.currentMessageID);
			view += expandedThread.getExpandedThread (currentMessage.threadID, currentMessage.sortCode);
		}
		else
		{
			viewLine = currentMessage.getExpandCollapse (viewCounter, 1) + currentMessage.getViewEntry (this.currentMessageID);
			view += this.getIndented (1, viewLine);
		}

		delete expandCollapse;
		this.messages.MoveNext();
	}

	return view;
}

function showView_disc ()
{
	var viewInfo = this.getView();
	viewInfo.show ();
}

function getDHTMLView_disc ()
{
	if (this.messages.EOF)
	{
		return String (config.forumNoMessages).weak();
	}

	this.showDHTMLExpandCollapseCode ();

	this.messages.MoveFirst()

	var viewLine;
	var view = '';

	while (!this.messages.EOF)
	{

		view += this.getDHTMLThread (this.messages);

	}

	return view;
}

function getDHTMLThread_disc (messages)
{
	var relativeIndentLevel;
	var absoluteIndentLevel;
	var sortCode;
	var currentMessage;
	var subjectLine;

	relativeIndentLevel = 1;
	currentMessage = new ForumMessage (messages);
	absoluteIndentLevel = this.getSortcodeIndentLevel (currentMessage.sortCode);
	sortCode = currentMessage.sortCode;
	subjectLine = currentMessage.getDHTMLExpandCollapse (relativeIndentLevel) + currentMessage.getViewEntry (this.currentMessageID);

	var currentID = String (currentMessage.messageID);
	var currentSortCode = String (currentMessage.sortCode);

	return this.getIndented (relativeIndentLevel, subjectLine) + this.getDHTMLChildren (currentID, currentSortCode, absoluteIndentLevel, relativeIndentLevel, sortCode, messages);
}

function getDHTMLChildren_disc (previousID, previousSortCode, absoluteIndentLevel, relativeIndentLevel, workingSortCode, messages)
{
	var viewLine = '';
	var displaySubthread = '';

	messages.MoveNext ()
	var nextMessage = new ForumMessage (messages);
	if (previousSortCode == String (nextMessage.sortCode).substring (0, previousSortCode.length))
	{
		if (previousSortCode == String (nextMessage.sortCode).substring (0, previousSortCode.length))
		{
			absoluteIndentLevel++;
			relativeIndentLevel++;
		}

		if (relativeIndentLevel == 2)
		{
			displaySubthread = 'none';
		}
		else
		{
			displaySubthread = '';
		}
		viewLine += '<DIV STYLE="margin-left:0;display:' + displaySubthread + ';" ID="Subthread-' + previousID + '">';

		var messageOutputCounter = 0;
		while (!messages.EOF && (previousSortCode == String (nextMessage.sortCode).substring (0, previousSortCode.length)))
		{
			subjectLine = nextMessage.getDHTMLExpandCollapse (relativeIndentLevel) + nextMessage.getViewEntry (this.currentMessageID);
			viewLine += this.getIndented (relativeIndentLevel, subjectLine);
			viewLine += this.getDHTMLChildren (String (nextMessage.messageID), String (nextMessage.sortCode), absoluteIndentLevel, relativeIndentLevel, String (nextMessage.sortCode), messages);
			nextMessage = new ForumMessage (messages);
			messageOutputCounter++;
		}

		viewLine += '</DIV>';
	}

	return viewLine;
}

function getViewThread_disc ()
{
	if (this.messages.EOF)
	{
		return String (config.forumNoMessages).weak();
	}
	this.messages.MoveFirst()

	var lastIndentLevel;
	var currentIndentLevel;
	var viewLine;
	var firstMessageSortCode;
	var thread = '';
	var viewCounter = 0;

	lastIndentLevel = 0;
	var dBase = new ForumDatabase ();
	firstMessageSortCode = String (dBase.getSortCodeField (this.messages));

	while (!this.messages.EOF)
	{
		viewCounter += 1;

		var currentMessage = new ForumMessage (this.messages);
		var expandCollapseThread = new ForumExpandCollapse (currentMessage, viewCounter, 0, 0);

		currentIndentLevel = 1 + this.getIndentLevel () - this.getSortcodeIndentLevel (firstMessageSortCode);
		if (currentIndentLevel < 1)
		{
			currentIndentLevel = 1;
			firstMessageSortCode = String (dBase.getSortCodeField (this.messages));
		}

		viewLine = currentMessage.getExpandCollapse (viewCounter, 0) + currentMessage.getViewEntry (this.currentMessageID);
		thread += this.getIndented (currentIndentLevel, viewLine);

		if (expandCollapseThread.doWeCollapse())
		{
			this.skipToNextSibling ();
			if (!this.messages.EOF)
			{
				firstMessageSortCode = this.getParentSortCode (String (dBase.getSortCodeField (this.messages)));
			}
		}
		else
		{
			if (!this.messages.EOF)
			{
				this.messages.MoveNext();
			}
		}
	}

	return thread;
}

function showViewThread_disc ()
{
	var threadInfo = this.getViewThread();
	threadInfo.show ();
}

function getParentSortCode_disc (sortcode)
{
	var parentSortCode = "";
	var lastSeparator = sortcode.lastIndexOf (".");
	if (-1 != lastSeparator)
	{
		parentSortCode = sortcode.substring (0, lastSeparator);
	}
	return parentSortCode;
}

function getViewFullThread_disc ()
{
	if (this.messages.EOF)
	{
		return String (config.forumNoMessages).weak();
	}
	this.messages.MoveFirst()

	var lastIndentLevel;
	var currentIndentLevel;
	var viewLine;
	var firstMessageSortCode;
	var fullThread = '';

	lastIndentLevel = 0;
	var dBase = new ForumDatabase ();
	firstMessageSortCode = String (dBase.getSortCodeField (this.messages));

	while (!this.messages.EOF)
	{
		var currentMessage = new ForumMessage (this.messages);

		currentIndentLevel = this.getIndentLevel ();
		viewLine = currentMessage.getViewEntry (this.currentMessageID);

		fullThread += this.getIndented (currentIndentLevel, viewLine);

		if (!this.messages.EOF)
		{
			this.messages.MoveNext();
		}
	}

	return fullThread;
}

function showViewFullThread_disc ()
{
	var threadInfo = this.getViewFullThread();
	threadInfo.show ();
}

function getIndented_disc (currentIndentLevel, viewText)
{
	var counter;
	var HTMLOutput;

	HTMLOutput = '<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0"><TR><TD VALIGN="top">&nbsp;';
	for (counter = 0; counter < currentIndentLevel; counter++)
	{
		HTMLOutput += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	}
	HTMLOutput += '</TD><TD VALIGN="top">' + viewText + '</TD></TR></TABLE>';

	return HTMLOutput;
}

function showIndented_disc (currentIndentLevel, viewText)
{
	var HTMLOutput = this.getIndented (currentIndentLevel, viewText);
	HTMLOutput.show();
}

function getIndentLevel_disc ()
{
	var parsedCode = new ForumMessage (this.messages).sortCode;
	var foundAt = 1;
	var indentCounter = 0;

	while (foundAt > 0)
	{
		foundAt = String (parsedCode).search ('[\\.]');
		parsedCode = String (parsedCode).substr (foundAt + 1);
		indentCounter++;
	}

	return indentCounter;
}

function getSortcodeIndentLevel_disc (sortCode)
{
	var parsedCode = sortCode;
	var foundAt = 1;
	var indentCounter = 0;

	while (foundAt > 0)
	{
		foundAt = String (parsedCode).search ('[^0-9]');
		parsedCode = String (parsedCode).substr (foundAt + 1);
		indentCounter++;
	}
	return indentCounter;
}

function skipToNextSibling_disc ()
{
	var currentMessage = new ForumMessage (this.messages);
	var currentSortCode = currentMessage.sortCode;

	this.messages.MoveNext();
	while ((!this.messages.EOF) && (String(currentSortCode).length < String(new ForumMessage(this.messages).sortCode).length))
	{
		this.messages.MoveNext();
	}
}

function showDHTMLExpandCollapseCode_disc ()
{
	var DHTMLCode = '';

	DHTMLCode += "\n<SCR" + "IPT LANGUAGE=\"Javascript\" RUNAT=\"client\">";
	DHTMLCode += "\nvar standardDOM;";
	DHTMLCode += "\nif (document.all)";
	DHTMLCode += "\n{";
	DHTMLCode += "\n\tstandardDOM = false;";
	DHTMLCode += "\n}";
	DHTMLCode += "\nelse";
	DHTMLCode += "\n{";
	DHTMLCode += "\n\tdocument.all = document.getElementById;";
	DHTMLCode += "\n\tstandardDOM = true;";
	DHTMLCode += "\n}\n";
	DHTMLCode += "\nfunction expandCollapseForumClick_disc (DOMEvent)";
	DHTMLCode += "\n{";
	DHTMLCode += "\n\tvar parentID;";
	DHTMLCode += "\n\tvar child;";
	DHTMLCode += "\n\tvar parentImage;";
	DHTMLCode += "\n\tif (standardDOM)";
	DHTMLCode += "\n\t{";
	DHTMLCode += "\n\t\tparentID = DOMEvent.target.id;";
	DHTMLCode += "\n\t}";
	DHTMLCode += "\n\telse";
	DHTMLCode += "\n\t{";
	DHTMLCode += "\n\t\tparentID = window.event.srcElement.id;";
	DHTMLCode += "\n\t}";
	DHTMLCode += "\n\tchild = document.all ('Subthread-' + parentID);";
	DHTMLCode += "\n\tif (child != null)";
	DHTMLCode += "\n\t{";
	DHTMLCode += "\n\t\tparentImage = document.all (parentID);";
	DHTMLCode += "\n\t\tif (child.style.display == 'none')";
	DHTMLCode += "\n\t\t{";
	DHTMLCode += "\n\t\t\tchild.style.display = 'block';";
	DHTMLCode += "\n\t\t\tparentImage.src = '" + config.collapseImage + "';";
	DHTMLCode += "\n\t\t\tparentImage.alt = '-';";
	DHTMLCode += "\n\t\t}";
	DHTMLCode += "\n\t\telse";
	DHTMLCode += "\n\t\t{";
	DHTMLCode += "\n\t\t\tchild.style.display = 'none';";
	DHTMLCode += "\n\t\t\tparentImage.src = '" + config.expandImage + "';";
	DHTMLCode += "\n\t\t\tparentImage.alt = '+';";
	DHTMLCode += "\n\t\t}";
	DHTMLCode += "\n\t}";
	DHTMLCode += "\n\treturn true;";
	DHTMLCode += "\n}";
	DHTMLCode += "\n</SCR" + "IPT>";

	DHTMLCode.show ();
	return;
}

ForumView.prototype.getView = getView_disc;
ForumView.prototype.show = showView_disc;
ForumView.prototype.getDHTMLView = getDHTMLView_disc;
ForumView.prototype.getDHTMLThread = getDHTMLThread_disc;
ForumView.prototype.getDHTMLChildren = getDHTMLChildren_disc;
ForumView.prototype.getViewThread = getViewThread_disc;
ForumView.prototype.showViewThread = showViewThread_disc;
ForumView.prototype.getParentSortCode = getParentSortCode_disc;
ForumView.prototype.getViewFullThread = getViewFullThread_disc;
ForumView.prototype.showViewFullThread = showViewFullThread_disc;
ForumView.prototype.getIndented = getIndented_disc;
ForumView.prototype.showIndented = showIndented_disc;
ForumView.prototype.getIndentLevel = getIndentLevel_disc;
ForumView.prototype.getSortcodeIndentLevel = getSortcodeIndentLevel_disc;
ForumView.prototype.skipToNextSibling = skipToNextSibling_disc;
ForumView.prototype.showDHTMLExpandCollapseCode = showDHTMLExpandCollapseCode_disc;
</SCRIPT>