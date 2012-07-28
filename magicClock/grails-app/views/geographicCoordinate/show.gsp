
<%@ page import="de.magicclock.GeographicCoordinate" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div>
  <h1>Actions</h1>
  <g:link class="button" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>&nbsp;&nbsp;###&nbsp;
  <g:link class="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<div class="body">
  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="geographicCoordinate.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: geographicCoordinateInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="geographicCoordinate.lon.label" default="Lon" /></td>

        <td valign="top" class="value">${fieldValue(bean: geographicCoordinateInstance, field: "lon")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="geographicCoordinate.lat.label" default="Lat" /></td>

        <td valign="top" class="value">${fieldValue(bean: geographicCoordinateInstance, field: "lat")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="geographicCoordinate.key.label" default="Key" /></td>

        <td valign="top" class="value">${fieldValue(bean: geographicCoordinateInstance, field: "key")}</td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${geographicCoordinateInstance?.id}" />
      <g:actionSubmit class="button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
      <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </g:form>
  </div>
</div>
</body>
</html>
