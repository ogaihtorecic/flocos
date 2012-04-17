package flocos

class LocalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [localInstanceList: Local.list(params), localInstanceTotal: Local.count()]
    }

    def create = {
        def localInstance = new Local()
        localInstance.properties = params
        return [localInstance: localInstance]
    }

    def save = {
        def localInstance = new Local(params)
        if (localInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'local.label', default: 'Local'), localInstance.id])}"
            redirect(action: "show", id: localInstance.id)
        }
        else {
            render(view: "create", model: [localInstance: localInstance])
        }
    }

    def show = {
        def localInstance = Local.get(params.id)
        if (!localInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
            redirect(action: "list")
        }
        else {
            [localInstance: localInstance]
        }
    }

    def edit = {
        def localInstance = Local.get(params.id)
        if (!localInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [localInstance: localInstance]
        }
    }

    def update = {
        def localInstance = Local.get(params.id)
        if (localInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (localInstance.version > version) {
                    
                    localInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'local.label', default: 'Local')] as Object[], "Another user has updated this Local while you were editing")
                    render(view: "edit", model: [localInstance: localInstance])
                    return
                }
            }
            localInstance.properties = params
            if (!localInstance.hasErrors() && localInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'local.label', default: 'Local'), localInstance.id])}"
                redirect(action: "show", id: localInstance.id)
            }
            else {
                render(view: "edit", model: [localInstance: localInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def localInstance = Local.get(params.id)
        if (localInstance) {
            try {
                localInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'local.label', default: 'Local'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Local.findAllByLocalIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [localInstanceList: results, localInstanceTotal: Local.count()])
	}
}
