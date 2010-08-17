package flocos

class Classificacao {

	String tipoClassificacao
	String subcategoria

	static belongsTo = [dadosEducacionais:DadosEducacionais, relatoUso:RelatoUso]

    static constraints = {
    	tipoClassificacao(nullable:false, blank:false, inList:['Comunica��o', 'Coordena��o', 'Colabora��o'])
    	subcategoria(inList:['', 'Ass�ncrona', 'S�ncrona'])
    	dadosEducacionais(nullable:true)
    	relatoUso(nullable:true)
    }
}
