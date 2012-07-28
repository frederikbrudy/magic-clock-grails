<div class="list">
    <table>
      <thead>
      <tr>


        <g:sortableColumn action="index" property="id" title="${message(code: 'magicClockUser.id.label', default: 'Id')}" />

        <g:sortableColumn action="index" property="key" title="${message(code: 'magicClockUser.key.label', default: 'Key')}" />

        <g:sortableColumn action="index" property="color" title="${message(code: 'magicClockUser.color.label', default: 'Color')}" />

        <g:sortableColumn action="index" property="location" title="${message(code: 'magicClockUser.location.label', default: 'Location')}" />

        <g:sortableColumn action="index" property="assignedClockHand" title="${message(code: 'magicClockUser.assignedClockHand.label', default: 'Assigned Clock Hand')}" />

        <g:sortableColumn action="index" property="receiveUpdates" title="${message(code: 'magicClockUser.receiveUpdates.label', default: 'Receive Updates')}" />

        <g:sortableColumn action="index" property="lastLocationUpdate" title="${message(code: 'magicClockUser.lastLocationUpdate.label', default: 'Last Location Update')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${magicClockUserInstanceList}" status="i" var="magicClockUserInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <g:set var="showing" value="${magicClockUserInstance.color && magicClockUserInstance.assignedClockHand && magicClockUserInstance.location}"/>
          <td class="${showing ? ((magicClockUserInstance.receiveUpdates) ? 'magicClockShowing' : 'magicClockShowingButNotUpdating') : 'magicClockNotShowing'}">
            <g:link action="show" id="${magicClockUserInstance.id}">${fieldValue(bean: magicClockUserInstance, field: "id")}</g:link>
          </td>

          <td>${fieldValue(bean: magicClockUserInstance, field: "key")}</td>

          <td>${fieldValue(bean: magicClockUserInstance, field: "color")}</td>

          <td>${fieldValue(bean: magicClockUserInstance, field: "location")}</td>

          <td>${fieldValue(bean: magicClockUserInstance, field: "assignedClockHand")}</td>

          <td>${fieldValue(bean: magicClockUserInstance, field: "receiveUpdates")}</td>

          <td>
            <g:if test="${magicClockUserInstance?.lastLocationUpdate}">
            %{--<g:formatDate date="${magicClockUserInstance.lastLocationUpdate}" format="dd.MM.yyyy 'at' hh:mm:ss" /> --}%
              <g:timeSince date="${magicClockUserInstance.lastLocationUpdate}" />
            </g:if>
            <g:else>
              Never
            </g:else>
          </td>

        </tr>
      </g:each>
      </tbody>
    </table>
    
  </div>
  <div class="paginateButtons">
    <g:paginate total="${magicClockUserInstanceTotal}" />
  </div>