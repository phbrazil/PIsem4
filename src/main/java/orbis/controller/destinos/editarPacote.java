/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.destinos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import orbis.DAO.conexao.conexaoDAO;
import orbis.DAO.pacote.tbPacote;

/**
 *
 * @author paulo.bezerra
 */
public class editarPacote {

    public boolean editar(tbPacote pacotes) {
        
        boolean success = false;

        conexaoDAO bancoconexao = new conexaoDAO();

        try {

            Connection conexao = bancoconexao.getConnection();

            String query = ("update tbpacote set dthevento=?, qtdmax =?,"
                    + "valor =?, localsaida=?, localdestino=?, roteiro=? where"
                    + " idpacote= ?;");

            PreparedStatement preparedStmt = conexao.prepareStatement(query);
            preparedStmt.setString(1, pacotes.getDthevento());
            preparedStmt.setInt(2, pacotes.getQtdMax());
            preparedStmt.setDouble(3, pacotes.getValor());
            preparedStmt.setString(4, pacotes.getLocalSaida());
            preparedStmt.setString(5, pacotes.getLocalDestino());
            preparedStmt.setString(6, pacotes.getRoteiro());
            preparedStmt.setLong(7, pacotes.getIdPacote());
            
            preparedStmt.execute();

            success = true;

            pacotes = null;

            conexao.close();

        } catch (Exception e) {

            System.out.println("Erro atualizar produto " + e.getMessage());

        }
        return success;
    }

}
