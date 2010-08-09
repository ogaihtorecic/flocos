package flocos

class SistemaOperacional {

	String sistemaOperacional

	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	sistemaOperacional(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	sistemaOperacional
    }
}
