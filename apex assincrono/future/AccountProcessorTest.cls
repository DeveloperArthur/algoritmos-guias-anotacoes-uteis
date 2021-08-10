@isTest
public class AccountProcessorTest {

    @isTest
	public static void test(){
        Test.startTest();
        Account account = new Account(Name = 'a');
        insert account;
        
        List<Id> contas = new List<Id>();
		contas.add(account.Id);
        
        AccountProcessor.countContacts(contas);
        Test.stopTest();
    }
}