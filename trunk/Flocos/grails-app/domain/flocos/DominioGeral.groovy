package flocos

class DominioGeral {

    String dominioGeral

	static belongsTo = [dadosDominios:DadosDominios]

    static constraints = {
    	dominioGeral(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	dominioGeral
    }
}
