/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import orbis.DAO.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernateInsertClientes {

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {
            //popula o model com os dados
            tbCliente clientes = new tbCliente();

            clientes.setIdEndereco(10);
            clientes.setEmailCliente("pauloh2012sul@gmail.com");
            clientes.setNomeCliente("Paulo Bezerra");
            clientes.setRgCliente("46.682.552-3");
            clientes.setCpfCliente("375.197.588-85");
            clientes.setTelCliente("1156633578");
            clientes.setCelCliente("11981997228");
            clientes.setPasswordCliente("0c24a188a9");
            clientes.setChangePassword(false);
            clientes.setIdPayment(1);

            //indica as configuracoes do banco
            Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            Long idCliente = (Long) session.save(clientes);

            System.out.println("id criado foi " + idCliente);

            //comita as informacoes
            tx.commit();

            session.close();

        }

    }

}
