package de.magicclock

class MagicClockUserController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def magicClockService

  def beforeInterceptor = {
    if(params.id) {
      def user = MagicClockUser.get(params.id)
      magicClockService.checkTimeout(user)
    } else {                              
      MagicClockUser.list().each {
        magicClockService.checkTimeout(it)
      }
    }
  }

  def index = {
    [getDataString: magicClockService.getData()]
  }

  def list = {
    redirect action: 'index'
  }

  def listMagicClockUsers = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    render(template: 'list', model: [magicClockUserInstanceList: MagicClockUser.list(params), magicClockUserInstanceTotal: MagicClockUser.count()])

  }

  def create = {
    def magicClockUserInstance = new MagicClockUser()
    magicClockUserInstance.properties = params
    magicClockUserInstance.location = Location.findByTag(LocationTag.UNTERWEGS);
    return [magicClockUserInstance: magicClockUserInstance]
  }

  def save = {
    def magicClockUserInstance = new MagicClockUser(params)
    if (magicClockUserInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), magicClockUserInstance.id])}"
      redirect(action: "show", id: magicClockUserInstance.id)
    }
    else {
      render(view: "create", model: [magicClockUserInstance: magicClockUserInstance])
    }
  }

  def show = {
    def magicClockUserInstance = MagicClockUser.get(params.id)
    if (!magicClockUserInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
      redirect(action: "index")
    }
    else {
      [magicClockUserInstance: magicClockUserInstance]
    }
  }

  def edit = {
    def magicClockUserInstance = MagicClockUser.get(params.id)
    if (!magicClockUserInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
      redirect(action: "index")
    }
    else {
      return [magicClockUserInstance: magicClockUserInstance]
    }
  }

  def update = {
    def magicClockUserInstance = MagicClockUser.get(params.id)
    if (magicClockUserInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (magicClockUserInstance.version > version) {

          magicClockUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'magicClockUser.label', default: 'MagicClockUser')] as Object[], "Another user has updated this MagicClockUser while you were editing")
          render(view: "edit", model: [magicClockUserInstance: magicClockUserInstance])
          return
        }
      }
      magicClockUserInstance.properties = params
      magicClockUserInstance.lastLocationUpdate = null;
      if (!magicClockUserInstance.hasErrors() && magicClockUserInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), magicClockUserInstance.id])}"
        redirect(action: "index")
      }
      else {
        render(view: "edit", model: [magicClockUserInstance: magicClockUserInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
      redirect(action: "index")
    }
  }

  def delete = {
    def magicClockUserInstance = MagicClockUser.get(params.id)
    if (magicClockUserInstance) {
      try {
        magicClockUserInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
        redirect(action: "index")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'magicClockUser.label', default: 'MagicClockUser'), params.id])}"
      redirect(action: "index")
    }
  }

  def updateHistory = {
    params.max = Math.min(params.max ? params.int('max') : 20, 100)
    params.sort = "time"
    params.order = "desc"
    [updateHistoryEntryInstanceList: UpdateHistoryEntry.list(params), updateHistoryEntryInstanceTotal: UpdateHistoryEntry.count()]
  }

  def clearHistory = {
    UpdateHistoryEntry.executeUpdate('delete from UpdateHistoryEntry')
    redirect action: "updateHistory"
  }
}
