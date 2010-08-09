package flocos

class Homepage {

	String homepage

	static belongsTo = [responsavel:Responsavel]

    static constraints = {
    	homepage(nullable:false, blank:false, url:true)
    }
    
    String toString() {
    	homepage
    }
}
