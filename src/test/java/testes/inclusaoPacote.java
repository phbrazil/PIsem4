/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import orbis.DAO.conexao.conexaoDAO;

/**
 *
 * @author paulo.bezerra
 */
public class inclusaoPacote {

    public void inclusao() {

        conexaoDAO bancoconexao = new conexaoDAO();

        double valor = Math.random()*100;
        int qtd = (int) (Math.random() * 100);
        try {

            Connection conexao = bancoconexao.getConnection();

            String query = ("INSERT INTO tbpacote (dthevento,qtdmax,"
                    + "valor,localsaida,localdestino,roteiro)"
                    + " VALUES (now(),"+qtd+","+valor+",'Sao Paulo','Bahia','Varios roles')");

            PreparedStatement preparedStmt = conexao.prepareStatement(query);

            preparedStmt.execute();

            conexao.close();

        } catch (Exception e) {

            System.out.println("Erro inserir pacote " + e.getMessage());

        }
    }

}
