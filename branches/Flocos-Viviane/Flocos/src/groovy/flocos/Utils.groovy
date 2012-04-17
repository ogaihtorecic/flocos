package flocos

import java.io.File;
import java.io.FileOutputStream;
import java.util.Set;

import br.edu.ufam.sw.Link;
import br.edu.ufam.sw.LogManager;
import br.edu.ufam.sw.model.owl.AnnotationFile;
import br.edu.ufam.sw.model.owl.OntologyManager;
import br.edu.ufam.sw.startup.ComponentManager;

class Utils {
	
	static void copy(def source, def dest) {
		InputStream is = new FileInputStream(source);
		OutputStream os = new FileOutputStream(dest);
		
		byte[] buf = new byte[1024];
		int len;
		while ((len = is.read(buf)) > 0) {
			os.write(buf, 0, len);
		}
		is.close();
		os.close();
	}
	
	static boolean gerarOntologia(def model, def appPath, def serverName) {
			String objEduHtml = "<html><body>" + model.objetivoEducacional + "</body></html>"
			String objEduFileName = "obj_edu_${System.currentTimeMillis()}.html"
			String filePath =  "${appPath}/uploads/${objEduFileName}"
						
			FileWriter fstream = new FileWriter(filePath);
			BufferedWriter out = new BufferedWriter(fstream);
			out.write(objEduHtml);
			out.close();
			
			String pWebResource = "http://${serverName}:8080/Flocos/uploads/${objEduFileName}"
			String pCED = "HTMLDataExtractor"
			String pCMS = "SemanticMatcherBasedOnDirectoryService"
			
			def dominios = model instanceof DadosEducacionais ? model.dominiosPropostos : model.dominiosUsados 
			DadosDominios dadosDominios = dominios[0]
			
			File webResource = new File(filePath)
			
			File ontology = null
			File ontology2 = null
			
			if(dadosDominios.nomeArquivo && !"".equals(dadosDominios.nomeArquivo)) {
				String ontologyFile = "${appPath}/uploads/${dadosDominios.nomeArquivo}"
				ontology = new File(ontologyFile)
			}
			
			if(dominios.size() > 1) 
			{
				DadosDominios dadosDominios2 = dominios[1]
				if(dadosDominios2.nomeArquivo && !"".equals(dadosDominios2.nomeArquivo)) {
					String ontologyFile2 = "${appPath}/uploads/${dadosDominios2.nomeArquivo}"
					ontology2 = new File(ontologyFile2)
				}
			}
			
			// Um dos dois nao sera nulo por conta da verificacao no chamador (DadosEducacionaisController.save e RelatoUsoController.save)
			// A primeira ontologia nao pode ser nula (Restricao do SemanticMatcherBasedOnDirectoryService)
			if(ontology == null) {
				ontology = ontology2
				ontology2 = null
			}
			
			String executionID = LogManager.getInstance().createLog(pWebResource);
			Set<Link> links = ComponentManager.getInstance().runCED(pCED, executionID, webResource);
			
			Set<String> conceptsIDs = null
			try {
				conceptsIDs = ComponentManager.getInstance().runCMS(pCMS, executionID, links, ontology, ontology2);
			} catch(java.net.UnknownHostException e) {
				new File(filePath).delete()
				return false;
			}
			
			AnnotationFile annotationFile = OntologyManager.getInstance().createAnnotationFile(executionID, webResource, ontology, ontology2, conceptsIDs);
			
			def destFile = "${appPath}/uploads/${annotationFile.fileName}"
			
			copy(annotationFile.fullFileName, destFile)
			
			def anotacao = new flocos.AnotacaoSemantica(localAnotacao:"http://${serverName}:8080/Flocos/uploads/${annotationFile.fileName}")
			if(model instanceof DadosEducacionais) {
				anotacao.dadosEducacionais = model
			} else if(model instanceof RelatoUso) {
				anotacao.relatoUso = model
			}
			if(model.anotacoesSemanticas == null) {
				model.anotacoesSemanticas = [anotacao]
			} else {
				model.anotacoesSemanticas.add(anotacao)
			}
			
			return (model.save(flush: true) && anotacao.save(flush: true));
	}
}
