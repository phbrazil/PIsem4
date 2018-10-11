/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacote;

import java.sql.Connection;
import java.sql.ResultSet;
import orbis.DAO.conexao.Conexao;

/**
 *
 * @author paulo.bezerra
 */
public class destinosAutoCompleteDAO {

    private Connection conexao = null;

    public String AutoComplete() {
        
        System.out.println("entrei na DAO");

        String selectgeral = "";
        String projetos = "";

        Conexao bancoconexao = new Conexao();

        try {

            Class.forName("com.mysql.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            selectgeral = "select localdestino from tbpacote";
            ResultSet resultgeral = st.executeQuery(selectgeral);
            while (resultgeral.next()) {

                projetos = projetos + "," + resultgeral.getString("localdestino");

            }

            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return projetos;
    }

}
