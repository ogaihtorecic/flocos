package flocos

class NivelEscolaridade {

	String nivelEscolaridade

	static hasMany = [dadosEducacionais:DadosEducacionais, relatosUso:RelatoUso]
	static belongsTo = [DadosEducacionais, RelatoUso]

    static constraints = {
    	nivelEscolaridade(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	nivelEscolaridade
    }
}
