/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.util.Iterator;
import java.util.List;
import orbis.DAO.pacote.listarImagens;
import orbis.model.imagensPacote.tbImagens;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author killuminatti08
 */
public class gravarImagens {

    public boolean gravar(List<String> imagens, int id) {

        boolean gravado = false;

        Configuration con = new Configuration().configure().addAnnotatedClass(tbImagens.class);

        tbImagens tbImagens = new tbImagens();
        for (int i = 0; i < imagens.size(); i++) {
            
            System.out.println(imagens.get(i)+" nomes das imagens ja salvas");
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            try {

                Transaction tx = session.beginTransaction();

                listarImagens listarImagens = new listarImagens();

                List<tbImagens> imagem = (List<tbImagens>) listarImagens.listar(id);

                for (int j = 0; i < imagem.size(); j++) {
                    if (imagem.get(j).getNomeImagem().equals(imagens.get(j))) {
                        System.out.println("Imagens iguais");
                        System.out.println(imagem.get(j).getNomeImagem() + " Banco");
                        System.out.println(imagens.get(i) + " Entrada");

                    } else {
                        System.out.println("entrei no else");
                        tbImagens.setIdPacote(id);
                        tbImagens.setNomeImagem(imagens.get(i));
                        
                        session.save(tbImagens);
                        //comita as informacoes
                        tx.commit();
                        System.out.println("salvei");

                    }

                }

                //inicia a transacao com o banco
            } catch (HibernateException e) {
                System.out.println("erro " + e + "+++++++ imagem");

            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }
        }
        gravado = true;

        return gravado;
    }

}
