/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.login;

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
@WebServlet(name = "/trocarSenha", urlPatterns = {"/trocarSenha"})
public class trocarSenha extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession();

        String emailCliente = request.getParameter("emailCliente");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        int idcliente = Integer.valueOf(request.getParameter("idcliente"));

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        tbCliente cliente;

        try {

            Transaction tx = session.beginTransaction();

            cliente = (tbCliente) session.get(tbCliente.class, idcliente);
            //comita as informacoes
            tx.commit();
        } finally {
            //if (session != null) {
            //  session.close();
            //sf.close();
            // }
        }

        if (password.equals(confirmpassword)) {

            cliente.setPasswordCliente(password);
            cliente.setChangePassword(false);

            try {

                Transaction tx = session.beginTransaction();
                session.update(cliente);
                //comita as informacoes
                tx.commit();
            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }
            
            String path = "login.jsp";
            String mensagem = "Sua senha foi alterada, favor efetuar o acesso novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");
            
        } else {

            if (session != null) {
                session.close();
                sf.close();
            }
            String path = "login.jsp";
            String mensagem = "Ocorreu um erro, tente novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
