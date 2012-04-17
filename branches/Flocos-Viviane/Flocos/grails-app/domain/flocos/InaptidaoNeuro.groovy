package flocos

class InaptidaoNeuro {

    String inaptidaoNeuro

	static hasMany = [dadosAcessibilidade:DadosAcessibilidade]
	static belongsTo = DadosAcessibilidade

    static constraints = {
    	inaptidaoNeuro(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	inaptidaoNeuro
    }
}
