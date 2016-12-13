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
<table class="list" id="table">
  <thead>
  <tr>
    <th>Alert Date</th>
    <th>Title</th>
    <th>Text</th>
    <th>Level</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${alerts}" var="alert">
    <tr onMouseOver="this.className='highlightrow'" onMouseOut="this.className='normalrow'">
      <td>${alert.alertDate}</td>
      <td>${alert.alertTitle}</td>
      <td>${alert.alertText}</td>
      <td>${alert.alertLevel.key}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script type="text/javascript">
  jQuery(document).ready(function () {
    jQuery("#table").tablesorter({
      headers: {
        2: {
          sorter: false
        }
      }
    });
  });
</script>
