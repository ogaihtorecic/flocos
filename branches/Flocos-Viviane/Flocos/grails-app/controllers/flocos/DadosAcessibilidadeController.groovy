package flocos

class DadosAcessibilidadeController {

	static navigation = [
		group:'Principal', 
		order:6, 
		title:'Dados de Acessibilidade', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosAcessibilidadeInstanceList: DadosAcessibilidade.list(params), dadosAcessibilidadeInstanceTotal: DadosAcessibilidade.count()]
    }

    def create = {
		if(!params.moaf) {
			flash.message = "Dados de Acessibilidade devem estar associados a um Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}

		def moaf = Moaf.get(params.moaf.id)
		if(!moaf) {
			flash.message = "O Moaf passado como parâmetro não existe"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(moaf.dadosAcessibilidade != null) {
			flash.message = "Moaf passado como parâmetro já possui Dados de Acessibilidade"
			redirect(controller: "moaf", action: "list")
			return
		}
				
		if(!session.usuario.id.equals(moaf.usuario.id)) {
			flash.message = "Você não pode editar esse Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}				
				
        def dadosAcessibilidadeInstance = new DadosAcessibilidade()
        dadosAcessibilidadeInstance.properties = params
        return [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance]
    }

    def save = {
        def dadosAcessibilidadeInstance = new DadosAcessibilidade(params)
        if (dadosAcessibilidadeInstance.save(flush: true)) {
			
			def moaf = Moaf.get(params.moaf.id)
			moaf.dadosAcessibilidade = dadosAcessibilidadeInstance
			moaf.save(flush:true)
			
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), dadosAcessibilidadeInstance.id])}"
			
            if("".equals(params.backUri)) {
            	redirect(controller: "moaf", action: "show", id: moaf.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance])
        }
    }

    def show = {
        def dadosAcessibilidadeInstance = DadosAcessibilidade.get(params.id)
        if (!dadosAcessibilidadeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance]
        }
    }

    def edit = {
        def dadosAcessibilidadeInstance = DadosAcessibilidade.get(params.id)
        if (!dadosAcessibilidadeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.id != dadosAcessibilidadeInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosAcessibilidadeInstance.id)
			}
            return [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance]
        }
    }

    def update = {
        def dadosAcessibilidadeInstance = DadosAcessibilidade.get(params.id)
        if (dadosAcessibilidadeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosAcessibilidadeInstance.version > version) {
                    
                    dadosAcessibilidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade')] as Object[], "Another user has updated this DadosAcessibilidade while you were editing")
                    render(view: "edit", model: [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance])
                    return
                }
            }
            dadosAcessibilidadeInstance.properties = params
            if (!dadosAcessibilidadeInstance.hasErrors() && dadosAcessibilidadeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), dadosAcessibilidadeInstance.id])}"
                redirect(action: "show", id: dadosAcessibilidadeInstance.id)
            }
            else {
                render(view: "edit", model: [dadosAcessibilidadeInstance: dadosAcessibilidadeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosAcessibilidadeInstance = DadosAcessibilidade.get(params.id)
        if (dadosAcessibilidadeInstance) {
        	if(session.usuario.id != dadosAcessibilidadeInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosAcessibilidadeInstance.id)
				return
			}
            try {
                dadosAcessibilidadeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosAcessibilidade.label', default: 'DadosAcessibilidade'), params.id])}"
            redirect(action: "list")
        }
    }
}
