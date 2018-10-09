/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.destinos;

import java.sql.Connection;
import java.sql.ResultSet;
import orbis.DAO.conexao.conexaoDAO;
import orbis.model.pacotes.pacotes;

/**
 *
 * @author paulo.bezerra
 */
public class consulta {
    
        private Connection conexao = null;

    
        public pacotes pacotes(int idpacote) {
            
        String select = "";

        conexaoDAO bancoconexao = new conexaoDAO();
        
        pacotes produtos = new pacotes(0, null, null, 0, 0, 0, false, null);

        try {

            Class.forName("com.mysql.jdbc.Driver");

            conexao = bancoconexao.getConnection();

            java.sql.Statement st = conexao.createStatement();

            select = "select * from produto where id = " + idpacote;
            ResultSet resultado = st.executeQuery(select);
            while (resultado.next()) {

                produtos.setId(Integer.valueOf(resultado.getString("id")));
                produtos.setNome(String.valueOf(resultado.getString("nome")));
                produtos.setDescricao(String.valueOf(resultado.getString("descricao")));
                produtos.setPreco_compra(Double.valueOf(resultado.getString("preco_compra")));
                produtos.setPreco_venda(Double.valueOf(resultado.getString("preco_venda")));
                produtos.setQuantidade(Integer.valueOf(resultado.getString("quantidade")));
                produtos.setDisponivel(Boolean.valueOf(resultado.getString("disponivel")));

            }
            conexao.close();

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        }
        return produtos;
    }
}
