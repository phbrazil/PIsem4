/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacote;

import orbis.model.endereco.tbEndereco;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class gravarEndereco {

    public int gravarEndereco(tbEndereco endereco) {

        Configuration con = new Configuration().configure().addAnnotatedClass(tbEndereco.class);

        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        int idendereco = 0;

        try {

            Transaction tx = session.beginTransaction();
            idendereco = (Integer) session.save(endereco);

            //comita as informacoes
            tx.commit();

            //inicia a transacao com o banco
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }
        return idendereco;
    }

}
