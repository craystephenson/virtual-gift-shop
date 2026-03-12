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
        <td width="125%" height="1" valign="middle" align="center">
          <table border="0" width="98%">
            <tr>
              <td width="100%">
                <p align="center"><font face="Arial"><img border="0" src="file:///C:/My%20Documents/My%20Webs/Honchie/images/storefront/honchie.gif" align="left"></font></p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table border="0" width="78%" height="23">
      <tr>
        <td width="100%" height="19">
          <p align="center"><font face="Arial"><map name="FPMap0">
          <area href="categories/home_office.asp" shape="rect" coords="18, 1, 102, 13">
          <area href="categories/entertainment.asp" shape="rect" coords="120, 1, 195, 13">
          <area href="file:///C:/My%20Documents/My%20Webs/Honchie/board/categories/food_drink.asp" shape="rect" coords="208, 1, 293, 13">
          <area href="file:///C:/My%20Documents/My%20Webs/Honchie/board/categories/health_beauty.asp" shape="rect" coords="302, 0, 401, 12">
          <area href="file:///C:/My%20Documents/My%20Webs/Honchie/board/categories/apparel.asp" shape="rect" coords="412, 0, 460, 14">
          <area href="file:///C:/My%20Documents/My%20Webs/Honchie/board/categories/services.asp" shape="rect" coords="472, 0, 521, 14">
          <area href="categories/greeting.asp" coords="535, 0, 599, 13" shape="rect">
          <area href="file:///C:/My%20Documents/My%20Webs/Honchie/board/categories/music.asp" shape="rect" coords="615, 1, 698, 13"></map><img border="0" src="file:///C:/My%20Documents/My%20Webs/Honchie/images/storefront/menu.gif" usemap="#FPMap0" align="right"></font></p>
        </td>
      </tr>
    </table>
	<H1><%FORUM_TITLE_DISC%></H1>

	<H2><font face="Arial" size="2">Search Results:</font></H2>

	<%SEARCH_RESULTS_DISC%>

	<%SEARCH_FORM_DISC%>

        <%CLEANUP_DISC%>
</BODY>
</HTML>