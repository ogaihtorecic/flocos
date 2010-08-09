package flocos

class HomepageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [homepageInstanceList: Homepage.list(params), homepageInstanceTotal: Homepage.count()]
    }

    def create = {
        def homepageInstance = new Homepage()
        homepageInstance.properties = params
        return [homepageInstance: homepageInstance]
    }

    def save = {
        def homepageInstance = new Homepage(params)
        if (homepageInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'homepage.label', default: 'Homepage'), homepageInstance.id])}"
            redirect(action: "show", id: homepageInstance.id)
        }
        else {
            render(view: "create", model: [homepageInstance: homepageInstance])
        }
    }

    def show = {
        def homepageInstance = Homepage.get(params.id)
        if (!homepageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
            redirect(action: "list")
        }
        else {
            [homepageInstance: homepageInstance]
        }
    }

    def edit = {
        def homepageInstance = Homepage.get(params.id)
        if (!homepageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [homepageInstance: homepageInstance]
        }
    }

    def update = {
        def homepageInstance = Homepage.get(params.id)
        if (homepageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (homepageInstance.version > version) {
                    
                    homepageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'homepage.label', default: 'Homepage')] as Object[], "Another user has updated this Homepage while you were editing")
                    render(view: "edit", model: [homepageInstance: homepageInstance])
                    return
                }
            }
            homepageInstance.properties = params
            if (!homepageInstance.hasErrors() && homepageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'homepage.label', default: 'Homepage'), homepageInstance.id])}"
                redirect(action: "show", id: homepageInstance.id)
            }
            else {
                render(view: "edit", model: [homepageInstance: homepageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def homepageInstance = Homepage.get(params.id)
        if (homepageInstance) {
            try {
                homepageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'homepage.label', default: 'Homepage'), params.id])}"
            redirect(action: "list")
        }
    }
}
