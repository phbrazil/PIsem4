/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.DAO.pacote;

import orbis.model.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class atualizarIdEndereco {

    public boolean atualizar(int idcliente, int idendereco) {
        
        boolean atualizado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);

        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        
        tbCliente cliente = new tbCliente();

        try {

            Transaction tx = session.beginTransaction();
            cliente = (tbCliente) session.get(tbCliente.class,idcliente);
            
            cliente.setIdEndereco(idendereco);
            cliente.setCadastroIncompleto(false);
            
            session.update(cliente);

            //comita as informacoes
            tx.commit();
            atualizado = true;
            System.out.println("aqui ta "+atualizado);

            //inicia a transacao com o banco
        } finally {
            if (session != null) {
                session.close();
                sf.close();
                
            }
        }
        return atualizado;
    }

}
