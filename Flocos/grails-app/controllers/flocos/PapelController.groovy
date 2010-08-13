package flocos

class PapelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [papelInstanceList: Papel.list(params), papelInstanceTotal: Papel.count()]
    }

    def create = {
        def papelInstance = new Papel()
        papelInstance.properties = params
        return [papelInstance: papelInstance]
    }

    def save = {
        def papelInstance = new Papel(params)
        if (papelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'papel.label', default: 'Papel'), papelInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: papelInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [papelInstance: papelInstance])
        }
    }

    def show = {
        def papelInstance = Papel.get(params.id)
        if (!papelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [papelInstance: papelInstance]
        }
    }

    def edit = {
        def papelInstance = Papel.get(params.id)
        if (!papelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [papelInstance: papelInstance]
        }
    }

    def update = {
        def papelInstance = Papel.get(params.id)
        if (papelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (papelInstance.version > version) {
                    
                    papelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'papel.label', default: 'Papel')] as Object[], "Another user has updated this Papel while you were editing")
                    render(view: "edit", model: [papelInstance: papelInstance])
                    return
                }
            }
            papelInstance.properties = params
            if (!papelInstance.hasErrors() && papelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'papel.label', default: 'Papel'), papelInstance.id])}"
                redirect(action: "show", id: papelInstance.id)
            }
            else {
                render(view: "edit", model: [papelInstance: papelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def papelInstance = Papel.get(params.id)
        if (papelInstance) {
            try {
                papelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Papel.findAllByPapelIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [papelInstanceList: results, papelInstanceTotal: Papel.count()])
	}
}
