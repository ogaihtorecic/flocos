package br.com.oquepensar.stringop;

public class RemoverAcentos {  
    static String acentuado = "çÇáéíóúýÁÉÍÓÚÝàèìòùÀÈÌÒÙãõñäëïöüÿÄËÏÖÜÃÕÑâêîôûÂÊÎÔÛ";  
    static String semAcento = "cCaeiouyAEIOUYaeiouAEIOUaonaeiouyAEIOUAONaeiouAEIOU";  
    static char[] tabela;  
    static {  
        tabela = new char[256];  
        for (int i = 0; i < tabela.length; ++i) {  
        tabela [i] = (char) i;  
        }  
        for (int i = 0; i < acentuado.length(); ++i) {  
            tabela [acentuado.charAt(i)] = semAcento.charAt(i);  
        }  
    }  
    public static String remover (final String s) {  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < s.length(); ++i) {  
            char ch = s.charAt (i);  
            if (ch < 256) {   
                sb.append (tabela [ch]);  
            } else {  
                sb.append (ch);  
            }  
        }  
        return sb.toString();  
    }  
    public static void main(String[] args) {  
        String s = "Gisele Bündchen da Conceição e Silva foi batizada assim em homenagem à sua conterrânea de Horizontina, RS.";  
        s = RemoverAcentos.remover (s);  
        System.out.println (s);  
    }  
}  
