package flocos

class DadosCriacao {

	String versao
	Date data
	String licenca

	Usuario usuario
	
	static hasMany = [meiosAcesso:MeioAcesso, responsaveis:Responsavel]
	
	static belongsTo = Moaf
	
    static constraints = {
    	versao(nullable:true)
    	data(nullable:true)
    	licenca(inList:['', 'freeware', 'opensource', 'shareware', 'demo', 'trial', 'adware', 'comercializado', 'outra'])
    }
    
    String toString() {
    	versao
    }
}
