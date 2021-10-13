package br.com.infra.salesforce;

import com.sforce.soap.enterprise.Connector;
import com.sforce.soap.enterprise.EnterpriseConnection;
import com.sforce.ws.ConnectionException;
import com.sforce.ws.ConnectorConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class ConexaoSalesforceFactory {
    private CredencialSalesforce credencial;

    @Autowired
    public ConexaoSalesforceFactory(CredencialSalesforce credencial) {
        this.credencial = credencial;
    }

    @Bean
    public EnterpriseConnection cria() {
        try {
            ConnectorConfig config = new ConnectorConfig();
            config.setUsername(credencial.getUsuario());
            config.setPassword(credencial.getSenha());
            config.setAuthEndpoint("https://test.salesforce.com/services/Soap/c/47.0/codigo");
            config.setServiceEndpoint("https://test.salesforce.com/services/Soap/c/47.0/codigo");
            EnterpriseConnection enterpriseConnection = Connector.newConnection(config);
            return enterpriseConnection;

        } catch (ConnectionException e) {
            System.out.println("Erro: " + e.getMessage());
            throw new RuntimeException("Não coneseguiu obter conexao com o Salesforce ", e);
        }
    }
}
