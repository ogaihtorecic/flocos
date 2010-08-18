package flocos

class MoafController {

	static navigation = [
		group:'Principal', 
		order:0, 
		title:'Moaf', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [moafInstanceList: Moaf.list(params), moafInstanceTotal: Moaf.count()]
    }

    def create = {
        def moafInstance = new Moaf()
        moafInstance.properties = params
        return [moafInstance: moafInstance]
    }

    def save = {
        def moafInstance = new Moaf(params)
        if (moafInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'moaf.label', default: 'Moaf'), moafInstance.id])}"
            redirect(action: "show", id: moafInstance.id)
        }
        else {
            render(view: "create", model: [moafInstance: moafInstance])
        }
    }

    def show = {
        def moafInstance = Moaf.get(params.id)
        if (!moafInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
            redirect(action: "list")
        }
        else {
            [moafInstance: moafInstance]
        }
    }

    def edit = {
        def moafInstance = Moaf.get(params.id)
        if (!moafInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
            redirect(action: "list")
        }
        else {
			if(session.usuario.id != moafInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: moafInstance.id)
			}
            return [moafInstance: moafInstance]
        }
    }

    def update = {
        def moafInstance = Moaf.get(params.id)
        if (moafInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (moafInstance.version > version) {
                    
                    moafInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'moaf.label', default: 'Moaf')] as Object[], "Another user has updated this Moaf while you were editing")
                    render(view: "edit", model: [moafInstance: moafInstance])
                    return
                }
            }
            moafInstance.properties = params
            if (!moafInstance.hasErrors() && moafInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'moaf.label', default: 'Moaf'), moafInstance.id])}"
                redirect(action: "show", id: moafInstance.id)
            }
            else {
                render(view: "edit", model: [moafInstance: moafInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def moafInstance = Moaf.get(params.id)
        if (moafInstance) {
		    if(session.usuario.id != moafInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: moafInstance.id)
				return
		    }
            try {
                moafInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def continuarCadastro = {
		def moafInstance = Moaf.get(params.id)
        if (moafInstance) {
        	if(moafInstance.dadosGerais == null) {
				redirect(controller: "dadosGerais", action: "create", params: ['moaf.id': moafInstance.id])
			} else if(moafInstance.dadosCriacao == null) {
				redirect(controller: "dadosCriacao", action: "create", params: ['moaf.id': moafInstance.id])
			} else if(moafInstance.dadosTecnicos == null) {
				redirect(controller: "dadosTecnicos", action: "create", params: ['moaf.id': moafInstance.id])
			} else if(moafInstance.dadosDominios == null || moafInstance.dadosDominios.size() == 0) {
				redirect(controller: "dadosDominios", action: "create", params: ['moaf.id': moafInstance.id])
			} else if(moafInstance.dadosEducacionais == null) {
				redirect(controller: "dadosEducacionais", action: "create", params: ['moaf.id': moafInstance.id])
			} else if(moafInstance.dadosAcessibilidade == null) {
				redirect(controller: "dadosAcessibilidade", action: "create", params: ['moaf.id': moafInstance.id])
			} else {
				redirect(action: "list")
			}
		} else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moaf.label', default: 'Moaf'), params.id])}"
            redirect(action: "list")
        }
	}
}
