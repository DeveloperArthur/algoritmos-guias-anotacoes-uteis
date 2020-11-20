/* Imagine um painel veteririo
 * RG DO DONO              NOME DO PET                VALOR
 * 12345                   Sofia                      20
 * 54321                   Sami                       40
 * 12345                   Blade                      50
 * 12345                   Sofia                      60
 *
 * Observe que há uma duplicata, o dono do veterinário disse
 * que ele quer que, se RG e nome do pet forem iguais
 * estes devem ser unificados, retirando 1 e somando os valores
 * o algoritmo abaixo irá fazer isto:
 * */

package br.com.clinicaveterinaria;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Cliente> clientes = Arrays.asList(
                new Cliente("12345", "Sofia", 20.0),
                new Cliente("54321", "Sami", 40.0),
                new Cliente("12345", "Blade", 20.0),
                new Cliente("12345", "Sofia", 60.0)
        );

        List<Cliente> listaUnificada = getListaUnificada(clientes);
        listaUnificada.forEach(cliente -> {
            System.out.println(cliente.getRg() + " " + cliente.getNomeDoPet() + " " + cliente.getValorParaPagar());
        });
    }

    public static List<Cliente> getListaUnificada(List<Cliente> clientes) {
        Map<String, Cliente> listaUnificada = new HashMap<>();
        clientes.forEach(cliente -> {
            String chave = cliente.getRg().toLowerCase() + cliente.getNomeDoPet().toLowerCase();
            if (listaUnificada.containsKey(chave)) {
                Cliente valorExistente = listaUnificada.get(chave);
                Double valorNovo = valorExistente.getValorParaPagar() + cliente.getValorParaPagar();
                valorExistente.setValorParaPagar(valorNovo);
                listaUnificada.replace(chave, valorExistente);
            } else
                listaUnificada.put(chave, cliente);
        });
        return new ArrayList<>(listaUnificada.values());
    }
}
