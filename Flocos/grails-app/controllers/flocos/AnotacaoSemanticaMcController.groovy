package flocos

class AnotacaoSemanticaMcController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [anotacaoSemanticaInstanceList: AnotacaoSemantica.list(params), anotacaoSemanticaInstanceTotal: AnotacaoSemantica.count()]
    }

    def create = {
        def anotacaoSemanticaInstance = new AnotacaoSemantica()
        anotacaoSemanticaInstance.properties = params
        return [anotacaoSemanticaInstance: anotacaoSemanticaInstance]
    }

    def save = {
        def anotacaoSemanticaInstance = new AnotacaoSemantica(params)
        if (anotacaoSemanticaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), anotacaoSemanticaInstance.id])}"
            redirect(action: "show", id: anotacaoSemanticaInstance.id)
        }
        else {
            render(view: "create", model: [anotacaoSemanticaInstance: anotacaoSemanticaInstance])
        }
    }

    def show = {
        def anotacaoSemanticaInstance = AnotacaoSemantica.get(params.id)
        if (!anotacaoSemanticaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [anotacaoSemanticaInstance: anotacaoSemanticaInstance]
        }
    }

    def edit = {
        def anotacaoSemanticaInstance = AnotacaoSemantica.get(params.id)
        if (!anotacaoSemanticaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [anotacaoSemanticaInstance: anotacaoSemanticaInstance]
        }
    }

    def update = {
        def anotacaoSemanticaInstance = AnotacaoSemantica.get(params.id)
        if (anotacaoSemanticaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (anotacaoSemanticaInstance.version > version) {
                    
                    anotacaoSemanticaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica')] as Object[], "Another user has updated this AnotacaoSemantica while you were editing")
                    render(view: "edit", model: [anotacaoSemanticaInstance: anotacaoSemanticaInstance])
                    return
                }
            }
            anotacaoSemanticaInstance.properties = params
            if (!anotacaoSemanticaInstance.hasErrors() && anotacaoSemanticaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), anotacaoSemanticaInstance.id])}"
                redirect(action: "show", id: anotacaoSemanticaInstance.id)
            }
            else {
                render(view: "edit", model: [anotacaoSemanticaInstance: anotacaoSemanticaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def anotacaoSemanticaInstance = AnotacaoSemantica.get(params.id)
        if (anotacaoSemanticaInstance) {
            try {
                anotacaoSemanticaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anotacaoSemantica.label', default: 'AnotacaoSemantica'), params.id])}"
            redirect(action: "list")
        }
    }
}
