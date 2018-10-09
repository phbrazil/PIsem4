/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import orbis.DAO.cliente.tbCliente;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernateGet {

    public static void main(String[] args) {

        SessionFactory factory;

        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }

        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            tbCliente clientes = (tbCliente) session.get(tbCliente.class, new Long(1));
            System.out.println("valor antigo " + clientes.getNomeCliente());

            //atualizar valor
            clientes.setNomeCliente("nome novo");
            session.update(clientes);

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

}
