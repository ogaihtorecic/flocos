<html>
    <head>
        <title>FLOCOS 2.0</title>
		<meta name="layout" content="main" />
		<style type="text/css" media="screen">

			#nav {
				margin-top:20px;
				margin-left:30px;
				width:228px;
				float:left;

			}
			.homePagePanel * {
				margin:0px;
			}
			.homePagePanel .panelBody ul {
				list-style-type:none;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody h1 {
				text-transform:uppercase;
				font-size:1.1em;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody {
			    background: url(images/leftnav_midstretch.png) repeat-y top;
				margin:0px;
				padding:15px;
			}
			.homePagePanel .panelBtm {
			    background: url(images/leftnav_btm.png) no-repeat top;
				height:20px;
				margin:0px;
			}

			.homePagePanel .panelTop {
			    background: url(images/leftnav_top.png) no-repeat top;
				height:11px;
				margin:0px;
			}
			h2 {
				margin-top:15px;
				margin-bottom:15px;
				font-size:1.2em;
			}
			#pageBody {
				margin-left:280px;
				margin-right:20px;
			}
		</style>
    </head>
    <body>
    	<g:if test="${session.usuario}">
        	${response.sendRedirect("moaf/list")}
        </g:if>
    	<g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
		<g:form name="formLogin" action="login" controller="usuario">
		<center><div>
			<img src="images/login.png" width="60" height="60">
			Login: <input type="text" name="login"/><br/>
			<img src="images/senha.png" width="60" height="60">
			Senha: <input type="password" name="senha"/><br/>
			<input type="submit" value="Lembrar Senha"/>	 &nbsp; &nbsp;		
			<input type="submit" value="Registre-se"/> &nbsp; &nbsp;
			<input type="submit" value="Entrar"/>
		</div></center>
		</g:form>

    </body>
</html>