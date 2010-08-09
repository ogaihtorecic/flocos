package flocos

class Classificacao {

	String tipoClassificacao
	String subcategoria

	static belongsTo = [dadosEducacionais:DadosEducacionais, relatoUso:RelatoUso]

    static constraints = {
    	tipoClassificacao(nullable:false, blank:false, inList:['comunicacao', 'coordenacao', 'colaboracao'])
    	subcategoria(inList:['', 'assincrona', 'sincrona'])
    	dadosEducacionais(nullable:true)
    	relatoUso(nullable:true)
    }
}
