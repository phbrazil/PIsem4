/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.util.List;
import orbis.DAO.pacote.listarImagens;
import orbis.model.imagensPacote.tbImagens;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
public class deletarPacote {

    public boolean deletar(int idPacote) {

        boolean deletado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        Configuration conImagens = new Configuration().configure().addAnnotatedClass(tbImagens.class);

        SessionFactory sf = con.buildSessionFactory();
        SessionFactory sfImagens = conImagens.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        Session sessionImagens = sfImagens.openSession();

        listarImagens listarImagens = new listarImagens();

        List<tbImagens> listaImagens;

        try {

            listaImagens = listarImagens.listar(idPacote);

            //NMO VAMOS DELETAR PACOTE DEVIDO A AMARRACAO COM CHAVES ESTRANGEIRAS
//            for (int i = 0; i < listaImagens.size(); i++) {
//                
//                Transaction txImagens = sessionImagens.beginTransaction();
//
//                //tbImagens imagem = (tbImagens) session.get(tbImagens.class, idPacote);
//
//                sessionImagens.delete(listaImagens.get(i));
//                txImagens.commit();
//
//            }

            Transaction tx = session.beginTransaction();

            tbPacote pacote = (tbPacote) session.get(tbPacote.class, idPacote);
            pacote.setAtivo(false);
            session.update(pacote);

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
