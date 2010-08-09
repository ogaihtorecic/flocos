package flocos

class Usuario {

	String login
	String senha
	String email

	Responsavel responsavel

    static constraints = {
    	login(nullable:false, blank:false, unique:true)
    	senha(nullable:false, blank:false, password:true)
    	email(nullable:false, blank:false, email:true)
    }
    
    String toString() {
    	login
    }
}
