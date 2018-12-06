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
@WebServlet(name = "/esqueciSenha", urlPatterns = {"/esqueciSenha"})
public class esqueciSenha extends HttpServlet {

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

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        List<tbCliente> clienteList;

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            String hql = "from tbCliente where emailCliente = '" + emailCliente + "'";
            clienteList = session.createQuery(hql).list();

            //comita as informacoes
            tx.commit();
        } finally {
            // if (session != null) {
            //   session.close();
            // sf.close();
            // }
        }

        tbCliente cliente;
        String senhaProvisoria = "0c24a188a9";

        if (clienteList.size() > 0 && clienteList.get(0).getEmailCliente().equals(emailCliente)) {

            //indica as configuracoes do banco
            try {

                Transaction tx = session.beginTransaction();

                cliente = (tbCliente) session.get(tbCliente.class, clienteList.get(0).getId());

                
                cliente.setPasswordCliente(senhaProvisoria);
                cliente.setChangePassword(true);
                session.update(cliente);

                //comita as informacoes
                tx.commit();
            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }

            request.setAttribute("to1", emailCliente);
            request.setAttribute("subject", "Redefina sua senha - Orbis");
            request.setAttribute("body", "Sua senha provisória é: \n"
                    +senhaProvisoria);
            
            request.getRequestDispatcher("emailAlertaSenha.jsp").forward(request, response);

        } else {

            if (session != null) {
                session.close();
                sf.close();
            }

            String path = "esqueciSenha.jsp";
            String mensagem = "Email não encontrado!";
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
