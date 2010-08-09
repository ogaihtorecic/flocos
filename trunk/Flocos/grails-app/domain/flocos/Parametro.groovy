package flocos

class Parametro {

	String nomeParametro
	String tipoParametro
	String opcional
	String metodoEnvio
	String tipo

	static belongsTo = [dadosTecnicos:DadosTecnicos]
	
	static constraints = {
		tipoParametro(inList:['alfanumerico', 'logico', 'numerico'])
		opcional(inList:['sim', 'nao'])
		metodoEnvio(inList:['get', 'post'])
		tipo(inList:['entrada', 'saida'])
	}

	String toString() {
		"$nomeParametro ($tipo)"
	}

}
