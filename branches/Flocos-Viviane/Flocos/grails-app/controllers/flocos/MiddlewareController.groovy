package flocos

class MiddlewareController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [middlewareInstanceList: Middleware.list(params), middlewareInstanceTotal: Middleware.count()]
    }

    def create = {
        def middlewareInstance = new Middleware()
        middlewareInstance.properties = params
        return [middlewareInstance: middlewareInstance]
    }

    def save = {
        def middlewareInstance = new Middleware(params)
        if (middlewareInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'middleware.label', default: 'Middleware'), middlewareInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: middlewareInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [middlewareInstance: middlewareInstance])
        }
    }

    def show = {
        def middlewareInstance = Middleware.get(params.id)
        if (!middlewareInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
            redirect(action: "list")
        }
        else {
            [middlewareInstance: middlewareInstance]
        }
    }

    def edit = {
        def middlewareInstance = Middleware.get(params.id)
        if (!middlewareInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [middlewareInstance: middlewareInstance]
        }
    }

    def update = {
        def middlewareInstance = Middleware.get(params.id)
        if (middlewareInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (middlewareInstance.version > version) {
                    
                    middlewareInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'middleware.label', default: 'Middleware')] as Object[], "Another user has updated this Middleware while you were editing")
                    render(view: "edit", model: [middlewareInstance: middlewareInstance])
                    return
                }
            }
            middlewareInstance.properties = params
            if (!middlewareInstance.hasErrors() && middlewareInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'middleware.label', default: 'Middleware'), middlewareInstance.id])}"
                redirect(action: "show", id: middlewareInstance.id)
            }
            else {
                render(view: "edit", model: [middlewareInstance: middlewareInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def middlewareInstance = Middleware.get(params.id)
        if (middlewareInstance) {
            try {
                middlewareInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'middleware.label', default: 'Middleware'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Middleware.findAllByMiddlewareIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [middlewareInstanceList: results, middlewareInstanceTotal: Middleware.count()])
	}
}
