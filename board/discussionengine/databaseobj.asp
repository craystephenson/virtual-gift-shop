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
// DATABASE OBJECT
//
// ======================================================================

function ASPFDatabase
(
)
{
  return this;
}

// ======================================================================
//
// Interface to recordset fields (not private member variables).
//
// ======================================================================

function getSubjectField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldSubject));
}

function getBodyField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldBody));
}

function getSortCodeField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldSortCode));
}

function getAuthorNameField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldAuthorName));
}

function getAuthorEmailField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldAuthorEmail));
}

function getAuthorFullnameField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldAuthorFullName));
}

function getAuthorEmailField_db_disc
(
 msgMessageRecord
)
{
  return String (msgMessageRecord.Fields (config.DATABASE_FieldAuthorEmail));
}

function getMessageIDField_db_disc
(
 msgMessageRecord
)
{
  return Number (msgMessageRecord.Fields (config.DATABASE_FieldMessageID).Value);
}

function getParentIDField_db_disc
(
 msgMessageRecord
)
{
  return Number (msgMessageRecord.Fields (config.DATABASE_FieldParentID).Value);
}

function getThreadIDField_db_disc
(
 msgMessageRecord
)
{
  return Number (msgMessageRecord.Fields (config.DATABASE_FieldThreadID).Value);
}

function getNumChildrenField_db_disc
(
 msgMessageRecord
)
{
  return Number (msgMessageRecord.Fields (config.DATABASE_FieldNumChildren).Value);
}

function getDateCreatedField_db_disc
(
 msgMessageRecord
)
{
  return new Date (msgMessageRecord.Fields (config.DATABASE_FieldDateCreated));
}

function getDateModifiedField_db_disc
(
 msgMessageRecord
)
{
  return new Date (msgMessageRecord.Fields (config.DATABASE_FieldDateModified));
}

function getEmailParentOnResponseField_db_disc
(
 msgMessageRecord
)
{
  return Number (msgMessageRecord.Fields (config.DATABASE_FieldEmailParentOnResponse).Value);
}

// ======================================================================
//
// Main object methods.
//
// ======================================================================

function getAllRootMessages_db_disc
(
 bSortAscending
)
{
  var strSQL = "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldParentID;
  strSQL += " = 0 ORDER BY ";
  strSQL += config.DATABASE_FieldDateCreated;

  if (bSortAscending)
    {
      strSQL = strSQL + " ASC";
    }
  else
    {
      strSQL = strSQL + " DESC";
    }

  return this.getCachedOrNewData (config.CACHE_AllRootMessagesKey, strSQL);
}

