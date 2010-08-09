package flocos

class DadosGeraisController {

	static navigation = [
		group:'Principal', 
		order:1, 
		title:'Dados Gerais', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosGeraisInstanceList: DadosGerais.list(params), dadosGeraisInstanceTotal: DadosGerais.count()]
    }

    def create = {
        def dadosGeraisInstance = new DadosGerais()
        dadosGeraisInstance.properties = params
        return [dadosGeraisInstance: dadosGeraisInstance]
    }

    def save = {
        def dadosGeraisInstance = new DadosGerais(params)
		
		def file = request.getFile('myFile')
		def filePath = servletContext.getRealPath("/") + "/uploads/${file.originalFilename}"
		if(file && !file.empty) {
			dadosGeraisInstance.localArquivo = "http://${request.serverName}:8080/Flocos/uploads/${file.originalFilename}"
			dadosGeraisInstance.tamanhoArquivo = file.size.intValue()
		}
		
        if (dadosGeraisInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), dadosGeraisInstance.id])}"
			
			// Faz upload...
			if(file && !file.empty) {
				file.transferTo(new java.io.File(filePath))
			}
			
            if("".equals(params.backUri)) {
				def moaf = new Moaf()
				moaf.dadosGerais = dadosGeraisInstance
				moaf.usuario = session.usuario
				moaf.save(flush:true)
				
            	redirect(controller: "dadosCriacao", action: "create", params: ['moaf.id': moaf.id])
				
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [dadosGeraisInstance: dadosGeraisInstance])
        }
    }

    def show = {
        def dadosGeraisInstance = DadosGerais.get(params.id)
        if (!dadosGeraisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosGeraisInstance: dadosGeraisInstance]
        }
    }

    def edit = {
        def dadosGeraisInstance = DadosGerais.get(params.id)
        if (!dadosGeraisInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
            redirect(action: "list")
        }
        else {
			if(session.usuario.id != dadosGeraisInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosGeraisInstance.id)
			}
            return [dadosGeraisInstance: dadosGeraisInstance]
        }
    }

    def update = {
        def dadosGeraisInstance = DadosGerais.get(params.id)
        if (dadosGeraisInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosGeraisInstance.version > version) {
                    
                    dadosGeraisInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosGerais.label', default: 'DadosGerais')] as Object[], "Another user has updated this DadosGerais while you were editing")
                    render(view: "edit", model: [dadosGeraisInstance: dadosGeraisInstance])
                    return
                }
            }
            dadosGeraisInstance.properties = params
			
			def file = request.getFile('myFile')
			def filePath = servletContext.getRealPath("/") + "/uploads/";
			if(file && !file.empty) {
				filePath += file.originalFilename
				dadosGeraisInstance.localArquivo = "http://${request.serverName}:8080/Flocos/uploads/${file.originalFilename}"
				dadosGeraisInstance.tamanhoArquivo = file.size.intValue()
			}
			
            if (!dadosGeraisInstance.hasErrors() && dadosGeraisInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), dadosGeraisInstance.id])}"
				
				// Faz upload...
				if(file && !file.empty) {
					file.transferTo(new java.io.File(filePath))
				}
				
                redirect(action: "show", id: dadosGeraisInstance.id)
            }
            else {
                render(view: "edit", model: [dadosGeraisInstance: dadosGeraisInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosGeraisInstance = DadosGerais.get(params.id)
        if (dadosGeraisInstance) {
			if(session.usuario.id != dadosGeraisInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosGeraisInstance.id)
				return
			}
            try {
                dadosGeraisInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosGerais.label', default: 'DadosGerais'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def search = {
		def results = DadosGerais.findAllByNomeIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [dadosGeraisInstanceList: results, dadosGeraisInstanceTotal: DadosGerais.count()])
	}
}
