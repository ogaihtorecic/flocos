package flocos

class TipoPnee {

	String tipoPnee

	static hasMany = [dadosAcessibilidade:DadosAcessibilidade]
	static belongsTo = DadosAcessibilidade

    static constraints = {
    	tipoPnee(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	tipoPnee
    }
}
