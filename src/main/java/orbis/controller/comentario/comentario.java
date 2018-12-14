/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.comentario;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.comentario.tbComentario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/Comentario", urlPatterns = {"/Comentario"})
public class comentario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        int idpacote = Integer.valueOf(request.getParameter("idpacote"));
        double nota = Double.valueOf(request.getParameter("rating"));
        String nome = request.getParameter("nome");
        String comentario = request.getParameter("comentario");
        String email = request.getParameter("email");

        tbComentario tbcomentario = new tbComentario();

        tbcomentario.setNota(nota);
        tbcomentario.setEmail(email);
        tbcomentario.setNome(nome);
        tbcomentario.setComentario(comentario);
        tbcomentario.setIdpacote(idpacote);
        tbcomentario.setDthComentario(data);

        //GRAVAR NO BANCO
        //indica as configuracoes do banco
        Configuration con = new Configuration().configure().addAnnotatedClass(tbComentario.class).addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        List<tbCliente> clienteList;

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();
            String hql = "from tbCliente where emailCliente = '" + email + "'";
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

            Integer id = null;

            try {
                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();
                id = (Integer) session.save(tbcomentario);

                //comita as informacoes
                tx.commit();

            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }
            }

            if (id != null) {

                PrintWriter out = response.getWriter();

                String pathModal = "pacote?destino=" + idpacote;
                String mensagem = "Novo comentário adicionado. Obrigado!";
                request.setAttribute("path", pathModal);
                out.println("<script type='text/javascript'>");
                out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
                out.println("</script>");

            } else {
                PrintWriter out = response.getWriter();

                String pathModal = "pacote?destino=" + idpacote;
                String mensagem = "Ocorreu um erro, tente novamente.";
                request.setAttribute("path", pathModal);
                out.println("<script type='text/javascript'>");
                out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
                out.println("</script>");
            }

        } else {

            if (session != null) {
                session.close();
                sf.close();
            }

            PrintWriter out = response.getWriter();

            String pathModal = "login.jsp";
            String mensagem = "Você precisa ter um email cadastrado no sistema para comentar";
            request.setAttribute("path", pathModal);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + pathModal + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