function getCurrentRootMessages_db_disc
(
 bSortAscending
)
{
  var dtCutoffDate = new Date ();
  dtCutoffDate.setDate (dtCutoffDate.getDate () - config.ADMINSETTING_DaysMessagesActive);

  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " > {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'} AND (";
  strSQL += config.DATABASE_FieldParentID;
  strSQL += " = 0 OR ";
  strSQL += config.DATABASE_FieldParentID;
  strSQL += " IN (SELECT ";
  strSQL += config.DATABASE_FieldMessageID;
  strSQL += " FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " < {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'})) ORDER BY ";
  strSQL += config.DATABASE_FieldDateCreated;

  if (bSortAscending)
    {
      strSQL += " ASC";
    }
  else
    {
      strSQL += " DESC";
    }

  delete dtCutoffDate;
  return this.getCachedOrNewData (config.CACHE_CurrentRootMessagesKeyPrefix + config.CACHE_ItemSeparator + config.ADMINSETTING_DaysMessagesActive, strSQL);
}

function getAllCurrentMessages_db_disc
(
 bSortAscending
)
{
  var dtCutoffDate = new Date ();
  dtCutoffDate.setDate (dtCutoffDate.getDate () - config.ADMINSETTING_DaysMessagesActive);

  var strSortOrder = "";
  if (bSortAscending)
    {
      strSortOrder = " ASC";
    }
  else
    {
      strSortOrder = " DESC";
    }

  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " > {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'} ORDER BY ";
  strSQL += config.DATABASE_FieldThreadID;
  strSQL += strSortOrder;
  strSQL += ", ";
  strSQL += config.DATABASE_FieldSortCode;
  strSQL += " ASC";


  delete dtCutoffDate;
  return this.getCachedOrNewData (config.CACHE_AllCurrentMessagesKeyPrefix + config.CACHE_ItemSeparator + config.ADMINSETTING_DaysMessagesActive, strSQL);
}

function getArchiveRootMessages_db_disc
(
 dtArchiveDate,
 bSortAscending
)
{
  var dtCutoffDate = new Date (dtArchiveDate);
  dtCutoffDate.setMonth (dtArchiveDate.getMonth () + 1);

  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " >= {d '";
  strSQL += dtArchiveDate.getODBCNormalisedDate ();
  strSQL += "'} AND ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " < {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'} AND (";
  strSQL += config.DATABASE_FieldParentID;
  strSQL += " = 0 OR ";
  strSQL += config.DATABASE_FieldParentID;
  strSQL += " IN (SELECT ";
  strSQL += config.DATABASE_FieldMessageID;
  strSQL += " FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " < {d '";
  strSQL += dtArchiveDate.getODBCNormalisedDate ();
  strSQL += "'} AND ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " >= {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'})) ORDER BY ";
  strSQL += config.DATABASE_FieldDateCreated;

  if (bSortAscending)
    {
      strSQL += " ASC";
    }
  else
    {
      strSQL += " DESC";
    }

  delete dtCutoffDate;
  return this.getCachedOrNewData (config.CACHE_RootArchivedMessagesKeyPrefix + config.CACHE_ItemSeparator + config.ADMINSETTING_DaysMessagesActive, strSQL);
}

function getAllArchiveMessages_db_disc
(
 dtArchiveDate,
 bSortAscending
)
{
  var dtCutoffDate = new Date (dtArchiveDate);
  dtCutoffDate.setMonth (dtArchiveDate.getMonth () + 1);

  var strSortOrder;
  if (bSortAscending)
    {
      strSortOrder = " ASC";
    }
  else
    {
      strSortOrder = " DESC";
    }

  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " >= {d '";
  strSQL += dtArchiveDate.getODBCNormalisedDate ();
  strSQL += "'} AND ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " < {d '";
  strSQL += dtCutoffDate.getODBCNormalisedDate ();
  strSQL += "'} ORDER BY ";
  strSQL += config.DATABASE_FieldThreadID;
  strSQL += strSortOrder;
  strSQL += ", ";
  strSQL += config.DATABASE_FieldSortCode;
  strSQL += " ASC";

  delete dtCutoffDate;
  return this.getCachedOrNewData (config.CACHE_AllArchivedMessagesKeyPrefix + config.CACHE_ItemSeparator + dtArchiveDate.getYear () + config.CACHE_ItemSeparator + dtArchiveDate.getMonth (), strSQL);
}

function getAllThreadMessages_db_disc
(
 nThreadID
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldThreadID;
  strSQL += " = ";
  strSQL += nThreadID;
  strSQL += " ORDER BY ";
  strSQL += config.DATABASE_FieldSortCode;

  return this.getCachedOrNewData (config.CACHE_AllThreadMessagesKey + config.CACHE_ItemSeparator + nThreadID, strSQL);
}

function getSubThreadMessages_db_disc
(
 nThreadID,
 strStartAtSortCode
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldThreadID;
  strSQL += " = ";
  strSQL += nThreadID;
  strSQL += " AND ";
  strSQL += config.DATABASE_FieldSortCode;
  strSQL += " >= '";
  strSQL += strStartAtSortCode;
  strSQL += "' ORDER BY ";
  strSQL += config.DATABASE_FieldSortCode;

  return this.getCachedOrNewData (config.CACHE_SubThreadMessagesKey + config.CACHE_ItemSeparator + nThreadID + config.CACHE_ItemSeparator + strStartAtSortCode, strSQL);
}

function getMessageByID_db_disc
(
 nMessageID
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldMessageID;
  strSQL += " = ";
  strSQL += nMessageID;

  return new ASPFMessage (this.executeSQL (strSQL), ASPF_RECORDSET_OBJECT_TYPE_DISC);
}

function getRecordByID_db_disc
(
 nMessageID
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldMessageID;
  strSQL += " = ";
  strSQL += nMessageID;

  return this.executeSQL (strSQL);
}

function getRecordBySortCode_db_disc
(
 strSortCode
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldSortCode;
  strSQL += " = ";
  strSQL += strSortCode;

  return new ASPFMessage (this.executeSQL (strSQL), ASPF_RECORDSET_OBJECT_TYPE_DISC);
}

function getRecordByDateCreated_db_disc
(
 dtDateCreated
)
{
  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " = {d '";
  strSQL += dtDateCreated.getODBCNormalisedDate ();
  strSQL += "'}";

  return new ASPFMessage (this.executeSQL (strSQL), ASPF_RECORDSET_OBJECT_TYPE_DISC);
}

function getOpenDatabaseConnection_db_disc
(
)
{
  var cnOpenConnection;

  if (isDefined_disc (ASPFDatabase.DBConnection))
    {
      cnOpenConnection = ASPFDatabase.DBConnection;
    }
  else
    {
      cnOpenConnection = Server.CreateObject ("ADODB.Connection");
      cnOpenConnection.Mode = adModeReadWrite;

      cnOpenConnection.Open (config.getDatabaseDSN ());
      ASPFDatabase.DBConnection = cnOpenConnection;
    }

  return cnOpenConnection;
}

function getAdminSQLResults_db_disc
(
 cnDBConnection,
 strSQL
)
{
  return this.executeSQLUsingConnection (strSQL, cnDBConnection);
}

function executeSQL_db_disc
(
 strSQL
)
{
  var cnDBConnection = this.getOpenDatabaseConnection ();

  return this.executeSQLUsingConnection (strSQL, cnDBConnection);
}

function executeSQLUsingConnection_db_disc
(
 strSQL,
 cnDBConnection
)
{
  var rsRecordSet;

  rsRecordSet = Server.CreateObject ("ADODB.RecordSet");

//  Response.Write ("<H5>" + strSQL + "</H5>");
//  Response.Write ("<pre>" + executeSQLUsingConnection_db_disc.caller + "</pre>");

  rsRecordSet.Open (strSQL, cnDBConnection, adOpenKeyset, adLockOptimistic, adCmdText);

  return rsRecordSet;
}

function searchForum_db_disc
(
 strStringToSearchFor
)
{
  var strSearchString;
  strSearchString = String (strStringToSearchFor).replace (/\'/gi, ASPFHTML.DOUBLE_QUOTES ());

  var strSQL = "";
  strSQL += "SELECT * FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldBody;
  strSQL += " LIKE '%";
  strSQL += strSearchString;
  strSQL += "%' OR ";
  strSQL += config.DATABASE_FieldSubject;
  strSQL += " LIKE '%";
  strSQL += strSearchString;
  strSQL += "%' OR ";
  strSQL += config.DATABASE_FieldAuthorName;
  strSQL += " LIKE '%";
  strSQL += strSearchString;
  strSQL += "%' OR ";
  strSQL += config.DATABASE_FieldAuthorEmail;
  strSQL += " LIKE '%";
  strSQL += strSearchString;
  strSQL += "%' OR ";
  strSQL += config.DATABASE_FieldAuthorFullName;
  strSQL += " LIKE '%";
  strSQL += strSearchString;
  strSQL += "%' ORDER BY ";
  strSQL += config.DATABASE_FieldDateCreated;
  strSQL += " DESC";

  return this.executeSQL (strSQL);
}

function saveNewRecord_db_disc
(
 msgNewMessage
)
{
  var dtPostedDate = new Date();

  var cnDBConnection = this.getOpenDatabaseConnection ();
  this.beginTransaction ();

  msgNewMessage.setSortCode (this.getNewSortCode (msgNewMessage.getParentID ()));
  msgNewMessage.setDateCreated (dtPostedDate);
  msgNewMessage.setDateModified (dtPostedDate);

  var rsNewMessageRecord = Server.CreateObject ("ADODB.RecordSet");

  rsNewMessageRecord.Open (config.ADMINSETTING_DatabaseTable,
			   cnDBConnection,
			   adOpenKeyset,
			   adLockPessimistic,
			   adCmdTable);
  rsNewMessageRecord.AddNew ();

  rsNewMessageRecord.Fields (config.DATABASE_FieldDateCreated)
    = dtPostedDate.getODBCNormalisedTimeStamp ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldDateModified)
    = dtPostedDate.getODBCNormalisedTimeStamp ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldParentID)
    = msgNewMessage.getParentID ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldNumChildren)
    = 0;
  rsNewMessageRecord.Fields (config.DATABASE_FieldSortCode)
    = msgNewMessage.getSortCode ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldThreadID)
    = msgNewMessage.getThreadID ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldAuthorName)
    = msgNewMessage.getAuthorName ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldAuthorFullName)
    = msgNewMessage.getAuthorFullname ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldAuthorEmail)
    = msgNewMessage.getAuthorEmail ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldEmailParentOnResponse)
    = msgNewMessage.getEmailParentOnResponse ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldSubject)
    = msgNewMessage.getSubject ();
  rsNewMessageRecord.Fields (config.DATABASE_FieldBody)
    = msgNewMessage.getBody ();

  rsNewMessageRecord.Update ();
  var msgTempMessage = new ASPFMessage (rsNewMessageRecord, ASPF_RECORDSET_OBJECT_TYPE_DISC);

  msgNewMessage.setMessageID (msgTempMessage.getMessageID ());
  if (isUndefined_disc (msgNewMessage.getThreadID ()) || (msgNewMessage.getThreadID () == 0))
    {
      msgNewMessage.setThreadID (msgTempMessage.getMessageID ());
    }

  if (msgTempMessage.getSortCode () == "0")
    {
      var strSQL = "";
      strSQL += "UPDATE ";
      strSQL += config.ADMINSETTING_DatabaseTable;
      strSQL += " SET ";
      strSQL += config.DATABASE_FieldThreadID;
      strSQL += " = ";
      strSQL += msgTempMessage.getMessageID ();
      strSQL += ", ";
      strSQL += config.DATABASE_FieldSortCode;
      strSQL += " = str(";
      strSQL += msgTempMessage.getMessageID ();
      strSQL += ") WHERE ";
      strSQL += config.DATABASE_FieldMessageID;
      strSQL += " = ";
      strSQL += msgTempMessage.getMessageID ();
      this.executeSQLUsingConnection (strSQL, cnDBConnection);
    }

  if (cnDBConnection.Errors.Count == 0)
    {
      this.commitTransaction ();
    }
  else
    {
      this.rollbackTransaction ();
    }

  this.expireCurrentCache ();
  this.expireThreadCache (msgTempMessage.getThreadID ());
  this.expireArchiveCache (dtPostedDate);

  cnDBConnection = "";
  rsNewMessageRecord.Close ();

  delete dtPostedDate;
  delete rsNewMessageRecord;
  return msgTempMessage.getMessageID ();
}

