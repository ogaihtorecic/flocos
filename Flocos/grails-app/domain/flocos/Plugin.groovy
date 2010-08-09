package flocos

class Plugin {

    String plugin
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	plugin(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	plugin
    }
}
