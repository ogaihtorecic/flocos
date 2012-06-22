package flocos

class ResponsavelMcController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [responsavelMcInstanceList: ResponsavelMc.list(params), responsavelMcInstanceTotal: ResponsavelMc.count()]
    }

    def create = {
        def responsavelMcInstance = new ResponsavelMc()
        responsavelMcInstance.properties = params
        return [responsavelMcInstance: responsavelMcInstance]
    }

    def save = {
        def responsavelMcInstance = new ResponsavelMc(params)
        if (responsavelMcInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), responsavelMcInstance.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [responsavelMcInstance: responsavelMcInstance])
        }
    }

    def show = {
        def responsavelMcInstance = ResponsavelMc.get(params.id)
        if (!responsavelMcInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
            redirect(action: "list")
        }
        else {
            [responsavelMcInstance: responsavelMcInstance]
        }
    }

    def edit = {
        def responsavelMcInstance = ResponsavelMc.get(params.id.toLong())
        if (!responsavelMcInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [responsavelMcInstance: responsavelMcInstance]
        }
    }

    def update = {
        def responsavelMcInstance = ResponsavelMc.get(params.id)
        if (responsavelMcInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (responsavelMcInstance.version > version) {
                    
                    responsavelMcInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'responsavelMc.label', default: 'ResponsavelMc')] as Object[], "Another user has updated this ResponsavelMc while you were editing")
                    render(view: "edit", model: [responsavelMcInstance: responsavelMcInstance])
                    return
                }
            }
            responsavelMcInstance.properties = params
            if (!responsavelMcInstance.hasErrors() && responsavelMcInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), responsavelMcInstance.id])}"
                redirect(action: "show", id: responsavelMcInstance.id)
            }
            else {
                render(view: "edit", model: [responsavelMcInstance: responsavelMcInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def responsavelMcInstance = ResponsavelMc.get(params.id.toLong())
        if (responsavelMcInstance) {
            try {
                responsavelMcInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'responsavelMc.label', default: 'ResponsavelMc'), params.id])}"
            redirect(action: "list")
        }
    }
}
