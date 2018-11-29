/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.autoComplete;

import java.util.List;
import orbis.model.cidades.tbCidades;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
public class cidadesAutoComplete {

    public List<tbCidades> AutoComplete() {
        
        //popula o model com os dados
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCidades.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        List<tbCidades> cidades;
        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();

            cidades = session.createQuery("FROM tbCidades").list();

            //comita as informacoes
            tx.commit();
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        return cidades;
    }

}