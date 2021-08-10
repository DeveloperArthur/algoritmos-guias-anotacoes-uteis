public class EmailSalesforceClient implements EnviadorDeEmail {
    private EmailRepository emailRepository = RepositoryFactory.getEmailRepository();
    
    public Boolean envia(String codigo, String email){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] { email };
		message.optOutPolicy = 'FILTER';
      message.subject = 'TITULO';
        message.setHtmlBody(getModeloEmail(codigo));
        
        Id idDoEmailRemetende = emailRepository.getEmailRemetente();
        if(idDoEmailRemetende != null) message.setOrgWideEmailAddressId(idDoEmailRemetende);
        
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
            
		Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) return true;
        else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
            return false;
        }
    }
    
    private String getModeloEmail(String codigo){
        return '<html>'+
            		'<body>'+
            			'<h1><i>Seu código é: '+codigo+'<i></h1>'+
            			'<p><i>Este código ficará ativo por 1 hora. Se ele expirar, você pode<br>'+
            			'solicitar um novo código pelo nosso canal de atendimento do WhatsApp.<br><br>'+
            			'Um abraço, Time XZYY<i></p>'+
            		'<body>'+
            	'</html>';
    }
}
