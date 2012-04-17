package flocos

class SistemaOperacionalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sistemaOperacionalInstanceList: SistemaOperacional.list(params), sistemaOperacionalInstanceTotal: SistemaOperacional.count()]
    }

    def create = {
        def sistemaOperacionalInstance = new SistemaOperacional()
        sistemaOperacionalInstance.properties = params
        return [sistemaOperacionalInstance: sistemaOperacionalInstance]
    }

    def save = {
        def sistemaOperacionalInstance = new SistemaOperacional(params)
        if (sistemaOperacionalInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), sistemaOperacionalInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: sistemaOperacionalInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [sistemaOperacionalInstance: sistemaOperacionalInstance])
        }
    }

    def show = {
        def sistemaOperacionalInstance = SistemaOperacional.get(params.id)
        if (!sistemaOperacionalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sistemaOperacionalInstance: sistemaOperacionalInstance]
        }
    }

    def edit = {
        def sistemaOperacionalInstance = SistemaOperacional.get(params.id)
        if (!sistemaOperacionalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sistemaOperacionalInstance: sistemaOperacionalInstance]
        }
    }

    def update = {
        def sistemaOperacionalInstance = SistemaOperacional.get(params.id)
        if (sistemaOperacionalInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sistemaOperacionalInstance.version > version) {
                    
                    sistemaOperacionalInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional')] as Object[], "Another user has updated this SistemaOperacional while you were editing")
                    render(view: "edit", model: [sistemaOperacionalInstance: sistemaOperacionalInstance])
                    return
                }
            }
            sistemaOperacionalInstance.properties = params
            if (!sistemaOperacionalInstance.hasErrors() && sistemaOperacionalInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), sistemaOperacionalInstance.id])}"
                redirect(action: "show", id: sistemaOperacionalInstance.id)
            }
            else {
                render(view: "edit", model: [sistemaOperacionalInstance: sistemaOperacionalInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sistemaOperacionalInstance = SistemaOperacional.get(params.id)
        if (sistemaOperacionalInstance) {
            try {
                sistemaOperacionalInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sistemaOperacional.label', default: 'SistemaOperacional'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = SistemaOperacional.findAllBySistemaOperacionalIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [sistemaOperacionalInstanceList: results, sistemaOperacionalInstanceTotal: SistemaOperacional.count()])
	}
}
