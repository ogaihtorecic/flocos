package flocos

class DadosDominiosController {

	static navigation = [
		group:'Principal', 
		order:5, 
		title:'Dados de DomÃ­nios', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosDominiosInstanceList: DadosDominios.list(params), dadosDominiosInstanceTotal: DadosDominios.count()]
    }

    def create = {
		if(!params.moaf) {
			flash.message = "Dados de Domínios devem estar associados a um Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}

		def moaf = Moaf.get(params.moaf.id)
		if(!moaf) {
			flash.message = "O Moaf passado como parâmetro não existe"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(moaf.dadosDominios != null && moaf.dadosDominios.size() != 0) {
			flash.message = "Moaf passado como parâmetro já possui Dados de Domínios"
			redirect(controller: "moaf", action: "list")
			return
		}
				
		if(!session.usuario.id.equals(moaf.usuario.id)) {
			flash.message = "Você não pode editar esse Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}
										
        def dadosDominiosInstance = new DadosDominios()
        dadosDominiosInstance.properties = params
        return [dadosDominiosInstance: dadosDominiosInstance]
    }

	def createWithoutMoaf = {
		def dadosDominiosInstance = new DadosDominios()
        dadosDominiosInstance.properties = params
		render(view: "create", model: [dadosDominiosInstance: dadosDominiosInstance])
	}

    def save = {
        def dadosDominiosInstance = new DadosDominios(params)
		
		def file = request.getFile('myFile')
		def filePath = servletContext.getRealPath("/") + "/uploads/${file.originalFilename}"
		if(file && !file.empty) {
			def local = new flocos.Local(local:"http://${request.serverName}:8080/Flocos/uploads/${file.originalFilename}")
			local.dadosDominios = dadosDominiosInstance
			dadosDominiosInstance.locais = [local]
			dadosDominiosInstance.nomeArquivo = file.originalFilename
		}
		
        if (dadosDominiosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), dadosDominiosInstance.id])}"
			
			// Faz upload...
			if(file && !file.empty) {
				file.transferTo(new java.io.File(filePath))
			}
			
			def moaf = null
			if(params.moaf) {
				moaf = Moaf.get(params.moaf.id)
				if(moaf) {
					if(moaf.dadosDominios == null) {
						moaf.dadosDominios = [dadosDominiosInstance] 
					} else {
						moaf.dadosDominios.add dadosDominiosInstance
					}
					moaf.save(flush:true)
				}
			}
			
            if("".equals(params.backUri)) {
				if(moaf) {
					redirect(controller: "dadosAcessibilidade", action: "create", params: ['moaf.id': moaf.id])
				} else {
					redirect(action: "list")
				}
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [dadosDominiosInstance: dadosDominiosInstance])
        }
    }

    def show = {
        def dadosDominiosInstance = DadosDominios.get(params.id)
        if (!dadosDominiosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosDominiosInstance: dadosDominiosInstance]
        }
    }

    def edit = {
        def dadosDominiosInstance = DadosDominios.get(params.id)
        if (!dadosDominiosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.id != dadosDominiosInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosDominiosInstance.id)
			}
            return [dadosDominiosInstance: dadosDominiosInstance]
        }
    }

    def update = {
        def dadosDominiosInstance = DadosDominios.get(params.id)
        if (dadosDominiosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosDominiosInstance.version > version) {
                    
                    dadosDominiosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosDominios.label', default: 'DadosDominios')] as Object[], "Another user has updated this DadosDominios while you were editing")
                    render(view: "edit", model: [dadosDominiosInstance: dadosDominiosInstance])
                    return
                }
            }
            dadosDominiosInstance.properties = params
			
			def file = request.getFile('myFile')
			def filePath = servletContext.getRealPath("/") + "/uploads/";
			if(file && !file.empty) {
				filePath += file.originalFilename
				def local = new flocos.Local(local:"http://${request.serverName}:8080/Flocos/uploads/${file.originalFilename}")
				local.dadosDominios = dadosDominiosInstance
				if(dadosDominiosInstance.locais == null) {
					dadosDominiosInstance.locais = [local]
				} else {
					dadosDominiosInstance.locais.add(local)
				}
				dadosDominiosInstance.nomeArquivo = file.originalFilename
			}
			
            if (!dadosDominiosInstance.hasErrors() && dadosDominiosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), dadosDominiosInstance.id])}"
				
				// Faz upload...
				if(file && !file.empty) {
					file.transferTo(new java.io.File(filePath))
				}
				
                redirect(action: "show", id: dadosDominiosInstance.id)
            }
            else {
                render(view: "edit", model: [dadosDominiosInstance: dadosDominiosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosDominiosInstance = DadosDominios.get(params.id)
        if (dadosDominiosInstance) {
        	if(session.usuario.id != dadosDominiosInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosDominiosInstance.id)
				return
			}
            try {
                dadosDominiosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosDominios.label', default: 'DadosDominios'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = DadosDominios.findAllByTituloIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [dadosDominiosInstanceList: results, dadosDominiosInstanceTotal: DadosDominios.count()])
	}
}
