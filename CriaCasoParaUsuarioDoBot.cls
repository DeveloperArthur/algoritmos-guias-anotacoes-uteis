public class CriaCasoParaUsuarioDoBot {
    public class HandleInput {
        @InvocableVariable(required=true)
        //variavel routableId do Bot
        public String idDaSessao;
    }
    
    public class HandleOutput {
        @InvocableVariable(required=true)
        public String numeroDoCaso;
    }
    
    @InvocableMethod
    public static List<HandleOutput> buscaPedidos(List<HandleInput> inputParameters){
        String idDaSessao = inputParameters.get(0).idDaSessao;
        
        Case caso = criaCasoPor(idDaSessao);
        String numeroDoCaso = buscaCasoPor(caso.Id);
        
        List<HandleOutPut> outPuts = new List<HandleOutput>();
        HandleOutput outPut = new HandleOutput();
        outPut.numeroDoCaso = numeroDoCaso;
        outPuts.add(outPut);
        
        return outPuts;
    }
    
    private static Case criaCasoPor(String idDaSessao){
        Case caso = new Case();
        caso.Status = 'New';
        
        List<MessagingSession> messagingSessions = [SELECT Name FROM MessagingSession WHERE Id = :idDaSessao];
        List<LiveChatTranscript> liveChatTranscript = [SELECT Name FROM LiveChatTranscript WHERE Id = :idDaSessao];
        
        if(messagingSessions.size() > 0){
            caso.Origin = 'Whatsapp';
            caso.Subject = messagingSessions.get(0).Name +' - Whatsapp';
            messagingSessions.get(0).CaseId = caso.Id;
            update messagingSessions.get(0);
        }else if(liveChatTranscript.size() > 0){
            caso.Origin = 'Chat';
            caso.Subject = liveChatTranscript.get(0).Name +' - Chat';
            liveChatTranscript.get(0).CaseId = caso.Id;
            update liveChatTranscript.get(0);
        }
        insert caso;
        return caso;
    }
    
    private static String buscaCasoPor(Id idDoCaso){
        return [SELECT CaseNumber FROM Case WHERE Id = :idDoCaso].CaseNumber;
    }
}
