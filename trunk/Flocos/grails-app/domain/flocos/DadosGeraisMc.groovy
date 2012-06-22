package flocos

class DadosGeraisMc 
{
    String title
    String initialConcept
    String description

    byte[] arquivo = null
    String fileName = null

    static hasMany = [language:Idioma]

    //static belongsTo = MoafMc

    static constraints = 
    {
        title(blank:false)
        initialConcept(blank:false)
        description(blank:false)
        arquivo(nullable: true)
        fileName(nullable: true, blank: true)
    }
    
    String toString() 
    {
        title
    }
}
