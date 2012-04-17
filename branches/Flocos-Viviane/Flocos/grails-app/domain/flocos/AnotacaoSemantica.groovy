package flocos

class AnotacaoSemantica {

	String localAnotacao
	String tipoAnotacao = "OWL"
	
	static belongsTo = [dadosEducacionais:DadosEducacionais, relatoUso:RelatoUso]

    static constraints = {
		localAnotacao(nullable:false, blank:false)
    	//localAnotacao(nullable:false, blank:false, url:true) //XXX: Descomentar qnd ir para producao, url:true nao aceita endereco localhost:8080
    	tipoAnotacao(nullable:false, blank:false)
    	dadosEducacionais(nullable:true)
    	relatoUso(nullable:true)
    }
    
    String toString() {
    	localAnotacao
    }
}
