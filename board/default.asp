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
                <p align="center"><font face="Arial"><img border="0" src="file:///C:/My%20Documents/My%20Webs/Honchie/images/storefront/honchie.gif" align="left"></font></p>
                <p align="center">&nbsp;</p>
                <p align="center">&nbsp;</p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table border="0" width="78%">
      <tr>
        <td width="100%" style="border-style: solid; border-color: #FFFFFF">
          <p align="center"><map name="FPMap0">
          <area href="../categories/home_office.asp" coords="0, 3, 84, 15" shape="rect">
          <area href="../categories/entertainment.asp" shape="rect" coords="103, 0, 178, 14">
          <area href="../categories/food_drink.asp" shape="rect" coords="198, 1, 279, 13">
          <area href="../categories/health_beauty.asp" shape="rect" coords="295, 2, 390, 14">
          <area href="../categories/apparel.asp" shape="rect" coords="410, 0, 449, 14">
          <area href="../categories/services.asp" shape="rect" coords="467, 1, 506, 13">
          <area href="../categories/music.asp" coords="527, 2, 611, 13" shape="rect">
          <area href="../categories/questions.asp" coords="622, 3, 679, 14" shape="rect">
          <area href="default.asp" shape="rect" coords="695, 1, 730, 13"></map><img border="0" src="file:///C:/My%20Documents/My%20Webs/Honchie/images/storefront/menu.gif" usemap="#FPMap0" width="738" height="15"><br>
          <br>
          </p>
        </td>
      </tr>
    </table>

    <table border="0" width="72%" height="1">
      <tr>
        <td width="36%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
          <p align="center"><img border="0" src="inkwell.gif" align="left">
        </td>
        <td width="58%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
    <img border="0" src="dissucsioncopy.gif" align="left">
        </td>
        <td width="41%" height="1" valign="middle" align="left" style="border-style: solid; border-color: #FFFFFF">
          <p align="left"><img border="0" src="inkwell2.gif">
        </td>
      </tr>
    </table>
<br>
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