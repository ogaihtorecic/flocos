package flocos

import grails.converters.*
import java.text.SimpleDateFormat

class MoafMcController {
    
    def modeloVetorialService
    
    static navigation = [
		group:'Principal', 
		order:6, 
		title:'Moaf-MC', 
		isVisible: { session.usuario != null }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = 
    {        
        def query = (params.query != null)?params.query:""
        def offset = (params.offset != null)?params.offset:0
        def moafMcInstanceList = []
        def total = 0
        
        if (!query.isEmpty())
        {
            def result = modeloVetorialService.getTop(query, offset)
            
            result[0].each
            {
                def moafMc = MoafMc.get(it)
                moafMcInstanceList << moafMc
            }
            
            total = result[1]
        }else
        {
            moafMcInstanceList = MoafMc.list(params)
            total = MoafMc.count()
        }
        
        
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [moafMcInstanceList: moafMcInstanceList, moafMcInstanceTotal: total, query: query]
    }

    def create = {
        def moafMcInstance = new MoafMc()
        moafMcInstance.properties = params
        
        moafMcInstance.dadosGerais = new DadosGeraisMc()
        moafMcInstance.dadosCriacao = new DadosCriacaoMc()
        moafMcInstance.dadosTecnicos = new DadosTecnicosMc()
        moafMcInstance.dadosEducacionais  = new DadosEducacionaisMc()
        
        return [moafMc: moafMcInstance]
    }

    def save = {       
        def moafMcInstance = new MoafMc()
        moafMcInstance.usuario = session.usuario
        moafMcInstance.dadosGerais = new DadosGeraisMc()
        moafMcInstance.dadosCriacao = new DadosCriacaoMc()
        moafMcInstance.dadosTecnicos = new DadosTecnicosMc()
        moafMcInstance.dadosEducacionais = new DadosEducacionaisMc()
        
        moafMcInstance.dadosGerais.properties = params.dadosGeraisMc
        moafMcInstance.dadosCriacao.properties = params.dadosCriacaoMc
        moafMcInstance.dadosTecnicos.properties = params.dadosTecnicosMc
        moafMcInstance.dadosEducacionais.properties = params.dadosEducacionaisMc
        
        def fileUpload = request.getFile("arquivo")
        
        if (!fileUpload.isEmpty())
        {
            moafMcInstance.dadosGerais.arquivo = fileUpload.getBytes()
            moafMcInstance.dadosGerais.fileName = fileUpload.getOriginalFilename() 
            moafMcInstance.dadosTecnicos.size = fileUpload.getSize()
        }
        
        MoafMc.withTransaction { status ->
            if (moafMcInstance.dadosGerais.save(flush: true) && 
                moafMcInstance.dadosCriacao.save(flush: true) && 
                moafMcInstance.dadosTecnicos.save(flush: true) && 
                moafMcInstance.dadosEducacionais.save(flush: true) && 
                moafMcInstance.save(flush: true)) 
            {
                modeloVetorialService.index(moafMcInstance.id as int, servletContext.getRealPath("stop.txt"))
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), moafMcInstance.id])}"
                redirect(action: "show", id: moafMcInstance.id)
            }
            else 
            {
                status.setRollbackOnly()
                render(view: "create", model: [moafMc: moafMcInstance])
            }
        }
            
    }

    def show = {
        def moafMcInstance = MoafMc.get(params.id)
        if (!moafMcInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
            redirect(action: "list")
        }
        else {
            [moafMc: moafMcInstance]
        }
    }

    def edit = {
        def moafMcInstance = MoafMc.get(params.id)
        if (!moafMcInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [moafMc: moafMcInstance]
        }
    }

    def update = {
        def moafMcInstance = MoafMc.get(params.id.toLong())
        if (moafMcInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (moafMcInstance.version > version) {
                    
                    moafMcInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'moafMc.label', default: 'MoafMc')] as Object[], "Another user has updated this MoafMc while you were editing")
                    render(view: "edit", model: [moafMcInstance: moafMcInstance])
                    return
                }
            }
            moafMcInstance.properties = params
            moafMcInstance.dadosGerais.properties = params.dadosGeraisMc
            moafMcInstance.dadosCriacao.properties = params.dadosCriacaoMc
            moafMcInstance.dadosTecnicos.properties = params.dadosTecnicosMc
            moafMcInstance.dadosEducacionais.properties = params.dadosEducacionaisMc
            
            def fileUpload = request.getFile("arquivo")
        
            if (!fileUpload.isEmpty())
            {
                moafMcInstance.dadosGerais.arquivo = fileUpload.getBytes()
                moafMcInstance.dadosGerais.fileName = fileUpload.getOriginalFilename() 
                moafMcInstance.dadosTecnicos.size = fileUpload.getSize()
            }
            
            if (!moafMcInstance.dadosGerais.hasErrors() && moafMcInstance.dadosGerais.save(flush: true) && 
                !moafMcInstance.dadosCriacao.hasErrors() && moafMcInstance.dadosCriacao.save(flush: true) && 
                !moafMcInstance.dadosTecnicos.hasErrors() && moafMcInstance.dadosTecnicos.save(flush: true) && 
                !moafMcInstance.dadosEducacionais.hasErrors() && moafMcInstance.dadosEducacionais.save(flush: true) &&
                !moafMcInstance.hasErrors() && moafMcInstance.save(flush: true)) 
            {
                modeloVetorialService.updateDocument(moafMcInstance.id, servletContext.getRealPath("stop.txt"))
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), moafMcInstance.id])}"
                redirect(action: "show", id: moafMcInstance.id)
            }
            else {
                render(view: "edit", model: [moafMc: moafMcInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def moafMcInstance = MoafMc.get(params.id)
        if (moafMcInstance) {
            try {
                modeloVetorialService.deleteDocument(moafMcInstance.id)
                moafMcInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moafMc.label', default: 'MoafMc'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def loadDomain = 
    {
        def domains = DadosDominios.list()
        render domains as JSON
    }
    
    def getArq = 
    {
        params.id = params.id.toLong()
        def dg = DadosGeraisMc.executeQuery("select m.dadosGerais from MoafMc m where m.id = ?", params.id)[0]
        def arq = dg.arquivo        
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment;filename=\"" + dg.fileName + "\"")
        response.setHeader("Content-Length", "${arq.size()}")
        response.outputStream << arq
    }
}
