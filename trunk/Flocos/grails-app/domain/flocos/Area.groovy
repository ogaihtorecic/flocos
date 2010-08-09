package flocos

class Area {

	String area

	static hasMany = [dadosEducacionais:DadosEducacionais, relatosUso:RelatoUso]
	static belongsTo = [DadosEducacionais, RelatoUso]
	
    static constraints = {
    	area(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	area
    }
}
