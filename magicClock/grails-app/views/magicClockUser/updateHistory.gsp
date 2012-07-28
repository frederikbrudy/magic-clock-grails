<%@ page import="de.magicclock.UpdateHistoryEntry" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'updateHistoryEntry.label', default: 'UpdateHistoryEntry')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      loadUpdateHistoryMaps();
    });
  </script>
</head>
<body>
<div class="body">
  <h1>${message(code:'default.actions.label', default: 'Actions')}</h1>
  <div>
    <g:link>Back to MagicClockUser list</g:link>
    <g:if test="${updateHistoryEntryInstanceList}">
      &nbsp;###&nbsp;
      <g:link action="clearHistory" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Clear History</g:link>
    </g:if>
  </div>
  <br/>
  <h1>Location Update History</h1>
  <g:if test="${updateHistoryEntryInstanceList}">
    <div style="display:none" id="updateHistory_ids">
      <g:collect in="${updateHistoryEntryInstanceList}" expr="it.id">
        <span class="updateHistory_id">${it}</span>
      </g:collect>
    </div>
    <div class="list">
      <table>
        <thead>
        <tr>
          <th><g:message code="updateHistoryEntry.key.label" default="Key" /></th>

          <g:sortableColumn property="time" title="${message(code: 'updateHistoryEntry.time.label', default: 'Time')}" />

          <g:sortableColumn property="longitude" title="${message(code: 'updateHistoryEntry.longitude.label', default: 'Longitude')}" />

          <g:sortableColumn property="latitude" title="${message(code: 'updateHistoryEntry.latitude.label', default: 'Latitude')}" />

          <g:sortableColumn property="locationOld" title="${message(code: 'updateHistoryEntry.locationOld.label', default: 'Location Old')}" />

          <g:sortableColumn property="locationNew" title="${message(code: 'updateHistoryEntry.locationNew.label', default: 'Location New')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${updateHistoryEntryInstanceList}" status="i" var="updateHistoryEntryInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <span style="display:none;" id="${updateHistoryEntryInstance.id}_lon">${updateHistoryEntryInstance.longitude}</span>
            <span style="display:none;" id="${updateHistoryEntryInstance.id}_lat">${updateHistoryEntryInstance.latitude}</span>
            <td id="${updateHistoryEntryInstance.id}_key">${fieldValue(bean: updateHistoryEntryInstance, field: "key")}</td>

            <td id="${updateHistoryEntryInstance.id}_time"><g:formatDate date="${updateHistoryEntryInstance.time}" format="dd.MM.yyyy 'at' HH:mm:ss" /> (<g:timeSince date="${updateHistoryEntryInstance.time}" />)</td>

            <td >${fieldValue(bean: updateHistoryEntryInstance, field: "longitude")}</td>

            <td>${fieldValue(bean: updateHistoryEntryInstance, field: "latitude")}</td>

            <td>${fieldValue(bean: updateHistoryEntryInstance, field: "locationOld")}</td>

            <td id="${updateHistoryEntryInstance.id}_locationNew">${fieldValue(bean: updateHistoryEntryInstance, field: "locationNew")}</td>
          </tr>
          <tr>
            <td class="${(i % 2) == 0 ? 'odd' : 'even'}" colspan="6">
              <div id="${updateHistoryEntryInstance.id}_map" style="width:1000px; height:400px;">Loading map ...</div>
            </td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${updateHistoryEntryInstanceTotal}" />
    </div>
  </g:if>
  <g:else>
    No location updates received
  </g:else>
</div>
</body>
</html>
