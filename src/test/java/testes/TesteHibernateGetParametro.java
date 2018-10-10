/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import java.util.Iterator;
import java.util.List;
import javax.swing.JOptionPane;
import orbis.DAO.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernateGetParametro {

    public static void main(String[] args) {

        //popula o model com os dados

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        
        //pega o parametro
        String parametro = JOptionPane.showInputDialog("Insira o parametro");

        //inicia a transacao com o banco
        Transaction tx = session.beginTransaction();
        String hql = "from tbCliente where nomecliente like '%" + parametro + "%'";

        List clientes = session.createQuery(hql).list();
        for (Iterator iterator = clientes.iterator(); iterator.hasNext();) {
            tbCliente cliente = (tbCliente) iterator.next();
            System.out.println(cliente.getCpfCliente()+"\n");
        }
        
        

        //comita as informacoes
        tx.commit();
        session.close();

    }

}
