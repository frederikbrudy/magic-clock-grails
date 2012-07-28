
<%@ page import="de.magicclock.Location" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
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
        <td valign="top" class="name"><g:message code="location.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: locationInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.key.label" default="Key" /></td>

        <td valign="top" class="value">${locationInstance?.key?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.tag.label" default="Tag" /></td>

        <td valign="top" class="value">${locationInstance?.tag?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.description.label" default="Description" /></td>

        <td valign="top" class="value">${fieldValue(bean: locationInstance, field: "description")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.topLeft.label" default="Top Left" /></td>

        <td valign="top" class="value"><g:link controller="geographicCoordinate" action="show" id="${locationInstance?.topLeft?.id}">${locationInstance?.topLeft?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.topRight.label" default="Top Right" /></td>

        <td valign="top" class="value"><g:link controller="geographicCoordinate" action="show" id="${locationInstance?.topRight?.id}">${locationInstance?.topRight?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.bottomLeft.label" default="Bottom Left" /></td>

        <td valign="top" class="value"><g:link controller="geographicCoordinate" action="show" id="${locationInstance?.bottomLeft?.id}">${locationInstance?.bottomLeft?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="location.bottomRight.label" default="Bottom Right" /></td>

        <td valign="top" class="value"><g:link controller="geographicCoordinate" action="show" id="${locationInstance?.bottomRight?.id}">${locationInstance?.bottomRight?.encodeAsHTML()}</g:link></td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${locationInstance?.id}" />
      <g:actionSubmit class="button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
      <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </g:form>
  </div>
</div>
</body>
</html>
