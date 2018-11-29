/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.ClienteJPA;

import java.util.List;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASAPH-001
 */
public class consultaCliente {

    public List<tbPacote> consultaPacote(String valorbusca) {
        

        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {

            String query = "";

            //popula o model com os dados
            //indica as configuracoes do banco
            //pega o parametro
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            query = "from tbCliente WHERE "
                    + "localDestino like '%" + valorbusca.trim() + "%' or localSaida like '%" + valorbusca + "%'";

            List<tbPacote> pacotes = session.createQuery(query).list();
            
            System.out.println(query);

            //comita as informacoes
            tx.commit();
            if (pacotes.iterator().hasNext()) {
                return pacotes;
            }

        } catch (Exception e) {

            System.out.println("Error: " + e.getMessage());

        } finally {
            session.close();
            sf.close();

        }
        return null;
    }

}