function saveUpdatedRecord_db_disc
(
 msgUpdatedMessage
)
{
  var dtModifiedDate = new Date();
  msgUpdatedMessage.setDateModified (dtModifiedDate);

  var cnDBConnection = this.getOpenDatabaseConnection ();
  this.beginTransaction ();

  var rsUpdatedMessageRecord = this.getRecordByID (msgUpdatedMessage.getMessageID ());

  var nNewNumChildren;
  void msgUpdatedMessage.getNumChildren ();

  void rsUpdatedMessageRecord.Fields (config.DATABASE_FieldNumChildren);
  if (msgUpdatedMessage.getNumChildren () >
      rsUpdatedMessageRecord.Fields (config.DATABASE_FieldNumChildren))
    {
      nNewNumChildren = msgUpdatedMessage.getNumChildren ();
    }
  else
    {
      nNewNumChildren = rsUpdatedMessageRecord.Fields (config.DATABASE_FieldNumChildren);
    }

  rsUpdatedMessageRecord.Fields (config.DATABASE_FieldDateModified)
    = dtModifiedDate.getODBCNormalisedTimeStamp ();
  rsUpdatedMessageRecord.Fields (config.DATABASE_FieldNumChildren)
    = nNewNumChildren;
  rsUpdatedMessageRecord.Fields (config.DATABASE_FieldEmailParentOnResponse)
    = msgUpdatedMessage.getEmailParentOnResponse ();
  rsUpdatedMessageRecord.Fields (config.DATABASE_FieldSubject)
    = msgUpdatedMessage.getSubject ();
  rsUpdatedMessageRecord.Fields (config.DATABASE_FieldBody)
    = msgUpdatedMessage.getBody ();

  rsUpdatedMessageRecord.Update ();

  if (cnDBConnection.Errors.Count == 0)
    {
      this.commitTransaction ();
    }
  else
    {
      this.rollbackTransaction ();
    }

  this.expireCurrentCache ();
  this.expireThreadCache (msgUpdatedMessage.getThreadID ());
  this.expireArchiveCache (dtModifiedDate);

  cnDBConnection = "";
  rsUpdatedMessageRecord.Close ();

  delete rsUpdatedMessageRecord;
  delete dtModifiedDate;
  return;
}

