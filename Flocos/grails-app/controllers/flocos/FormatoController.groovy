package flocos

class FormatoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [formatoInstanceList: Formato.list(params), formatoInstanceTotal: Formato.count()]
    }

    def create = {
        def formatoInstance = new Formato()
        formatoInstance.properties = params
        return [formatoInstance: formatoInstance]
    }

    def save = {
        def formatoInstance = new Formato(params)
        if (formatoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'formato.label', default: 'Formato'), formatoInstance.id])}"
            redirect(action: "show", id: formatoInstance.id)
        }
        else {
            render(view: "create", model: [formatoInstance: formatoInstance])
        }
    }

    def show = {
        def formatoInstance = Formato.get(params.id)
        if (!formatoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
            redirect(action: "list")
        }
        else {
            [formatoInstance: formatoInstance]
        }
    }

    def edit = {
        def formatoInstance = Formato.get(params.id)
        if (!formatoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [formatoInstance: formatoInstance]
        }
    }

    def update = {
        def formatoInstance = Formato.get(params.id)
        if (formatoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (formatoInstance.version > version) {
                    
                    formatoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'formato.label', default: 'Formato')] as Object[], "Another user has updated this Formato while you were editing")
                    render(view: "edit", model: [formatoInstance: formatoInstance])
                    return
                }
            }
            formatoInstance.properties = params
            if (!formatoInstance.hasErrors() && formatoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'formato.label', default: 'Formato'), formatoInstance.id])}"
                redirect(action: "show", id: formatoInstance.id)
            }
            else {
                render(view: "edit", model: [formatoInstance: formatoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def formatoInstance = Formato.get(params.id)
        if (formatoInstance) {
            try {
                formatoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'formato.label', default: 'Formato'), params.id])}"
            redirect(action: "list")
        }
    }
}
