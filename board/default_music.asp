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
    <table border="0" width="99%" height="1">
      <tr>
        <td width="125%" height="1" valign="middle" align="center" style="border-style: solid; border-color: #FFFFFF">
          <table border="0" width="98%">
            <tr>
              <td width="100%" style="border-style: solid; border-color: #FFFFFF">
                <table border="0" width="102%" height="1">
                  <tr>
                    <td width="125%" height="1" valign="middle" align="center"><font face="Arial"><a href="../categories/music.asp"><img border="0" src="file:///C:/My%20Documents/My%20Webs/Honchie/images/storefront/honchie_band.jpg" align="left"></a></font>&nbsp;&nbsp;&nbsp;</td>
                  </tr>
                </table>
                <p align="center"><font face="Arial" size="2">Please, talk to
                us. Help us name our first album. Write some lyrics for
                Honchie's next big hit.</font></p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

    <table border="0" width="72%" height="1">
      <tr>
        <td width="36%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
          <p align="center">
        </td>
        <td width="58%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
        </td>
        <td width="41%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
          <p align="left">
        </td>
      </tr>
    </table>
    &nbsp;
	<P align="left">
    <br> <align="left">
    <%CURRENT_POSTS_THREADED_DHTML_DISC%>
	</P>

	<P>
	<%NEW_POST_BUTTON_DISC%>
	</P>

	<P>
	<%SEARCH_FORM_DISC%>
	</P>
	<P>
	<%ARCHIVE_LINK_DISC%>.
	</P>

</BODY>
<%CLEANUP_DISC%>
</HTML>