function createTableHeader(height){
	document.write("<table width='40%' height='"+ height +"' align='center' valign='top' cellpadding='0' cellspacing='0'>");
	document.write("<tr align='center'>");
	document.write("<td rowspan='2'><img src='images/ufam_logo.jpg'></td>");
	document.write("<td valign='bottom' align='center' width='90%'><font color='#888888' size='6'>UFAM Semantic Web Group</font></td>");
	document.write("</tr>");
	document.write("<tr>");
	document.write("<td valign='top' align='center'><font color='#888888' size='5'>Semantic Web Annotation Framework</font></td>");
	document.write("</tr>");
}

function createTableBottom(){
	document.write("</table>");
}

function MostraImg(url, largura, altura){
	largura = largura || 800;
	altura = altura || 800;
	window.open(url, 'imagem', 'width='+ largura +',height='+ altura +',left=200,top=100');
}
  
function MontaImagens(iInicio, iFim, totalColunas){
	var sNome = "";
	for (var i = iInicio; i < iFim; i++){
		sNome = "img/itiquira"+ i +".jpg";
		if (i % totalColunas == 0)
			document.write("<tr>");
		document.write("<td align=center><a href=\"javascript:MostraImg('"+ sNome +"');\">");
		document.write("<img border=0 width='100' height='100' src='"+ sNome +"' alt='Clique para mostrar a foto "+ sNome +" no tamanho normal'></td>");
		if (i % totalColunas == 3)
			document.write("</tr>");
	}
}

function MontaMenu(pagAtual ){
	pagAtual = pagAtual || "";
	document.write("<table width='100%' align=center>");
	document.write("  <tr align=center>");

	/*
	document.write("    <td width='10%' class=menuFont align=left>:");
	if (pagAtual != "inicio")
		document.write("<a href='index.html' class=menuFont>");
	document.write("In&iacute;cio</a>:</td>");
	*/
	
	document.write("    <td width='14%' class=menuFont align=left>");
	if (pagAtual != "profissional")
		document.write("<a href='prof.html' class=menuFont>");
	document.write("&lt;&lt;Profissional&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont>");
	if (pagAtual != "docencia")
		document.write("<a href='docencia.html' class=menuFont>");
	document.write("&lt;&lt;Doc&ecirc;ncia&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont>");
	if (pagAtual != "MAO")
		document.write("<a href='MAO.html' class=menuFont>");
	document.write("&lt;&lt;Manaus&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont>");
	if (pagAtual != "BSB")
		document.write("<a href='BSB.html' class=menuFont>");
	document.write("&lt;&lt;Bras&iacute;lia&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont>");
	if (pagAtual != "SSA")
		document.write("<a href='SSA.html' class=menuFont>");
	document.write("&lt;&lt;Salvador&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont>");
	if (pagAtual != "pessoal")
		document.write("<a href='pessoal.html' class=menuFont>");
	document.write("&lt;&lt;Pessoal&gt;&gt;</a></td>");

	document.write("    <td width='14%' class=menuFont align=right>");
	if (pagAtual != "dicasCV")
		document.write("<a href='dicasCV.html' class=menuFont>");
	document.write("&lt;&lt;Dicas CV&gt;&gt;</a></td>");

	document.write("  </tr>");
	document.write("  <tr><td>&nbsp;</td></tr>");
	document.write("</table>");
}

function MontaRodape(pagAtual){
	MontaMenu(pagAtual);
}

