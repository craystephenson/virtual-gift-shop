<SCRIPT LANGUAGE="Javascript" RUNAT="Server">
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

// Appearance Constants
var adFlatBevel = 0;
var ad3Dbevel = 1;

// BOFAction Constants
var adDoMoveFirst = 0;
var adStayBOF = 1;

// CommandType Constants
var adCmdText = 1;
var adCmdTable = 2;
var adCmdStoredProc = 4;
var adCmdUnknown = 8;

// Mode Constants
var adModeUnknown = 0;
var adModeRead = 1;
var adModeWrite = 2;
var adModeReadWrite = 3;
var adModeShareDenyRead = 4;
var adModeShareDenyWrite = 8;
var adModeShareExclusive = 12;
var adModeShareDenyNone = 16;

// ConnectionString Constants
var adConnectStringTypeUnknown = 0;
var adOLEDB = 1;
var adOLEDBFile = 2;
var adODBC = 3;

// CursorLocation Constants
var adUseServer = 2;
var adUseClient = 3;

// CursorType Constants
var adOpenForwardOnly = 0; // Note   ForwardOnly cursors are not available for the ADO Data Control.
var adOpenKeyset = 1;
var adOpenDynamic = 2;
var adOpenStatic = 3;

// EOFAction Constants
var adDoMoveLast = 0;
var adStayEOF = 1;
var adDoAddNew = 2;

// EventReason Constants
var adRsnAddNew = 1;
var adRsnDelete = 2;
var adRsnUpdate = 3;
var adRsnUndoUpdate = 4;
var adRsnUndoAddNew = 5;
var adRsnUndoDelete = 6;
var adRsnRequery = 7;
var adRsnResynch = 8;
var adRsnClose = 9;
var adRsnMove = 10;

// EventStatus Constants
var adStatusOK = 1;
var adStatusErrorsOccurred = 2;
var adStatusCantDeny = 3;
var adStatusCancel = 4;
var adStatusUnwantedEvent = 5;

// LockType Constants
var adLockUnspecified = -1;
var adLockReadOnly = 1;
var adLockPessimistic = 2;
var adLockOptimistic = 3;
var adLockBatchOptimistic = 4;

// Orientation Constants
var adHorizontal = 0;
var adVertical = 1;
</SCRIPT>
