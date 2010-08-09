package flocos

class Local {

	String local

	static belongsTo = [dadosTecnicos:DadosTecnicos, dadosDominios:DadosDominios]

    static constraints = {
    	//local(nullable:false, blank:false, url:true) //XXX: Descomentar qnd ir para producao, url:true nao aceita endereco localhost:8080
    	local(nullable:false, blank:false)
    	dadosTecnicos(nullable:true)
    	dadosDominios(nullable:true)
    }
    
    String toString() {
    	"<a href='${local}' target='_blank'>${local}</a>"
    }
}
