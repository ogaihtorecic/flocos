package flocos

class ClassificacaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classificacaoInstanceList: Classificacao.list(params), classificacaoInstanceTotal: Classificacao.count()]
    }

    def create = {
        def classificacaoInstance = new Classificacao()
        classificacaoInstance.properties = params
        return [classificacaoInstance: classificacaoInstance]
    }

    def save = {
        def classificacaoInstance = new Classificacao(params)
        if (classificacaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), classificacaoInstance.id])}"
            redirect(action: "show", id: classificacaoInstance.id)
        }
        else {
            render(view: "create", model: [classificacaoInstance: classificacaoInstance])
        }
    }

    def show = {
        def classificacaoInstance = Classificacao.get(params.id)
        if (!classificacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [classificacaoInstance: classificacaoInstance]
        }
    }

    def edit = {
        def classificacaoInstance = Classificacao.get(params.id)
        if (!classificacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [classificacaoInstance: classificacaoInstance]
        }
    }

    def update = {
        def classificacaoInstance = Classificacao.get(params.id)
        if (classificacaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (classificacaoInstance.version > version) {
                    
                    classificacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'classificacao.label', default: 'Classificacao')] as Object[], "Another user has updated this Classificacao while you were editing")
                    render(view: "edit", model: [classificacaoInstance: classificacaoInstance])
                    return
                }
            }
            classificacaoInstance.properties = params
            if (!classificacaoInstance.hasErrors() && classificacaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), classificacaoInstance.id])}"
                redirect(action: "show", id: classificacaoInstance.id)
            }
            else {
                render(view: "edit", model: [classificacaoInstance: classificacaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def classificacaoInstance = Classificacao.get(params.id)
        if (classificacaoInstance) {
            try {
                classificacaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])}"
            redirect(action: "list")
        }
    }
}
