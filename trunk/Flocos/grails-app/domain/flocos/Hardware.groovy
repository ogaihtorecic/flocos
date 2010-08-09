package flocos

class Hardware {

    String hardware
	
	static hasMany = [dadosTecnicos:DadosTecnicos]
	static belongsTo = DadosTecnicos

    static constraints = {
    	hardware(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	hardware
    }
}
