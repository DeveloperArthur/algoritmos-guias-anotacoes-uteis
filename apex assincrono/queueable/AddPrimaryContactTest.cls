@isTest
public class AddPrimaryContactTest {
    
    @isTest
    private static void test(){
        Test.startTest();
        
        Contact contato = setup();
        
        AddPrimaryContact queue = new AddPrimaryContact(contato, 'NY');
        AddPrimaryContact queue2 = new AddPrimaryContact(contato, 'CA');
        System.enqueueJob(queue);
        System.enqueueJob(queue2);
        
        Test.stopTest();
        
        System.assertEquals(50, [select count() FROM ACCOUNT WHERE BillingState = 'NY']);
        System.assertEquals(50, [select count() FROM ACCOUNT WHERE BillingState = 'CA']);
    }
    
    private static Contact setup(){
        List<Account> contas = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account conta = new Account();
            conta.Name = 'aaa';
            conta.BillingState = 'NY';
            contas.add(conta);
        }
        for (Integer i = 0; i < 50; i++) {
            Account conta = new Account();
            conta.Name = 'aaaA';
            conta.BillingState = 'CA';
            contas.add(conta);
        }
        insert contas;
        
        Contact contato = new Contact();
        contato.LastName = 'aa';
        insert contato;
        return contato;
    }
}