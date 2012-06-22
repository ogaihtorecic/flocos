package flocos

class ResponsavelMc 
{
    
    String author
    String email
    String developer
    String institution

    //static hasMany = [institutions: InstituicaoMc, developers: DeveloperMc]

    static constraints = 
    {
    	author(blank:false, unique: true)
        email(blank:false)
    }
    
    String toString() 
    {
        author
    }
}
