<%@ Language=VBScript %>
<%
'=======================================================================
'
' "ASP Forums" - a web-based discussion forum implementation.
' Copyright (C) 1999, 2000  ASP Forums, http://www.aspforums.com/
'
' This library is free software; you can redistribute it and/or
' modify it under the terms of the GNU Lesser General Public
' License as published by the Free Software Foundation; either
' version 2.1 of the License, or (at your option) any later version.
'
' This library is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
' Lesser General Public License for more details.
'
' You should have received a copy of the GNU Lesser General Public
' License along with this library; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
'
'=======================================================================

'=======================================================================
' ASP Forums 2.0
'=======================================================================
%>
<%Option Explicit%>
<!-- #INCLUDE file="aspforums.asp" -->
<HTML>
<HEAD>
<TITLE><%FORUM_TITLE_DISC%></TITLE>
</HEAD>

<BODY>
	<H1><%FORUM_TITLE_DISC%></H1>

	<P>
	<%SAVE_EDITED_MESSAGE_DISC%>
	</P>

	<P>
	<%PARENT_MESSAGE_LINK_DISC%>
	</P>

	<P>
	<%FORUM_LINK_DISC%>
	</P>

        <%CLEANUP_DISC%>
</BODY>
</HTML>