

<%@ page import="de.magicclock.MagicClockColor; de.magicclock.MagicClockColor; de.magicclock.ClockHand; de.magicclock.MagicClockUser" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'magicClockUser.label', default: 'MagicClockUser')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div>
  <h1>Aktionen</h1>
  <g:link class="button" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>&nbsp;&nbsp;###&nbsp;
  <g:link class="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:hasErrors bean="${magicClockUserInstance}">
  <div class="errors">
    <g:renderErrors bean="${magicClockUserInstance}" as="list" />
  </div>
</g:hasErrors>
<g:form method="post" >
  <g:hiddenField name="id" value="${magicClockUserInstance?.id}" />
  <g:hiddenField name="version" value="${magicClockUserInstance?.version}" />
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="key"><g:message code="magicClockUser.key.label" default="Key" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'key', 'errors')}">
          <g:textField name="key" value="${magicClockUserInstance?.key}" />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="color"><g:message code="magicClockUser.color.label" default="Color" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'color', 'errors')}">
          <g:select name="color" from="${MagicClockColor?.values()}" keys="${MagicClockColor?.values()*.name()}" value="${magicClockUserInstance?.color?.name()}" noSelection="['': '']" />
          <br/>
          Notes:
          <ul>
            <li>To switch the color with another user, first set the color of the other user to blank (or any unused color) and then reassign the color of this user. It is not allowed, that two users have the same color.</li>
          </ul>
        </td>
      </tr>


      %{--<tr class="prop">--}%
      %{--<td valign="top" class="name">--}%
      %{--<label for="lastLocationUpdate"><g:message code="magicClockUser.lastLocationUpdate.label" default="Last Location Update" /></label>--}%
      %{--</td>--}%
      %{--<td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'lastLocationUpdate', 'errors')}">--}%
      %{--<g:datePicker name="lastLocationUpdate" precision="day" value="${magicClockUserInstance?.lastLocationUpdate}" default="none" noSelection="['': '']" />--}%
      %{--</td>--}%
      %{--</tr>--}%

      <tr class="prop">
        <td valign="top" class="name">
          <label for="assignedClockHand"><g:message code="magicClockUser.assignedClockHand.label" default="Assigned Clock Hand" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'assignedClockHand', 'errors')}">
          <g:select name="assignedClockHand" from="${ClockHand?.values()}" keys="${ClockHand?.values()*.name()}" value="${magicClockUserInstance?.assignedClockHand?.name()}" noSelection="['': '']" />
          <br/>
          Notes:
          <ul>
            <li>This field should not be set manually. It is set by the application when updateLocation was called and it is cleared when a user times out (after 2 hours).</li>
          </ul>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="favoriteColor"><g:message code="magicClockUser.favoriteColor.label" default="Favorite Color" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'favoriteColor', 'errors')}">
          <g:select name="favoriteColor" from="${MagicClockColor?.values()}" keys="${MagicClockColor?.values()*.name()}" value="${magicClockUserInstance?.favoriteColor?.name()}"  />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="home"><g:message code="magicClockUser.home.label" default="Home" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'home', 'errors')}">
          <g:select name="home.id" from="${de.magicclock.Location.list()}" optionKey="id" value="${magicClockUserInstance?.home?.id}"  />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="location"><g:message code="magicClockUser.location.label" default="Location" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'location', 'errors')}">
          <g:select name="location.id" id="selectLocationID" from="${de.magicclock.Location.list()}" optionKey="id" value="${magicClockUserInstance?.location?.id}"  />
          <br/>
          Notes:
          <ul>
            <li>If the location is set manually, the field receive updates will be unchecked. Check this field to reenable updates via mobile app.</li>
          </ul>
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="receiveUpdates"><g:message code="magicClockUser.receiveUpdates.label" default="Receive Updates" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'receiveUpdates', 'errors')}">
          <g:checkBox name="receiveUpdates" id="magicClockUserReceiveUpdates" value="${magicClockUserInstance?.receiveUpdates}" />
          <br/>
          Notes:
          <ul>
            <li>Uncheck this field to disable all updates via the mobile app.</li>
          </ul>
        </td>
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
