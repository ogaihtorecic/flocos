package flocos

class ParametroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [parametroInstanceList: Parametro.list(params), parametroInstanceTotal: Parametro.count()]
    }

    def create = {
        def parametroInstance = new Parametro()
        parametroInstance.properties = params
        return [parametroInstance: parametroInstance]
    }

    def save = {
        def parametroInstance = new Parametro(params)
        if (parametroInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'parametro.label', default: 'Parametro'), parametroInstance.id])}"
            redirect(action: "show", id: parametroInstance.id)
        }
        else {
            render(view: "create", model: [parametroInstance: parametroInstance])
        }
    }

    def show = {
        def parametroInstance = Parametro.get(params.id)
        if (!parametroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
            redirect(action: "list")
        }
        else {
            [parametroInstance: parametroInstance]
        }
    }

    def edit = {
        def parametroInstance = Parametro.get(params.id)
        if (!parametroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [parametroInstance: parametroInstance]
        }
    }

    def update = {
        def parametroInstance = Parametro.get(params.id)
        if (parametroInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (parametroInstance.version > version) {
                    
                    parametroInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'parametro.label', default: 'Parametro')] as Object[], "Another user has updated this Parametro while you were editing")
                    render(view: "edit", model: [parametroInstance: parametroInstance])
                    return
                }
            }
            parametroInstance.properties = params
            if (!parametroInstance.hasErrors() && parametroInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'parametro.label', default: 'Parametro'), parametroInstance.id])}"
                redirect(action: "show", id: parametroInstance.id)
            }
            else {
                render(view: "edit", model: [parametroInstance: parametroInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def parametroInstance = Parametro.get(params.id)
        if (parametroInstance) {
            try {
                parametroInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Parametro.findAllByNomeParametroIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [parametroInstanceList: results, parametroInstanceTotal: Parametro.count()])
	}
}
