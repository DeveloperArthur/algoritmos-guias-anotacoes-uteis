public class CollectionUtil {

	public static void carregarMap(Map<Id, SObject> mapSObj, String campoChave, List<SObject> lstSObj) {
		Id chave = null;
		
		for(SObject sObj : lstSObj) {
			chave = (Id) sObj.get(campoChave);

			mapSObj.put(chave, sObj);
		}
	}

    public static void carregarMap(Map<String, SObject> mapSObj, String campoChave, List<SObject> lstSObj) {
        String chave = null;
        
        for(SObject sObj : lstSObj) {
            chave = (String) sObj.get(campoChave);

            mapSObj.put(chave, sObj);
        }
    }

    public static void carregarMap(Map<Decimal, SObject> mapSObj, String campoChave, List<SObject> lstSObj) {
        Decimal chave = null;
        
        for(SObject sObj : lstSObj) {
            chave = (Decimal) sObj.get(campoChave);

            mapSObj.put(chave, sObj);
        }
    }

	public static void carregarMap(Map<Id, List<SObject>> mapSObj, String campoChave, List<SObject> lstSObj) {
		Id chave = null;
		List<SObject> lista = new List<SObject>();
		
		for(SObject sObj : lstSObj) {
			chave = (Id) sObj.get(campoChave);

			if (mapSObj.containsKey(chave)) {
				lista = mapSObj.get(chave);
			}
			else {
				lista = new  List<SObject>();
			}

			//System.Debug('>>>> lista = ((' + lista + '))');

			lista.add(sObj);
			mapSObj.put(chave, lista);
		}
	}

    public static void carregarMap(Map<String, List<SObject>> mapSObj, String campoChave, List<SObject> lstSObj) {
		String chave = null;
		List<SObject> lista = new List<SObject>();
		
		for(SObject sObj : lstSObj) {
			chave = (String) sObj.get(campoChave);

			if (mapSObj.containsKey(chave)) {
				lista = mapSObj.get(chave);
			}
			else {
				lista = new  List<SObject>();
			}


			lista.add(sObj);
			mapSObj.put(chave, lista);
		}
	}

    public static void carregarSet(Set<Id> setIds, String campoChave, List<SObject> lstSObj) {
        Id chave = null;
        
        for(SObject sObj : lstSObj) {
            chave = (Id) sObj.get(campoChave);

            setIds.add(chave);
        }
    }

    public static void carregarSet(Set<String> setString, String campoChave, List<SObject> lstSObj) {
        String chave = null;
        
        for(SObject sObj : lstSObj) {
            chave = (String) sObj.get(campoChave);

            setString.add(chave);
        }
    }

    public static void carregarList(List<Id> listIds, String campoChave, List<SObject> lstSObj) {
        Id chave = null;
        
        for(SObject sObj : lstSObj) {
            chave = (Id) sObj.get(campoChave);

            listIds.add(chave);
        }
    }

	public static List<List<String>> dividirPorSubListas(List<String> lstOriginal, Integer qtdeMaxPorSubLista) {     
        //essa lista vai armazenar a coleção recebida em sublistas (o conteúdo original dividido em partes)
        List<List<String>> subListas = new List<List<String>>();
    
        Integer qtdeSubListas = 0;
        Integer inicio = 0;
        Integer fim = 0;

        if(lstOriginal.size() <= qtdeMaxPorSubLista)
        {
            subListas.add(lstOriginal);
        }
        else
        {
            //determina a quantidade de sublistas que serão criadas de acordo com o tamanho da lista recebida
            //e a quantidade máxima de elementos por sublista*/
            qtdeSubListas = dividir(lstOriginal.size(), qtdeMaxPorSubLista);

            for(Integer i = 1; i <= qtdeSubListas; i++)
            {
                //determina o inicio e o fim da sublista
                inicio = fim;
                fim = i * qtdeMaxPorSubLista;

                //se o fim ultrapassar o tamanho da lista, o fim receberá o tamanho dela
                if(fim > lstOriginal.size())
                {
                    fim = lstOriginal.size();
                }

                subListas.add(fragmentarLista(lstOriginal, inicio, fim));
            }
        }

        return subListas;
    }

    public static Integer dividir(Integer dividendo, Integer divisor) {
        Integer resultado = (Math.mod(dividendo, divisor) == 0 ? (dividendo / divisor) : (dividendo / divisor) + 1);
        
        return resultado;
    }

    public static List<String> fragmentarLista(List<String> lstOriginal, Integer inicio, Integer fim)
    {
        List<String> lstFragmentada = new List<String>();
        
        for(Integer i = inicio; i < fim; i++)
        {
            lstFragmentada.add(lstOriginal.get(i));
        }
            
        return lstFragmentada;
    }
}