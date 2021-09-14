public class Controller {
    
    public class HandleInput {
        @InvocableVariable(required=true)
        public String entrada;
    }
    
    public class HandleOutput {
        @InvocableVariable(required=true)
        public String saida;
    }
    
    @InvocableMethod
    public static List<HandleOutput> metodo(List<HandleInput> inputParameters){
        String entrada = inputParameters.get(0).entrada;
        
        List<HandleOutPut> outPuts = new List<HandleOutput>();
        HandleOutput outPut = new HandleOutput();
        outPut.saida = entrada;
        outPuts.add(outPut);
        
        return outPuts;
    }
}