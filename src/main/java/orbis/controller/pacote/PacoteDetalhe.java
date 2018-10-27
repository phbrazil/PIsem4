/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.pacote;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/pacote", urlPatterns = {"/pacote"})
public class PacoteDetalhe extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        Integer destino = Integer.valueOf(request.getParameter("destino"));
        
        System.out.println("chegou aqui "+destino);

        //popula o model com os dados
        tbPacote pacote;

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();

            pacote = (tbPacote) session.get(tbPacote.class, destino);

            //comita as informacoes
            tx.commit();

        } finally {
            if (session != null) {
                session.close();
                sf.close();

            }
        }

        request.setAttribute("pacote", pacote);
        request.getRequestDispatcher("pacoteDetalhe.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}