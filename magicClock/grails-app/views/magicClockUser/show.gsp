
<%@ page import="de.magicclock.MagicClockUser" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'magicClockUser.label', default: 'MagicClockUser')}" />
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
        <td valign="top" class="name"><g:message code="magicClockUser.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: magicClockUserInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.key.label" default="Key" /></td>

        <td valign="top" class="value">${fieldValue(bean: magicClockUserInstance, field: "key")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.color.label" default="Color" /></td>

        <td valign="top" class="value">${magicClockUserInstance?.color?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.lastLocationUpdate.label" default="Last Location Update" /></td>

        <td valign="top" class="value">
          <g:if test="${magicClockUserInstance?.lastLocationUpdate}">
            <g:formatDate date="${magicClockUserInstance.lastLocationUpdate}" format="dd.MM.yyyy 'at' HH:mm:ss" />
            (<g:timeSince date="${magicClockUserInstance.lastLocationUpdate}" />)
          </g:if>
          <g:else>
            Never
          </g:else>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.assignedClockHand.label" default="Assigned Clock Hand" /></td>

        <td valign="top" class="value">${magicClockUserInstance?.assignedClockHand?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.favoriteColor.label" default="Favorite Color" /></td>

        <td valign="top" class="value">${magicClockUserInstance?.favoriteColor?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.home.label" default="Home" /></td>

        <td valign="top" class="value"><g:link controller="location" action="show" id="${magicClockUserInstance?.home?.id}">${magicClockUserInstance?.home?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.location.label" default="Location" /></td>

        <td valign="top" class="value"><g:link controller="location" action="show" id="${magicClockUserInstance?.location?.id}">${magicClockUserInstance?.location?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="magicClockUser.receiveUpdates.label" default="Receive Updates" /></td>

        <td valign="top" class="value"><g:formatBoolean boolean="${magicClockUserInstance?.receiveUpdates}" /></td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${magicClockUserInstance?.id}" />
      <g:actionSubmit class="button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
      <g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </g:form>
  </div>
</div>
</body>
</html>
