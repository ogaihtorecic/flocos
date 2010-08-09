package flocos

class Browser {

	String browser
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	browser(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	browser
    }
}
