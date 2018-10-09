/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import orbis.DAO.controllerJPA.ClientesJpaController;
import orbis.DAO.pacotes.Clientes;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernate {

    public static void main(String[] args){
        Clientes clientes = new Clientes();
        clientes.setNome("Paulo Bezerra");
        clientes.setIdade(27);
        
        Configuration con = new Configuration().configure().addAnnotatedClass(Clientes.class);
        SessionFactory sf = con.buildSessionFactory();
        
        Session session = sf.openSession();
        
        Transaction tx = session.beginTransaction();
        session.save(clientes);
        
        tx.commit();


    }

}
