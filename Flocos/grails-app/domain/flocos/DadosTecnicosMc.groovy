package flocos

class DadosTecnicosMc 
{
    Integer size = 0
    String location
    String software
    String mediaResource
    
    static constraints = 
    {
        location(blank:true)
    	size(nullable:true)
        software(nullable:true)
        mediaResource(nullable: true)
    }
}
