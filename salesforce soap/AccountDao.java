package br.infra.salesforce.account;

import com.sforce.soap.enterprise.Error;
import com.sforce.soap.enterprise.*;
import com.sforce.soap.enterprise.fault.UnexpectedErrorFault;
import com.sforce.soap.enterprise.sobject.Account;
import com.sforce.soap.enterprise.sobject.SObject;
import com.sforce.ws.ConnectionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Optional;

@Component
public class AccountDao implements AccountRepository {
    private EnterpriseConnection conexao;
    private ConversorConta conversor;

    @Autowired
    public AccountDao(EnterpriseConnection conexao) {
        this.conexao = conexao;
    }

    @Override
    public Optional<Conta> buscaPorId(String id) {
        try {
            String sql = "SELECT id, PersonEmail, FirstName, LastName FROM Account WHERE id = '" + id + "'";

            QueryResult resultado = conexao.query(sql);
            SObject[] contas = resultado.getRecords();
            Optional<Account> contaSalesforce = Optional.empty();
            for (SObject object : contas) {
                contaSalesforce = Optional.of((Account) object);
            }

            Optional<Conta> contaOptional = Optional.empty();
            if (contaSalesforce.isPresent())
                contaOptional = Optional.of(conversor.deAccountParaConta(contaSalesforce.get()));

            return contaOptional;

        } catch (UnexpectedErrorFault e) {
            throw new RuntimeException("Ocorreu um erro ao buscar dados da Conta com o ID: " + id, e);
        } catch (ConnectionException e) {
            throw new RuntimeException("Ocorreu um erro ao buscar dados da Conta com o ID: " + id, e);
        }
    }

    @Override
    public Conta salva(Conta conta) {
        try {
            Account contaSalesforce = conversor.deAccountParaConta(conta);
            SaveResult[] execucao = conexao.create(new Account[]{contaSalesforce});
            validaExcucaoDeMetodoDoSalesforce(execucao);
        } catch (ConnectionException | ErroSalesforceException e) {
            throw new RuntimeException("Ocorreu um erro ao criar hóspede", e);
        }
        return conta;
    }

    @Override
    public Conta atualiza(Conta conta) {
        try {
            Account contaSalesforce = conversor.deAccountParaConta(conta);
            SaveResult[] execucao = conexao.update(new Account[]{contaSalesforce});
            validaExcucaoDeMetodoDoSalesforce(execucao);
        } catch (ConnectionException | ErroSalesforceException e) {
            throw new RuntimeException("Ocorreu um erro ao atualizar conta", e);
        }
        return conta;
    }

    @Override
    public boolean remove(Conta conta) {
        try {
            DeleteResult[] execucao = conexao.delete(new String[]{conta.getId()});
            validaExcucaoDeMetodoDoSalesforce(execucao);
        } catch (ConnectionException | ErroSalesforceException e) {
            throw new RuntimeException("Ocorreu um erro ao deletar conta", e);
        }
        return true;
    }

    private void validaExcucaoDeMetodoDoSalesforce(SaveResult[] resultado) throws ErroSalesforceException {
        for (SaveResult i : resultado) {
            System.out.println("RESULTADO " + i);
            if (!i.getSuccess()) {
                String mensagemDeErro = "";
                for (Error erro : i.getErrors()) {
                    mensagemDeErro = erro.getMessage();
                }
                throw new ErroSalesforceException("Erro ao criar/atualizar - " + mensagemDeErro);
            }
        }
    }

    private void validaExcucaoDeMetodoDoSalesforce(DeleteResult[] resultado) throws ErroSalesforceException {
        for (DeleteResult i : resultado) {
            System.out.println("RESULTADO " + i);
            if (!i.getSuccess()) {
                String mensagemDeErro = "";
                for (Error erro : i.getErrors()) {
                    mensagemDeErro = erro.getMessage();
                }
                throw new ErroSalesforceException("Erro ao remover - " + mensagemDeErro);
            }
        }
    }
}