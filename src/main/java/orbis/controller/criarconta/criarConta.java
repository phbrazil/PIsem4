/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/CriarConta", urlPatterns = {"/CriarConta"})
public class criarConta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        tbCliente clientes = new tbCliente();

        clientes.setIdEndereco(1);
        clientes.setEmailCliente(request.getParameter("email"));
        clientes.setNomeCliente(request.getParameter("nome"));
        clientes.setRgCliente(request.getParameter("rg"));
        clientes.setCpfCliente(request.getParameter("cpf"));
        clientes.setTelCliente(request.getParameter("telefone"));
        clientes.setCelCliente(request.getParameter("celular"));
        clientes.setPasswordCliente(request.getParameter("psw"));
        //Define que o grupo do cliente é de "Compradores"
        clientes.setIdgrupo(2);
        clientes.setCadastroIncompleto(true);
        String psw = request.getParameter("psw-repeat");
        String pswrepeat = request.getParameter("psw-repeat");
        clientes.setChangePassword(false);
        clientes.setIdPayment(1);
        
        if (!psw.equals(pswrepeat)) {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Ocorreu um erro. Favor tentar novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            //indica as configuracoes do banco
            Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            try {

                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();
                session.save(clientes);

                //comita as informacoes
                tx.commit();
            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }

            }
            
            request.setAttribute("to1", clientes.getEmailCliente());
            request.setAttribute("subject", "Favor completar seu Cadastro");
            
            System.out.println(clientes.getEmailCliente());
            
            request.getRequestDispatcher("emailAlertaCadastroCliente.jsp").forward(request, response);
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
