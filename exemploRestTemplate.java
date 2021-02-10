package br.com.catho.reembolso;

import org.json.JSONException;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;

public class Main {
    public static void main(String[] args) throws JSONException {
        String ENDPOINT = "https://deboraeisabellaeletronicame.com.br:77819/rest/";
        String parametrosDaRequisicao = "grant_type=password&password=M8fllOUpeL&username=Art1998";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        ResponseEntity<RetornoToken> respostaDaAutenticacao = new RestTemplate().exchange(ENDPOINT + "api/oauth2/v1/token?" + parametrosDaRequisicao, HttpMethod.POST, new HttpEntity<>(headers), RetornoToken.class);
        System.out.println("RESPOSTA PARA AUTENTICAR: " + respostaDaAutenticacao.getStatusCodeValue());

        String token = respostaDaAutenticacao.getBody().getAccess_token();

        headers.add("Authorization", "Bearer " + token);
        String body = "{\"min_position\": 3,\"has_more_items\": true,\"items_html\": \"Car\",\"new_latent_count\": 4,\"data\": {\"length\": 21,\"text\": \"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"},\"numericalArray\": [28,26,30,31,32],\"StringArray\": [\"Nitrogen\",\"Oxygen\",\"Nitrogen\",\"Oxygen\"],\"multipleTypesArray\": 5,\"objArray\": [{\"class\": \"middle\",\"age\": 7},{\"class\": \"upper\",\"age\": 9},{\"class\": \"middle\",\"age\": 2},{\"class\": \"middle\",\"age\": 5},{\"class\": \"lower\",\"age\": 3}]}";

        ResponseEntity<String> segundaResposta = new RestTemplate().exchange(ENDPOINT + "ACCOUNT/api/fat/v1", HttpMethod.POST, new HttpEntity<>(body, headers), String.class);
        System.out.println("RESPOSTA PARA INTEGRAR CLIENTE: " + segundaResposta.getStatusCodeValue());
    }

    private static class RetornoToken {
        String access_token;

        public RetornoToken() {
        }

        public String getAccess_token() {
            return access_token;
        }

        public void setAccess_token(String access_token) {
            this.access_token = access_token;
        }
    }
}
