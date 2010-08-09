package flocos

class ResolucaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [resolucaoInstanceList: Resolucao.list(params), resolucaoInstanceTotal: Resolucao.count()]
    }

    def create = {
        def resolucaoInstance = new Resolucao()
        resolucaoInstance.properties = params
        return [resolucaoInstance: resolucaoInstance]
    }

    def save = {
        def resolucaoInstance = new Resolucao(params)
        if (resolucaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), resolucaoInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: resolucaoInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [resolucaoInstance: resolucaoInstance])
        }
    }

    def show = {
        def resolucaoInstance = Resolucao.get(params.id)
        if (!resolucaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [resolucaoInstance: resolucaoInstance]
        }
    }

    def edit = {
        def resolucaoInstance = Resolucao.get(params.id)
        if (!resolucaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [resolucaoInstance: resolucaoInstance]
        }
    }

    def update = {
        def resolucaoInstance = Resolucao.get(params.id)
        if (resolucaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (resolucaoInstance.version > version) {
                    
                    resolucaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'resolucao.label', default: 'Resolucao')] as Object[], "Another user has updated this Resolucao while you were editing")
                    render(view: "edit", model: [resolucaoInstance: resolucaoInstance])
                    return
                }
            }
            resolucaoInstance.properties = params
            if (!resolucaoInstance.hasErrors() && resolucaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), resolucaoInstance.id])}"
                redirect(action: "show", id: resolucaoInstance.id)
            }
            else {
                render(view: "edit", model: [resolucaoInstance: resolucaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def resolucaoInstance = Resolucao.get(params.id)
        if (resolucaoInstance) {
            try {
                resolucaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resolucao.label', default: 'Resolucao'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Resolucao.findAllByResolucaoIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [resolucaoInstanceList: results, resolucaoInstanceTotal: Resolucao.count()])
	}
}
