package flocos

class FuncaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [funcaoInstanceList: Funcao.list(params), funcaoInstanceTotal: Funcao.count()]
    }

    def create = {
        def funcaoInstance = new Funcao()
        funcaoInstance.properties = params
        return [funcaoInstance: funcaoInstance]
    }

    def save = {
        def funcaoInstance = new Funcao(params)
        if (funcaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'funcao.label', default: 'Funcao'), funcaoInstance.id])}"
            redirect(action: "show", id: funcaoInstance.id)
        }
        else {
            render(view: "create", model: [funcaoInstance: funcaoInstance])
        }
    }

    def show = {
        def funcaoInstance = Funcao.get(params.id)
        if (!funcaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [funcaoInstance: funcaoInstance]
        }
    }

    def edit = {
        def funcaoInstance = Funcao.get(params.id)
        if (!funcaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [funcaoInstance: funcaoInstance]
        }
    }

    def update = {
        def funcaoInstance = Funcao.get(params.id)
        if (funcaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (funcaoInstance.version > version) {
                    
                    funcaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'funcao.label', default: 'Funcao')] as Object[], "Another user has updated this Funcao while you were editing")
                    render(view: "edit", model: [funcaoInstance: funcaoInstance])
                    return
                }
            }
            funcaoInstance.properties = params
            if (!funcaoInstance.hasErrors() && funcaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'funcao.label', default: 'Funcao'), funcaoInstance.id])}"
                redirect(action: "show", id: funcaoInstance.id)
            }
            else {
                render(view: "edit", model: [funcaoInstance: funcaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def funcaoInstance = Funcao.get(params.id)
        if (funcaoInstance) {
            try {
                funcaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcao.label', default: 'Funcao'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Funcao.findAllByNomeFuncaoIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [funcaoInstanceList: results, funcaoInstanceTotal: Funcao.count()])
	}
}
