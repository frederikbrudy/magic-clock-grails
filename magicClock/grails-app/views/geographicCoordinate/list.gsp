
<%@ page import="de.magicclock.GeographicCoordinate" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<h1>${message(code:'default.actions.label', default: 'Actions')}</h1>
<div>
  <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]" /></h1>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'geographicCoordinate.id.label', default: 'Id')}" />

        <g:sortableColumn property="lon" title="${message(code: 'geographicCoordinate.lon.label', default: 'Lon')}" />

        <g:sortableColumn property="lat" title="${message(code: 'geographicCoordinate.lat.label', default: 'Lat')}" />

        <g:sortableColumn property="key" title="${message(code: 'geographicCoordinate.key.label', default: 'Key')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${geographicCoordinateInstanceList}" status="i" var="geographicCoordinateInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${geographicCoordinateInstance.id}">${fieldValue(bean: geographicCoordinateInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: geographicCoordinateInstance, field: "lon")}</td>

          <td>${fieldValue(bean: geographicCoordinateInstance, field: "lat")}</td>

          <td>${fieldValue(bean: geographicCoordinateInstance, field: "key")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${geographicCoordinateInstanceTotal}" />
  </div>
</div>
</body>
</html>
