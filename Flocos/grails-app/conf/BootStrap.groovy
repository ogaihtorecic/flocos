import br.edu.ufam.sw.startup.StartupManager;

class BootStrap {

     def init = { servletContext ->
     	def r = new flocos.Responsavel(nome:"Admin")
     	r.save()
        
        def input = servletContext.getResourceAsStream("listLanguages.csv")
        input = input.text            
        def lista = input.split("\n")

        lista.each
        {
            def idioma = new flocos.Idioma(idioma: it)
            idioma.save()
        }
        
     	new flocos.Usuario(login:"admin", senha:"admin", email:"cicero.thiago@gmail.com", responsavel:r).save()
		new flocos.Usuario(login:"cicero", senha:"cicero", email:"cicero.thiago@gmail.com", responsavel:r).save()
		
		new flocos.MeioAcesso(meioAcesso:"Desktop").save()
		new flocos.MeioAcesso(meioAcesso:"TV").save()
		new flocos.MeioAcesso(meioAcesso:"TV Digital Interativa").save()
		new flocos.MeioAcesso(meioAcesso:"Wap").save()
		new flocos.MeioAcesso(meioAcesso:"Web").save()
		
		new flocos.TipoMidia(tipoMidia:"Texto").save()
		new flocos.TipoMidia(tipoMidia:"Áudio").save()
		new flocos.TipoMidia(tipoMidia:"Vídeo").save()
		new flocos.TipoMidia(tipoMidia:"Imagem").save()
		new flocos.TipoMidia(tipoMidia:"Software").save()
		
		new flocos.Area(area:"Agrária").save()
		new flocos.Area(area:"Biológicas").save()
		new flocos.Area(area:"Saúde").save()
		new flocos.Area(area:"Exatas e da Terra").save()
		new flocos.Area(area:"Humanas").save()
		new flocos.Area(area:"Sociais Aplicadas").save()
		new flocos.Area(area:"Engenharia").save()
		new flocos.Area(area:"Lingüística").save()
		new flocos.Area(area:"Letras e Artes").save()
		new flocos.Area(area:"Outras").save()
		new flocos.Area(area:"Todas").save()
		
		new flocos.NivelEscolaridade(nivelEscolaridade:"Educação Infantil").save()
		new flocos.NivelEscolaridade(nivelEscolaridade:"Ensino Fundamental").save()
		new flocos.NivelEscolaridade(nivelEscolaridade:"Ensino Médio").save()
		new flocos.NivelEscolaridade(nivelEscolaridade:"Ensino Superior").save()
		new flocos.NivelEscolaridade(nivelEscolaridade:"Outros").save()
		new flocos.NivelEscolaridade(nivelEscolaridade:"Todos").save()
		
		new flocos.TipoPnee(tipoPnee:"Visual").save()
		new flocos.TipoPnee(tipoPnee:"Auditiva").save()
		new flocos.TipoPnee(tipoPnee:"Física").save()
		new flocos.TipoPnee(tipoPnee:"Fala").save()
		new flocos.TipoPnee(tipoPnee:"Cognitiva").save()
		new flocos.TipoPnee(tipoPnee:"Neurológica").save()
		new flocos.TipoPnee(tipoPnee:"Todas").save()
		
		new flocos.InaptidaoVisual(inaptidaoVisual:"Cegueira").save()
		new flocos.InaptidaoVisual(inaptidaoVisual:"Sub-Normal").save()
		new flocos.InaptidaoVisual(inaptidaoVisual:"Daltônico").save()
		
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Dislexia").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Dificuldade de Atenção").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Retardado Mental").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Síndrome de Down").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Deficiência na Memória").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Inaptidões de Saúde Mentais").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Epilético").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Inaptidões Múltiplas").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Relacionados ao Envelhecimento").save()
		new flocos.InaptidaoNeuro(inaptidaoNeuro:"Outras").save()
		
		StartupManager.getInstance().load()
		
     }
     def destroy = {
     }
} 