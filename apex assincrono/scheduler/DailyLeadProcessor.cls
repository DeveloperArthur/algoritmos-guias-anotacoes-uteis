global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead LIMIT 200];
        
        List<Lead> leadsParaAtualizar = new List<Lead>();
        for(Lead lead : leads){
            if(lead.LeadSource == null){ 
                lead.LeadSource = 'Dreamforce';
                leadsParaAtualizar.add(lead);
            }
        }
        
        update leadsParaAtualizar;
    }
}