/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author paulo.bezerra
 */
public class Conexao {

    private String url = "jdbc:mysql://localhost:3306/orbis";
    private String driver = "com.mysql.jdbc.Driver";
    private String userName = "orbis";
    private String password = "admin";
    private Connection conexao = null;

    /*
    CREATE USER 'orbis'@'localhost' IDENTIFIED BY 'admin';
    GRANT ALL PRIVILEGES ON * . * TO 'orbis'@'localhost';
     */
    public Connection getConnection() throws SQLException {

        try {
            Class.forName(driver);
            if (conexao == null) {

                conexao = DriverManager.getConnection(url, userName, password);
                System.out.println("conectou");
            }
        } catch (Exception e) {
            System.out.print("Erro na conexao: " + e.getMessage());
        }
        return conexao;
    }

}
