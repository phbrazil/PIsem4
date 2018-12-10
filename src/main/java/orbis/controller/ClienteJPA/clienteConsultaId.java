/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.ClienteJPA;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.DAO.pacote.listarImagens;
import orbis.model.imagensPacote.tbImagens;
import orbis.model.cliente.tbCliente;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/clienteConsultaID", urlPatterns = {"/clienteConsultaID"})
public class clienteConsultaId extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        //request.setCharacterEncoding("ISO-8859-1");

        HttpSession sessao = request.getSession(true);

        String data = new SimpleDateFormat("dd/MM/yyyy hh:mm").format(Calendar.getInstance().getTime());

        tbCliente cliente = new tbCliente();
        request.setCharacterEncoding("UTF-8");

        int idcliente = (Integer) sessao.getAttribute("idCliente");

        Configuration con = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sf = con.buildSessionFactory();

        //abre sessao com o banco
        Session session = sf.openSession();

        try {

            //inicia a transacao com o banco
            Transaction tx = session.beginTransaction();

            cliente = (tbCliente) session.get(tbCliente.class, idcliente);

            //comita as informacoes
            tx.commit();
        } catch (Exception ex) {
            System.out.println("erro " + ex);

        } finally {
            session.close();
            sf.close();

        }
        
        request.setAttribute("cliente", cliente);
        
        
        request.getRequestDispatcher("clienteEditar.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
