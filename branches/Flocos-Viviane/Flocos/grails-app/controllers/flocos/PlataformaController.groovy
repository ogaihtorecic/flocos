package flocos

class PlataformaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [plataformaInstanceList: Plataforma.list(params), plataformaInstanceTotal: Plataforma.count()]
    }

    def create = {
        def plataformaInstance = new Plataforma()
        plataformaInstance.properties = params
        return [plataformaInstance: plataformaInstance]
    }

    def save = {
        def plataformaInstance = new Plataforma(params)
        if (plataformaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), plataformaInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: plataformaInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [plataformaInstance: plataformaInstance])
        }
    }

    def show = {
        def plataformaInstance = Plataforma.get(params.id)
        if (!plataformaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
            redirect(action: "list")
        }
        else {
            [plataformaInstance: plataformaInstance]
        }
    }

    def edit = {
        def plataformaInstance = Plataforma.get(params.id)
        if (!plataformaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [plataformaInstance: plataformaInstance]
        }
    }

    def update = {
        def plataformaInstance = Plataforma.get(params.id)
        if (plataformaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (plataformaInstance.version > version) {
                    
                    plataformaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'plataforma.label', default: 'Plataforma')] as Object[], "Another user has updated this Plataforma while you were editing")
                    render(view: "edit", model: [plataformaInstance: plataformaInstance])
                    return
                }
            }
            plataformaInstance.properties = params
            if (!plataformaInstance.hasErrors() && plataformaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), plataformaInstance.id])}"
                redirect(action: "show", id: plataformaInstance.id)
            }
            else {
                render(view: "edit", model: [plataformaInstance: plataformaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def plataformaInstance = Plataforma.get(params.id)
        if (plataformaInstance) {
            try {
                plataformaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plataforma.label', default: 'Plataforma'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Plataforma.findAllByPlataformaIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [plataformaInstanceList: results, plataformaInstanceTotal: Plataforma.count()])
	}
}
