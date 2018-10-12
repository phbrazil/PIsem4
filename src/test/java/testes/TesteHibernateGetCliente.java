/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import orbis.model.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernateGetCliente {

    public static void main(String[] args) {

        //popula o model com os dados
        tbCliente clientes;

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        //inicia a transacao com o banco
        Transaction tx = session.beginTransaction();

        clientes = (tbCliente) session.get(tbCliente.class, new Long(100));

        System.out.println("resultado do select foi " + clientes.getNomeCliente());

        //comita as informacoes
        tx.commit();

        session.close();
        sf.close();

    }

}
