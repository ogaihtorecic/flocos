package flocos

class DadosDominioMc 
{
    String title
    String generalDomain
    String specificDomain
    String location
    String version
    String creator
    String descriptionOntology

    Usuario usuario
    
    Date dateCreated
    Date lastUpdated

    static hasMany = [language:Idioma, locations:Local, formats:Formato]
	
    static constraints = {
    	title(nullable:false, blank:false)
    	specificDomain(nullable:false, blank:false)
    	locations(size: 1..255)
    	generalDomain(nullable: true, blank: true)
        version(nullable: true, blank: true)
        creator(nullable: true, blank: true)
        descriptionOntology(nullable: true, blank: true)
    }
}
