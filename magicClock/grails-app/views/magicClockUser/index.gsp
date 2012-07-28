<%@ page import="de.magicclock.MagicClockColor; de.magicclock.LocationTag; de.magicclock.MagicClockColor; de.magicclock.LocationTag; de.magicclock.MagicClockColor; de.magicclock.MagicClockUser" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'magicClockUser.label', default: 'MagicClockUser')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<h1>${message(code:'default.actions.label', default: 'Actions')}</h1>
<div>
  <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>&nbsp;&nbsp;###&nbsp;
  <g:link class="create">Refresh list</g:link>&nbsp;&nbsp;###&nbsp;
  <g:link action="updateHistory">Show Update History</g:link>
</div>
<div class="body">
  <h1>MagicClockUsers List</h1>

  <div id="magicClockUserList">
    <g:include action="listMagicClockUsers"/>
  </div>
  Notes:
  <ul>
    <li>Click on the id to show/edit/delete a user.</li>
    <li>
      The MagicClock receives updates if and only if 'color', 'assigned Clock hand' and 'location' have a value. A successful call to ${request.serverName}/rest/updateLocation will set those values if not assigned. This is also indicated by the background-color of 'id':
      <ul>
        <li><strong class="magicClockNotShowing">red</strong> - the MagicClock does not receive updates from the Server (at least one of {'color', 'assigned MagicClock hand', 'location'} has no value)</li>
        <li><strong class="magicClockShowingButNotUpdating">yellow</strong> - the MagicClock receives updates from the Server but the Server does not receive updates from the mobile app (receiveUpdates == false)</li>
        <li><strong class="magicClockShowing">green</strong> - the MagicClock receives updates from the Server and the Server receives updates from mobile app</li>
      </ul>
    </li>
    <li>The field 'last location update' shows the time since the last update from a mobile app.</li>
  </ul>
  <div id="getDataString">
    <h2>String returned by /rest/getData</h2>
    <g:if test="${getDataString}">
      ${getDataString}
    </g:if>
    <g:else>
      not available
    </g:else>
    <br/><br/>
    <hr/>
    <strong>Format</strong><br/>
    {CC:TT|CC:TT|CC:TT|CC:TT}<br/>
    C=ColorID<br/>
    T=TimeID<br/>
    Default values: 00:07 (Color = OFF, Location = UNTERWEGS)
  </div>
  <h2>Codes</h2>
  <div class="span24 last">


    <div id="dataBindingsLocation" class="span-6">
      <table style="width: 200px;">
        <col style="width: 100px; !important" />
        <col style="width: 100px; !important" />
        <thead>
        <th>Location</th>
        <th>Code</th>
        </thead>
        <tbody>

        <g:each in="${LocationTag.values()}" var="location">
          <tr>
            <td>${location}</td>
            <td>${location.value}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div id="dataBindingsColor" class="span-18 last">
      <table style="width: 200px">
        <col style="width: 100px; !important" />
        <col style="width: 100px; !important" />
        <thead>
        <th>Color</th>
        <th>Code</th>
        </thead>
        <tbody>
        <g:each in="${MagicClockColor.values()}" var="color">
          <tr>
            <td>${color}</td>
            <td>${color.value}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
