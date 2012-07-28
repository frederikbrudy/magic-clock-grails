
<%@ page import="de.magicclock.Location" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      loadLocationMaps();
    });
  </script>
</head>
<body>
<h1>${message(code:'default.actions.label', default: 'Actions')}</h1>
<div>
  <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<div class="body">
  <div style="display:none" id="location_ids">
    <g:collect in="${locationInstanceList}" expr="it.id">
      <span class="location_id">${it}</span>
    </g:collect>
  </div>
  <h1><g:message code="default.list.label" args="[entityName]" /></h1>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'location.id.label', default: 'Id')}" />

        <g:sortableColumn property="key" title="${message(code: 'location.key.label', default: 'Key')}" />

        <g:sortableColumn property="tag" title="${message(code: 'location.tag.label', default: 'Tag')}" />

        <g:sortableColumn property="description" title="${message(code: 'location.description.label', default: 'Description')}" />

        <th><g:message code="location.topLeft.label" default="Top Left" /></th>

        <th><g:message code="location.topRight.label" default="Top Right" /></th>

        <th><g:message code="location.bottomLeft.label" default="Bottom Left" /></th>

        <th><g:message code="location.bottomRight.label" default="Bottom Right" /></th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${locationInstanceList}" status="i" var="locationInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <div style="display:none;">
            <span id="${locationInstance.id}_tL_lon">${locationInstance?.topLeft?.lon}</span>
            <span id="${locationInstance.id}_tL_lat">${locationInstance?.topLeft?.lat}</span>
            <span id="${locationInstance.id}_tR_lon">${locationInstance?.topRight?.lon}</span>
            <span id="${locationInstance.id}_tR_lat">${locationInstance?.topRight?.lat}</span>
            <span id="${locationInstance.id}_bL_lon">${locationInstance?.bottomLeft?.lon}</span>
            <span id="${locationInstance.id}_bL_lat">${locationInstance?.bottomLeft?.lat}</span>
            <span id="${locationInstance.id}_bR_lon">${locationInstance?.bottomRight?.lon}</span>
            <span id="${locationInstance.id}_bR_lat">${locationInstance?.bottomRight?.lat}</span>
          </div>

          <td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "id")}</g:link>
            %{--<g:set var="homeLocation" value="${locationInstance.key.substring(0,4).equals("home")}"/>--}%
            %{--<g:if test="${homeLocation}">--}%
              %{----}%
              %{--<g:set var="filePath" value="icon_home_${locationInstance.key.substring(5).trim()}.png"/>--}%
              %{--<img style="position:absolute;overflow:visible; z-index:300; margin-top:33px; margin-left:77px;" src="${resource(dir:'images',file:filePath)}" />--}%
            %{--</g:if>--}%
          </td>

          <td id="${locationInstance.id}_key">
            ${fieldValue(bean: locationInstance, field: "key")}
          </td>

          <td>${fieldValue(bean: locationInstance, field: "tag")}</td>

          <td>${fieldValue(bean: locationInstance, field: "description")}</td>

          <td>${fieldValue(bean: locationInstance, field: "topLeft")}</td>

          <td>${fieldValue(bean: locationInstance, field: "topRight")}</td>

          <td>${fieldValue(bean: locationInstance, field: "bottomLeft")}</td>

          <td>${fieldValue(bean: locationInstance, field: "bottomRight")}</td>

        </tr>
        <tr>
          <td class="${(i % 2) == 0 ? 'odd' : 'even'}" colspan="8">

            <div id="${locationInstance.id}_map" style="width:1000px; height:400px;">No map available</div>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${locationInstanceTotal}" />
  </div>
</div>
</body>
</html>
