package flocos

class ResponsavelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [responsavelInstanceList: Responsavel.list(params), responsavelInstanceTotal: Responsavel.count()]
    }

    def create = {
        def responsavelInstance = new Responsavel()
        responsavelInstance.properties = params
        return [responsavelInstance: responsavelInstance]
    }

    def save = {
        def responsavelInstance = new Responsavel(params)
        if (responsavelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), responsavelInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: responsavelInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [responsavelInstance: responsavelInstance])
        }
    }

    def show = {
        def responsavelInstance = Responsavel.get(params.id)
        if (!responsavelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [responsavelInstance: responsavelInstance]
        }
    }

    def edit = {
        def responsavelInstance = Responsavel.get(params.id)
        if (!responsavelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [responsavelInstance: responsavelInstance]
        }
    }

    def update = {
        def responsavelInstance = Responsavel.get(params.id)
        if (responsavelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (responsavelInstance.version > version) {
                    
                    responsavelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'responsavel.label', default: 'Responsavel')] as Object[], "Another user has updated this Responsavel while you were editing")
                    render(view: "edit", model: [responsavelInstance: responsavelInstance])
                    return
                }
            }
            responsavelInstance.properties = params
            if (!responsavelInstance.hasErrors() && responsavelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), responsavelInstance.id])}"
                redirect(action: "show", id: responsavelInstance.id)
            }
            else {
                render(view: "edit", model: [responsavelInstance: responsavelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def responsavelInstance = Responsavel.get(params.id)
        if (responsavelInstance) {
            try {
                responsavelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavel.label', default: 'Responsavel'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Responsavel.findAllByNomeIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [responsavelInstanceList: results, responsavelInstanceTotal: Responsavel.count()])
	}
}
