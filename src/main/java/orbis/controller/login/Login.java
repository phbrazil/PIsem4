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
@WebServlet(name = "/Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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

        String emailCliente = request.getParameter("userName");
        String passwordCliente = request.getParameter("password");

        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        List<tbCliente> cliente;

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            String hql = "from tbCliente where emailCliente = '" + emailCliente + "' and passwordCliente ='" + passwordCliente + "'";
            cliente = session.createQuery(hql).list();

            //comita as informacoes
            tx.commit();
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }
        String primeironome = "";

        if (cliente.size() > 0) {

            for (int i = 0; i < cliente.get(0).getNomeCliente().length(); i++) {

                if (i == 0) {
                    primeironome = primeironome + cliente.get(0).getNomeCliente().toUpperCase().charAt(i);

                } else {
                    primeironome = primeironome + cliente.get(0).getNomeCliente().toLowerCase().charAt(i);

                }

                if (String.valueOf(cliente.get(0).getNomeCliente().charAt(i)).equals(" ")) {

                    break;

                }

            }
            sessao.setAttribute("nomeUser", primeironome);
            sessao.setAttribute("emailCliente", cliente.get(0).getEmailCliente());
            sessao.setAttribute("idcliente", cliente.get(0).getId());
            sessao.setAttribute("idgrupo", cliente.get(0).getIdgrupo());
            
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {

            String path = "login.jsp";
            String mensagem = "Acesso negado!";
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
