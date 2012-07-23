package flocos

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import br.com.oquepensar.stringop.*;
import org.apache.lucene.analysis.LimitTokenCountAnalyzer;
import org.apache.lucene.analysis.WhitespaceAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.*;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

class ModeloVetorialService 
{
    private FSDirectory dir = null;
    private IndexWriterConfig idw;
    private IndexWriter writer;
    private IndexReader reader;
    private IndexSearcher searcher;
    private QueryParser parser;

    static transactional = true

    def openDir(String dirName) 
    {
        if (dir == null)
        {
            try 
            {	
                dir = FSDirectory.open( new File(dirName) );	                
            } catch (Exception e) 
            {
                System.out.println(" caught a " + e.getClass() + "\n with message: " + e.getMessage());
            }
        }
    }
    
    def beginWriter()
    {
        openDir("indices");
        
        try 
        {				
            idw = new IndexWriterConfig(Version.LUCENE_35, new LimitTokenCountAnalyzer(new WhitespaceAnalyzer(Version.LUCENE_35), Integer.MAX_VALUE) );

            writer = new IndexWriter(dir, idw);
        } catch (Exception e) 
        {
            System.out.println(" caught a " + e.getClass() + "\n with message: " + e.getMessage());
        }
    }
    
    def index(Integer moafMcId, String path)
    {
        beginWriter();
        
        def moafmc = MoafMc.get(moafMcId)
        String keywords = moafmc.dadosGerais.initialConcept + "\n" + moafmc.dadosGerais.title;
        
        moafmc.dadosEducacionais.purpose.each
        {area ->
            keywords += "\n" + area.area;
        }
        
        Tokenizer tk = new Tokenizer(path);
        keywords = tk.keywords(keywords);
        
        Document doc = new Document();
        doc.add( new Field("content", keywords.toLowerCase(), Field.Store.NO, Field.Index.ANALYZED) );
        doc.add( new Field("id", String.valueOf(moafmc.id), Field.Store.YES, Field.Index.NOT_ANALYZED) );

        try 
        {
            writer.addDocument(doc);
        } catch (Exception e) 
        {				
            e.printStackTrace();
        }
        
        closeWriter();
    }
	
    def closeWriter()
    {
        try 
        {
            writer.forceMerge(1);
            writer.close();
        } catch (CorruptIndexException e) 
        {
            e.printStackTrace();
        } catch (IOException e) 
        {
            e.printStackTrace();
        }
    }
	
    def beginReader()
    {
        openDir("indices");
        
        try
        {			
            reader = IndexReader.open(dir);
            searcher = new IndexSearcher(reader);

            parser = new QueryParser(Version.LUCENE_35, "content", new LimitTokenCountAnalyzer(new WhitespaceAnalyzer(Version.LUCENE_35), Integer.MAX_VALUE));
        }catch(Exception ex)
        {
            System.out.println( ex.toString() );
        }
    }
    
    def getTop(String query, Integer offset) 
    {
        beginReader();                
        
        try
        {	
            Query q = parser.parse(RemoverAcentos.remover(query).toLowerCase());
            TopDocs rs = searcher.search(q, null, Integer.MAX_VALUE);
            int count = Math.min(rs.totalHits - offset, 10);
            
            def results = []

            for (int i = 0; i < count; i++)
            {
                Document doc = searcher.doc(rs.scoreDocs[i].doc);	
                results << doc.get("id");
            }

            closeReader();
            
            return [results, rs.totalHits];
        }catch(Exception ex)
        {
            System.out.println( ex.toString() );
        }

        closeReader();
        return [[], 0];
    }
        
    def closeReader()
    {
        try 
        {
            searcher.close();
            reader.close();
        } catch (Exception ex) 
        {
            System.out.println( ex.toString() );
        }		
    }
    
    def updateDocument(def moafMcId, String path)
    {
        beginWriter();
        
        def moafmc = MoafMc.get(moafMcId);
        String keywords = moafmc.dadosGerais.initialConcept + "\n" + moafmc.dadosGerais.title;
        
        moafmc.dadosEducacionais.purpose.each
        {area ->
            keywords += "\n" + area;
        }
        
        Tokenizer tk = new Tokenizer(path);
        keywords = tk.keywords(keywords);
        
        Document doc = new Document();
        doc.add( new Field("content", keywords, Field.Store.NO, Field.Index.ANALYZED) );
        doc.add( new Field("id", String.valueOf(moafmc.id), Field.Store.YES, Field.Index.NOT_ANALYZED) );
        
        writer.updateDocument(new Term("id", String.valueOf(moafMcId)), doc);
        
        closeWriter();
    }
    
    def deleteDocument(Integer moafMcId)
    {
        beginWriter();
        
        writer.deleteDocuments(new Term("id", String.valueOf(moafMcId)));
        
        closeWriter();
    }
    
}
