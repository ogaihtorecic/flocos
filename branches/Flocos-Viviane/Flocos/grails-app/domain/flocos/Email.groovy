package flocos

class Email {

	String email

	static belongsTo = [responsavel:Responsavel]

    static constraints = {
    	email(nullable:false, blank:false, email:true)
    }
    
    String toString() {
    	email
    }
}
