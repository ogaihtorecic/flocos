package flocos

class Formato {

	String formato

	static belongsTo = [dadosDominios:DadosDominios]

	static constraints = {
		formato(nullable:false, blank:false)
	}

	String toString() {
		formato
	}
}
