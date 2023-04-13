import java.net.URISyntaxException;
import java.nio.file.Paths;

/*
* Observe que para obter 100% de cobertura de código
* precisaríamos exercitar o bloco try/catch, e para
* que isso aconteça, teríamos que forçar de alguma
* forma o método toURI a lançar a exceção.
* 
* mas não há vantagem em fazer isso. É mais importante 
* testar o que aconteceria com a classe cliente, que invoca
* Example.resourceFolder, se o resourceFolder lançasse uma RuntimeException. 
* 
* Isso é muito mais fácil de fazer, pois temos mais controle 
* sobre o método resourceFolder do que o método do Java toURI()

* Portanto, não vale a pena cobrir este pedaço de código e 
* isso mostra porque apontar cegamente para 100% de cobertura 
* não faz sentido.
*/

public class Example {

  public static String resourceFolder(String path) {
    try {
      return Paths.get(ResourceUtils.class
          .getResource("/").toURI()).toString() + path;
    } catch (URISyntaxException e) {
      throw new RuntimeException(e);
    }
  }
}
