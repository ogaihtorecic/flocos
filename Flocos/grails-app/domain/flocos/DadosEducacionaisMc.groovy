package flocos

class DadosEducacionaisMc 
{
    
    
    String age    
    String complement
    String structureConceptualMap
	
    static hasMany = [purpose:Area, proposedDomain:DadosDominios, levelOfEducation:NivelEscolaridade, semanticAnnotation:AnotacaoSemantica]
    
    static constraints = 
    {
    	age(nullable:true, blank: true)    	
    	complement(nullable:true, blank: true)
    	structureConceptualMap(inList:["Estrutura em Teia", "Estrutura hierárquica", "Estrutura Flowchart", "Estrutura conceitual"])
    }
    
    String toString() 
    {
    	complement
    }
}
