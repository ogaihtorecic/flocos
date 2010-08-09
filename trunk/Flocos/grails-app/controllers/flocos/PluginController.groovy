package flocos

class PluginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pluginInstanceList: Plugin.list(params), pluginInstanceTotal: Plugin.count()]
    }

    def create = {
        def pluginInstance = new Plugin()
        pluginInstance.properties = params
        return [pluginInstance: pluginInstance]
    }

    def save = {
        def pluginInstance = new Plugin(params)
        if (pluginInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'plugin.label', default: 'Plugin'), pluginInstance.id])}"
            if("".equals(params.backUri)) {
            	redirect(action: "show", id: pluginInstance.id)
            } else {
            	redirect(uri: params.backUri)
            }
        }
        else {
            render(view: "create", model: [pluginInstance: pluginInstance])
        }
    }

    def show = {
        def pluginInstance = Plugin.get(params.id)
        if (!pluginInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pluginInstance: pluginInstance]
        }
    }

    def edit = {
        def pluginInstance = Plugin.get(params.id)
        if (!pluginInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pluginInstance: pluginInstance]
        }
    }

    def update = {
        def pluginInstance = Plugin.get(params.id)
        if (pluginInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pluginInstance.version > version) {
                    
                    pluginInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'plugin.label', default: 'Plugin')] as Object[], "Another user has updated this Plugin while you were editing")
                    render(view: "edit", model: [pluginInstance: pluginInstance])
                    return
                }
            }
            pluginInstance.properties = params
            if (!pluginInstance.hasErrors() && pluginInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'plugin.label', default: 'Plugin'), pluginInstance.id])}"
                redirect(action: "show", id: pluginInstance.id)
            }
            else {
                render(view: "edit", model: [pluginInstance: pluginInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pluginInstance = Plugin.get(params.id)
        if (pluginInstance) {
            try {
                pluginInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'plugin.label', default: 'Plugin'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def search = {
		def results = Plugin.findAllByPluginIlike("%" + params.criteria + "%", [max:10])
		render(view: "list", model: [pluginInstanceList: results, pluginInstanceTotal: Plugin.count()])
	}
}
