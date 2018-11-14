/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.util.List;
import orbis.controller.imagensPacote.tbImagens;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class gravarImagens {

    public boolean gravar(List<String> imagens, int id) {

        System.out.println("aqui chegou " + imagens.size() + " imagens");

        boolean gravado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbImagens.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        tbImagens tbImagens = new tbImagens();
        for (int i = 0; i < imagens.size(); i++) {

            try {

                System.out.println(i + "++++");
                tbImagens.setIdPacote(id);
                tbImagens.setNomeImagem(imagens.get(i));

                Transaction tx = session.beginTransaction();
                session.save(tbImagens);

                //comita as informacoes
                tx.commit();

                //inicia a transacao com o banco
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
