/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.dashboard.DAO;

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

    public List<tbPacote> ListarProjetosGeral(String subarea, int idgrupo, String status, String year,
            String selecttype, String areaselect) {

        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {

            String query = "";

            Transaction tx = session.beginTransaction();
            query = "from tbPacote";

            List<tbPacote> pacotes = session.createQuery(query).list();

            //comita as informacoes
            tx.commit();
            if (pacotes.iterator().hasNext()) {
                session.close();
                return pacotes;
            }

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }
        return null;
    }

}
