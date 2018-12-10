/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.io.File;
import orbis.model.imagensPacote.tbImagens;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class deletarImagens {

    public boolean deletar(int idImagem) {

        //String home = System.getProperty("user.home");
        String home = "/opt/tomcat/apache-tomee-webprofile-7.0.2/webapps";

        boolean deletado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbImagens.class);

        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {

            Transaction tx = session.beginTransaction();
            tbImagens imagem = (tbImagens) session.get(tbImagens.class, idImagem);

            //MAC
            //File foto = new File("/Users/killuminatti08/NetBeansProjects/Orbis/src/main/webapp/img/imagens/" + String.valueOf(imagem.getIdPacote()+"/"+imagem.getNomeImagem()));
            //WINDOWS
            //File foto = new File("C:\\Users\\ASAPH-001\\Documents\\NetBeansProjects\\Orbis\\src\\main\\webapp\\img\\imagens\\" + String.valueOf(imagem.getIdPacote()+"\\"+imagem.getNomeImagem()));
            //UBUNTU
            File foto = new File(home + "/orbis/img/imagens/" + String.valueOf(imagem.getIdPacote() + "/" + imagem.getNomeImagem()));
            foto.delete();
            session.delete(imagem);

            //comita as informacoes
            tx.commit();

            //inicia a transacao com o banco
        } finally {
            if (session != null) {
                session.close();
                sf.close();
                System.out.println("Imagem deletada");
            }
        }

        deletado = true;

        return deletado;
    }

}
