package flocos

class DadosTecnicos {

	Integer tamanho
	Integer duracao
	Usuario usuario

	static hasMany = [locais:Local, sistemasOperacionais:SistemaOperacional, browsers:Browser, resolucoes:Resolucao, plugins:Plugin, hardwares:Hardware, middlewares:Middleware, plataformas:Plataforma, tipoMidias:TipoMidia, parametros:Parametro, funcoes:Funcao]
	
	String tipoAplicacao
	String obervacaoInstalacao
	Integer quantidadeMaxima

	static belongsTo = Moaf

    static constraints = {
    	tamanho(nullable:true)
    	duracao(nullable:true)
    	tipoAplicacao(nullable:true)
    	obervacaoInstalacao(nullable:true, maxSize:255)
    	quantidadeMaxima(nullable:true)
    }
}
