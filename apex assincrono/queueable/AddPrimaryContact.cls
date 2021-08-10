public class AddPrimaryContact implements Queueable {
    private Contact contato;
    private String estado;
    
    public AddPrimaryContact(Contact contato, String estado){
        this.contato = contato;
        this.estado = estado;
    }
    
    public void execute(QueueableContext context) {
        List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) 
                                     FROM ACCOUNT WHERE BillingState = :this.estado LIMIT 200];
        
        List<Contact> contatosAtt = new List<Contact>();
        for (Account acc:ListAccount){
            Contact contatoClone = this.contato.clone(false,false,false,false);
            contatoClone.AccountId =  acc.id;
            contatosAtt.add(contatoClone);
        }
        
        if(contatosAtt.size() > 0){
            insert contatosAtt;
        }
    }
}