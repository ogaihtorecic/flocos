package flocos

class Plataforma {

    String plataforma
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	plataforma(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	plataforma
    }
}
