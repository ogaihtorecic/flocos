package flocos

class RelatoUso {

	Date data
	Integer idade
	String qtdParticipantes
	String conteudo
	String preRequisitos
	Integer tempoPrevisto
	String objetivoEducacional
	String complemento
	String dificuldade
	String tipoInteratividade
	String nivelInteratividade

	Usuario usuario

	List dominiosUsados

	static belongsTo = [dadosEducacionais:DadosEducacionais]
	static hasMany = [responsaveis:Responsavel, areas:Area, dominiosUsados:DadosDominios, niveisEscolaridade:NivelEscolaridade, classificacoes:Classificacao, anotacoesSemanticas:AnotacaoSemantica]
	
    static constraints = {
    	data(nullable:true)
    	idade(nullable:true)
    	qtdParticipantes(nullable:true)
    	conteudo(nullable:true)
    	preRequisitos(nullable:true)
    	tempoPrevisto(nullable:true)
    	objetivoEducacional(nullable:false, blank:false, maxSize:2000)
    	complemento(nullable:true)
    	dificuldade(inList:['', 'facilimo', 'facil', 'medio', 'dificil', 'super dificil'])
    	tipoInteratividade(inList:['', 'ativa', 'passiva', 'mista'])
    	nivelInteratividade(inList:['', 'baixa', 'alta', 'muito alta'])
    }

	String toString() {
		conteudo
	}
}