function getNewSortCode_db_disc
(
 nParentID
)
{
  var strNewSortCode;

  if (nParentID == 0)
    {
      strNewSortCode = "0";
    }
  else
    {
      var msgParentMessage = this.getMessageByID (nParentID);

      msgParentMessage.setNumChildren (msgParentMessage.getNumChildren () + 1);

      strNewSortCode = msgParentMessage.getSortCode () + "." + msgParentMessage.getNumChildren ();

      msgParentMessage.saveUpdatedData ();

      delete msgParentMessage;
    }

  return strNewSortCode;
}

function deleteMessage_db_disc
(
 cnDBConnection,
 nMessageID
)
{
  var msgMessageToDelete = this.getMessageByID (nMessageID);
  var nParentID = msgMessageToDelete.getParentID ();
  if (msgMessageToDelete.getNumChildren () > 0)
    {
      var strThreadSQL = "";
      strThreadSQL += "SELECT * FROM ";
      strThreadSQL += config.ADMINSETTING_DatabaseTable;
      strThreadSQL += " WHERE ";
      strThreadSQL += config.DATABASE_FieldThreadID;
      strThreadSQL += " = ";
      strThreadSQL += msgMessageToDelete.getThreadID ();
      strThreadSQL += " AND ";
      strThreadSQL += config.DATABASE_FieldSortCode;
      strThreadSQL += " LIKE '";
      strThreadSQL += msgMessageToDelete.getSortCode ();
      strThreadSQL += "%' ORDER BY ";
      strThreadSQL += config.DATABASE_FieldSortCode;
      var rsChildren = this.executeSQLUsingConnection (strThreadSQL, cnDBConnection);

      while (!rsChildren.EOF)
	{
	  rsChildren.Delete();
	  rsChildren.MoveNext();
	}
      delete rsChildren;
    }

  var strSQL = "";
  strSQL += "DELETE FROM ";
  strSQL += config.ADMINSETTING_DatabaseTable;
  strSQL += " WHERE ";
  strSQL += config.DATABASE_FieldMessageID;
  strSQL += " = ";
  strSQL += nMessageID;
  this.executeSQLUsingConnection (strSQL, cnDBConnection);

  delete msgMessageToDelete;
  return;
}

