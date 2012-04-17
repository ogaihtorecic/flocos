package flocos

class Responsavel {

	String nome

	static hasMany = [dadosCriacao:DadosCriacao, emails:Email, homepages:Homepage, instituicoes:Instituicao, papeis:Papel, relatosUso:RelatoUso]
	static belongsTo = [DadosCriacao, DadosDominios, RelatoUso, Usuario]

    static constraints = {
    	nome(nullable:false, blank:false, unique:true)
    }
    
    String toString() {
    	nome
    }
}
