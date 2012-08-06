package br.com.oquepensar.stringop;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashMap;

public class Tokenizer 
{
	private static HashMap<String, Integer> stopWords = null;
	private String nomeArqStopWords;
	
	public Tokenizer(String arq)
	{
		nomeArqStopWords = arq;
		if (stopWords == null)
		{
			stopWords = new HashMap<String, Integer>();
			montaStopWords();
		}
	}
	
	public void montaStopWords()
	{
		
		try 
        {   
			Reader reader = new InputStreamReader(new FileInputStream(nomeArqStopWords), "ISO-8859-1");
            BufferedReader in = new BufferedReader(reader);	            
            String line;
            
            while (in.ready()) 
            {            	
                line = in.readLine();
                line = line.replaceAll("\\|.*", "").trim().toLowerCase();
                line = RemoverAcentos.remover(line);
                
                if (!line.isEmpty())
                {
                	stopWords.put(line, 1);
                }
            }
            
            in.close();
            
        } catch (IOException e) 
        {
        	System.out.println(e);
        }
	}
	
	public String keywords(String s)
	{
		String resul = RemoverAcentos.remover(s).replaceAll("[^\\w\\s]", " ").replaceAll("\\s{2,}", " ").toLowerCase();
		String words[] = resul.split("\\s");
		resul = "";
		
		for (String w : words)
		{
			if (!stopWords.containsKey(w))
			{
				resul += w + " ";
			}
		}
		
		return resul.trim();
	}
}
