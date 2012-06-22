package flocos

class IdiomaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {        
        /*def input = servletContext.getResourceAsStream("listLanguages.csv")
        input = input.text            
        def lista = input.split("\n")

        lista.each
        {
            def idioma = new Idioma(idioma: it)
            idioma.save()
        }*/
        
        
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [idiomaInstanceList: Idioma.list(params), idiomaInstanceTotal: Idioma.count()]
    }

    def create = {
        def idiomaInstance = new Idioma()
        idiomaInstance.properties = params
        return [idiomaInstance: idiomaInstance]
    }

    def save = {
        def idiomaInstance = new Idioma(params)
        if (idiomaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'idioma.label', default: 'Idioma'), idiomaInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: idiomaInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [idiomaInstance: idiomaInstance])
        }
    }

    def show = {
        def idiomaInstance = Idioma.get(params.id)
        if (!idiomaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
            redirect(action: "list")
        }
        else {
            [idiomaInstance: idiomaInstance]
        }
    }

    def edit = {
        def idiomaInstance = Idioma.get(params.id)
        if (!idiomaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [idiomaInstance: idiomaInstance]
        }
    }

    def update = {
        def idiomaInstance = Idioma.get(params.id)
        if (idiomaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (idiomaInstance.version > version) {
                    
                    idiomaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'idioma.label', default: 'Idioma')] as Object[], "Another user has updated this Idioma while you were editing")
                    render(view: "edit", model: [idiomaInstance: idiomaInstance])
                    return
                }
            }
            idiomaInstance.properties = params
            if (!idiomaInstance.hasErrors() && idiomaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'idioma.label', default: 'Idioma'), idiomaInstance.id])}"
                redirect(action: "show", id: idiomaInstance.id)
            }
            else {
                render(view: "edit", model: [idiomaInstance: idiomaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def idiomaInstance = Idioma.get(params.id)
        if (idiomaInstance) {
            try {
                idiomaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), params.id])}"
            redirect(action: "list")
        }
    }
}
