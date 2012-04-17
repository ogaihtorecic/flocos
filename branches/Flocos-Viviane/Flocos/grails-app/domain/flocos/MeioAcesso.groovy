package flocos

class MeioAcesso {

	String meioAcesso

	static hasMany = [dadosCriacao:DadosCriacao]
	static belongsTo = DadosCriacao

    static constraints = {
    	meioAcesso(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	meioAcesso
    }
}
