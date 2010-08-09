package flocos

class Resolucao {

	String resolucao
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	resolucao(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	resolucao
    }
}
