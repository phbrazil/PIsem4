/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.criarconta;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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

        PrintWriter out = response.getWriter();

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

        int idcliente = 0;

        if (!psw.equals(pswrepeat)) {
            out = response.getWriter();
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

            List<tbCliente> clienteList;

            try {

                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();
                String hql = "from tbCliente where cpfCliente = '" + clientes.getCpfCliente()+ "' or"
                        + " rgCliente = '"+clientes.getRgCliente()+"'";
                clienteList = session.createQuery(hql).list();
                
                //comita as informacoes
                tx.commit();
            } finally {
                // if (session != null) {
                //   session.close();
                // sf.close();
                // }
            }

            if (clienteList.size() > 0) {

                if (session != null) {
                    session.close();
                    sf.close();
                }

                String path = "login.jsp";
                String mensagem = "Esse CPF ou RG já se encontra cadastrado";
                request.setAttribute("path", path);
                out.println("<script type='text/javascript'>");
                out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
                out.println("</script>");

            } else {

                try {

                    //inicia a transacao com o banco
                    Transaction tx = session.beginTransaction();
                    idcliente = (Integer) session.save(clientes);

                    //comita as informacoes
                    tx.commit();
                } finally {
                    if (session != null) {
                        session.close();
                        sf.close();
                    }

                }

                request.setAttribute("to1", clientes.getEmailCliente());
                request.setAttribute("subject", "Favor completar seu Cadastro - Orbis alerta!");
                request.setAttribute("body", "Confirme seus dados de endereço clicando no link abaixo:"
                        + "\n http://9ember.com/orbis/completarCadastro?idcliente=" + idcliente);

                request.getRequestDispatcher("emailAlertaCadastroCliente.jsp").forward(request, response);

            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
