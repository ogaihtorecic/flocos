package flocos

class DadosEducacionais {
	
	String idade
	String conteudo
	String preRequisitos
	Integer tempoPrevisto
	String complemento
	String dificuldade
	String tipoInteratividade
	String nivelInteratividade
	String objetivoEducacional
	Usuario usuario
	
	List dominiosPropostos
	
    static hasMany = [relatosUso:RelatoUso, areas:Area, dominiosPropostos:DadosDominios, niveisEscolaridade:NivelEscolaridade, classificacoes:Classificacao, anotacoesSemanticas:AnotacaoSemantica]
    static belongsTo = Moaf
    
    static constraints = {
    	idade(nullable:true)
    	conteudo(nullable:true)
    	preRequisitos(nullable:true)
    	tempoPrevisto(nullable:true)
    	complemento(nullable:true, maxSize:255)
    	dificuldade(inList:['', 'facilimo', 'facil', 'medio', 'dificil', 'super dificil'])
    	tipoInteratividade(inList:['', 'ativa', 'passiva', 'mista'])
    	nivelInteratividade(inList:['', 'baixa', 'alta', 'muito alta'])
    	objetivoEducacional(nullable:true, maxSize:2000)
    }
    
    String toString() {
    	conteudo
    }
}
