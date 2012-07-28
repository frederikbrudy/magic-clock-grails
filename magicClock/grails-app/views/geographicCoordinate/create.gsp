

<%@ page import="de.magicclock.GeographicCoordinate" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div>
  <h1>Actions</h1>
  <g:link class="button" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
</div>
<h1>${entityName} anlegen</h1>
<g:hasErrors bean="${geographicCoordinateInstance}">
  <h2>Errors occured</h2>
  <div class="errors">
    <g:renderErrors bean="${geographicCoordinateInstance}" as="list" />
  </div>
</g:hasErrors>
<g:form action="save" >
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="lon"><g:message code="geographicCoordinate.lon.label" default="Lon" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: geographicCoordinateInstance, field: 'lon', 'errors')}">
          <g:textField name="lon" value="${fieldValue(bean: geographicCoordinateInstance, field: 'lon')}" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="lat"><g:message code="geographicCoordinate.lat.label" default="Lat" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: geographicCoordinateInstance, field: 'lat', 'errors')}">
          <g:textField name="lat" value="${fieldValue(bean: geographicCoordinateInstance, field: 'lat')}" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="key"><g:message code="geographicCoordinate.key.label" default="Key" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: geographicCoordinateInstance, field: 'key', 'errors')}">
          <g:textField name="key" value="${geographicCoordinateInstance?.key}" />
        </td>
      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <button type="submit" class="button" name="create">${message(code: 'default.button.create.label', default: 'Create')}</button>
  </div>
</g:form>
</div>
</body>
</html>
