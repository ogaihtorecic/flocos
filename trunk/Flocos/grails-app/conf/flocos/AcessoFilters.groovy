package flocos

class AcessoFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
            	if(request.getRequestURI().equals("/Flocos/") || actionName.equals("login")) {
            		return true
            	}
            	
                if(!session.usuario) {
                	flash.message = "Para acessar essa pagina voce deve se logar antes!"
                	redirect(uri:"/")
                	return false
                } else if(controllerName.equals("usuario") && !actionName.equals("logout") && !session.usuario.login.equals("admin")) {
					flash.message = "Usuario nao possui acesso a essa funcao!"
                	redirect(uri:"/")
                	return false
				}
                
                return true
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
