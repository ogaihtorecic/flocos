package flocos

class InaptidaoVisual {

	String inaptidaoVisual

	static hasMany = [dadosAcessibilidade:DadosAcessibilidade]
	static belongsTo = DadosAcessibilidade

    static constraints = {
    	inaptidaoVisual(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	inaptidaoVisual
    }
}
