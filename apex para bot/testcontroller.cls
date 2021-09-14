@isTest
public class TestController {
    
    @isTest
    public static void test(){
        Controller.HandleInput handleInput = new Controller.HandleInput();
        handleInput.entrada = '41294911000156';
        
        List<Controller.HandleInput> inputParameters = new List<Controller.HandleInput>();
        inputParameters.add(handleInput);
        
        List<Controller.HandleOutput> outputs = Controller.metodo(inputParameters);
        
        System.assertEquals('41294911000156', outputs.get(0).saida);
    }
}