@isTest
public class TestCollectionUtil {
    
    private static testMethod void testarSetsMapsComuns() {
        Account acc1 = new Account();
        acc1.Name='Teste1';
        insert acc1;
        
        Account acc2 = new Account();
        acc2.Name='Teste2';
        insert acc2;
        
        Account acc3 = new Account();
        acc3.Name='Teste3';
        insert acc3;
        
        List<Account> lstAcc = [SELECT Id, Name from Account];
        
        //INÍCIO DO TESTE
        Test.startTest(); 
        Map<Id, Account> mapAccId = new Map<Id, Account>();
        Map<String, Account> mapAccString = new Map<String, Account>();
        Set<Id> setIds = new Set<Id>();
        Set<String> setString = new Set<String>();
		List<Id> listId = new List<Id>();
	    
        CollectionUtil.carregarMap(mapAccId, 'Id', lstAcc);
        CollectionUtil.carregarMap(mapAccString,'Id',lstAcc);        
        
        CollectionUtil.carregarSet(setIds,'Id',lstAcc);        
        CollectionUtil.carregarSet(setString,'Id',lstAcc);        
        
        CollectionUtil.carregarList(listId, 'Id', lstAcc);
        
        Test.stopTest();
        
        System.AssertEquals(acc1, mapAccId.get(acc1.Id));
        System.AssertEquals(acc2, mapAccId.get(acc2.Id));
        System.AssertEquals(acc3, mapAccId.get(acc3.Id));
        
        System.AssertEquals(acc1, mapAccString.get(String.valueOf(acc1.Id)));
        System.AssertEquals(acc2, mapAccString.get(String.valueOf(acc2.Id)));
        System.AssertEquals(acc3, mapAccString.get(String.valueOf(acc3.Id)));
        
        System.AssertEquals(new List<Id>{acc1.Id,acc2.Id,acc3.Id}, listId);
        System.AssertEquals(new Set<String>{String.valueOf(acc1.Id),String.valueOf(acc2.Id),String.valueOf(acc3.Id)}, setString);
        System.AssertEquals(new Set<Id>{acc1.Id,acc2.Id,acc3.Id}, setIds);
    }
    
}