function decrementNumChildren_db_disc
(
 cnDBConnection,
 nParentID
)
{
  if (nParentID != 0)
    {
      var msgParentMessage = this.getMessageByID (nParentID);

      var strSQL = "";
      strSQL += "UPDATE ";
      strSQL += config.ADMINSETTING_DatabaseTable;
      strSQL += " SET ";
      strSQL += config.DATABASE_FieldNumChildren;
      strSQL += "=";
      strSQL += (msgParentMessage.getNumChildren () - 1);
      strSQL += " WHERE ";
      strSQL += config.DATABASE_FieldMessageID;
      strSQL += " = ";
      strSQL += nParentID;
      this.executeSQLUsingConnection (strSQL, cnDBConnection);
      delete msgParentMessage;
    }

  return;
}

function getConnectionErrors_db_disc
(
 cnDBConnection
)
{
  var strErrorOutput = "";

  if (cnDBConnection.Errors.count > 0)
    {
      strErrorOutput += config.USERTEXT_SQL_DBErrorPrefix;

      for (var nCounter = 0; nCounter < cnDBConnection.Errors.count; nCounter++)
	{
	  strErrorOutput += config.USERTEXT_SQL_DBErrorNumberPrompt;
	  strErrorOutput += cnDBConnection.errors (nCounter).number + "\n";
	  strErrorOutput += config.USERTEXT_SQL_DBErrorDescriptionPrompt;
	  strErrorOutput += cnDBConnection.errors (nCounter).description + "\n";
	}
    }
  else
    {
      strErrorOutput += config.USERTEXT_SQL_DBErrorNoErrorPrompt;
    }

  return strErrorOutput;
}

