package flocos

class DadosCriacaoMc 
{
    String typeConceptMap

    Date updated

    static hasMany = [responsaveis:ResponsavelMc]

    static belongsTo = Moaf
	
    static constraints = 
    {
    	typeConceptMap(inList:["Simple", "Complet"])
    }
    
    String toString() {
    	typeConceptMap
    }
}
