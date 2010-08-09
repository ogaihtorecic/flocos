package flocos

class DadosAcessibilidade {

	String descricaoPnee
	
	Usuario usuario
	
	String inaptidaoAuditiva

	static hasMany = [tiposPnee:TipoPnee, inaptidoesVisuais:InaptidaoVisual, inaptidoesNeuro:InaptidaoNeuro]
	
	static belongsTo = Moaf

    static constraints = {
    	descricaoPnee(nullable:true, maxSize:255)
		inaptidaoAuditiva(inList:['', 'surdez', 'dificuldade auditiva'])
    }
}
