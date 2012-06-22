package flocos

class DadosTecnicosController {

	static navigation = [
		group:'Principal', 
		order:3, 
		title:'Dados Técnicos', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dadosTecnicosInstanceList: DadosTecnicos.list(params), dadosTecnicosInstanceTotal: DadosTecnicos.count()]
    }

    def create = {
		if(!params.moaf) {
			flash.message = "Dados T�cnicos devem estar associados a um Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}

		def moaf = Moaf.get(params.moaf.id)
		if(!moaf) {
			flash.message = "O Moaf passado como par�metro n�o existe"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(moaf.dadosTecnicos != null) {
			flash.message = "Moaf passado como par�metro j� possui Dados T�cnicos"
			redirect(controller: "moaf", action: "list")
			return
		}
		
		if(!session.usuario.id.equals(moaf.usuario.id)) {
			flash.message = "Voc� n�o pode editar esse Moaf"
			redirect(controller: "moaf", action: "list")
			return
		}
														
        def dadosTecnicosInstance = new DadosTecnicos()
        dadosTecnicosInstance.properties = params
        return [dadosTecnicosInstance: dadosTecnicosInstance]
    }

    def save = {
        def dadosTecnicosInstance = new DadosTecnicos(params)
        if (dadosTecnicosInstance.save(flush: true)) {
            
			def moaf = Moaf.get(params.moaf.id)
			
			if(moaf.dadosGerais && moaf.dadosGerais.localArquivo && !"".equals(moaf.dadosGerais.localArquivo)) {
				Local l = new Local(local: moaf.dadosGerais.localArquivo)
				dadosTecnicosInstance.locais = [l]
				l.dadosTecnicos = dadosTecnicosInstance; 
			}
			
			moaf.dadosTecnicos = dadosTecnicosInstance
			moaf.save(flush:true)
			
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), dadosTecnicosInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(controller: "dadosDominios", action: "create", params: ['moaf.id': moaf.id])
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [dadosTecnicosInstance: dadosTecnicosInstance])
        }
    }

    def show = {
        def dadosTecnicosInstance = DadosTecnicos.get(params.id)
        if (!dadosTecnicosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dadosTecnicosInstance: dadosTecnicosInstance]
        }
    }

    def edit = {
        def dadosTecnicosInstance = DadosTecnicos.get(params.id)
        if (!dadosTecnicosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
            redirect(action: "list")
        }
        else {
        	if(session.usuario.id != dadosTecnicosInstance.usuario.id) {
				flash.message = "Voce nao pode editar esse componente"
				redirect(action: "show", id: dadosTecnicosInstance.id)
			}
            return [dadosTecnicosInstance: dadosTecnicosInstance]
        }
    }

    def update = {
        def dadosTecnicosInstance = DadosTecnicos.get(params.id)
        if (dadosTecnicosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dadosTecnicosInstance.version > version) {
                    
                    dadosTecnicosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos')] as Object[], "Another user has updated this DadosTecnicos while you were editing")
                    render(view: "edit", model: [dadosTecnicosInstance: dadosTecnicosInstance])
                    return
                }
            }
            dadosTecnicosInstance.properties = params
            if (!dadosTecnicosInstance.hasErrors() && dadosTecnicosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), dadosTecnicosInstance.id])}"
                redirect(action: "show", id: dadosTecnicosInstance.id)
            }
            else {
                render(view: "edit", model: [dadosTecnicosInstance: dadosTecnicosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dadosTecnicosInstance = DadosTecnicos.get(params.id)
        if (dadosTecnicosInstance) {
        	if(session.usuario.id != dadosTecnicosInstance.usuario.id) {
				flash.message = "Voce nao pode deletar esse componente"
				redirect(action: "show", id: dadosTecnicosInstance.id)
				return
			}
            try {
                dadosTecnicosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dadosTecnicos.label', default: 'DadosTecnicos'), params.id])}"
            redirect(action: "list")
        }
    }
}
