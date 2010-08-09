package flocos

class TipoMidia {

    String tipoMidia
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	tipoMidia(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	tipoMidia
    }
}
