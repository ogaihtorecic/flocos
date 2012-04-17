package flocos

class RelatoUsoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [relatoUsoInstanceList: RelatoUso.list(params), relatoUsoInstanceTotal: RelatoUso.count()]
    }

    def create = {
    	if(params.dadosEducacionais) {
    		if(flocos.DadosEducacionais.findById(params.dadosEducacionais.id).usuario.id != session.usuario.id) {
		        def relatoUsoInstance = new RelatoUso()
		        relatoUsoInstance.properties = params
		        return [relatoUsoInstance: relatoUsoInstance]
	        } else {
	        	flash.message = "Voce so pode registar Relatos de Uso para Dados Educacionais que nao sao seus!"
        		redirect(action: "list")
	        }
        } else {
        	flash.message = "Relato de Uso deve estar associado a um Dado Educacional!"
        	redirect(action: "list")
        }
    }

    def save = {
        def relatoUsoInstance = new RelatoUso(params)
		
        if (relatoUsoInstance.save(flush: true)) {
			
			boolean possuiArquivo = false
			def dominios = relatoUsoInstance.dominiosUsados
			if(dominios && dominios.size() > 0) {
				if(dominios[0].nomeArquivo && !"".equals(dominios[0].nomeArquivo)) {
					possuiArquivo = true
				}
				if(dominios.size() > 1 && dominios[1].nomeArquivo && !"".equals(dominios[1].nomeArquivo)) {
					possuiArquivo = true
				}
			}
			
        	if(relatoUsoInstance.dominiosUsados && possuiArquivo &&
			   relatoUsoInstance.objetivoEducacional &&
			   !"".equals(relatoUsoInstance.objetivoEducacional)) {
        		redirect(action: "gerarOntologia", id: relatoUsoInstance.id, params: ['dadosEducacionais.id': params.dadosEducacionais.id])
			} else {
	            flash.message = "${message(code: 'default.created.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), relatoUsoInstance.id])}"
	            redirect(action: "show", id: relatoUsoInstance.id)
            }
        }
        else {
            render(view: "create", model: [relatoUsoInstance: relatoUsoInstance])
        }
    }

    def show = {
        def relatoUsoInstance = RelatoUso.get(params.id)
        if (!relatoUsoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
            redirect(action: "list")
        }
        else {
            [relatoUsoInstance: relatoUsoInstance]
        }
    }

    def edit = {
        def relatoUsoInstance = RelatoUso.get(params.id)
        if (!relatoUsoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.id != relatoUsoInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: relatoUsoInstance.id)
			}
            return [relatoUsoInstance: relatoUsoInstance]
        }
    }

    def update = {
        def relatoUsoInstance = RelatoUso.get(params.id)
        if (relatoUsoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (relatoUsoInstance.version > version) {
                    
                    relatoUsoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'relatoUso.label', default: 'RelatoUso')] as Object[], "Another user has updated this RelatoUso while you were editing")
                    render(view: "edit", model: [relatoUsoInstance: relatoUsoInstance])
                    return
                }
            }
            relatoUsoInstance.properties = params
            if (!relatoUsoInstance.hasErrors() && relatoUsoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), relatoUsoInstance.id])}"
                redirect(action: "show", id: relatoUsoInstance.id)
            }
            else {
                render(view: "edit", model: [relatoUsoInstance: relatoUsoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def relatoUsoInstance = RelatoUso.get(params.id)
        if (relatoUsoInstance) {
        	if(session.usuario.id != relatoUsoInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: relatoUsoInstance.id)
				return
		    }
            try {
                relatoUsoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relatoUso.label', default: 'RelatoUso'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = RelatoUso.findAllByConteudoIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [relatoUsoInstanceList: results, relatoUsoInstanceTotal: RelatoUso.count()])
	}
	
	def gerarOntologia = {
		def relatoUsoInstance = RelatoUso.get(params.id)
        if (relatoUsoInstance) {
        	boolean gerouOntologia = Utils.gerarOntologia(relatoUsoInstance, servletContext.getRealPath("/"), request.serverName)
        	if(gerouOntologia) {
				flash.message = "Ontologia gerada com sucesso"
				redirect(action: "show", id: relatoUsoInstance.id)
			} else {
				flash.message = "Erro ao processar Ontologia"
				render(view: "create", model: [relatoUsoInstance: relatoUsoInstance], params: ['dadosEducacionais.id': params.dadosEducacionais.id])
			}
        }
    }
}
