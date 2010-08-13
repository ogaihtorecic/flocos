package flocos

class DadosEducacionaisController {

	static navigation = [
		group:'Principal', 
		order:4, 
		title:'Dados Educacionais', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosEducacionaisInstanceList: DadosEducacionais.list(params), dadosEducacionaisInstanceTotal: DadosEducacionais.count()]
    }

    def create = {
		if(!params.moaf) {
			flash.message = "Dados Educacionais devem estar associados a um Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}

		def moaf = Moaf.get(params.moaf.id)
		if(!moaf) {
			flash.message = "O Moaf passado como parâmetro não existe"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(moaf.dadosEducacionais != null) {
			flash.message = "Moaf passado como parâmetro já possui Dados Educacionais"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(!session.usuario.id.equals(moaf.usuario.id)) {
			flash.message = "Você não pode editar esse Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}
								
        def dadosEducacionaisInstance = new DadosEducacionais()
        dadosEducacionaisInstance.properties = params
        return [dadosEducacionaisInstance: dadosEducacionaisInstance]
    }

    def save = {
        def dadosEducacionaisInstance = new DadosEducacionais(params)
		
        if (dadosEducacionaisInstance.save(flush: true)) {
			
			boolean possuiArquivo = false
			def dominios = dadosEducacionaisInstance.dominiosPropostos
			if(dominios && dominios.size() > 0) {
				if(dominios[0].nomeArquivo && !"".equals(dominios[0].nomeArquivo)) {
					possuiArquivo = true
				}
				if(dominios.size() > 1 && dominios[1].nomeArquivo && !"".equals(dominios[1].nomeArquivo)) {
					possuiArquivo = true
				}
			}
			
			if(dadosEducacionaisInstance.dominiosPropostos &&
				possuiArquivo &&
				dadosEducacionaisInstance.objetivoEducacional &&
				!"".equals(dadosEducacionaisInstance.objetivoEducacional)) {
				redirect(action: "gerarOntologia", id: dadosEducacionaisInstance.id, params: ['moaf.id': params.moaf.id])
			} else {
				def moaf = Moaf.get(params.moaf.id)
				moaf.dadosEducacionais = dadosEducacionaisInstance
				moaf.save(flush:true)
			
	            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), dadosEducacionaisInstance.id])}"
	            if("".equals(params.backUri)) {
	            	redirect(controller: "dadosDominios", action: "create", params: ['moaf.id': moaf.id])
	            } else {
	            	redirect(uri: params.backUri)
	            }
			}
        }
        else {
            render(view: "create", model: [dadosEducacionaisInstance: dadosEducacionaisInstance])
        }
    }

    def show = {
        def dadosEducacionaisInstance = DadosEducacionais.get(params.id)
        if (!dadosEducacionaisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosEducacionaisInstance: dadosEducacionaisInstance]
        }
    }

    def edit = {
        def dadosEducacionaisInstance = DadosEducacionais.get(params.id)
        if (!dadosEducacionaisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.id != dadosEducacionaisInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosEducacionaisInstance.id)
			}
            return [dadosEducacionaisInstance: dadosEducacionaisInstance]
        }
    }

    def update = {
        def dadosEducacionaisInstance = DadosEducacionais.get(params.id)
        if (dadosEducacionaisInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosEducacionaisInstance.version > version) {
                    
                    dadosEducacionaisInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais')] as Object[], "Another user has updated this DadosEducacionais while you were editing")
                    render(view: "edit", model: [dadosEducacionaisInstance: dadosEducacionaisInstance])
                    return
                }
            }
            dadosEducacionaisInstance.properties = params
            if (!dadosEducacionaisInstance.hasErrors() && dadosEducacionaisInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), dadosEducacionaisInstance.id])}"
                redirect(action: "show", id: dadosEducacionaisInstance.id)
            }
            else {
                render(view: "edit", model: [dadosEducacionaisInstance: dadosEducacionaisInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosEducacionaisInstance = DadosEducacionais.get(params.id)
        if (dadosEducacionaisInstance) {
        	if(session.usuario.id != dadosEducacionaisInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosEducacionaisInstance.id)
				return
			}
            try {
                dadosEducacionaisInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosEducacionais.label', default: 'DadosEducacionais'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = DadosEducacionais.findAllByConteudoIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [dadosEducacionaisInstanceList: results, dadosEducacionaisInstanceTotal: DadosEducacionais.count()])
	}
	
	def gerarOntologia = {
		def dadosEducacionaisInstance = DadosEducacionais.get(params.id)
        if (dadosEducacionaisInstance) {
			
			boolean gerouOntologia = Utils.gerarOntologia(dadosEducacionaisInstance, servletContext.getRealPath("/"), request.serverName)
        	if(gerouOntologia) {
				
				def moaf = Moaf.get(params.moaf.id)
				moaf.dadosEducacionais = dadosEducacionaisInstance
				moaf.save(flush:true)
				
				flash.message = "Ontologia gerada com sucesso"
				redirect(controller: "dadosDominios", action: "create", params: ['moaf.id': moaf.id])
			} else {
				flash.message = "Erro ao gerar ontologia"
				render(view: "create", model: [dadosEducacionaisInstance: dadosEducacionaisInstance])
			}
			
        }
	}
}