function MontaCabecalho(){
	document.write("<table valign=top width='100%' align=center>");
	document.write("  <tr>");
	document.write("    <td valign=bottom class=headerFont width='90%' align=left>Gilberto Martins dos Santos Neto - <font color='#CC0033'>Novo celular: +55 (71) 8771-7828</font></td>");
	document.write("    <td rowspan=4 align=right><IMG SRC='img/GilRosto.jpg' WIDTH=120 HEIGHT=120 BORDER=0 ALT='Gilberto Martins dos Santos Neto'></td>");
	document.write("  </tr>");
	document.write("  <tr><td valign=top class=titleFont width='90%' align=left>Sou Analista de Sistemas, adoro tecnologia, tento saber um pouco de tudo apesar de n&atilde;o me considerar especialista em nada.</td></tr>");
	document.write("  <tr><td valign=top class=titleFont width='90%' align=left>Nasci em Salvador (BA), j&aacute; morei em Bras&iacute;lia - DF (1 ano e 4 meses) e em Manaus - AM (2 anos e 6 meses).</td></tr>");
	document.write("  <tr><td valign=top class=titleFont width='90%' align=left>Voltei em junho/2007 para os bra&ccedil;os da minha fam&iacute;lia em Salvador :D</td></tr>");

	//document.write("  <tr><td valign=top class=titleFont width='90%' align=left><font color=red>Novo celular: +55 (71) 8771-7828</font></td></tr>");
	document.write("  <tr><td valign=top class=titleFont width='90%' align=left>Contatos: gilbertomsn@gmail.com / gilbertomsn@yahoo.com</td></tr>");
	document.write("</table>");
}

