/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.util.List;
import orbis.model.imagensPacote.tbImagens;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class deletarImagens {

    public boolean deletar(int idImagem) {

        boolean deletado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbImagens.class);

        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {

            Transaction tx = session.beginTransaction();
            tbImagens imagem = (tbImagens) session.get(tbImagens.class, idImagem);

            session.delete(imagem);

            //comita as informacoes
            tx.commit();

            //inicia a transacao com o banco
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        deletado = true;

        return deletado;
    }

}
