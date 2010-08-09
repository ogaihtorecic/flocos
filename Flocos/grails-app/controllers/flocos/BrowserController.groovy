package flocos

class BrowserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [browserInstanceList: Browser.list(params), browserInstanceTotal: Browser.count()]
    }

    def create = {
        def browserInstance = new Browser()
        browserInstance.properties = params
        return [browserInstance: browserInstance]
    }

    def save = {
        def browserInstance = new Browser(params)
        if (browserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'browser.label', default: 'Browser'), browserInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: browserInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [browserInstance: browserInstance])
        }
    }

    def show = {
        def browserInstance = Browser.get(params.id)
        if (!browserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [browserInstance: browserInstance]
        }
    }

    def edit = {
        def browserInstance = Browser.get(params.id)
        if (!browserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [browserInstance: browserInstance]
        }
    }

    def update = {
        def browserInstance = Browser.get(params.id)
        if (browserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (browserInstance.version > version) {
                    
                    browserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'browser.label', default: 'Browser')] as Object[], "Another user has updated this Browser while you were editing")
                    render(view: "edit", model: [browserInstance: browserInstance])
                    return
                }
            }
            browserInstance.properties = params
            if (!browserInstance.hasErrors() && browserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'browser.label', default: 'Browser'), browserInstance.id])}"
                redirect(action: "show", id: browserInstance.id)
            }
            else {
                render(view: "edit", model: [browserInstance: browserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def browserInstance = Browser.get(params.id)
        if (browserInstance) {
            try {
                browserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'browser.label', default: 'Browser'), params.id])}"
            redirect(action: "list")
        }
    }
}
