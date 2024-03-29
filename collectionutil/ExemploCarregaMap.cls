public class ExemploCarregaMap {
    public static void processa(List<Contact> contatos){
        
        Set<Id> setIdContas = new Set<Id>();
        for(Contact contato : contatos){ setIdContas.add(contato.Conta__c); }
        
        Map<Id, Account> mapAccount = new Map<Id, Account>();
        CollectionUtil.carregarMap(mapAccount, 'Id', [SELECT Id FROM Account WHERE Id in :setIdContas]);
        
        for(Contact contato : contatos){
            Account conta = mapAccount.get(contato.Conta__c);
            
            /* Invés de fazer um select dentro do loop, você faz um map */            
        }        
    }
}

//se quiser usar map<Id, List> use esse link como referencia: https://salesforce.stackexchange.com/questions/376261/how-to-assemble-a-map-that-has-a-list-inside/376262#376262