function deleteMessageHierarchy_db_disc
(
 nMessageID
)
{
  var cnDBConnection = this.getOpenDatabaseConnection ();
  this.beginTransaction ();

  var msgMessageToDelete = this.getMessageByID (nMessageID);
  var nParentID = msgMessageToDelete.getParentID ();

  this.deleteMessage (cnDBConnection, nMessageID);
  this.decrementNumChildren (cnDBConnection, nParentID);

  var strReturnedMessage = "";
  if (cnDBConnection.Errors.Count == 0)
    {
      strReturnedMessage = config.USERTEXT_SQL_DeleteSuccessfulMessage.strong ();
      this.commitTransaction ();
    }
  else
    {
      strReturnedMessage = config.USERTEXT_SQL_DeleteUnsuccessfulMessage.strong ();
      this.rollbackTransaction ();
    }

  delete msgMessageToDelete;
  return strReturnedMessage;
}

function beginTransaction_db_disc ()
{
  if (ASPFDatabase.DBTransactionLevel == 0)
    {
      var cnDBConnection = this.getOpenDatabaseConnection ();
      cnDBConnection.BeginTrans ();
      cnDBConnection = "";
    }

  ASPFDatabase.DBTransactionLevel++;
  return;
}

function commitTransaction_db_disc ()
{
  if (ASPFDatabase.DBTransactionLevel == 1)
    {
      var cnDBConnection = this.getOpenDatabaseConnection ();
      cnDBConnection.CommitTrans ();
      cnDBConnection = "";
    }

  ASPFDatabase.DBTransactionLevel--;
  return;
}

function rollbackTransaction_db_disc ()
{
  var cnDBConnection = this.getOpenDatabaseConnection ();
  cnDBConnection.RollbackTrans ();
  cnDBConnection = "";
  ASPFDatabase.DBTransactionLevel = 0;

  return;
}

function isInTransation_db_disc ()
{
  var bIsInTransaction;
  if (ASPFDatabase.DBTransactionLevel > 0)
    {
      bIsInTransaction = true;
    }
  else
    {
      bIsInTransaction = false;
    }

  return bIsInTransaction;
}

function getCachedOrNewData_db_disc
(
 strItemKey,
 strSQL
)
{
  var cchCurrentCache = new ASPFCache ();
  var objCachedData = cchCurrentCache.retrieveObjectByKey (strItemKey);

  var objRequiredData;
  if (isUndefined_disc (objCachedData))
    {
      objRequiredData = this.executeSQL (strSQL);
      cchCurrentCache.storeObjectByKey (strItemKey, objRequiredData);
    }
  else
    {
      objRequiredData = objCachedData;
      objRequiredData.MoveFirst ();
    }

  delete cchCurrentCache;
  return objRequiredData;
}

function expireThreadCache_db_disc
(
 nThreadID
)
{
  var cchCurrentCache = new ASPFCache ();
  cchCurrentCache.removeObjectByKey (config.CACHE_AllThreadMessagesKey + config.CACHE_ItemSeparator + nThreadID);
  cchCurrentCache.removeObjectsByKeyPrefix (config.CACHE_SubThreadMessagesKey + config.CACHE_ItemSeparator + nThreadID);

  delete cchCurrentCache;
  return;
}

function expireCurrentCache_db_disc
(
)
{
  var cchCurrentCache = new ASPFCache ();
  cchCurrentCache.removeObjectByKey (config.CACHE_AllRootMessagesKey);
  cchCurrentCache.removeObjectsByKeyPrefix (config.CACHE_AllCurrentMessagesKeyPrefix);
  cchCurrentCache.removeObjectsByKeyPrefix (config.CACHE_CurrentRootMessagesKeyPrefix);

  delete cchCurrentCache;
  return;
}

function expireArchiveCache_db_disc
(
 dtArchiveDate
)
{
  if (isDefined_disc (dtArchiveDate))
    {
      var cchCurrentCache = new ASPFCache ();
      cchCurrentCache.removeObjectByKey (config.CACHE_AllArchivedMessagesKeyPrefix + config.CACHE_ItemSeparator + dtArchiveDate.getYear () + config.CACHE_ItemSeparator + dtArchiveDate.getMonth ());
      cchCurrentCache.removeObjectByKey (config.CACHE_RootArchivedMessagesKeyPrefix + config.CACHE_ItemSeparator + dtArchiveDate.getYear () + config.CACHE_ItemSeparator + dtArchiveDate.getMonth ());
      delete cchCurrentCache;
    }

  return;
}

function cleanup_db_disc
(
)
{
  if (isDefined_disc (ASPFDatabase.DBConnection))
    {
      delete ASPFDatabase.DBConnection;
    }

  return;
}

