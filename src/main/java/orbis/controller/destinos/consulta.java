/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.destinos;

import java.sql.Connection;
import java.sql.ResultSet;
import orbis.DAO.conexao.conexaoDAO;
import orbis.DAO.pacote.tbPacote;

/**
 *
 * @author paulo.bezerra
 */
public class consulta {
    
        private Connection conexao = null;

    
        public tbPacote pacotes(int idpacote) {
            
        String select = "";

        conexaoDAO bancoconexao = new conexaoDAO();
        
        tbPacote pacotes = new tbPacote();

        try {

            Class.forName("com.mysql.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            select = "select * from tbpacote where idpacote= " + idpacote;
            ResultSet resultado = st.executeQuery(select);
            while (resultado.next()) {

                pacotes.setDthevento(String.valueOf(resultado.getString("dthevento")));
                pacotes.setQtdMax(Integer.valueOf(resultado.getString("qtdmax")));
                pacotes.setValor(Double.valueOf(resultado.getString("valor")));
                pacotes.setLocalSaida(String.valueOf(resultado.getString("localsaida")));
                pacotes.setLocalDestino(String.valueOf(resultado.getString("localdestino")));
                pacotes.setRoteiro(String.valueOf(resultado.getString("roteiro")));

            }
            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return pacotes;
    }
}
