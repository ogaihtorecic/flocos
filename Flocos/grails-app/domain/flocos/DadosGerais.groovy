package flocos

class DadosGerais {

	String nome
	String palavrasChave
	String descricao
	
	Usuario usuario
	
	String localArquivo
	Integer tamanhoArquivo
	
	static hasMany = [idiomas:Idioma]

	static belongsTo = Moaf

	static constraints = {
		nome(nullable:false, blank:false)
		palavrasChave(nullable:true)
		descricao(nullable:false, blank:false, maxSize:255)
		localArquivo(nullable:true)
		tamanhoArquivo(nullable:true)
	}

	String toString() {
		nome
	}
}
