@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @isTest
    private static void testLeadProcessor(){
        Test.startTest();
        
        setup();
        
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        
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

