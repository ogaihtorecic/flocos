package flocos

class Papel {

	String papel

	static hasMany = [responsaveis:Responsavel]
	static belongsTo = Responsavel

    static constraints = {
    	papel(nullable:false, blank:false)
    }
    
    String toString() {
    	papel
    }
}
