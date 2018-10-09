/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.destinos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import orbis.DAO.conexao.conexaoDAO;
import orbis.model.pacotes.pacotes;

/**
 *
 * @author paulo.bezerra
 */
public class inclusaoPacote {

    public boolean inclusao(pacotes pacotes) {

        boolean success = false;

        conexaoDAO bancoconexao = new conexaoDAO();

        try {

            Connection conexao = bancoconexao.getConnection();

            String query = ("INSERT INTO produto (nome,descricao, preco_compra,"
                    + "preco_venda, quantidade,disponivel, dt_cadastro)"
                    + " VALUES (?,?,?,?,?,?,now())");

            PreparedStatement preparedStmt = conexao.prepareStatement(query);
            preparedStmt.setString(1, pacotes.getNome());
            preparedStmt.setString(2, pacotes.getDescricao());
            preparedStmt.setDouble(3, pacotes.getPreco_compra());
            preparedStmt.setDouble(4, pacotes.getPreco_venda());
            preparedStmt.setInt(5, pacotes.getQuantidade());
            preparedStmt.setBoolean(6, pacotes.isDisponivel());
            
            preparedStmt.execute();

            success = true;

            pacotes = null;

            conexao.close();

        } catch (Exception e) {

            System.out.println("Erro gravar produto " + e.getMessage());

        }
        return success;
    }

}
