@isTest
public class LeadProcessorTest {
    
    @isTest
    private static void testLeadProcessor(){
        Test.startTest();
        
        setup();
        
        LeadProcessor batch = new LeadProcessor();
        Id batchId = Database.executeBatch(batch);
        
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead]);
    }
    
    private static void setup(){
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.LastName = 'a';
            lead.Company = 'a';
            leads.add(lead);
        }
        insert leads;
    }
}