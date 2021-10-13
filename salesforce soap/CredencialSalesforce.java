package br.com.infra.salesforce;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "salesforce")
public class CredencialSalesforce {
    private String usuario;
    private String senha;
    private String chave;


    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha + chave;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setChave(String chave) {
        this.chave = chave;
    }
}