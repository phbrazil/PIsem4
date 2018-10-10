/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacote;

import java.sql.Connection;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
public class listarPacotes {

    private Connection conexao = null;

    public List<tbPacote> listar() {

        //popula o model com os dados
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        //inicia a transacao com o banco
        Transaction tx = session.beginTransaction();

        List pacotes = session.createQuery("FROM tbPacote").list();

        //comita as informacoes
        tx.commit();
        session.close();

        return pacotes;
    }

}
