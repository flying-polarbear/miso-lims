<%--
  ~ Copyright (c) 2012. The Genome Analysis Centre, Norwich, UK
  ~ MISO project contacts: Robert Davey @ TGAC
  ~ **********************************************************************
  ~
  ~ This file is part of MISO.
  ~
  ~ MISO is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ MISO is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with MISO.  If not, see <http://www.gnu.org/licenses/>.
  ~
  ~ **********************************************************************
  --%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="<c:url value='/scripts/jquery/datatables/css/jquery.dataTables.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/scripts/jquery/datatables/css/jquery.dataTables_themeroller.css'/>">

<div id="maincontent">
  <div id="contentcolumn">
    <h1 id="tableTitle"></h1>
    <table class="display no-border ui-widget-content" id="listingTable">
    </table>
    <script type="text/javascript">
      jQuery(document).ready(function () {
        document.getElementById('tableTitle').innerText = ${targetType}.name;
        ListUtils.createTable("listingTable", ${targetType}, ${projectId}, ${config});
      });
    </script>
    <div id="dialog"></div>
  </div>
</div>
<%@ include file="adminsub.jsp" %>

<%@ include file="../footer.jsp" %>
