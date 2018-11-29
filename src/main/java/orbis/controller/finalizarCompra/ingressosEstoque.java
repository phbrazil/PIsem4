/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.finalizarCompra;

import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class ingressosEstoque {

    public boolean ingressosEstoque(int idpacote, int quantidade) {

        boolean atualizado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        tbPacote pacote = new tbPacote();

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();

            pacote = (tbPacote) session.get(tbPacote.class, idpacote);
            pacote.setQtdMax(pacote.getQtdMax() - quantidade);

            session.update(pacote);

            //comita as informacoes
            tx.commit();

        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
            atualizado = true;

        }

        return atualizado;
    }

}
