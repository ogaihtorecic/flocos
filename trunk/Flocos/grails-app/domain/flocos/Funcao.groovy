package flocos

class Funcao {

	String nomeFuncao
	String descricaoFuncao
	String parametroEntrada
	String parametroSaida

    static belongsTo = [dadosTecnicos:DadosTecnicos]
    
    String toString() {
    	nomeFuncao
    }
}
