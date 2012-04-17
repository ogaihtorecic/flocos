package flocos

class Instituicao {

	String instituicao

	static hasMany = [responsaveis:Responsavel]
	static belongsTo = Responsavel

    static constraints = {
    	instituicao(nullable:false, blank:false)
    }
    
    String toString() {
    	instituicao
    }
}
