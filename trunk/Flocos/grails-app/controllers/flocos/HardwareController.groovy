package flocos

class HardwareController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [hardwareInstanceList: Hardware.list(params), hardwareInstanceTotal: Hardware.count()]
    }

    def create = {
        def hardwareInstance = new Hardware()
        hardwareInstance.properties = params
        return [hardwareInstance: hardwareInstance]
    }

    def save = {
        def hardwareInstance = new Hardware(params)
        if (hardwareInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'hardware.label', default: 'Hardware'), hardwareInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: hardwareInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [hardwareInstance: hardwareInstance])
        }
    }

    def show = {
        def hardwareInstance = Hardware.get(params.id)
        if (!hardwareInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
            redirect(action: "list")
        }
        else {
            [hardwareInstance: hardwareInstance]
        }
    }

    def edit = {
        def hardwareInstance = Hardware.get(params.id)
        if (!hardwareInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [hardwareInstance: hardwareInstance]
        }
    }

    def update = {
        def hardwareInstance = Hardware.get(params.id)
        if (hardwareInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (hardwareInstance.version > version) {
                    
                    hardwareInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'hardware.label', default: 'Hardware')] as Object[], "Another user has updated this Hardware while you were editing")
                    render(view: "edit", model: [hardwareInstance: hardwareInstance])
                    return
                }
            }
            hardwareInstance.properties = params
            if (!hardwareInstance.hasErrors() && hardwareInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'hardware.label', default: 'Hardware'), hardwareInstance.id])}"
                redirect(action: "show", id: hardwareInstance.id)
            }
            else {
                render(view: "edit", model: [hardwareInstance: hardwareInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def hardwareInstance = Hardware.get(params.id)
        if (hardwareInstance) {
            try {
                hardwareInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hardware.label', default: 'Hardware'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Hardware.findAllByHardwareIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [hardwareInstanceList: results, hardwareInstanceTotal: Hardware.count()])
	}
}
