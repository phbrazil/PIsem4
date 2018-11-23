/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ASAPH-001
 */
public class TesteHibernateInsertPacotes {

    public static void main(String[] args) {

        String dataatual = new SimpleDateFormat("dd-MM-yyyy_hh:mm:ss").format(Calendar.getInstance().getTime());
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        
                 Random rand = new Random();


        //inicia a transacao com o banco
        for (int i = 0; i < 1000; i++) {

            //popula o model com os dados
            tbPacote pacotes = new tbPacote();
            
            pacotes.setDthevento(dataatual);
            pacotes.setDthCadastro(dataatual);
            pacotes.setQtdMax(rand.nextInt(100)+1);
            pacotes.setLocalSaida("Sao Paulo");
            pacotes.setLocalDestino("Bahia teste " + i);
            pacotes.setRoteiro("role zueiro");
            pacotes.setValor(Math.random() * 100);
            pacotes.setAtivo(true);
            pacotes.setImagePath("/teste/teste.jpg");

            Transaction tx = session.beginTransaction();


            int idPacote = (Integer) session.save(pacotes);

            System.out.println("o id pacote criado foi " + idPacote);

            //comita as informacoes
            tx.commit();

        }
        session.close();
        sf.close();
        System.out.println("Conexao fechada");

    }

}
