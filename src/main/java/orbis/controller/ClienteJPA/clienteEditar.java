/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.ClienteJPA;

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
@WebServlet(name = "/editarCliente", urlPatterns = {"/editarCliente"})
public class clienteEditar extends HttpServlet {

    //private String UPLOAD_DIRECTORY = "/Users/killuminatti08/NetBeansProjects/Orbis/imagens/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType(
                "text/html");
        PrintWriter out = response.getWriter();
        //OutputStream out = null;

        request.setCharacterEncoding("UTF-8");
        // response.setCharacterEncoding("ISO-8859-1");
        request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        tbCliente cliente = new tbCliente();

        int idCliente = (Integer) sessao.getAttribute("idCliente");

        cliente.setId(idCliente);
        cliente.setPasswordCliente(request.getParameter("pass"));
        cliente.setIdPayment(Integer.valueOf(request.getParameter("idPayment")));
        cliente.setIdgrupo(Integer.valueOf(request.getParameter("idgrupo")));
        cliente.setIdEndereco(Integer.valueOf(request.getParameter("idEndereco")));
        cliente.setEmailCliente(request.getParameter("email"));
        cliente.setNomeCliente(request.getParameter("nome"));
        cliente.setTelCliente(request.getParameter("tel"));
        cliente.setCelCliente(request.getParameter("cel"));
        cliente.setCpfCliente(request.getParameter("cpf"));
        cliente.setRgCliente(request.getParameter("rg"));

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {
            //inicia a transacao com o banco
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

        //File uploaded successfully
        String pathModal = "clienteConsultaID?id=" + idCliente;
        String mensagem = "Dados alterados com sucesso!";
        request.setAttribute("path", pathModal);
        out.println("<script type='text/javascript'>");
        out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
        out.println("</script>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
