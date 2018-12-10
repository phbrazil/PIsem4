/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orbis.controller.ingressos;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import orbis.model.cliente.tbCliente;
import orbis.model.pacote.tbPacote;
import orbis.model.venda.tbVenda;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author paulo.bezerra
 */
@WebServlet(name = "/imprimirIngressos", urlPatterns = {"/imprimirIngressos"})
public class ingressos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession(true);

        int idpacote = Integer.valueOf(request.getParameter("idpacote"));
        int idvenda = Integer.valueOf(request.getParameter("idvenda"));
        int idcliente = Integer.valueOf(request.getParameter("idcliente"));

        NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                new Locale("pt", "BR"));

        //indica as configuracoes do banco
        Configuration conVenda = new Configuration().configure().addAnnotatedClass(tbVenda.class);
        Configuration conPacote = new Configuration().configure().addAnnotatedClass(tbPacote.class);
        Configuration conCliente = new Configuration().configure().addAnnotatedClass(tbCliente.class);
        SessionFactory sfVenda = conVenda.buildSessionFactory();
        SessionFactory sfPacote = conPacote.buildSessionFactory();
        SessionFactory sfCliente = conCliente.buildSessionFactory();

        //abre sessao com o banco
        Session sessionVenda = sfVenda.openSession();
        Session sessionPacote = sfPacote.openSession();
        Session sessionCliente = sfCliente.openSession();
        tbVenda venda;
        tbPacote pacote;
        tbCliente cliente;
        try {

            Transaction txVenda = sessionVenda.beginTransaction();
            Transaction txpacote = sessionPacote.beginTransaction();
            Transaction txCliente = sessionCliente.beginTransaction();

            venda = (tbVenda) sessionVenda.get(tbVenda.class, idvenda);

            pacote = (tbPacote) sessionPacote.get(tbPacote.class, idpacote);

            cliente = (tbCliente) sessionCliente.get(tbCliente.class, idcliente);
            //comita as informacoes
            txVenda.commit();
            txpacote.commit();
            txCliente.commit();

        } finally {
            if (sessionVenda != null) {
                sessionVenda.close();
                sfVenda.close();
            }
            if (sessionPacote != null) {
                sessionPacote.close();
                sfPacote.close();
            }
            if (sessionCliente != null) {
                sessionCliente.close();
                sfCliente.close();
            }

        }
        request.setAttribute("venda", venda);
        request.setAttribute("pacote", pacote);
        request.setAttribute("cliente", cliente);
        request.setAttribute("valor", formatoMoeda.format(pacote.getValor()));
        request.setAttribute("quantidade", venda.getIngressos());

        request.getRequestDispatcher("ingressos.jsp").forward(request, response);

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
