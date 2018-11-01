/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.checkout;

import orbis.controller.busca.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import orbis.model.cliente.tbCliente;
import orbis.model.pacote.tbPacote;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/checkOut", urlPatterns = {"/checkOut"})
public class checkout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                PrintWriter out = response.getWriter();


        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        String nomeUser = (String) sessao.getAttribute("nomeUser");

        if (nomeUser == null) {

            String path = "login.jsp";
            String mensagem = "Favor efetuar o acesso ao sistema antes da compra";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            int idpacote = Integer.valueOf(request.getParameter("idpacote"));

            //indica as configuracoes do banco
            Configuration con = new Configuration().configure().addAnnotatedClass(tbPacote.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();
            tbPacote pacote;

            try {

                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();

                pacote = (tbPacote) session.get(tbPacote.class, idpacote);

                //comita as informacoes
                tx.commit();
            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }

            request.setAttribute("pacote", pacote);

            request.getRequestDispatcher("finalizarCompra.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
