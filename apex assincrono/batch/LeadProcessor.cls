public class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Lead');
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead lead : scope){
            lead.LeadSource = 'Dreamforce';
        }
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Concluido!');
    }
}