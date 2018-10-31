/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.finalizarVenda;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.venda.tbVenda;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/FinalizarVenda", urlPatterns = {"/FinalizarVenda"})
public class finalizarVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        String datavenda = new SimpleDateFormat("yyyy-MM-dd_hh:mm:ss").format(Calendar.getInstance().getTime());

        tbVenda venda = new tbVenda();
        double total = Double.valueOf(request.getParameter("total"));

        venda.setIdcliente(3);
        venda.setDthvenda(String.valueOf(datavenda));
        venda.setTotal(total);

        System.out.println("total " + venda.getTotal());

        if (venda.getTotal() <= 0) {
            PrintWriter out = response.getWriter();
            String path = "index.jsp";
            String mensagem = "Ocorreu um erro. Favor tentar novamente";
            request.setAttribute("path", path);
            out.println("<script type='text/javascript'>");
            out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
            out.println("</script>");

        } else {

            //indica as configuracoes do banco
            Configuration con = new Configuration().configure().addAnnotatedClass(tbVenda.class);
            SessionFactory sf = con.buildSessionFactory();

            //abre sessao com o banco
            Session session = sf.openSession();

            try {

                //inicia a transacao com o banco
                Transaction tx = session.beginTransaction();
                int idvenda = (Integer) session.save(venda);

                //comita as informacoes
                tx.commit();
            } finally {
                if (session != null) {
                    session.close();
                    sf.close();
                }

            }
        }
        PrintWriter out = response.getWriter();
        String path = "index.jsp";
        String mensagem = "Venda Efetuada com sucesso!";
        request.setAttribute("path", path);
        out.println("<script type='text/javascript'>");
        out.println("location='modal?path=" + path + "&mensagem=" + mensagem + "';");
        out.println("</script>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
