public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accounts){
        
        List<Account> contasAtualizadas = new List<Account>();
        for(Id idDaConta : accounts){
            List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :idDaConta];    
            
            Account account = [SELECT Id FROM Account WHERE Id = :idDaConta];
            
            account.Number_Of_Contacts__c = contacts.size();
            
            contasAtualizadas.add(account);
        }
        
        update contasAtualizadas;
    }
}