ASPFDatabase.DBConnection = undefined_disc;
ASPFDatabase.DBTransactionLevel = 0;

ASPFDatabase.prototype.getSubjectField = getSubjectField_db_disc;
ASPFDatabase.prototype.getBodyField = getBodyField_db_disc;
ASPFDatabase.prototype.getSortCodeField = getSortCodeField_db_disc;
ASPFDatabase.prototype.getAuthorNameField = getAuthorNameField_db_disc;
ASPFDatabase.prototype.getAuthorEmailField = getAuthorEmailField_db_disc;
ASPFDatabase.prototype.getAuthorFullnameField = getAuthorFullnameField_db_disc;
ASPFDatabase.prototype.getAuthorEmailField = getAuthorEmailField_db_disc;
ASPFDatabase.prototype.getMessageIDField = getMessageIDField_db_disc;
ASPFDatabase.prototype.getParentIDField = getParentIDField_db_disc;
ASPFDatabase.prototype.getThreadIDField = getThreadIDField_db_disc;
ASPFDatabase.prototype.getNumChildrenField = getNumChildrenField_db_disc;
ASPFDatabase.prototype.getDateCreatedField = getDateCreatedField_db_disc;
ASPFDatabase.prototype.getDateModifiedField = getDateModifiedField_db_disc;
ASPFDatabase.prototype.getEmailParentOnResponseField = getEmailParentOnResponseField_db_disc;

ASPFDatabase.prototype.getAllRootMessages = getAllRootMessages_db_disc;
ASPFDatabase.prototype.getCurrentRootMessages = getCurrentRootMessages_db_disc;
ASPFDatabase.prototype.getAllCurrentMessages = getAllCurrentMessages_db_disc;
ASPFDatabase.prototype.getArchiveRootMessages = getArchiveRootMessages_db_disc;
ASPFDatabase.prototype.getAllArchiveMessages = getAllArchiveMessages_db_disc;
ASPFDatabase.prototype.getAllThreadMessages = getAllThreadMessages_db_disc;
ASPFDatabase.prototype.getSubThreadMessages = getSubThreadMessages_db_disc;
ASPFDatabase.prototype.getMessageByID = getMessageByID_db_disc;
ASPFDatabase.prototype.getRecordByID = getRecordByID_db_disc;
ASPFDatabase.prototype.getRecordBySortCode = getRecordBySortCode_db_disc;
ASPFDatabase.prototype.getRecordByDateCreated = getRecordByDateCreated_db_disc;
ASPFDatabase.prototype.getOpenDatabaseConnection = getOpenDatabaseConnection_db_disc;
ASPFDatabase.prototype.getAdminSQLResults = getAdminSQLResults_db_disc;
ASPFDatabase.prototype.executeSQL = executeSQL_db_disc;
ASPFDatabase.prototype.executeSQLUsingConnection = executeSQLUsingConnection_db_disc;
ASPFDatabase.prototype.getNewSortCode = getNewSortCode_db_disc;
ASPFDatabase.prototype.deleteMessage = deleteMessage_db_disc;
ASPFDatabase.prototype.decrementNumChildren = decrementNumChildren_db_disc;
ASPFDatabase.prototype.getConnectionErrors = getConnectionErrors_db_disc;
ASPFDatabase.prototype.deleteMessageHierarchy = deleteMessageHierarchy_db_disc;
ASPFDatabase.prototype.searchForum = searchForum_db_disc;
ASPFDatabase.prototype.saveNewRecord = saveNewRecord_db_disc;
ASPFDatabase.prototype.saveUpdatedRecord = saveUpdatedRecord_db_disc;
ASPFDatabase.prototype.beginTransaction = beginTransaction_db_disc;
ASPFDatabase.prototype.commitTransaction = commitTransaction_db_disc;
ASPFDatabase.prototype.rollbackTransaction = rollbackTransaction_db_disc;
ASPFDatabase.prototype.isInTransation = isInTransation_db_disc;
ASPFDatabase.prototype.getCachedOrNewData = getCachedOrNewData_db_disc;
ASPFDatabase.prototype.expireThreadCache = expireThreadCache_db_disc;
ASPFDatabase.prototype.expireCurrentCache = expireCurrentCache_db_disc;
ASPFDatabase.prototype.expireArchiveCache = expireArchiveCache_db_disc;
ASPFDatabase.prototype.cleanup = cleanup_db_disc;
</SCRIPT>

