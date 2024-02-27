package org.example;

import org.web3j.contracts.eip20.generated.ERC20;
import org.web3j.crypto.*;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.core.methods.response.Web3ClientVersion;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.*;
import org.web3j.tx.gas.DefaultGasProvider;

import java.io.IOException;
import java.math.BigInteger;

public class Main {

    public static void main(String[] args) throws Exception {
        Main m = new Main();
        m.go();
    }
    public void go() throws Exception {
        String privateKey = System.getenv("PRIVATE_KEY");
        String sepoliaNodeEndpoint = System.getenv("SEPOLIA_NODE_ENDPOINT");
        String enderecoContrato = "0x9ddCA6462A571e6CD85A21FcC79F77D3D574f64d";
        String enderecoUsuarioOrigem = "0x80520e7a8Af2bd6d05f30b95D715e109Ac1CC9F3";
        String enderecoUsuarioDestino = enderecoUsuarioOrigem;

        Web3j web3 = Web3j.build(new HttpService(sepoliaNodeEndpoint));

        TransactionManager transactionManager = new RawTransactionManager(web3, Credentials.create(privateKey));
        ERC20 contract = ERC20.load(enderecoContrato, web3, transactionManager, new DefaultGasProvider());

        String nome = contract.name().send();
        System.out.println("Nome do Token é: " + nome);

        BigInteger balance = contract.balanceOf(enderecoUsuarioOrigem).send();
        System.out.println("Saldo do cliente: " + balance);

        TransactionReceipt transactionReceipt = contract.transfer(enderecoUsuarioDestino, BigInteger.valueOf(100000)).send();
        System.out.println("Transacao de mint realizada com sucesso!");
        System.out.println("Detalhes: " + transactionReceipt);

        balance = contract.balanceOf(enderecoUsuarioOrigem).send();
        System.out.println("Saldo do cliente: " + balance);
    }
}