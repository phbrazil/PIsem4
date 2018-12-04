/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.imagensPacote.tbImagens;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/completarCadastro", urlPatterns = {"/completarCadastro"})
public class completarCadastro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idcliente = Integer.valueOf(request.getParameter("idcliente"));

        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);

        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();
        tbCliente cliente = null;
        try {

            Transaction tx = session.beginTransaction();
            cliente = (tbCliente) session.get(tbCliente.class, idcliente);

            //comita as informacoes
            tx.commit();

            //inicia a transacao com o banco
        } finally {
            if (session != null) {
                session.close();
                sf.close();
            }
        }

        if (cliente.isCadastroIncompleto() == true) {
            
            System.out.println("cadastro incompleto");

            request.setAttribute("nome", cliente.getNomeCliente());
            request.setAttribute("email", cliente.getEmailCliente());
            request.setAttribute("idcliente", cliente.getId());
            
            request.getRequestDispatcher("clienteCompletarCadastro.jsp").forward(request, response);

        } else {
            System.out.println("cadastro completo");
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Seu cadastro já foi finalizado anteriormente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