function MontaCV(){
	var jump = "<tr><td>&nbsp;</td></tr>";
	var space = "&nbsp;&nbsp;&nbsp;&nbsp;";
	document.write("<table valign=top width='100%' align=left>");

	document.write(jump);
	document.write("  <tr><td class=titleFont>Downloads:</td></tr>");
	document.write("  <tr><td>"+ space +"Get my resum&eacute; (English version): <a href='res/CV_GilbertoMartins_English.doc'>click here</a></td></tr>");
	document.write("  <tr><td>"+ space +"Como documento do Word (vers&atilde;o em portugu&ecirc;s): <a href='res/CV_GilbertoMartins_resumido.doc'>clique aqui</a></td></tr>");
	document.write("  <tr><td>"+ space +"Como PDF: <a href='res/CV_GilbertoMartins_resumido.pdf'>clique aqui</a></td></tr>");

	document.write(jump);
	document.write("  <tr><td class=titleFont>OBJETIVOS</td></tr>");
	document.write("  <tr><td>"+ space +"Aprimorar meus conhecimentos relativos &agrave; Gest&atilde;o de Pessoas</td></tr>");
	document.write("  <tr><td>"+ space +"Aprimorar meus conhecimentos relativos &agrave; an&aacute;lise e ao desenvolvimento de sistemas</td></tr>");
	document.write("  <tr><td>"+ space +"Aprimorar meus conhecimentos relativos &agrave; diversas &aacute;reas de interesse, como:</td></tr>");
	document.write("  <tr><td>"+ space + space +"Mobile: an&aacute;lise, desenvolvimento, integra&ccedil;&atilde;o de sistemas</td></tr>");
	document.write("  <tr><td>"+ space + space +"Intelig&ecirc;ncia Artificial: Web Sem&acirc;ntica principalmente</td></tr>");
	document.write("  <tr><td>"+ space + space +"Business Intelligence (BI): planejamento estrat&eacute;gico e Data Warehouse</td></tr>");
	document.write("  <tr><td>"+ space + space +"Gest&atilde;o de Neg&oacute;cios: empreendedorismo, lideran&ccedil;a, motiva&ccedil;&atilde;o, administra&ccedil;&atilde;o de empresas</td></tr>");
	document.write(jump);
	document.write("  <tr><td class=titleFont>HABILIDADES</td></tr>");
	document.write("  <tr><td>"+ space +"Grande disposição para enfrentar desafios</td></tr>");
	document.write("  <tr><td>"+ space +"Experiência em coordenação de equipes de desenvolvimento</td></tr>");
	document.write("  <tr><td>"+ space +"Capacidade de liderança</td></tr>");
	document.write("  <tr><td>"+ space +"Facilidade de aprendizado</td></tr>");
	document.write(jump);

	document.write("  <tr><td class=titleFont>QUALIFICA&Ccedil;&Otilde;ES T&Eacute;CNICAS</td></tr>");
	
	document.write("  <tr><td class=middleFont>"+ space +"Sistemas Operacionais</td></tr>");
	document.write("  <tr><td>"+ space + space +"Windows - Todas as vers&otilde;es Desktop e Server (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MS-DOS (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Linux - Conectiva, Red Hat (M&eacute;dio)</td></tr>");
	document.write("  <tr><td></td></tr>");
	
	document.write("  <tr><td class=middleFont>"+ space +"Tecnologias Web</td></tr>");
	document.write("  <tr><td>"+ space + space +"ASP.Net - VB.Net, IIS (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"ASP - VBScript, IIS (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"PHP (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"JavaScript (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Hyperion Analyzer (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"HTML (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Java/JSP/EJB - Apache, Tomcat, Resin (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"CSS (B&aacute;sico)</td></tr>");

	document.write("  <tr><td class=middleFont>"+ space +"Linguagens Client/Server</td></tr>");
	document.write("  <tr><td>"+ space + space +"RCP Applications/SWT/JFace (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Visual Basic (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Pascal (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Java/SWING (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Java/AWT (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"C/C++ (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Business Objects (B&aacute;sico)</td></tr>");

	document.write("  <tr><td class=middleFont>"+ space +"Banco de Dados</td></tr>");
	document.write("  <tr><td>"+ space + space +"SQL Server - 97/2000 (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MySQL (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Access - 97/2000 (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"DB2 (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Oracle (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"EssBase (B&aacute;sico)</td></tr>");

	document.write("  <tr><td class=middleFont>"+ space +"Ferramentas/Programas/Tecnologias</td></tr>");
	document.write("  <tr><td>"+ space + space +"Eclipse (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MS Visual Studio .Net (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"EditPlus (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MySQLFront (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"VNC (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Araneae (Avan&ccedil;ado)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Netbeans (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"UML (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"XML (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Eclipse (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Quest Central for DB2 (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MS Project (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MS SourceSafe (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Visual Studio 5 (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"UltraEdit (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"JDev (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"TeraTerm Pro (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Putty (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"PowerDesigner (M&eacute;dio)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Rational Rose (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"MS FrontPage (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Macromedia Dreamweaver (B&aacute;sico)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Macromedia UltraDev (B&aacute;sico)</td></tr>");

	document.write(jump);
	document.write("  <tr><td class=titleFont>EXPERI&Ecirc;NCIA PROFISSIONAL</td></tr>");

	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.frb.br' class=blackFont alt='Clique para ir ao site'>Faculdade Ruy Barbosa</a> (08/2007 at&eacute; os dias atuais)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Professor universit&aacute;rio do curso Bacharelado em Ci&ecirc;ncia da Computa&ccedil;&atilde;o (Noturno). Disciplina(s):</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-Compiladores</td></tr>");
	
	document.write("  <tr><td>&nbsp;</td></tr>");
	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.fja.edu.br' class=blackFont alt='Clique para ir ao site'>Faculdades Jorge Amado</a> (09/2007 at&eacute; os dias atuais)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Professor universit&aacute;rio do curso Gradua&ccedil;&atilde;o Tecnol&oacute;gica de Desenvolvimento de Software (Noturno). Disciplina(s):</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-Programa&ccedil;&atilde;o Orientada a Objetos</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-Ger&ecirc;ncia de Configura&ccedil;&atilde;o e Testes</td></tr>");
	
	document.write("  <tr><td>&nbsp;</td></tr>");
	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.fpf.br' class=blackFont alt='Clique para ir ao site da Funda&ccedil;&atilde;o Paulo Feitoza'>Funda&ccedil;&atilde;o Paulo Feitoza</a> (01/2005 at&eacute; 05/2007)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Analista de Sistemas S&ecirc;nior, em projetos para o Mobility Toolkit da <a target='_blank' href='http://www.benqmobile.com/'>BenQ/Siemens Mobile</a> em Manaus (AM), envolvendo as seguintes tecnologias:</td></tr>");
	document.write("  <tr><td></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://java.sun.com'>Java (JSE e JME)</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://wiki.eclipse.org/index.php/Rich_Client_Platform'>RCP Applications</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.eclipse.org/swt/'>SWT</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://wiki.eclipse.org/index.php/JFace'>JFace</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.eclipse.org/'>Eclipse</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.w3.org/XML/'>XML</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.uml.org/'>UML</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.google.com/search?q=Design+Patterns'>Design Patterns</a></td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"-<a target='_blank' href='http://www.installshield.com/'>InstallShield</a></td></tr>");

	document.write("  <tr><td>&nbsp;</td></tr>");
	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.unitech.com.br' class=blackFont alt='Clique para ir ao site da Unitech Tecnologia de Informa&ccedil;&atilde;o'>Unitech Tecnologia de Informa&ccedil;&atilde;o</a> (02/2003 at&eacute; 12/2004)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Analista de Sistemas OLAP, desenvolvendo em Java, JSP, EJB, ASP, JavaScript, Hyperion Analyzer em projetos na <a target='_blank' href='http://www.brasiltelecom.com.br'>Brasil Telecom</a> em Brasília (DF)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Analista de Sistemas ETL, desenvolvendo em SyncSort, Java, XML, XSL, XSD em UNIX AIX em projetos na <a target='_blank' href='http://www.brasiltelecom.com.br'>Brasil Telecom</a> em Brasília (DF)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Analista de Sistemas WEB, utilizando ASP.NET (VB.NET), SQL Server e UML em Salvador (BA)</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"L&iacute;der de equipe, testador e homologador na F&aacute;brica de Software no projeto UniCRM</td></tr>");
	document.write("  <tr><td></td></tr>");

	document.write("  <tr><td>&nbsp;</td></tr>");
	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.giusoft.com.br' class=blackFont alt='Clique para ir ao site da GiuSoft Inform&aacute;tica'>GiuSoft Inform&aacute;tica</a> (12/2000 at&eacute; 01/2003)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Coordenação, an&aacute;lise e desenvolvimento de sistemas para a Internet/Intranet e Cliente/Servidor em  Salvador (BA), para clientes como :</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"<a target='_blank' href='http://www.intermaritima.com.br' alt='Clique para ir ao site da Intermar&iacute;tima Terminais'>Intermar&iacute;tima Terminais</a> (Intranet/Internet utilizando ASP, SQL Server, Access, Windows 2K, Windows NT; Cliente/Servidor usando VB, Access)</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"<a target='_blank' href='http://www.sindautobahia.com.br' alt='Clique para ir ao site do Sindauto Bahia'>Sindauto Bahia</a> (Sistema utilizando inicialmente ASP, SQL Server, Windows 2K, depois efetuei a migração pra PHP, MySQL, Linux, EDI)</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"<a target='_blank' href='http://www.concordiatransportes.com.br' alt='Clique para ir ao site da Conc&oacute;rdia Transportes'>Conc&oacute;rdia Transportes</a> (Sistema para Intranet abrangendo todos os setores da empresa, como Financeiro, Faturamento, Opera&ccedil;&atilde;o, Manuten&ccedil;&atilde;o de ve&iacute;culos e pneus, utilizando ASP, SQL Server, Access, Windows 2K)</td></tr>");
	document.write("  <tr><td></td></tr>");
	document.write("  <tr><td class=middleFont>"+ space +"<a target='_blank' href='http://www.interativabr.com' class=blackFont alt='Clique para is ao site da InterAtiva Inform&aacute;tica'>InterAtiva Inform&aacute;tica</a> (12/1999 at&eacute; 12/2000)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Desenvolvimento de sistemas para a Internet/Intranet, administração e suporte à rede em  Salvador (BA), para clientes como :</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"Grupo Econ&ocirc;mico (Conepar e Econtrading)</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"<a target='_blank' href='http://www.sind.org.br' target='_blank' alt='Clique para ir ao site do Sindicato dos Qu&iacute;micos e Petroleiros'>Sindicato dos Qu&iacute;micos e Petroleiros</a></td></tr>");
	document.write("  <tr><td></td></tr>");
	document.write(jump);

	document.write("  <tr><td class=titleFont>IDIOMA</td></tr>");
	document.write("  <tr><td>"+ space + space +"Ingl&ecirc;s: Leitura e Escrita - Avan&ccedil;ado; Conversa&ccedil;&atilde;o- Intermedi&aacute;rio;</td></tr>");
	document.write("  <tr><td>"+ space + space +"Espanhol - B&aacute;sico</td></tr>");
	document.write("  <tr><td></td></tr>");
	document.write(jump);

	document.write("  <tr><td class=titleFont>FORMA&Ccedil;&Atilde;O ACAD&Ecirc;MICA</td></tr>");
	document.write("  <tr><td>"+ space +"2006-2008 - Mestrado em Inform&aacute;tica na <a target='_blank' href='http://www.dcc.ufam.edu.br/'>Universidade Federal do Amazonas</a> - em andamento)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Projeto em Intelig&ecirc;ncia Artificial, na &aacute;rea de Web Sem&acirc;ntica</td></tr>");
	document.write("  <tr><td>"+ space +"1999-2002 - Bacharel em Ci&ecirc;ncia da Computa&ccedil;&atilde;o na <a target='_blank' href='http://www.frb.br'>Faculdade Ruy Barbosa</a> (continua&ccedil;&atilde;o do curso da Universidade Cat&oacute;lica do Salvador - conclu&iacute;do)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Projeto Final em Engenharia de Software: \"Ampliando a Percepção em um Ambiente de Desenvolvimento Cooperativo de Software na WEB\"</td></tr>");
	document.write("  <tr><td>"+ space + space + space + space +"Tecnologias utilizadas: JSP, Servlets, Java, UML, MySQL, Tomcat e padr&atilde;o MVC (Model, View, Controller)</td></tr>");
	document.write("  <tr><td>"+ space + space +"Artigo publicado na Cientefico: <a target='_blank' href='http://www.cientefico.frb.br/ciente/2003.2/info/Eng%20Software/index_Software.htm'>\"Estendendo o suporte a persistência em um ambiente de desenvolvimento cooperativo de software na WEB\"</a></td></tr>");
	document.write("  <tr><td>"+ space +"1998 - Bacharelado em Informática na <a target='_blank' href='http://www.ucsal.br'>Universidade Católica do Salvador</a></td></tr>");

	document.write(jump);
	document.write("  <tr><td class=titleFont>CURSOS e PALESTRAS</td></tr>");
	document.write("  <tr><td>"+ space +"J2EE na Unitech Tecnologia de Informa&ccedil;&atilde;o, dezembro/2003</td></tr>");
	document.write("  <tr><td>"+ space +"ASP.Net (&ecirc;nfase em VB.NET) na Unitech Tecnologia de Informa&ccedil;&atilde;o, fevereiro/2003</td></tr>");
	document.write("  <tr><td>"+ space +"Lançamento do Kylix – Ferramenta de Desenvolvimento para Linux, 20/03/2001</td></tr>");
	document.write("  <tr><td>"+ space +"Linux – Seminário na Faculdade Ruy Barbosa, outubro de 2000</td></tr>");
	document.write("  <tr><td>"+ space +"Macromedia UltraDev – Seminário na Faculdade Ruy Barbosa, outubro de 2000</td></tr>");
	document.write("  <tr><td>"+ space +"E-Service em Mercado B2B: Impactos de uma nova realidade – Evento da 3M, 09/08/2000</td></tr>");
	document.write("  <tr><td>"+ space +"Memorização e Leitura Dinâmica – Flash Memorização e Leitura Dinâmica, out/1998</td></tr>");
	document.write("  <tr><td>"+ space +"Windows NT – Expansão Informática, novembro de 1999 a janeiro de 2000</td></tr>");

	document.write(jump);
	document.write("</table>");
}