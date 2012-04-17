package flocos

class DominioGeralController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dominioGeralInstanceList: DominioGeral.list(params), dominioGeralInstanceTotal: DominioGeral.count()]
    }

    def create = {
        def dominioGeralInstance = new DominioGeral()
        dominioGeralInstance.properties = params
        return [dominioGeralInstance: dominioGeralInstance]
    }

    def save = {
        def dominioGeralInstance = new DominioGeral(params)
        if (dominioGeralInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), dominioGeralInstance.id])}"
            redirect(action: "show", id: dominioGeralInstance.id)
        }
        else {
            render(view: "create", model: [dominioGeralInstance: dominioGeralInstance])
        }
    }

    def show = {
        def dominioGeralInstance = DominioGeral.get(params.id)
        if (!dominioGeralInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dominioGeralInstance: dominioGeralInstance]
        }
    }

    def edit = {
        def dominioGeralInstance = DominioGeral.get(params.id)
        if (!dominioGeralInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dominioGeralInstance: dominioGeralInstance]
        }
    }

    def update = {
        def dominioGeralInstance = DominioGeral.get(params.id)
        if (dominioGeralInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dominioGeralInstance.version > version) {
                    
                    dominioGeralInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dominioGeral.label', default: 'DominioGeral')] as Object[], "Another user has updated this DominioGeral while you were editing")
                    render(view: "edit", model: [dominioGeralInstance: dominioGeralInstance])
                    return
                }
            }
            dominioGeralInstance.properties = params
            if (!dominioGeralInstance.hasErrors() && dominioGeralInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), dominioGeralInstance.id])}"
                redirect(action: "show", id: dominioGeralInstance.id)
            }
            else {
                render(view: "edit", model: [dominioGeralInstance: dominioGeralInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dominioGeralInstance = DominioGeral.get(params.id)
        if (dominioGeralInstance) {
            try {
                dominioGeralInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dominioGeral.label', default: 'DominioGeral'), params.id])}"
            redirect(action: "list")
        }
    }
}
