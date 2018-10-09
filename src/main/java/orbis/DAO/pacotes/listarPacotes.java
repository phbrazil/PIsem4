/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacotes;

import java.sql.Connection;
import java.sql.ResultSet;
import orbis.DAO.conexao.conexaoDAO;

/**
 *
 * @author paulo.bezerra
 */
public class listarPacotes {

    private Connection conexao = null;

    public ResultSet listar() {

        String selectgeral = "";

        conexaoDAO bancoconexao = new conexaoDAO();

        try {

            Class.forName("com.mysql.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            selectgeral = "select * from tbpacotes";
            ResultSet resultgeral = st.executeQuery(selectgeral);
            if (resultgeral != null) {
                return resultgeral;
            }

            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return null;
    }

}
