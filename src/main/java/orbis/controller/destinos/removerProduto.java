/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.destinos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import orbis.DAO.conexao.conexaoDAO;

/**
 *
 * @author paulo.bezerra
 */
public class removerProduto {

    public boolean remover(int id) {

        boolean success = false;

        conexaoDAO bancoconexao = new conexaoDAO();

        try {

            Connection conexao = bancoconexao.getConnection();

            String query = ("delete from tbpacote where idpacote =?;");

            PreparedStatement preparedStmt = conexao.prepareStatement(query);
            preparedStmt.setInt(1, id);
            
            System.out.println(preparedStmt);

            
            preparedStmt.execute();

            success = true;

            conexao.close();

        } catch (Exception e) {

            System.out.println("Erro deletar pacote " + e.getMessage());

        }
        return success;
    }

}
