

<%@ page import="de.magicclock.MagicClockColor; de.magicclock.MagicClockColor; de.magicclock.MagicClockUser" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'magicClockUser.label', default: 'MagicClockUser')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div>
  <h1>Aktionen</h1>
  <g:link class="button" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
</div>
<h1>Add MagicClockUser</h1>
<g:hasErrors bean="${magicClockUserInstance}">
  <h2>Errors occured</h2>
  <div class="errors">
    <g:renderErrors bean="${magicClockUserInstance}" as="list" />
  </div>
</g:hasErrors>

<g:form action="save" >
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
          <g:select name="location.id" from="${de.magicclock.Location.list()}" optionKey="id" value="${magicClockUserInstance?.location?.id}"  />
        </td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <label for="receiveUpdates"><g:message code="magicClockUser.receiveUpdates.label" default="Receive Updates" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: magicClockUserInstance, field: 'receiveUpdates', 'errors')}">
          <g:checkBox name="receiveUpdates" value="${magicClockUserInstance?.receiveUpdates}" />
        </td>
      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <button type="submit" class="button" name="create">${message(code: 'default.button.create.label', default: 'Create')}</button>
  </div>
</g:form>
</body>
</html>
