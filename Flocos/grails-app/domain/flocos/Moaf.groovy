package flocos

class Moaf {

	DadosGerais dadosGerais
	DadosCriacao dadosCriacao
	DadosTecnicos dadosTecnicos
	
	DadosEducacionais dadosEducacionais
	List dadosDominios
	DadosAcessibilidade dadosAcessibilidade
	
	Usuario usuario
	
	static hasMany = [dadosDominios:DadosDominios]
	
	static constraints = {
		
		//XXX
		dadosCriacao(nullable:true)
		dadosTecnicos(nullable:true)
		
		dadosEducacionais(nullable:true)
		dadosAcessibilidade(nullable:true)
	}
}
