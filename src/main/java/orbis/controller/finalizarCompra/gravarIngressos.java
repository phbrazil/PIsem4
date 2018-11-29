/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.finalizarCompra;

import orbis.model.itemVenda.tbItemVenda;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class gravarIngressos {

    public boolean gravarIngressos(tbItemVenda ingressos, int quantidade) {

        boolean gravado = false;

        for (int i = 0; i < quantidade; i++) {

            Configuration con = new Configuration().configure().addAnnotatedClass(tbItemVenda.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            try {

                //inicia a transacao com o banco
                Transaction txItem = session.beginTransaction();

                session.save(ingressos);

                txItem.commit();

            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }

        }
        gravado = true;

        return gravado;

    }

}
