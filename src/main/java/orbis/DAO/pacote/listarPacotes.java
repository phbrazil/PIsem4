/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacote;

import java.sql.Connection;
import java.util.List;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
public class listarPacotes {

    public List<tbPacote> listar() {

        //popula o model com os dados
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        List pacotes = null;    
        //abre sessao com o banco
        Session session = sf.openSession();
        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();

            pacotes = session.createQuery("FROM tbPacote where ativo = true").list();

            //comita as informacoes
            tx.commit();
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }
        return pacotes;
    }

}
