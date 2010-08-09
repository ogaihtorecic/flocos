package flocos

class Idioma {

	String idioma

	static hasMany = [dadosGerais:DadosGerais, dadosDominios:DadosDominios]
	static belongsTo = [DadosGerais, DadosDominios]

	static constraints = {
		idioma(nullable:false, blank:false, maxSize:2, unique:true)
	}

	String toString() {
		idioma
	}
}
