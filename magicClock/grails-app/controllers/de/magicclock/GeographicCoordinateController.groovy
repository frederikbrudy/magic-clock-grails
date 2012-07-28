package de.magicclock

class GeographicCoordinateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [geographicCoordinateInstanceList: GeographicCoordinate.list(params), geographicCoordinateInstanceTotal: GeographicCoordinate.count()]
    }

    def create = {
        def geographicCoordinateInstance = new GeographicCoordinate()
        geographicCoordinateInstance.properties = params
        return [geographicCoordinateInstance: geographicCoordinateInstance]
    }

    def save = {
        def geographicCoordinateInstance = new GeographicCoordinate(params)
        if (geographicCoordinateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), geographicCoordinateInstance.id])}"
            redirect(action: "show", id: geographicCoordinateInstance.id)
        }
        else {
            render(view: "create", model: [geographicCoordinateInstance: geographicCoordinateInstance])
        }
    }

    def show = {
        def geographicCoordinateInstance = GeographicCoordinate.get(params.id)
        if (!geographicCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [geographicCoordinateInstance: geographicCoordinateInstance]
        }
    }

    def edit = {
        def geographicCoordinateInstance = GeographicCoordinate.get(params.id)
        if (!geographicCoordinateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [geographicCoordinateInstance: geographicCoordinateInstance]
        }
    }

    def update = {
        def geographicCoordinateInstance = GeographicCoordinate.get(params.id)
        if (geographicCoordinateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (geographicCoordinateInstance.version > version) {
                    
                    geographicCoordinateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate')] as Object[], "Another user has updated this GeographicCoordinate while you were editing")
                    render(view: "edit", model: [geographicCoordinateInstance: geographicCoordinateInstance])
                    return
                }
            }
            geographicCoordinateInstance.properties = params
            if (!geographicCoordinateInstance.hasErrors() && geographicCoordinateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), geographicCoordinateInstance.id])}"
                redirect(action: "show", id: geographicCoordinateInstance.id)
            }
            else {
                render(view: "edit", model: [geographicCoordinateInstance: geographicCoordinateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def geographicCoordinateInstance = GeographicCoordinate.get(params.id)
        if (geographicCoordinateInstance) {
            try {
                geographicCoordinateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geographicCoordinate.label', default: 'GeographicCoordinate'), params.id])}"
            redirect(action: "list")
        }
    }
}
