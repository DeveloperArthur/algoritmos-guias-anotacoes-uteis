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
