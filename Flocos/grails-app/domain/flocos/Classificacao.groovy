package flocos

class Classificacao {

	String tipoClassificacao
	String subcategoria

	static belongsTo = [dadosEducacionais:DadosEducacionais, relatoUso:RelatoUso]

    static constraints = {
    	tipoClassificacao(nullable:false, blank:false, inList:['Comunicação', 'Coordenação', 'Colaboração'])
    	subcategoria(inList:['', 'Assíncrona', 'Síncrona'])
    	dadosEducacionais(nullable:true)
    	relatoUso(nullable:true)
    }
}
