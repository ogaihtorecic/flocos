package flocos

class Middleware {

    String middleware
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	middleware(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	middleware
    }
}
