

<%@ page import="de.magicclock.LocationTag; de.magicclock.Location" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div>
  <h1>Actions</h1>
  <g:link class="button" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>&nbsp;&nbsp;###&nbsp;
  <g:link class="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:hasErrors bean="${locationInstance}">
  <div class="errors">
    <g:renderErrors bean="${locationInstance}" as="list" />
  </div>
</g:hasErrors>
<g:form method="post" >
  <g:hiddenField name="id" value="${locationInstance?.id}" />
  <g:hiddenField name="version" value="${locationInstance?.version}" />
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="key"><g:message code="location.key.label" default="Key" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'key', 'errors')}">
          <g:textField name="key" value="${locationInstance?.key}" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="tag"><g:message code="location.tag.label" default="Tag" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'tag', 'errors')}">
          <g:select name="tag" from="${LocationTag?.values()}" keys="${LocationTag?.values()*.name()}" value="${locationInstance?.tag?.name()}"  />
        </td>
      </tr>



      <tr class="prop">
        <td valign="top" class="name">
          <label for="description"><g:message code="location.description.label" default="Description" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'description', 'errors')}">
          <g:textField name="description" value="${locationInstance?.description}" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="topLeft"><g:message code="location.topLeft.label" default="Top Left" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'topLeft', 'errors')}">
          <g:select name="topLeft.id" from="${de.magicclock.GeographicCoordinate.list()}" optionKey="id" value="${locationInstance?.topLeft?.id}" noSelection="['null': '']" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="topRight"><g:message code="location.topRight.label" default="Top Right" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'topRight', 'errors')}">
          <g:select name="topRight.id" from="${de.magicclock.GeographicCoordinate.list()}" optionKey="id" value="${locationInstance?.topRight?.id}" noSelection="['null': '']" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="bottomLeft"><g:message code="location.bottomLeft.label" default="Bottom Left" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'bottomLeft', 'errors')}">
          <g:select name="bottomLeft.id" from="${de.magicclock.GeographicCoordinate.list()}" optionKey="id" value="${locationInstance?.bottomLeft?.id}" noSelection="['null': '']" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="bottomRight"><g:message code="location.bottomRight.label" default="Bottom Right" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'bottomRight', 'errors')}">
          <g:select name="bottomRight.id" from="${de.magicclock.GeographicCoordinate.list()}" optionKey="id" value="${locationInstance?.bottomRight?.id}" noSelection="['null': '']" />
        </td>
      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:actionSubmit class="button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
  </div>
</g:form>
</div>
</body>
</html>
