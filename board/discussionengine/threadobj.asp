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
// THREAD OBJECT
//
// ======================================================================

function ASPFThread
(
 nCurrentMessageID,
 strPageURLToUse
)
{
  this.setCurrentMessageID (nCurrentMessageID);
  if (isUndefined_disc (strPageURLToUse))
    {
      this.setPageURLToUse = config.getMainPagePath ();
    }
  else
    {
      this.setPageURLToUse = strPageURLToUse;
    }

  return this;
}

// ======================================================================
//
// Interface to private member variables.
//
// ======================================================================

function getCurrentMessageID_thd_disc
(
)
{
  return Number (this._currentMessageID);
}

function setCurrentMessageID_thd_disc
(
 nNewCurrentMessageID
)
{
  this._currentMessageID = Number (nNewCurrentMessageID);
  return;
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function getAllSorted_thd_disc
(
 bSortAscending
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getAllRootMessages (bSortAscending);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID ());
  var thdThreadInfo = vwMessageView.getView ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdThreadInfo;
}

function getCurrentSorted_thd_disc
(
 bSortAscending
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getCurrentRootMessages (bSortAscending);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID ());
  var thdThreadInfo = vwMessageView.getView ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdThreadInfo;
}

function getCurrentSortedDHTML_thd_disc
(
 bSortAscending
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getAllCurrentMessages (bSortAscending);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID ());
  var thdThreadInfo = vwMessageView.getDHTMLView ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdThreadInfo;
}

function getArchiveSorted_thd_disc
(
 dtArchiveDate,
 bSortAscending
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getArchiveRootMessages (dtArchiveDate, bSortAscending);
  var vwMessageView = new ASPFView (rsMessages,
				    this.getCurrentMessageID (),
				    config.getArchivePagePath ());
  var thdThreadInfo = vwMessageView.getView ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdThreadInfo;
}

function getArchiveSortedDHTML_thd_disc
(
 dtArchiveDate,
 bSortAscending
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getAllArchiveMessages (dtArchiveDate, bSortAscending);
  var vwMessageView = new ASPFView (rsMessages,
				    this.getCurrentMessageID (),
				    config.getArchivePagePath ());
  var thdThreadInfo = vwMessageView.getDHTMLView ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdThreadInfo;
}

function getExpandedThread_thd_disc
(
 nThreadID,
 nStartAt
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getSubThreadMessages (nThreadID, nStartAt);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID (), this.pageURLToUse);
  var thdExpandedThread = vwMessageView.getViewThread ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdExpandedThread;
}

function getSubThread_thd_disc
(
 nThreadID,
 nStartAt
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getSubThreadMessages (nThreadID, nStartAt);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID ());
  var thdSubThread = vwMessageView.getViewFullThread ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdSubThread;
}

function getFullThread_thd_disc
(
 nThreadID
)
{
  var dbDatabase = new ASPFDatabase ();
  var rsMessages = dbDatabase.getAllThreadMessages (nThreadID);
  var vwMessageView = new ASPFView (rsMessages, this.getCurrentMessageID ());
  var thdFullThread = vwMessageView.getViewFullThread ();

  delete dbDatabase;
  delete rsMessages;
  delete vwMessageView;
  return thdFullThread;
}

ASPFThread.prototype.getCurrentMessageID = getCurrentMessageID_thd_disc;
ASPFThread.prototype.setCurrentMessageID = setCurrentMessageID_thd_disc;

ASPFThread.prototype.getAllSorted = getAllSorted_thd_disc;
ASPFThread.prototype.getCurrentSorted = getCurrentSorted_thd_disc;
ASPFThread.prototype.getCurrentSortedDHTML = getCurrentSortedDHTML_thd_disc;
ASPFThread.prototype.getArchiveSorted = getArchiveSorted_thd_disc;
ASPFThread.prototype.getArchiveSortedDHTML = getArchiveSortedDHTML_thd_disc;
ASPFThread.prototype.getExpandedThread = getExpandedThread_thd_disc;
ASPFThread.prototype.getSubThread = getSubThread_thd_disc;
ASPFThread.prototype.getFullThread = getFullThread_thd_disc;
</SCRIPT>

