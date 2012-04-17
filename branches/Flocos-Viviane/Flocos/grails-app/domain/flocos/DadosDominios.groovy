package flocos

class DadosDominios {

	String titulo
	String dominioEspecifico
	Date data
	String versao
	String descricaoOntologia
	Usuario usuario
	
	String nomeArquivo
	
	static belongsTo = [Moaf, DadosEducacionais, RelatoUso]
	static hasMany = [idiomas:Idioma, dominiosGerais:DominioGeral, locais:Local, responsaveis:Responsavel, formatos:Formato, dadosEducacionais:DadosEducacionais, relatosUso:RelatoUso]
	
    static constraints = {
    	titulo(nullable:false, blank:false)
    	dominioEspecifico(nullable:false, blank:false)
    	data(nullable:true)
    	versao(nullable:true)
    	descricaoOntologia(nullable:true, maxSize:255)
		nomeArquivo(nullable:true)
    }
    
    String toString() {
    	titulo
    }
}
