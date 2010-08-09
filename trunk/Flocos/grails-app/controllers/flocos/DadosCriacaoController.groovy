package flocos

class DadosCriacaoController {

	static navigation = [
		group:'Principal', 
		order:2, 
		title:'Dados de CriaÃ§Ã£o', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosCriacaoInstanceList: DadosCriacao.list(params), dadosCriacaoInstanceTotal: DadosCriacao.count()]
    }

    def create = {
		if(!params.moaf) {
			flash.message = "Dados de criação devem estar associados a um Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}

		def moaf = Moaf.get(params.moaf.id)
		if(!moaf) {
			flash.message = "O Moaf passado como parâmetro não existe"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(moaf.dadosCriacao != null) {
			flash.message = "Moaf passado como parâmetro já possui Dados de Criação"
			redirect(controller: "moaf", action: "list")
			return
		}
				
		if(!session.usuario.id.equals(moaf.usuario.id)) {
			flash.message = "Você não pode editar esse Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}
				
        def dadosCriacaoInstance = new DadosCriacao()
        dadosCriacaoInstance.properties = params
        return [dadosCriacaoInstance: dadosCriacaoInstance]
    }

    def save = {
        def dadosCriacaoInstance = new DadosCriacao(params)
        if (dadosCriacaoInstance.save(flush: true)) {
			
			def moaf = Moaf.get(params.moaf.id)
			moaf.dadosCriacao = dadosCriacaoInstance
			moaf.save(flush:true)
			
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), dadosCriacaoInstance.id])}"
			
            if("".equals(params.backUri)) {
            	redirect(controller: "dadosTecnicos", action: "create", params: ['moaf.id': moaf.id])
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [dadosCriacaoInstance: dadosCriacaoInstance])
        }
    }

    def show = {
        def dadosCriacaoInstance = DadosCriacao.get(params.id)
        if (!dadosCriacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosCriacaoInstance: dadosCriacaoInstance]
        }
    }

    def edit = {
        def dadosCriacaoInstance = DadosCriacao.get(params.id)
        if (!dadosCriacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
            redirect(action: "list")
        }
        else {
			if(session.usuario.id != dadosCriacaoInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosCriacaoInstance.id)
			}
            return [dadosCriacaoInstance: dadosCriacaoInstance]
        }
    }

    def update = {
        def dadosCriacaoInstance = DadosCriacao.get(params.id)
        if (dadosCriacaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosCriacaoInstance.version > version) {
                    
                    dadosCriacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosCriacao.label', default: 'DadosCriacao')] as Object[], "Another user has updated this DadosCriacao while you were editing")
                    render(view: "edit", model: [dadosCriacaoInstance: dadosCriacaoInstance])
                    return
                }
            }
            dadosCriacaoInstance.properties = params
            if (!dadosCriacaoInstance.hasErrors() && dadosCriacaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), dadosCriacaoInstance.id])}"
                redirect(action: "show", id: dadosCriacaoInstance.id)
            }
            else {
                render(view: "edit", model: [dadosCriacaoInstance: dadosCriacaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosCriacaoInstance = DadosCriacao.get(params.id)
        if (dadosCriacaoInstance) {
			if(session.usuario.id != dadosCriacaoInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosCriacaoInstance.id)
				return
			}
            try {
                dadosCriacaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosCriacao.label', default: 'DadosCriacao'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = DadosCriacao.findAllByVersaoIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [dadosCriacaoInstanceList: results, dadosCriacaoInstanceTotal: DadosCriacao.count()])
	}
}
